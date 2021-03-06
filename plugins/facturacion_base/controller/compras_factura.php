<?php

require_model('asiento.php');
require_model('asiento_factura.php');
require_model('ejercicio.php');
require_model('factura_proveedor.php');
require_model('forma_pago.php');
require_model('partida.php');
require_model('proveedor.php');
require_model('subcuenta.php');

class compras_factura extends fs_controller
{
   public $agente;
   public $allow_delete;
   public $ejercicio;
   public $factura;
   public $forma_pago;
   public $mostrar_boton_pagada;
   public $proveedor;
   

   
   protected function private_core()
   {
      $this->ppage = $this->page->get('compras_facturas');
      $this->agente = FALSE;
      $this->ejercicio = new ejercicio();
      $factura = new factura_proveedor();
      $this->factura = FALSE;
      $this->forma_pago = new forma_pago();
      $this->proveedor = FALSE;
      
      /// ¿El usuario tiene permiso para eliminar en esta página?
      $this->allow_delete = $this->user->allow_delete_on(__CLASS__);
      
      /**
       * Si hay alguna extensión de tipo config y texto no_button_pagada,
       * desactivamos el botón de pagada/sin pagar.
       */
      $this->mostrar_boton_pagada = TRUE;
      foreach($this->extensions as $ext)
      {
         if($ext->type == 'config' AND $ext->text == 'no_button_pagada')
         {
            $this->mostrar_boton_pagada = FALSE;
            break;
         }
      }
      
      if( isset($_POST['idfactura']) )
      {
         $this->factura = $factura->get($_POST['idfactura']);
         $this->factura->numproveedor = $_POST['numproveedor'];
         $this->factura->observaciones = $_POST['observaciones'];
         $this->factura->codpago = $_POST['forma_pago'];
         
         /// obtenemos el ejercicio para poder acotar la fecha
         $eje0 = $this->ejercicio->get( $this->factura->codejercicio );
         if( $eje0 )
         {
            $this->factura->fecha = $eje0->get_best_fecha($_POST['fecha'], TRUE);
            $this->factura->hora = $_POST['hora'];
         }
         else
            $this->new_error_msg('No se encuentra el ejercicio asociado a la factura.');
         
         if( $this->factura->save() )
         {
            $asiento = $this->factura->get_asiento();
            if($asiento)
            {
               $asiento->fecha = $this->factura->fecha;
               if( !$asiento->save() )
                  $this->new_error_msg("Imposible modificar la fecha del asiento.");
            }
            $this->new_message("Factura modificada correctamente.");
            $this->new_change('Factura Proveedor '.$this->factura->codigo, $this->factura->url());
         }
         else
            $this->new_error_msg("¡Imposible modificar la factura!");
      }
      else if( isset($_GET['id']) )
      {
         $this->factura = $factura->get($_GET['id']);
      }
      
      if($this->factura)
      {
         $this->page->title = $this->factura->codigo;
         
         /// cargamos el agente
         if( !is_null($this->factura->codagente) )
         {
            $agente = new agente();
            $this->agente = $agente->get($this->factura->codagente);
         }
         
         /// cargamos el proveedor
         $proveedor = new proveedor();
         $this->proveedor = $proveedor->get($this->factura->codproveedor);
         
         if( isset($_GET['gen_asiento']) AND isset($_GET['petid']) )
         {
            if( $this->duplicated_petition($_GET['petid']) )
            {
               $this->new_error_msg('Petición duplicada. Evita hacer doble clic sobre los botones.');
            }
            else
               $this->generar_asiento();
         }
         else if( isset($_REQUEST['pagada']) )
         {
            $this->factura->pagada = ($_REQUEST['pagada'] == 'TRUE');
            if( $this->factura->save() )
            {
               $this->new_message("Factura modificada correctamente.");
            }
            else
               $this->new_error_msg("¡Imposible modificar la factura!");
         }
         
         /// comprobamos la factura
         $this->factura->full_test();
      }
      else
         $this->new_error_msg("¡Factura de proveedor no encontrada!");
   }
   
   public function url()
   {
      if( !isset($this->factura) )
      {
         return parent::url();
      }
      else if($this->factura)
      {
         return $this->factura->url();
      }
      else
         return $this->page->url();
   }
   
   private function generar_asiento()
   {
      if( $this->factura->get_asiento() )
      {
         $this->new_error_msg('Ya hay un asiento asociado a esta factura.');
      }
      else
      {
         $asiento_factura = new asiento_factura();
         $asiento_factura->soloasiento = TRUE;
         if( $asiento_factura->generar_asiento_compra($this->factura) )
         {
            $this->new_message("<a href='".$asiento_factura->asiento->url()."'>Asiento</a> generado correctamente.");
            $this->new_change('Factura Proveedor '.$this->factura->codigo, $this->factura->url());
         }
         
         foreach($asiento_factura->errors as $err)
         {
            $this->new_error_msg($err);
         }
         
         foreach($asiento_factura->messages as $msg)
         {
            $this->new_message($msg);
         }
      }
   }
}

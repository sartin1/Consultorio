<?php


require_once 'plugins/facturacion_base/extras/fs_pdf.php';
require_model('factura_cliente.php');
require_model('factura_proveedor.php');
require_model('serie.php');
require_model('forma_pago.php');
require_model('cliente.php');
require_model('proveedor.php');

class informe_facturas extends fs_controller
{
   public $agente;
   public $cliente;
   public $desde;
   public $factura_cli;
   public $factura_pro;
      public $forma_pago;
   public $hasta;
   public $pagada;
   public $proveedor;
   public $serie;
   public $stats;
   
   public function __construct()
   {
      parent::__construct(__CLASS__, 'Facturas', 'reportes', FALSE, TRUE);
   }
   
   protected function private_core()
   {
      $this->agente = new agente();
      $this->cliente = new cliente();
      $this->desde = Date('1-m-Y');
      $this->factura_cli = new factura_cliente();
      $this->factura_pro = new factura_proveedor();
      $this->hasta = Date('d-m-Y', mktime(0, 0, 0, date("m")+1, date("1")-1, date("Y")));
      $this->serie = new serie();
$this->forma_pago = new forma_pago();
      
      if( isset($_REQUEST['buscar_cliente']) )
      {
         $this->buscar_cliente();
      }
      else if( isset($_REQUEST['buscar_proveedor']) )
      {
         $this->buscar_proveedor();
      }
      else if( isset($_POST['listado']) )
      {
         if($_POST['listado'] == 'facturascli')
         {
            if($_POST['generar'] == 'pdf')
            {
               $this->pdf_facturas_cli();
            }
            else
               $this->csv_facturas_cli();
         }
         else
         {
            if($_POST['generar'] == 'pdf')
            {
               $this->pdf_facturas_prov();
            }
            else
               $this->csv_facturas_prov();
         }
      }
      else
      {
         $this->albaranes_pendientes();
      }
   }
   
   private function buscar_cliente()
   {
      /// desactivamos la plantilla HTML
      $this->template = FALSE;
      
      $cliente = new cliente();
      $json = array();
      foreach($cliente->search($_REQUEST['buscar_cliente']) as $cli)
      {
         $json[] = array('value' => $cli->nombre, 'data' => $cli->codcliente);
      }
      
      header('Content-Type: application/json');
      echo json_encode( array('query' => $_REQUEST['buscar_cliente'], 'suggestions' => $json) );
   }
   
    private function buscar_proveedor()
   {
      /// desactivamos la plantilla HTML
      $this->template = FALSE;
      
      $proveedor = new proveedor();
      $json = array();
      foreach($proveedor->search($_REQUEST['buscar_proveedor']) as $pro)
      {
         $json[] = array('value' => $pro->nombre, 'data' => $pro->codproveedor);
      }
      
      header('Content-Type: application/json');
      echo json_encode( array('query' => $_REQUEST['buscar_proveedor'], 'suggestions' => $json) );
   }
   
   private function csv_facturas_cli()
   {
      $this->template = FALSE;
      
      header("content-type:application/csv;charset=UTF-8");
      header("Content-Disposition: attachment; filename=\"facturas_cli.csv\"");
      echo "serie,factura,asiento,fecha,subcuenta,descripcion,cifnif,base,iva,totaliva,totalrecargo,totalirpf,total\n";
      
      $codserie = FALSE;
      if($_POST['codserie'] != '')
      {
         $codserie = $_POST['codserie'];
      }
      
      $codagente = FALSE;     
      if($_POST['codagente'] != '')
      {
         $codagente = $_POST['codagente'];
      }
      
      $codcliente = FALSE;     
      if($_POST['codcliente'] != '')
      {
         $codcliente = $_POST['codcliente'];
      }
      
      $estado = FALSE;
      if($_POST['estado'] != '')
      {
         $estado = $_POST['estado'];
      }
      
      $facturas = $this->factura_cli->all_desde($_POST['desde'], $_POST['hasta'], $codserie, $codagente, $codcliente, $estado);
      if($facturas)
      {
         foreach($facturas as $fac)
         {
            $linea = array(
                'serie' => $fac->codserie,
                'factura' => $fac->numero,
                'fecha' => $fac->fecha,
                'subcuenta' => '-',
                'descripcion' => $fac->nombrecliente,
                'cifnif' => $fac->cifnif,
                'base' => 0,
                'iva' => 0,
                'totaliva' => 0,
                'totalrecargo' => 0,
                'totalirpf' => 0,
                'total' => 0
            );
            
            $asiento = $fac->get_asiento();
            if($asiento)
            {
               $linea['asiento'] = $asiento->numero;
               $partidas = $asiento->get_partidas();
               if($partidas)
               {
                  $linea['subcuenta'] = $partidas[0]->codsubcuenta;
               }
            }
            
            if($fac->totalirpf != 0)
            {
               $linea['totalirpf'] = $fac->totalirpf;
               $linea['total'] = $fac->total;
               echo '"'.join('","', $linea)."\"\n";
               $linea['totalirpf'] = 0;
            }
            
            $linivas = $fac->get_lineas_iva();
            if($linivas)
            {
               foreach($linivas as $liva)
               {
                  /// acumulamos la base
                  if( !isset($impuestos[$liva->iva]['base']) )
                  {
                     $impuestos[$liva->iva]['base'] = $liva->neto;
                  }
                  else
                     $impuestos[$liva->iva]['base'] += $liva->neto;
                     
                  /// acumulamos el iva
                  if( !isset($impuestos[$liva->iva]['iva']) )
                  {
                     $impuestos[$liva->iva]['iva'] = $liva->totaliva;
                  }
                  else
                     $impuestos[$liva->iva]['iva'] += $liva->totaliva;
                     
                  /// completamos y añadimos la línea al CSV
                  $linea['base'] = $liva->neto;
                  $linea['iva'] = $liva->iva;
                  $linea['totaliva'] = $liva->totaliva;
                  $linea['totalrecargo'] = $liva->totalrecargo;
                  $linea['total'] = $liva->totallinea;
                  echo '"'.join('","', $linea)."\"\n";
               }
            }
         }
      }
   }
   
   private function csv_facturas_prov()
   {
      $this->template = FALSE;
      
      header("content-type:application/csv;charset=UTF-8");
      header("Content-Disposition: attachment; filename=\"facturas_prov.csv\"");
      echo "serie,factura,asiento,fecha,subcuenta,descripcion,cifnif,base,iva,totaliva,totalrecargo,totalirpf,total\n";
      
      $codserie = FALSE;
      if($_POST['codserie'] != '')
      {
         $codserie = $_POST['codserie'];
      }
      
      $codagente = FALSE;     
      if($_POST['codagente'] != '')
      {
         $codagente = $_POST['codagente'];
      }
      
      $codproveedor = FALSE;     
      if($_POST['codproveedor'] != '')
      {
         $codproveedor = $_POST['codproveedor'];
      }
      
      $estado = FALSE;
      if($_POST['estado'] != '')
      {
         $estado = $_POST['estado'];
      }
      
      $facturas = $this->factura_pro->all_desde($_POST['desde'], $_POST['hasta'], $codserie, $codagente, $codproveedor, $estado);
      if($facturas)
      {
         foreach($facturas as $fac)
         {
            $linea = array(
                'serie' => $fac->codserie,
                'factura' => $fac->numero,
                'asiento' => '-',
                'fecha' => $fac->fecha,
                'subcuenta' => '-',
                'descripcion' => $fac->nombre,
                'cifnif' => $fac->cifnif,
                'base' => 0,
                'iva' => 0,
                'totaliva' => 0,
                'totalrecargo' => 0,
                'totalirpf' => 0,
                'total' => 0
            );
            
            $asiento = $fac->get_asiento();
            if($asiento)
            {
               $linea['asiento'] = $asiento->numero;
               $partidas = $asiento->get_partidas();
               if($partidas)
               {
                  $linea['subcuenta'] = $partidas[0]->codsubcuenta;
               }
            }
            
            if($fac->totalirpf != 0)
            {
               $linea['totalirpf'] = $fac->totalirpf;
               $linea['total'] = $fac->total;
               echo '"'.join('","', $linea)."\"\n";
               $linea['totalirpf'] = 0;
            }
            
            $linivas = $fac->get_lineas_iva();
            if($linivas)
            {
               foreach($linivas as $liva)
               {
                  /// acumulamos la base
                  if( !isset($impuestos[$liva->iva]['base']) )
                  {
                     $impuestos[$liva->iva]['base'] = $liva->neto;
                  }
                  else
                     $impuestos[$liva->iva]['base'] += $liva->neto;
                  
                  /// acumulamos el iva
                  if( !isset($impuestos[$liva->iva]['iva']) )
                  {
                     $impuestos[$liva->iva]['iva'] = $liva->totaliva;
                  }
                  else
                     $impuestos[$liva->iva]['iva'] += $liva->totaliva;
                  
                  /// completamos y añadimos la línea al CSV
                  $linea['base'] = $liva->neto;
                  $linea['iva'] = $liva->iva;
                  $linea['totaliva'] = $liva->totaliva;
                  $linea['totalrecargo'] = $liva->totalrecargo;
                  $linea['total'] = $liva->totallinea;
                  echo '"'.join('","', $linea)."\"\n";
               }
            }
         }
      }
   }
   
   private function pdf_facturas_cli()
   {
      /// desactivamos el motor de plantillas
      $this->template = FALSE;
      
      $pdf_doc = new fs_pdf('a4', 'landscape', 'Courier');
      $pdf_doc->pdf->addInfo('Title', 'Facturas emitidas del '.$_POST['desde'].' al '.$_POST['hasta'] );
      $pdf_doc->pdf->addInfo('Subject', 'Facturas emitidas del '.$_POST['desde'].' al '.$_POST['hasta'] );
      $pdf_doc->pdf->addInfo('Author', $this->empresa->nombre);
      
      $codserie = FALSE;
      if($_POST['codserie'] != '')
      {
         $codserie = $_POST['codserie'];
      }
      
      $codagente = FALSE;     
      if($_POST['codagente'] != '')
      {
         $codagente = $_POST['codagente'];
      }

      $codpago = FALSE;     
      if($_POST['codpago'] != '')
      {
         $codpago = $_POST['codpago'];
      }
      
      $codcliente = FALSE;     
      if($_POST['codcliente'] != '')
      {
         $codcliente = $_POST['codcliente'];
      }
      
      $estado = FALSE;
      if($_POST['estado'] != '')
      {
         $estado = $_POST['estado'];
      }
      
      $facturas = $this->factura_cli->all_desde($_POST['desde'], $_POST['hasta'], $codserie, $codagente,  $codpago,  $codcliente,$estado);
      if($facturas)
      {
         $total_lineas = count($facturas);
         $linea_actual = 0;
         $lppag = 31;
         $total = $totalrecargo = $totalirpf = 0;
         $impuestos = array();
         $pagina = 1;
         
         while($linea_actual < $total_lineas)
         {
            if($linea_actual > 0)
            {
               $pdf_doc->pdf->ezNewPage();
               $pagina++;
            }
            
            /// encabezado
            $pdf_doc->pdf->ezText($this->empresa->nombre." - Facturas de paciente del ".$_POST['desde']." al ".$_POST['hasta']);


            
            if($codpago)
            {
               $pdf_doc->pdf->ezText("TODOS LOS pacientes CON LA OBRA SOCIAL: ".$codpago);
            }

            if($codagente)
            {
               $agente = '';
               $agente = new agente();
               $agente = $agente->get($codagente);
               $nombre_agente = $agente->nombre;
               $pdf_doc->pdf->ezText("Agente: ". $nombre_agente);
            }


            if($codcliente)
            {
               $nombre = '';
               $cliente = new cliente();
               $cliente = $cliente->get($codcliente);
               $nombre = $cliente->nombre;
               $pdf_doc->pdf->ezText("Cliente: ".$nombre);
            }
            
            if($estado)
            {
               if($estado == 'pagada')
               {
                  $pdf_doc->pdf->ezText("Estado: Pagadas");
               }
               else
               {
                  $pdf_doc->pdf->ezText("Estado: Sin Pagar");
               }
            }
            
            $pdf_doc->pdf->ezText("\n", 14);
            
            /// tabla principal
            $pdf_doc->new_table();
            $pdf_doc->add_table_header(
               array(
                  
                   'factura' => '<b>Factura.</b>',
                   'fecha' => '<b>Fecha</b>',
                   'descripcion' => '<b>Nombre</b>',
                   'cifnif' => '<b>'.FS_CIFNIF.'</b>',

                   'total' => '<b>Total</b>'
               )
            );
            for($i = 0; $i < $lppag AND $linea_actual < $total_lineas; $i++)
            {
               $linea = array(
           
                   'factura' => $facturas[$linea_actual]->codigo,
                   'fecha' => $facturas[$linea_actual]->fecha,
                   'descripcion' => $facturas[$linea_actual]->nombrecliente,
                   'cifnif' => $facturas[$linea_actual]->cifnif,

                   'total' => 0
               );
               $asiento = $facturas[$linea_actual]->get_asiento();
               if($asiento)
               {
                  $linea['asiento'] = $asiento->numero;
                  $partidas = $asiento->get_partidas();
                  if($partidas)
                  {
                     $linea['subcuenta'] = $partidas[0]->codsubcuenta;
                  }
               }
               
               if($facturas[$linea_actual]->totalirpf != 0)
               {
                  $linea['totalirpf'] = $this->show_numero($facturas[$linea_actual]->totalirpf);
                  $linea['total'] = $this->show_numero($facturas[$linea_actual]->total);
                  /// añade la línea al PDF
                  $pdf_doc->add_table_row($linea);
                  $linea['totalirpf'] = '-';
               }
               
               $linivas = $facturas[$linea_actual]->get_lineas_iva();
               if($linivas)
               {
                  $nueva_linea = FALSE;
                  
                  foreach($linivas as $liva)
                  {
                     /// acumulamos la base
                     if( !isset($impuestos[$liva->iva]['base']) )
                     {
                        $impuestos[$liva->iva]['base'] = $liva->neto;
                     }
                     else
                        $impuestos[$liva->iva]['base'] += $liva->neto;
                     
                     /// acumulamos el iva
                     if( !isset($impuestos[$liva->iva]['iva']) )
                     {
                        $impuestos[$liva->iva]['iva'] = $liva->totaliva;
                     }
                     else
                        $impuestos[$liva->iva]['iva'] += $liva->totaliva;
                     
                     /// completamos y añadimos la línea al PDF
                     $linea['base'] = $this->show_numero($liva->neto);
                     $linea['iva'] = $this->show_numero($liva->iva);
                     $linea['totaliva'] = $this->show_numero($liva->totaliva);
                     $linea['totalrecargo'] = $this->show_numero($liva->totalrecargo);
                     $linea['total'] = $this->show_numero($liva->totallinea);
                     $pdf_doc->add_table_row($linea);
                     
                     if($nueva_linea)
                     {
                        $i++;
                     }
                     else
                        $nueva_linea = TRUE;
                  }
               }
               
               $totalrecargo += $facturas[$linea_actual]->totalrecargo;
               $totalirpf += $facturas[$linea_actual]->totalirpf;
               $total += $facturas[$linea_actual]->total;
               $linea_actual++;
            }
            $pdf_doc->save_table(
               array(
                   'fontSize' => 8,
                   'cols' => array(
                       'base' => array('justification' => 'right'),
                       'iva' => array('justification' => 'right'),
                       'totaliva' => array('justification' => 'right'),
                       'totalrecargo' => array('justification' => 'right'),
                       'totalirpf' => array('justification' => 'right'),
                       'total' => array('justification' => 'right')
                   ),
                   'shaded' => 0,
                   'width' => 780
               )
            );
            $pdf_doc->pdf->ezText("\n", 10);
            
            
            /// Rellenamos la última tabla
            $pdf_doc->new_table();
            $titulo = array('pagina' => '<b>Suma y sigue</b>');
            $fila = array('pagina' => $pagina . '/' . ceil($total_lineas / $lppag));
            $opciones = array(
                'cols' => array('base' => array('justification' => 'right')),
                'showLines' => 0,
                'width' => 780
            );
            foreach($impuestos as $i => $value)
            {
              
               $opciones['cols']['base'.$i] = array('justification' => 'right');
               if($i != 0)
               {

                  $opciones['cols']['iva'.$i] = array('justification' => 'right');
               }
            }
            $titulo['total'] = '<b>Total</b>';
            $fila['totalrecargo'] = $this->show_precio($totalrecargo);
            $fila['totalirpf'] = $this->show_precio($totalirpf);
            $fila['total'] = $this->show_precio($total);
            $opciones['cols']['totalrecargo'] = array('justification' => 'right');
            $opciones['cols']['totalirpf'] = array('justification' => 'right');
            $opciones['cols']['total'] = array('justification' => 'right');
            $pdf_doc->add_table_header($titulo);
            $pdf_doc->add_table_row($fila);
            $pdf_doc->save_table($opciones);
         }
      }
      else
      {
         $pdf_doc->pdf->ezText($this->empresa->nombre." - Facturas de ventas del ".$_POST['desde']." al ".$_POST['hasta'].":\n\n", 14);
         $pdf_doc->pdf->ezText("Ninguna.\n\n", 14);
      }
      
      $pdf_doc->show();
   }
   
   private function pdf_facturas_prov()
   {
      /// desactivamos el motor de plantillas
      $this->template = FALSE;
      
      $pdf_doc = new fs_pdf('a4', 'landscape', 'Courier');
      $pdf_doc->pdf->addInfo('Title', 'Facturas recibidas del '.$_POST['desde'].' al '.$_POST['hasta'] );
      $pdf_doc->pdf->addInfo('Subject', 'Facturas recibidas del '.$_POST['desde'].' al '.$_POST['hasta'] );
      $pdf_doc->pdf->addInfo('Author', $this->empresa->nombre);
      
      $codserie = FALSE;
      if($_POST['codserie'] != '')
      {
         $codserie = $_POST['codserie'];
      }
      
      $codagente = FALSE;     
      if($_POST['codagente'] != '')
      {
         $codagente = $_POST['codagente'];
      }
      
      $codproveedor = FALSE;     
      if($_POST['codproveedor'] != '')
      {
         $codproveedor = $_POST['codproveedor'];
      }
      
      $estado = FALSE;
      if($_POST['estado'] != '')
      {
         $estado = $_POST['estado'];
      }
      
      $facturas = $this->factura_pro->all_desde($_POST['desde'], $_POST['hasta'], $codserie, $codagente, $codproveedor, $estado);
      if($facturas)
      {
         $total_lineas = count($facturas);
         $linea_actual = 0;
         $lppag = 31;
         $total = $totalrecargo = $totalirpf = 0;
         $impuestos = array();
         $pagina = 1;
         
         while($linea_actual < $total_lineas)
         {
            if($linea_actual > 0)
            {
               $pdf_doc->pdf->ezNewPage();
               $pagina++;
            }
            
            /// encabezado
            $pdf_doc->pdf->ezText($this->empresa->nombre." - Facturas de compras del ".$_POST['desde']." al ".$_POST['hasta']);
            
            if($codserie)
            {
               $pdf_doc->pdf->ezText("Serie: ".$codserie);
            }
            
            if($codagente)
            {
               $agente = '';
               $agente = new agente();
               $agente = $agente->get($codagente);
               $nombre_agente = $agente->nombre;
               $pdf_doc->pdf->ezText("Agente: ". $nombre_agente);
            }
            
            if($codproveedor)
            {
               $nombre = '';
               $proveedor = new proveedor();
               $proveedor = $proveedor->get($codproveedor);
               $proveedor = $proveedor->nombre;
               $pdf_doc->pdf->ezText("Proveedor: ".$proveedor);
            }
            
            if($estado)
            {
               if($estado == 'pagada')
               {
                  $pdf_doc->pdf->ezText("Estado: Pagadas");
               }
               else
               {
                  $pdf_doc->pdf->ezText("Estado: Sin Pagar");
               }
            }
            
            $pdf_doc->pdf->ezText("\n", 14);
            
            /// tabla principal
            $pdf_doc->new_table();
            $pdf_doc->add_table_header(
               array(
                   'serie' => '<b>S</b>',
                   'factura' => '<b>Factura</b>',

                   'fecha' => '<b>Fecha</b>',
                   
                   'descripcion' => '<b>Descripción</b>',
                   'cifnif' => '<b>'.FS_CIFNIF.'</b>',
                   'base' => '<b>Importes de compras</b>',
                   'iva' => '<b>% IVA</b>',
                   'totaliva' => '<b>IVA Total</b>',


                   'total' => '<b>Total</b>'
               )
            );
            for($i = 0; $i < $lppag AND $linea_actual < $total_lineas; $i++)
            {
               $linea = array(
                   'serie' => $facturas[$linea_actual]->codserie,
                   'factura' => $facturas[$linea_actual]->codigo,

                   'fecha' => $facturas[$linea_actual]->fecha,
             
                   'descripcion' => $facturas[$linea_actual]->nombre,
                   'cifnif' => $facturas[$linea_actual]->cifnif,
                   'base' => 0,
                   'iva' => 0,
                   'totaliva' => 0,


                   'total' => 0
               );
               $asiento = $facturas[$linea_actual]->get_asiento();
               if($asiento)
               {
                  $linea['asiento'] = $asiento->numero;
                  $partidas = $asiento->get_partidas();
                  if($partidas)
                  {
                     $linea['subcuenta'] = $partidas[0]->codsubcuenta;
                  }
               }
               
               if($facturas[$linea_actual]->totalirpf != 0)
               {
                  $linea['totalirpf'] = $this->show_numero($facturas[$linea_actual]->totalirpf);
                  $linea['total'] = $this->show_numero($facturas[$linea_actual]->total);
                  /// añade la línea al PDF
                  $pdf_doc->add_table_row($linea);
                  $linea['totalirpf'] = '-';
               }
               
               $linivas = $facturas[$linea_actual]->get_lineas_iva();
               if($linivas)
               {
                  $nueva_linea = FALSE;
                  
                  foreach($linivas as $liva)
                  {
                     /// acumulamos la base
                     if( !isset($impuestos[$liva->iva]['base']) )
                     {
                        $impuestos[$liva->iva]['base'] = $liva->neto;
                     }
                     else
                        $impuestos[$liva->iva]['base'] += $liva->neto;
                     
                     /// acumulamos el iva
                     if( !isset($impuestos[$liva->iva]['iva']) )
                     {
                        $impuestos[$liva->iva]['iva'] = $liva->totaliva;
                     }
                     else
                        $impuestos[$liva->iva]['iva'] += $liva->totaliva;
                     
                     /// completamos y añadimos la línea al PDF
                     $linea['base'] = $this->show_numero($liva->neto);
                     $linea['iva'] = $this->show_numero($liva->iva);
                     $linea['totaliva'] = $this->show_numero($liva->totaliva);
                     $linea['totalrecargo'] = $this->show_numero($liva->totalrecargo);
                     $linea['total'] = $this->show_numero($liva->totallinea);
                     $pdf_doc->add_table_row($linea);
                     
                     if($nueva_linea)
                     {
                        $i++;
                     }
                     else
                        $nueva_linea = TRUE;
                  }
               }
               
               $totalrecargo += $facturas[$linea_actual]->totalrecargo;
               $totalirpf += $facturas[$linea_actual]->totalirpf;
               $total += $facturas[$linea_actual]->total;
               $linea_actual++;
            }
            $pdf_doc->save_table(
               array(
                   'fontSize' => 8,
                   'cols' => array(
                       'base' => array('justification' => 'right'),
                       'iva' => array('justification' => 'right'),
                       'totaliva' => array('justification' => 'right'),
                       'totalrecargo' => array('justification' => 'right'),
                       'totalirpf' => array('justification' => 'right'),
                       'total' => array('justification' => 'right')
                   ),
                   'shaded' => 0,
                   'width' => 780
               )
            );
            $pdf_doc->pdf->ezText("\n", 10);
            
            
            /// Rellenamos la última tabla
            $pdf_doc->new_table();
            $titulo = array('pagina' => '<b>Suma y sigue</b>');
            $fila = array('pagina' => $pagina . '/' . ceil($total_lineas / $lppag));
            $opciones = array(
                'cols' => array('base' => array('justification' => 'right')),
                'showLines' => 0,
                'width' => 780
            );
            foreach($impuestos as $i => $value)
            {
               $titulo['base'.$i] = '<b>Importe Base '.$i.'%</b>';
               $fila['base'.$i] = $this->show_precio($value['base']);
               $opciones['cols']['base'.$i] = array('justification' => 'right');
               if($i != 0)
               {
                  $titulo['iva'.$i] = '<b>IVA '.$i.'%</b>';
                  $fila['iva'.$i] = $this->show_precio($value['iva']);
                  $opciones['cols']['iva'.$i] = array('justification' => 'right');
               }
            }

            $titulo['total'] = '<b>Total</b>';
            $fila['totalrecargo'] = $this->show_precio($totalrecargo);
            $fila['totalirpf'] = $this->show_precio($totalirpf);
            $fila['total'] = $this->show_precio($total);
            $opciones['cols']['totalrecargo'] = array('justification' => 'right');
            $opciones['cols']['totalirpf'] = array('justification' => 'right');
            $opciones['cols']['total'] = array('justification' => 'right');
            $pdf_doc->add_table_header($titulo);
            $pdf_doc->add_table_row($fila);
            $pdf_doc->save_table($opciones);
         }
      }
      else
      {
         $pdf_doc->pdf->ezText($this->empresa->nombre." - Facturas de compras del ".$_POST['desde'].' al '.$_POST['hasta'].":\n\n", 14);
         $pdf_doc->pdf->ezText("Ninguna.\n\n", 14);
      }
      
      $pdf_doc->show();
   }
   
   public function stats_last_days()
   {
      $stats = array();
      $stats_cli = $this->stats_last_days_aux('facturascli');
      $stats_pro = $this->stats_last_days_aux('facturasprov');
      
      foreach($stats_cli as $i => $value)
      {
         $stats[$i] = array(
             'day' => $value['day'],
             'total_cli' => $value['total'],
             'total_pro' => 0
         );
      }
      
      foreach($stats_pro as $i => $value)
         $stats[$i]['total_pro'] = $value['total'];
      
      return $stats;
   }
   
   private function stats_last_days_aux($table_name='facturascli', $numdays = 25)
   {
      $stats = array();
      $desde = Date('d-m-Y', strtotime( Date('d-m-Y').'-'.$numdays.' day'));
      
      foreach($this->date_range($desde, Date('d-m-Y'), '+1 day', 'd') as $date)
      {
         $i = intval($date);
         $stats[$i] = array('day' => $i, 'total' => 0);
      }
      
      if( strtolower(FS_DB_TYPE) == 'postgresql')
         $sql_aux = "to_char(fecha,'FMDD')";
      else
         $sql_aux = "DATE_FORMAT(fecha, '%d')";
      
      $data = $this->db->select("SELECT ".$sql_aux." as dia, sum(total) as total
         FROM ".$table_name." WHERE fecha >= ".$this->empresa->var2str($desde)."
         AND fecha <= ".$this->empresa->var2str(Date('d-m-Y'))."
         GROUP BY ".$sql_aux." ORDER BY dia ASC;");
      if($data)
      {
         foreach($data as $d)
         {
            $i = intval($d['dia']);
            $stats[$i] = array(
                'day' => $i,
                'total' => floatval($d['total'])
            );
         }
      }
      return $stats;
   }
   
   public function stats_last_months()
   {
      $stats = array();
      $stats_cli = $this->stats_last_months_aux('facturascli');
      $pagadas_cli = $this->stats_last_months_pagadas('facturascli');
      $stats_pro = $this->stats_last_months_aux('facturasprov');
      $meses = array(
          1 => 'ene',
          2 => 'feb',
          3 => 'mar',
          4 => 'abr',
          5 => 'may',
          6 => 'jun',
          7 => 'jul',
          8 => 'ago',
          9 => 'sep',
          10 => 'oct',
          11 => 'nov',
          12 => 'dic'
      );
      
      foreach($stats_cli as $i => $value)
      {
         $stats[$i] = array(
             'month' => $meses[ $value['month'] ],
             'total_cli' => round($value['total'], 2),
             'impuestos_cli' => $value['totaliva'],
             'total_pro' => 0,
             'impuestos_pro' => 0,
             'beneficios' => 0
         );
      }
      
      foreach($stats_pro as $i => $value)
      {
         $stats[$i]['total_pro'] = round($value['total'], 2);
         $stats[$i]['impuestos_pro'] = $value['totaliva'];
      }
      
      foreach($pagadas_cli as $i => $value)
      {
         $stats[$i]['beneficios'] = round($value['total'] - $stats[$i]['total_pro'] - $stats[$i]['impuestos_cli'], 2);
      }
      
      /// leemos para completar $this->stats
      $num = 0;
      foreach($stats as $st)
      {
         $this->stats['media_ventas'] += $st['total_cli'];
         $this->stats['media_compras'] += $st['total_pro'];
         $this->stats['media_beneficios'] += $st['beneficios'];
         $num++;
      }
      
      if($num > 0)
      {
         $this->stats['media_ventas'] = $this->stats['media_ventas'] / $num;
         $this->stats['media_compras'] = $this->stats['media_compras'] / $num;
         $this->stats['media_beneficios'] = $this->stats['media_beneficios'] / $num;
      }
      
      return $stats;
   }
   
   private function stats_last_months_aux($table_name='facturascli', $num = 11)
   {
      $stats = array();
      $desde = Date('d-m-Y', strtotime( Date('01-m-Y').'-'.$num.' month'));
      
      foreach($this->date_range($desde, Date('d-m-Y'), '+1 month', 'm') as $date)
      {
         $i = intval($date);
         $stats[$i] = array('month' => $i, 'total' => 0, 'totaliva' => 0);
      }
      
      if( strtolower(FS_DB_TYPE) == 'postgresql')
         $sql_aux = "to_char(fecha,'FMMM')";
      else
         $sql_aux = "DATE_FORMAT(fecha, '%m')";
      
      $data = $this->db->select("SELECT ".$sql_aux." as mes, sum(total) as total, sum(totaliva) as totaliva
         FROM ".$table_name." WHERE fecha >= ".$this->empresa->var2str($desde)."
         AND fecha <= ".$this->empresa->var2str(Date('d-m-Y'))."
         GROUP BY ".$sql_aux." ORDER BY mes ASC;");
      if($data)
      {
         foreach($data as $d)
         {
            $i = intval($d['mes']);
            $stats[$i] = array(
                'month' => $i,
                'total' => floatval($d['total']),
                'totaliva' => floatval($d['totaliva'])
            );
         }
      }
      return $stats;
   }
   
   private function stats_last_months_pagadas($table_name='facturascli', $num = 11)
   {
      $stats = array();
      $desde = Date('d-m-Y', strtotime( Date('01-m-Y').'-'.$num.' month'));
      
      foreach($this->date_range($desde, Date('d-m-Y'), '+1 month', 'm') as $date)
      {
         $i = intval($date);
         $stats[$i] = array('month' => $i, 'neto' => 0, 'total' => 0, 'totaliva' => 0);
      }
      
      if( strtolower(FS_DB_TYPE) == 'postgresql')
         $sql_aux = "to_char(fecha,'FMMM')";
      else
         $sql_aux = "DATE_FORMAT(fecha, '%m')";
      
      $data = $this->db->select("SELECT ".$sql_aux." as mes, sum(neto) as neto, sum(total) as total, sum(totaliva) as totaliva
         FROM ".$table_name." WHERE fecha >= ".$this->empresa->var2str($desde)."
         AND fecha <= ".$this->empresa->var2str(Date('d-m-Y'))." AND pagada = true
         GROUP BY ".$sql_aux." ORDER BY mes ASC;");
      if($data)
      {
         foreach($data as $d)
         {
            $i = intval($d['mes']);
            $stats[$i] = array(
                'month' => $i,
                'neto' => floatval($d['neto']),
                'total' => floatval($d['total']),
                'totaliva' => floatval($d['totaliva'])
            );
         }
      }
      return $stats;
   }
   
   public function stats_last_years()
   {
      $stats = array();
      $stats_cli = $this->stats_last_years_aux('facturascli');
      $pagadas_cli = $this->stats_last_years_pagadas('facturascli');
      $stats_pro = $this->stats_last_years_aux('facturasprov');
      
      foreach($stats_cli as $i => $value)
      {
         $stats[$i] = array(
             'year' => $value['year'],
             'total_cli' => round($value['total'], 2),
             'impuestos_cli' => $value['totaliva'],
             'total_pro' => 0,
             'impuestos_pro' => 0,
             'beneficios' => 0
         );
      }
      
      foreach($stats_pro as $i => $value)
      {
         $stats[$i]['total_pro'] = round($value['total'], 2);
         $stats[$i]['impuestos_pro'] = $value['totaliva'];
      }
      
      foreach($pagadas_cli as $i => $value)
      {
         $stats[$i]['beneficios'] = round($value['total'] - $stats[$i]['total_pro'] - $stats[$i]['impuestos_cli'], 2);
      }
      
      return $stats;
   }
   
   private function stats_last_years_aux($table_name='facturascli', $num = 4)
   {
      $stats = array();
      $desde = Date('d-m-Y', strtotime( Date('d-m-Y').'-'.$num.' year'));
      
      foreach($this->date_range($desde, Date('d-m-Y'), '+1 year', 'Y') as $date)
      {
         $i = intval($date);
         $stats[$i] = array('year' => $i, 'total' => 0, 'totaliva' => 0);
      }
      
      if( strtolower(FS_DB_TYPE) == 'postgresql')
         $sql_aux = "to_char(fecha,'FMYYYY')";
      else
         $sql_aux = "DATE_FORMAT(fecha, '%Y')";
      
      $data = $this->db->select("SELECT ".$sql_aux." as ano, sum(total) as total, sum(totaliva) as totaliva
         FROM ".$table_name." WHERE fecha >= ".$this->empresa->var2str($desde)."
         AND fecha <= ".$this->empresa->var2str(Date('d-m-Y'))."
         GROUP BY ".$sql_aux." ORDER BY ano ASC;");
      if($data)
      {
         foreach($data as $d)
         {
            $i = intval($d['ano']);
            $stats[$i] = array(
                'year' => $i,
                'total' => floatval($d['total']),
                'totaliva' => floatval($d['totaliva'])
            );
         }
      }
      return $stats;
   }
   
   private function stats_last_years_pagadas($table_name='facturascli', $num = 4)
   {
      $stats = array();
      $desde = Date('d-m-Y', strtotime( Date('d-m-Y').'-'.$num.' year'));
      
      foreach($this->date_range($desde, Date('d-m-Y'), '+1 year', 'Y') as $date)
      {
         $i = intval($date);
         $stats[$i] = array('year' => $i, 'total' => 0, 'totaliva' => 0);
      }
      
      if( strtolower(FS_DB_TYPE) == 'postgresql')
         $sql_aux = "to_char(fecha,'FMYYYY')";
      else
         $sql_aux = "DATE_FORMAT(fecha, '%Y')";
      
      $data = $this->db->select("SELECT ".$sql_aux." as ano, sum(total) as total, sum(totaliva) as totaliva
         FROM ".$table_name." WHERE fecha >= ".$this->empresa->var2str($desde)."
         AND fecha <= ".$this->empresa->var2str(Date('d-m-Y'))." AND pagada = true
         GROUP BY ".$sql_aux." ORDER BY ano ASC;");
      if($data)
      {
         foreach($data as $d)
         {
            $i = intval($d['ano']);
            $stats[$i] = array(
                'year' => $i,
                'total' => floatval($d['total']),
                'totaliva' => floatval($d['totaliva'])
            );
         }
      }
      return $stats;
   }
   
   private function date_range($first, $last, $step = '+1 day', $format = 'd-m-Y' )
   {
      $dates = array();
      $current = strtotime($first);
      $last = strtotime($last);
      
      while( $current <= $last )
      {
         $dates[] = date($format, $current);
         $current = strtotime($step, $current);
      }
      
      return $dates;
   }
   
   private function albaranes_pendientes()
   {
      $this->stats = array(
          'alb_ptes_compra' => 0,
          'alb_ptes_compra_importe' => 0,
          'alb_ptes_venta' => 0,
          'alb_ptes_venta_importe' => 0,
          'facturas_compra' => 0,
          'facturas_compra_importe' => 0,
          'facturas_venta' => 0,
          'facturas_venta_importe' => 0,
          'total' => 0,
          'media_ventas' => 0,
          'media_compras' => 0,
          'media_beneficios' => 0
      );
      
      $sql = "SELECT COUNT(idalbaran) as num, SUM(total) as total FROM albaranesprov WHERE ptefactura;";
      $data = $this->db->select($sql);
      if($data)
      {
         $this->stats['alb_ptes_compra'] = intval($data[0]['num']);
         $this->stats['alb_ptes_compra_importe'] = floatval($data[0]['total']);
      }
      
      $sql = "SELECT COUNT(idalbaran) as num, SUM(total) as total FROM albaranescli WHERE ptefactura;";
      $data = $this->db->select($sql);
      if($data)
      {
         $this->stats['alb_ptes_venta'] = intval($data[0]['num']);
         $this->stats['alb_ptes_venta_importe'] = floatval($data[0]['total']);
      }
      
      $sql = "SELECT COUNT(idfactura) as num, SUM(total) as total FROM facturasprov WHERE fecha >= "
              .$this->empresa->var2str($this->desde)." AND fecha <= ".$this->empresa->var2str($this->hasta).";";
      $data = $this->db->select($sql);
      if($data)
      {
         $this->stats['facturas_compra'] = intval($data[0]['num']);
         $this->stats['facturas_compra_importe'] = floatval($data[0]['total']);
      }
      
      $sql = "SELECT COUNT(idfactura) as num, SUM(total) as total FROM facturascli WHERE fecha >= "
              .$this->empresa->var2str($this->desde)." AND fecha <= ".$this->empresa->var2str($this->hasta).";";
      $data = $this->db->select($sql);
      if($data)
      {
         $this->stats['facturas_venta'] = intval($data[0]['num']);
         $this->stats['facturas_venta_importe'] = floatval($data[0]['total']);
      }
      
      $this->stats['total'] = $this->stats['facturas_venta_importe'] + $this->stats['alb_ptes_venta_importe'];
      $this->stats['total'] -= $this->stats['facturas_compra_importe'] + $this->stats['alb_ptes_compra_importe'];
   }
}

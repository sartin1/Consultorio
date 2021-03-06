<?php


require_model('almacen.php');
require_model('pais.php');

class admin_almacenes extends fs_controller
{
   public $allow_delete;
   public $almacenes;
   public $pais;
   

   
   protected function private_core()
   {
      $almacen = new almacen();
      $this->pais = new pais();
      
      /// ¿El usuario tiene permiso para eliminar en esta página?
      $this->allow_delete = $this->user->allow_delete_on(__CLASS__);
      
      if( isset($_POST['scodalmacen']) )
      {
         $al0 = $almacen->get($_POST['scodalmacen']);
         if( !$al0 )
         {
            $al0 = new almacen();
            $al0->codalmacen = $_POST['scodalmacen'];
         }
         $al0->nombre = $_POST['snombre'];
         $al0->codpais = $_POST['scodpais'];
         $al0->provincia = $_POST['sprovincia'];
         $al0->poblacion = $_POST['spoblacion'];
         $al0->direccion = $_POST['sdireccion'];
         $al0->codpostal = $_POST['scodpostal'];
         $al0->telefono = $_POST['stelefono'];
         $al0->fax = $_POST['sfax'];
         $al0->contacto = $_POST['scontacto'];
         if( $al0->save() )
         {
            $this->new_message("Almacén ".$al0->codalmacen." guardado correctamente.");
         }
         else
            $this->new_error_msg("¡Imposible guardar el almacén!");
      }
      else if( isset($_GET['delete']) )
      {
         $al0 = $almacen->get($_GET['delete']);
         if($al0)
         {
            if( !$this->user->admin )
            {
               $this->new_error_msg("Solo un administrador puede eliminar un almacén.");
            }
            else if( $al0->delete() )
            {
               $this->new_message("Almacén ".$al0->codalmacen." eliminado correctamente");
            }
            else
               $this->new_error_msg("¡Imposible eliminar el almacén!");
         }
         else
            $this->new_error_msg("¡Almacén no encontrado!");
      }
      else
      {
         /// ¿Guardamos las opciones avanzadas?
         $guardar = FALSE;
         foreach($GLOBALS['config2'] as $i => $value)
         {
            if( isset($_POST[$i]) )
            {
               $GLOBALS['config2'][$i] = $_POST[$i];
               $guardar = TRUE;
            }
         }
         
         if($guardar)
         {
            $file = fopen('tmp/'.FS_TMP_NAME.'config2.ini', 'w');
            if($file)
            {
               foreach($GLOBALS['config2'] as $i => $value)
               {
                  if( is_numeric($value) )
                  {
                     fwrite($file, $i." = ".$value.";\n");
                  }
                  else
                  {
                     fwrite($file, $i." = '".$value."';\n");
                  }
               }
               
               fclose($file);
            }
            
            $this->new_message('Datos guardados correctamente.');
         }
      }
      
      $this->almacenes = $almacen->all();
      
      /// si hay más de un almacén activamos el soporte multi-almacén en los listados
      $fsvar = new fs_var();
      if( count($this->almacenes) > 1 )
      {
         $fsvar->simple_save('multi_almacen', TRUE);
      }
      else
      {
         $fsvar->simple_delete('multi_almacen');
      }
   }
}

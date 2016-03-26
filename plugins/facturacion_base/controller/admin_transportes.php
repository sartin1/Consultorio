<?php


require_model('agencia_transporte.php');

class admin_transportes extends fs_controller
{
   public $allow_delete;
   public $listado;
   

   
   protected function private_core()
   {
      /// ¿El usuario tiene permiso para eliminar en esta página?
      $this->allow_delete = $this->user->allow_delete_on(__CLASS__);
      
      $agencia = new agencia_transporte();
      
      if( isset($_POST['codtrans']) )
      {
         $agencia2 = $agencia->get($_POST['codtrans']);
         if(!$agencia2)
         {
            $agencia2 = new agencia_transporte();
            $agencia2->codtrans = $_POST['codtrans'];
         }
         $agencia2->nombre = $_POST['nombre'];
         $agencia2->telefono = $_POST['telefono'];
         $agencia2->web = $_POST['web'];
         $agencia2->activo = isset($_POST['activo']);
         
         if( $agencia2->save() )
         {
            $this->new_message('Datos guardaddos correctamente.');
         }
         else
         {
            $this->new_error_msg('Error al guardar los datos.');
         }
      }
      else if( isset($_GET['delete']) )
      {
         $agencia2 = $agencia->get($_GET['delete']);
         if($agencia2)
         {
            if( $agencia2->delete() )
            {
               $this->new_message('Agencia eliminada correctamente.');
            }
            else
            {
               $this->new_error_msg('Error al eliminar la agencia.');
            }
         }
         else
         {
            $this->new_error_msg('Agencia no encontrada.');
         }
      }
      
      $this->listado = $agencia->all();
   }
}

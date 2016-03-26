<?php


require_model('asiento.php');

class contabilidad_asientos extends fs_controller
{
   public $asiento;
   public $resultados;
   public $offset;
   

   
   protected function private_core()
   {
      $this->asiento = new asiento();
      
      if( isset($_GET['delete']) )
      {
         $asiento = $this->asiento->get($_GET['delete']);
         if($asiento)
         {
            if( $asiento->delete() )
            {
               $this->new_message("Asiento eliminado correctamente.");
            }
            else
               $this->new_error_msg("¡Imposible eliminar el asiento!");
         }
         else
            $this->new_error_msg("¡Asiento no encontrado!");
      }
      else if( isset($_GET['renumerar']) )
      {
         if( $this->asiento->renumerar() )
         {
            $this->new_message("Asientos renumerados.");
         }
      }
      
      $this->offset = 0;
      if( isset($_GET['offset']) )
      {
         $this->offset = intval($_GET['offset']);
      }
      
      if( isset($_GET['descuadrados']) )
      {
         $this->resultados = $this->asiento->descuadrados();
      }
      else if($this->query)
      {
         $this->resultados = $this->asiento->search($this->query, $this->offset);
      }
      else
         $this->resultados = $this->asiento->all($this->offset);
   }
   
   public function anterior_url()
   {
      $url = '';
      
      if($this->query != '' AND $this->offset > 0)
      {
         $url = $this->url()."&query=".$this->query."&offset=".($this->offset-FS_ITEM_LIMIT);
      }
      else if($this->query == '' AND $this->offset > 0)
      {
         $url = $this->url()."&offset=".($this->offset-FS_ITEM_LIMIT);
      }
      
      return $url;
   }
   
   public function siguiente_url()
   {
      $url = '';
      
      if($this->query != '' AND count($this->resultados) == FS_ITEM_LIMIT)
      {
         $url = $this->url()."&query=".$this->query."&offset=".($this->offset+FS_ITEM_LIMIT);
      }
      else if($this->query == '' AND count($this->resultados) == FS_ITEM_LIMIT)
      {
         $url = $this->url()."&offset=".($this->offset+FS_ITEM_LIMIT);
      }
      
      return $url;
   }
   
   public function total_asientos()
   {
      $data = $this->db->select("SELECT COUNT(idasiento) as total FROM co_asientos;");
      if($data)
      {
         return intval($data[0]['total']);
      }
      else
         return 0;
   }
}

<?php


class admin_info extends fs_controller
{
   public function __construct()
   {
      parent::__construct(__CLASS__, 'Información del sistema', 'admin', TRUE, TRUE);
   }
   
   protected function private_core()
   {
      /**
       * Cargamos las variables del cron
       */
      $fsvar = new fs_var();
      $cron_vars = $fsvar->array_get( array('cron_exists' => FALSE, 'cron_lock' => FALSE, 'cron_error' => FALSE) );
      
      if( isset($_GET['fix']) )
      {
         $cron_vars['cron_error'] = FALSE;
         $cron_vars['cron_lock'] = FALSE;
         $fsvar->array_save($cron_vars);
      }
      else if( isset($_GET['clean_cache']) )
      {
         /// borramos los archivos php del directorio tmp
         foreach( scandir(getcwd().'/tmp') as $f)
         {
            if( substr($f, -4) == '.php' )
               unlink('tmp/'.$f);
         }
         
         if( $this->cache->clean() )
         {
            $this->new_message("Cache limpiada correctamente.");
         }
      }
      else if( !$cron_vars['cron_exists'] )
      {
         $this->new_advice('');
      }
      else if( $cron_vars['cron_error'] )
      {
         $this->new_error_msg('Parece que ha habido un error con el cron. Haz clic <a href="'.$this->url().'&fix=TRUE">aquí</a> para corregirlo.');
      }
      else if( $cron_vars['cron_lock'] )
      {
         $this->new_advice('Se está ejecutando el cron.');
      }
      
      if( isset($_REQUEST['json']) )
      {
         /// desactivamos el motor de plantillas
         $this->template = FALSE;
         
         $fslog = new fs_log();
         echo json_encode( $fslog->all(0, 10000) );
      }
      else
      {
         $this->share_extensions();
      }
   }
   
   public function linux()
   {
      return (php_uname('s') == 'Linux');
   }
   
   public function uname()
   {
      return php_uname();
   }
   
   public function php_version()
   {
      return phpversion();
   }
   
   public function cache_version()
   {
      return $this->cache->version();
   }
   
   public function sys_uptime()
   {
      system('uptime');
   }
   
   public function sys_df()
   {
      system('df -h');
   }
   
   public function sys_free()
   {
      system('free -m');
   }
   
   public function fs_db_name()
   {
      return FS_DB_NAME;
   }
   
   public function fs_db_version()
   {
      return $this->db->version();
   }
   
   public function get_locks()
   {
      return $this->db->get_locks();
   }
   
   public function get_db_tables()
   {
      return $this->db->list_tables();
   }
   
   private function share_extensions()
   {
      $fsext = new fs_extension();
      $fsext->name = 'bootstrap-table';
      $fsext->from = __CLASS__;
      $fsext->to = __CLASS__;
      $fsext->type = 'head';
      $fsext->text = '<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/bootstrap-table.min.css"/>
   <!-- Latest compiled and minified JavaScript -->
   <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/bootstrap-table.min.js"></script>
   <!-- Latest compiled and minified Locales -->
   <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/locale/bootstrap-table-es-SP.min.js"></script>';
      $fsext->save();
   }
}

<?php


class chat extends fs_model
{
   public function __construct($a=FALSE)
   {
      parent::__construct( 'chat', 'plugins/simple_jquery_im/' );
   }

   public function query($sql)
   {
      return $this->db->select($sql);
   }

   public function exec($sql)
   {
      return $this->db->exec($sql);
   }

   public function getDb()
   {
      return $this->db;
   }

   public function escape_string($string)
   {
      return $this->var2str($string);
   }

   protected function install()
   { }

   public function private_core( )
   {
      /* Sólo se instancia chat para que se cree la tabla en la DB */
      $install_db = new chat();

      session_start();
      $_SESSION['username'] = $this->user->nick; // Must be already set
   }

   public function exists()
   { }

   public function save()
   { }

   public function delete()
   { }

   public function all()
   { }

   public function search( $query, $offset = 0 )
   { }

   public function getMessagesByMe($user, $recv = 0)
   {
      $user = $this->escape_string($user);
      return $this->query("SELECT * FROM chat WHERE (to_user = $user " . ($recv !== FALSE?" AND recd = $recv":"") . ") ORDER BY id ASC");

   }

   public function readMessage($mid)
   {
      $mid = $this->var2str($mid);
      return $this->exec("UPDATE chat SET recd = 1 WHERE id = $mid AND recd = 0");
   }

   public function insert($from_user,$to_user, $message)
   {
      $sql = "INSERT INTO chat (from_user, to_user, message, sent_on) VALUES
		 			(".$this->escape_string($from_user).", ".$this->escape_string($to_user).", ".$this->escape_string($message).", NOW());";
      return $this->getDb()->exec($sql);

   }
}

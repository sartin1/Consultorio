<?php


require_model('chat.php');

require_once __DIR__ . "/../class/ChatCore.php";

class im_chat extends fs_controller
{
   public function __construct()
   {
      parent::__construct(__CLASS__, 'Chat', 'IM Chat', FALSE, FALSE);
   }

   protected function private_core()
   {
      parent::private_core();
      $this->share_extensions();
      if(isset($_GET['action']))
      {
         $this->template = NULL;
         $chat = new ChatCore(new chat());
         $chat->run();
      }
   }

   public function share_extensions()
   {
      $items =
         '<link href="plugins/simple_jquery_im/view/css/chat.css" type="text/css" rel="stylesheet" media="all" />
         <link href="plugins/simple_jquery_im/view/css/screen.css" type="text/css" rel="stylesheet" media="all" />
         <link href="plugins/simple_jquery_im/view/css/font-awesome.min.css" type="text/css" rel="stylesheet" media="all" />
         <link href="plugins/simple_jquery_im/view/css/hoe.css" type="text/css" rel="stylesheet" media="all" />

         <!--[if lte IE 7]>
         <link type="text/css" rel="stylesheet" media="all" href="plugins/simple_jquery_im/view/css/screen_ie.css" />
         <![endif]-->
         <script type="text/javascript" src="plugins/simple_jquery_im/view/js/chat.js"></script>
         <script type="text/javascript" src="plugins/simple_jquery_im/view/js/hoe.js"></script>
         <script type="text/javascript" src="plugins/simple_jquery_im/view/js/chat_autoloader.js"></script>
         ';

      $extensions = array(
         array(
            'name' => 'im_chat',
            'page_from' => __CLASS__,
            'page_to' => NULL,
            'type' => 'head',
            'text' => $items,
            'params' => ''
         ),
      );
      foreach ($extensions as $ext)
      {
         $fsext = new fs_extension($ext);
         $fsext->save();
      }
   }

}

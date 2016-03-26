<?php if(!class_exists('raintpl')){exit;}?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es" >
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
   <title><?php echo $fsc->page->title;?> &lsaquo; <?php if( $fsc->empresa->nombrecorto ){ ?><?php echo $fsc->empresa->nombrecorto;?><?php }else{ ?><?php echo $fsc->empresa->nombre;?><?php } ?></title>
   <meta name="description" content="<?php echo $fsc->empresa->nombre;?>" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <meta name="generator" content="" />
   <link rel="shortcut icon" href="view/img/favicon.ico" />
   <link rel="stylesheet" href="view/css/bootstrap.min.css" />
   <link rel="stylesheet" href="plugins/adminlte/view/font-awesome/css/font-awesome.min.css" />
   <link rel="stylesheet" href="plugins/adminlte/view/css/AdminLTE.min.css" />
   <link rel="stylesheet" href="plugins/adminlte/view/css/skins/_all-skins.min.css" />
   <link rel="stylesheet" href="view/css/datepicker.css" />
   <link rel="stylesheet" href="view/css/custom.css" />
   <script type="text/javascript" src="view/js/jquery.min.js"></script>
   <script type="text/javascript" src="view/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="view/js/bootstrap-datepicker.js" charset="UTF-8"></script>
   <script type="text/javascript" src="view/js/jquery.autocomplete.min.js"></script>
   <script type="text/javascript" src="plugins/adminlte/view/js/jquery.slimscroll.min.js"></script>
   <script type="text/javascript" src="plugins/adminlte/view/js/app.min.js"></script>
   <script type="text/javascript" src="view/js/base.js"></script>
   <script type="text/javascript">
      function show_precio(precio)
      {
         <?php if( FS_POS_DIVISA=='right' ){ ?>

         return number_format(precio, <?php  echo FS_NF0;?>, '<?php  echo FS_NF1;?>', '<?php  echo FS_NF2;?>')+' <?php echo $fsc->simbolo_divisa();?>';
         <?php }else{ ?>

         return '<?php echo $fsc->simbolo_divisa();?>'+number_format(precio, <?php  echo FS_NF0;?>, '<?php  echo FS_NF1;?>', '<?php  echo FS_NF2;?>');
         <?php } ?>

      }
      function show_numero(numero)
      {
         return number_format(numero, <?php  echo FS_NF0;?>, '<?php  echo FS_NF1;?>', '<?php  echo FS_NF2;?>');
      }
   </script>
   <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

      <?php if( $value1->type=='head' ){ ?><?php echo $value1->text;?><?php } ?>

   <?php } ?>

</head>
<body class="hold-transition skin-red sidebar-mini fixed">
   <div class="wrapper">
      <header class="main-header">
         <a href="index.php" class="logo">
            <span class="logo-mini"></span>
            <span class="logo-lg" style="  font-size: 15px;"><?php echo $fsc->empresa->nombrecorto;?></span>
         </a>
         <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
               <span class="sr-only">Menú</span>
            </a>
            <div class="navbar-custom-menu">
               <ul class="nav navbar-nav">
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="Acceso rápido">
                        <i class="fa fa-plus-square"></i>
                     </a>
                     <ul class="dropdown-menu">
                        <?php $menu_ar_vacio=$this->var['menu_ar_vacio']=TRUE;?>

                        <?php $loop_var1=$fsc->user->get_menu(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <?php if( $value1->important ){ ?>

                           <li><a href="<?php echo $value1->url();?>"><?php echo $value1->title;?></a></li>
                           <?php $menu_ar_vacio=$this->var['menu_ar_vacio']=FALSE;?>

                           <?php } ?>

                        <?php } ?>

                        <?php if( $menu_ar_vacio ){ ?>

                        <li><a href="#">Vacío</a></li>
                        <?php } ?>

                     </ul>
                  </li>
                  
                  
                  
                  <?php if( $fsc->get_last_changes() ){ ?>

                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-files-o hidden-xs"></i>
                        <span class="visible-xs">Historial</span>
                     </a>
                     <ul class="dropdown-menu">
                        <?php $loop_var1=$fsc->get_last_changes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <li title="<?php if( $value1['nuevo'] ){ ?>creado<?php }else{ ?>modificado<?php } ?> el <?php echo $value1['cambio'];?>">
                              <a href="<?php echo $value1['url'];?>">
                                 <?php if( $value1['nuevo'] ){ ?>

                                 <i class="fa fa-file"></i>
                                 <?php }else{ ?>

                                 <i class="fa fa-pencil-square-o"></i>
                                 <?php } ?>

                                 <?php echo $value1['texto'];?>

                              </a>
                           </li>
                        <?php } ?>

                     </ul>
                  </li>
                  <?php } ?>

                  
                  <li class="dropdown">
                   
                     <ul class="dropdown-menu">
                        <li><a href="<?php  echo FS_COMMUNITY_URL;?>/index.php?page=community_questions" target="_blank">Preguntas</a></li>
                        <li><a href="<?php  echo FS_COMMUNITY_URL;?>/index.php?page=community_errors" target="_blank">Errores</a></li>
                        <li><a href="<?php  echo FS_COMMUNITY_URL;?>/index.php?page=community_ideas" target="_blank">Sugerencias</a></li>
                        <li><a href="<?php  echo FS_COMMUNITY_URL;?>/index.php?page=community_colabora" target="_blank">Colabora</a></li>
                        <li class="divider"></li>
                        <li><a href="#" id="b_feedback"><i class="fa fa-paper-plane"></i>Informar...</a></li>
                     </ul>
                  </li>
                  
                  <li class="dropdown user user-menu">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src='view/avatar.png' class="user-image" alt="User Image"/>
                        <span class="hidden-xs"><?php echo $fsc->user->nick;?></span>
                     </a>
                     <ul class="dropdown-menu">
                        <li class="user-header">
                           <img src='view/avatar.png' class="img-circle" alt="User Image"/>
                           <p>
                              <?php echo $fsc->user->get_agente_fullname();?>

                              <small><?php echo $fsc->user->email;?></small>
                              <small><?php echo $fsc->user->last_login;?></small>
                           </p>
                        </li>
                        <li class="user-footer">
                           <div class="pull-left">
                              <a href="<?php echo $fsc->user->url();?>" class="btn btn-default btn-flat">Perfil</a>
                           </div>
                           <div class="pull-right">
                              <a href="<?php echo $fsc->url();?>&logout=TRUE" class="btn btn-default btn-flat">Salir</a>
                           </div>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
         </nav>
      </header>
      <aside class="main-sidebar">
         <section class="sidebar">
            <div class="user-panel">
               <div class="pull-left image">
                  <img src='view/avatar.png' class='img-circle' alt='<?php echo $fsc->user->nick;?>'/>
               </div>
               <div class="pull-left info">
                  <p><?php echo $fsc->user->email;?></p>
                  <a href="#"><i class="fa fa-circle text-success"></i> <?php echo $fsc->user->nick;?></a>
               </div>
            </div>
            <?php if( in_array('community3',$GLOBALS['plugins']) ){ ?>

     
            <?php }elseif( in_array('facturacion_base',$GLOBALS['plugins']) ){ ?>

            
            <?php } ?>

            <ul class="sidebar-menu">
               <li class="header">Menú</li>
               <?php $loop_var1=$fsc->folders(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <li class="treeview<?php if( $value1==$fsc->page->folder ){ ?> active<?php } ?>">
                  <a href="#">
                     <?php if( $value1=='admin' ){ ?>

                     <i class="fa fa-flask"></i>
                     <?php }elseif( $value1=='compras' ){ ?>

                     <i class="fa fa-ship"></i>
                     <?php }elseif( $value1=='configuracion' ){ ?>

                     <i class="fa fa-balance-scale"></i>
                     <?php }elseif( $value1=='turnos' ){ ?>

                     <i class="fa fa-users"></i>
                     <?php }elseif( $value1=='reportes' ){ ?>

                     <i class="fa fa-bar-chart-o"></i>
                     <?php }elseif( $value1=='escritorio' ){ ?>

                     <i class="fa fa-cc-visa"></i>
                     <?php }elseif( $value1=='c' ){ ?>

                     <i class="fa fa-shopping-cart"></i>
                     <?php }elseif( $value1=='comunidad' ){ ?>

                     <i class="fa fa-comments"></i>
                     <?php }else{ ?>

                     <i class="fa fa-th-large"></i>
                     <?php } ?>

                     <span class="text-capitalize"><?php echo $value1;?></span>
                     <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                     <?php $loop_var2=$fsc->pages($value1); $counter2=-1; if($loop_var2) foreach( $loop_var2 as $key2 => $value2 ){ $counter2++; ?>

                     <li<?php if( $value2->showing() ){ ?> class="active"<?php } ?>>
                        <a href="<?php echo $value2->url();?>">
                           <?php if( $value2->name=='admin_empresa' ){ ?>

                           <i class="fa fa-suitcase"></i>
                           <?php }elseif( $value2->name=='admin_home' ){ ?>

                           <i class="fa fa-cogs"></i>
                           <?php }elseif( in_array($value2->name, array('admin_users','compras_proveedores','ventas_clientes','admin_agentes','community_visitantes','informe_clientes')) ){ ?>

                           <i class="fa fa-users"></i>
                           <?php }elseif( $value2->name=='contabilidad_ejercicios' ){ ?>

                           <i class="fa fa-calendar"></i>
                           <?php }elseif( $value2->name=='ventas_articulos' OR $value2->name=='informe_articulos' OR $value2->name=='compras_articulos' ){ ?>

                           <i class="fa fa-cubes"></i>
                           <?php }elseif( $value2->name=='admin_woocommerce' ){ ?>

                           <i class="fa fa-wordpress"></i>
                           <?php }elseif( $value2->name=='admin_prestashop' OR $value2->name=='pedidos_prestashop' ){ ?>

                           <i class="fa fa-shopping-basket"></i>
                           <?php }elseif( $value2->name=='community_plugins' ){ ?>

                           <i class="fa fa-puzzle-piece"></i>
                           <?php }elseif( $value2->name=='community_stats' ){ ?>

                           <i class="fa fa-comments"></i>
                           <?php }elseif( $value2->showing() ){ ?>

                           <i class="fa fa-check-circle"></i>
                           <?php }else{ ?>

                           <i class="fa fa-circle-o"></i>
                           <?php } ?>

                           <?php echo $value2->title;?>

                        </a>
                     </li>
                     <?php } ?>

                  </ul>
               </li>
               <?php } ?>

            </ul>
         </section>
      </aside>
      <div class="content-wrapper" style="background-color: white;">
         <section class="content-header">
            <?php if( $fsc->get_errors() ){ ?>

            <div class="alert alert-danger hidden-print">
               <ul><?php $loop_var1=$fsc->get_errors(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><li><?php echo $value1;?></li><?php } ?></ul>
            </div>
            <?php } ?>

            <?php if( $fsc->get_messages() ){ ?>

            <div class="alert alert-success hidden-print">
               <ul><?php $loop_var1=$fsc->get_messages(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><li><?php echo $value1;?></li><?php } ?></ul>
            </div>
            <?php } ?>

            <?php if( $fsc->get_advices() ){ ?>

            <div class="alert alert-info hidden-print">
               <ul><?php $loop_var1=$fsc->get_advices(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><li><?php echo $value1;?></li><?php } ?></ul>
            </div>
            <?php } ?>

         </section>
         
         <?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("feedback") . ( substr("feedback",-1,1) != "/" ? "/" : "" ) . basename("feedback") );?>
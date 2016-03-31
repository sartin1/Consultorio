<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<div class="container-fluid" style="margin-top: 10px;">
   <div class="row">
      <div class="col-sm-6">
         <div class="btn-group hidden-xs">
            <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>" title="Recargar la página">
               <span class="glyphicon glyphicon-refresh"></span>
            </a>
            <?php if( $fsc->page->is_default() ){ ?>

            <a class="btn btn-sm btn-default active" href="<?php echo $fsc->url();?>&amp;default_page=FALSE" title="Desmarcar como página de inicio">
               <span class="glyphicon glyphicon-home"></span>
            </a>
            <?php }else{ ?>

            <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>&amp;default_page=TRUE" title="Marcar como página de inicio">
               <span class="glyphicon glyphicon-home"></span>
            </a>
            <?php } ?>

         </div>
      </div>
      <div class="col-sm-6 text-right">
         <h2 style="margin-top: 0px;">Escritorio</h2>
      </div>
   </div>
</div>

<div class="container-fluid">
   <section class="content">

      <!-- Inicio Fila 1 de widgets -->
      <div class="row">
  <!-- Widget 2x1 -->
         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-12 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-12 col-sm-6 col-xs-12">
         <?php } ?>

            <div class="bs-callout bs-callout-info">
               <div class="inner">
                  <h4><strong>Turnos</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-success clickableRow" href="index.php?page=nuevo_servicio">
                        <i class="glyphicon glyphicon-plus"></i> Crear nuevo
                     </li>
                     <?php $loop_var1=$fsc->num_total_estados_servicios(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <li class="list-group-item clickableRow" style='background-color: #<?php echo $value1["color"];?>;' href="index.php?page=ventas_servicios">
                        <i class="glyphicon glyphicon-list"></i> <?php echo $value1["descripcion"];?> <span class="badge"><?php echo $value1["total"];?></span>
                     </li>
                     <?php } ?>

                  </ul>

               </div>
            </div>
         </div>
         <?php } ?>

         <!-- Widget 1x1 -->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12" style="display:none">
            <div class="bs-callout bs-callout-info">
               <div class="inner">
                  <h4><strong><span class="text-capitalize"><?php  echo FS_PRESUPUESTOS;?></span> de clientes</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=ventas_presupuestos">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->ventas_num_presupuestos(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-warning clickableRow" href="index.php?page=ventas_presupuestos&pendientes=TRUE">
                        <i class="glyphicon glyphicon-time"></i> Pendientes <span class="badge"><?php $loop_var1=$fsc->ventas_num_presupuestos_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-danger clickableRow" href="index.php?page=ventas_presupuestos&rechazados=TRUE">
                        <i class="glyphicon glyphicon-remove"></i> Rechazados <span class="badge"><?php $loop_var1=$fsc->ventas_num_presupuestos_rechazados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-ok"></i> Aprobados <span class="badge"><?php $loop_var1=$fsc->ventas_num_presupuestos_aprobados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>

               </div>
            </div>
         </div>
         <?php } ?>

         <!-- Widget 1x2-->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12" style="display:none">
            <div class="bs-callout bs-callout-success">
               <div class="inner">
                  <h4><strong><span class="text-capitalize"><?php  echo FS_PEDIDOS;?></span> de clientes</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=ventas_pedidos">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->ventas_num_pedidos(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-warning clickableRow" href="index.php?page=ventas_pedidos&pendientes=TRUE">
                        <i class="glyphicon glyphicon-time"></i> Pendientes <span class="badge"><?php $loop_var1=$fsc->ventas_num_pedidos_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-danger clickableRow" href="index.php?page=ventas_pedidos&rechazados=TRUE">
                        <i class="glyphicon glyphicon-remove"></i> Rechazados <span class="badge"><?php $loop_var1=$fsc->ventas_num_pedidos_rechazados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-ok"></i> Aprobados <span class="badge"><?php $loop_var1=$fsc->ventas_num_pedidos_aprobados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <?php } ?>


         <!-- Widget 1x3 -->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-6 col-sm-6 col-xs-12">
         <?php } ?>

            <div class="bs-callout bs-callout-warning">
               <div class="inner">
                  <h4><strong><span class="text-capitalize"><?php  echo FS_ALBARANES;?></span> de clientes</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=ventas_albaranes">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->ventas_num_albaranes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-warning clickableRow" href="index.php?page=ventas_albaranes&ptefactura=TRUE">
                        <i class="glyphicon glyphicon-time"></i> Pendientes <span class="badge"><?php $loop_var1=$fsc->ventas_num_albaranes_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-ok"></i> Aprobados <span class="badge"><?php $loop_var1=$fsc->ventas_num_albaranes_aprobados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
                  <br><br>
               </div>
            </div>
         </div>

         <!-- Widget 1x4 -->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-6 col-sm-6 col-xs-12">
         <?php } ?>

            <div class="bs-callout bs-callout-danger">
               <div class="inner">
                  <h4><strong><span class="text-capitalize">Facturas</span> de clientes</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=ventas_facturas">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->ventas_num_facturas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-danger clickableRow" href="index.php?page=ventas_facturas&sinpagar=TRUE">
                        <i class="glyphicon glyphicon-exclamation-sign"></i> Sin cobrar <span class="badge"><?php $loop_var1=$fsc->ventas_num_facturas_sin_cobrar(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-briefcase"></i> Cobradas <span class="badge"><?php $loop_var1=$fsc->ventas_num_facturas_cobradas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
               </div><br><br>
            </div>
         </div>
      </div>
      <!--Fin Fila 1 de widgets-->

      <!--Inicio Fila 2 de widgets-->
      <div class="row">

       

         <!--Widget 2x2-->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-4 col-sm-6 col-xs-12">
         <?php } ?>

            <div class="bs-callout bs-callout-success">
               <div class="inner">
                  <h4><strong><span class="text-capitalize"><?php  echo FS_PEDIDOS;?></span> de proveedores</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=compras_pedidos">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->compras_num_pedidos(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-warning clickableRow" href="index.php?page=compras_pedidos&pendientes=TRUE">
                        <i class="glyphicon glyphicon-time"></i> Pendientes <span class="badge"><?php $loop_var1=$fsc->compras_num_pedidos_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-ok"></i> Aprobados <span class="badge"><?php $loop_var1=$fsc->compras_num_pedidos_aprobados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <?php } ?>


         <!--Widget 2x3-->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-4 col-sm-6 col-xs-12">
         <?php } ?>

         <?php }else{ ?>

         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-4 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-6 col-sm-6 col-xs-12">
         <?php } ?>

         <?php } ?>

            <div class="bs-callout bs-callout-warning" style="display:none">
               <div class="inner">
                  <h4><strong><span class="text-capitalize"><?php  echo FS_ALBARANES;?></span> de proveedores</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=compras_albaranes">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->compras_num_albaranes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-warning clickableRow" href="index.php?page=compras_albaranes&ptefactura=TRUE">
                        <i class="glyphicon glyphicon-time"></i> Pendientes <span class="badge"><?php $loop_var1=$fsc->compras_num_albaranes_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-ok"></i> Aprobados <span class="badge"><?php $loop_var1=$fsc->compras_num_albaranes_aprobados(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

         <!--Widget 2x4-->
         <?php if( in_array('presupuestos_y_pedidos',$GLOBALS['plugins']) ){ ?>

         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-3 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-4 col-sm-6 col-xs-12">
         <?php } ?>

         <?php }else{ ?>

         <?php if( in_array('servicios',$GLOBALS['plugins']) ){ ?>

         <div class="col-lg-4 col-sm-6 col-xs-12">
         <?php }else{ ?>

         <div class="col-lg-6 col-sm-6 col-xs-12">
         <?php } ?>

         <?php } ?>

            <div class="bs-callout bs-callout-danger" style="display:none">
               <div class="inner">
                  <h4><strong><span class="text-capitalize">Facturas</span> de proveedores</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-info clickableRow" href="index.php?page=compras_facturas">
                        <i class="glyphicon glyphicon-list"></i> Realizados <span class="badge"><?php $loop_var1=$fsc->compras_num_facturas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-danger clickableRow" href="index.php?page=compras_facturas&sinpagar=TRUE">
                        <i class="glyphicon glyphicon-exclamation-sign"></i> Sin pagar <span class="badge"><?php $loop_var1=$fsc->compras_num_facturas_sin_pagar(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                     <li class="list-group-item list-group-item-success">
                        <i class="glyphicon glyphicon-briefcase"></i> Pagadas <span class="badge"><?php $loop_var1=$fsc->compras_num_facturas_cobradas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><?php echo $value1["total"];?><?php } ?></span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <!--Fin Fila 2 de widgets-->

      <!--Inicio Fila 3 de widgets-->
      <div class="row">

         <!-- Widget 3x1 -->
         <div class="col-lg-6 col-sm-6 col-xs-12">
            <div class="bs-callout bs-callout-success">
               <div class="inner">
                  <h4><strong>Informe resumido de facturación</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-success clickableRow" href="index.php?page=ventas_facturas">
                        <i class="glyphicon glyphicon-list"></i>
                        Total facturas de ventas
                        <span class="badge">
                           <?php $loop_var1=$fsc->importe_total_facturas_ventas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <?php echo $fsc->show_precio($value1["total"]);?>

                           <?php } ?>

                        </span>
                     </li>
                     <li class="list-group-item list-group-item-danger clickableRow" href="index.php?page=compras_facturas">
                        <i class="glyphicon glyphicon-list"></i>
                        Total facturas de compras
                        <span class="badge">
                           <?php $loop_var1=$fsc->importe_total_facturas_compras(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <?php echo $fsc->show_precio($value1["total"]);?>

                           <?php } ?>

                        </span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

         <!-- Widget 3x2 -->
         <div class="col-lg-6 col-sm-6 col-xs-12">
            <div class="bs-callout bs-callout-info">
               <div class="inner">
                  <h4><strong>Informe resumido de facturación pendiente</strong></h4>
               </div>
               <div class="text-center">
                  <br/>
                  <ul class="list-group">
                     <li class="list-group-item list-group-item-success clickableRow" href="index.php?page=ventas_albaranes&mostrar=pendientes">
                        <i class="glyphicon glyphicon-list"></i>
                        Total de remitos pendientes del mes
                        <span class="badge">
                           <?php $loop_var1=$fsc->importe_total_albaranes_ventas_pendientes(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <?php echo $fsc->show_precio($value1["total"]);?>

                           <?php } ?>

                        </span>
                     </li>
                     <li class="list-group-item list-group-item-danger">
                        <i class="glyphicon glyphicon-list"></i> Total IVA a pagar
                        <span class="badge">
                           <?php $loop_var1=$fsc->importe_total_iva_pagado(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <?php $loop_var2=$fsc->importe_total_iva_a_pagar(); $counter2=-1; if($loop_var2) foreach( $loop_var2 as $key2 => $value2 ){ $counter2++; ?>

                                 <?php echo $fsc->show_precio($value2["total"] - $value1["total"]);?>

                              <?php } ?>

                           <?php } ?>

                        </span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

      </div>
      <!--Fin Fila 3 de widgets-->

   </section>
</div>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>


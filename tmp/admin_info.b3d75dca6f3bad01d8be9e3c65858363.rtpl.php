<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<div class="container-fluid" style="margin-top: 10px; margin-bottom: 10px;">
   <div class="row">
      <div class="col-sm-2 col-xs-1">
         <div class="btn-group hidden-xs">
            <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>" title="Recargar la página">
               <span class="glyphicon glyphicon-refresh"></span>
            </a>
            <?php if( $fsc->page->is_default() ){ ?>

            <a class="btn btn-sm btn-default active" href="<?php echo $fsc->url();?>&amp;default_page=FALSE" title="desmarcar como página de inicio">
               <span class="glyphicon glyphicon-home"></span>
            </a>
            <?php }else{ ?>

            <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>&amp;default_page=TRUE" title="marcar como página de inicio">
               <span class="glyphicon glyphicon-home"></span>
            </a>
            <?php } ?>

         </div>
      </div>
      <div class="col-sm-7 col-xs-9 text-center">
         <h3 style="margin-top: 0px;"><?php echo $fsc->page->title;?></h3>
      </div>
      <div class="col-sm-3 col-xs-2 text-right">
         <a class="btn btn-sm btn-danger" href="<?php echo $fsc->url();?>&clean_cache=TRUE">
            <span class="glyphicon glyphicon-trash"></span>
            <span class="hidden-xs">&nbsp; Limpiar la cache</span>
         </a>
      </div>
   </div>
</div>

<div role="tabpanel">
   <ul class="nav nav-tabs" role="tablist">

      <li role="presentation" class="active">
         <a href="#history" aria-controls="history" role="tab" data-toggle="tab">
            <span class="glyphicon glyphicon-book" aria-hidden="false"></span>
            <span class="hidden-xs">&nbsp; Historial</span>
         </a>
      </li>
      <li role="presentation">
         <a href="#tablas" aria-controls="tablas" role="tab" data-toggle="tab">
            <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
            <span class="hidden-xs">&nbsp; Tablas</span>
         </a>
      </li>
      <li role="presentation">
         <a href="#bloqueos" aria-controls="bloqueos" role="tab" data-toggle="tab">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="hidden-xs">&nbsp; Bloqueos</span>
         </a>
      </li>
   </ul>
   <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="home">
         <div class="table-responsive">

         </div>
         <div class="panel-group active" id="accordion" style="margin: 10px;">
            <div class="panel panel-default">
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion" href="#collapse_so">Sistema operativo</a>
                  </h3>
               </div>
               <div id="collapse_so" class="panel-collapse collapse in">
                  <div class="panel-body"><?php echo $fsc->uname();?></div>
                  <?php if( $fsc->linux() ){ ?>

                  <div class="panel-footer">
                     <b>Uptime:</b> <?php echo $fsc->sys_uptime();?>

                  </div>
                  <?php } ?>

               </div>
            </div>

            <?php if( $fsc->linux() ){ ?>

            <div class="panel panel-default">
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion" href="#collapse_mem">Memoria</a>
                  </h3>
               </div>
               <div id="collapse_mem" class="panel-collapse collapse">
                  <div class="panel-body"><pre><?php echo $fsc->sys_free();?></pre></div>
               </div>
            </div>

            <div class="panel panel-default">
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion" href="#collapse_dd">Disco duro</a>
                  </h3>
               </div>
               <div id="collapse_dd" class="panel-collapse collapse">
                  <div class="panel-body"><pre><?php echo $fsc->sys_df();?></pre></div>
               </div>
            </div>
            <?php } ?>

         </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="history">
         <div class="table-responsive">
            <table class="table table-hover"
                   data-toggle="table"
                   data-url="<?php echo $fsc->url();?>&json=fslog"
                   data-show-columns="true"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-export="true"
                   data-pagination="true"
                   data-page-size="<?php  echo FS_ITEM_LIMIT;?>"
                   data-show-header="true"
                   data-sortable="true"
                   data-show-footer="true">
               <thead>
                  <tr>
                     <th class="text-left" data-field="usuario" data-sortable="true">Usuario</th>
                     <th class="text-left" data-field="tipo" data-sortable="true">Tipo</th>
                     <th class="text-left" data-field="detalle" data-sortable="true">Detalle</th>
                     <th class="text-left" data-field="ip" data-sortable="true">IP</th>
                     <th class="text-right" data-field="fecha" data-sortable="true">Fecha</th>
                  </tr>
               </thead>
            </table>
         </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tablas">
         <div class="container-fluid" style="margin-top: 10px;">
            <div class="row">
               <?php $loop_var1=$fsc->get_db_tables(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <div class="col-md-4"><?php echo $value1["name"];?></div>
               <?php } ?>

            </div>
         </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="bloqueos">
         <div class="table-responsive">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th class="text-left">Base de datos</th>
                     <th class="text-left">relname</th>
                     <th class="text-left">relation</th>
                     <th class="text-left">transaction ID</th>
                     <th class="text-left">PID</th>
                     <th class="text-left">modo</th>
                     <th class="text-left">granted</th>
                  </tr>
               </thead>
               <?php $loop_var1=$fsc->get_locks(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <tr>
                  <td><?php echo $value1["database"];?></td>
                  <td><?php echo $value1["relname"];?></td>
                  <td><?php echo $value1["relation"];?></td>
                  <td><?php echo $value1["transactionid"];?></td>
                  <td><?php echo $value1["pid"];?></td>
                  <td><?php echo $value1["mode"];?></td>
                  <td><?php echo $value1["granted"];?></td>
               </tr>
               <?php }else{ ?>

               <tr class="bg-warning">
                  <td colspan="7">Ningún bloqueo detectado.</td>
               </tr>
               <?php } ?>

            </table>
         </div>
      </div>
   </div>
</div>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
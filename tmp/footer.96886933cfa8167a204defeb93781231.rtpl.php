<?php if(!class_exists('raintpl')){exit;}?>      <br/>
      <?php if( FS_DB_HISTORY ){ ?>

      <div class="container-fluid">
         <div class="row">
            <div class="col-sm-12">
               <div class="panel panel-default hidden-print">
                  <div class="panel-heading">
                     <h3 class="panel-title">Consultas SQL:</h3>
                  </div>
                  <div class="panel-body">
                     <ol style="font-size: 11px; margin: 0px; padding: 0px 0px 0px 20px;">
                        <?php $loop_var1=$fsc->get_db_history(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?><li><?php echo $value1;?></li><?php } ?>

                     </ol>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <?php } ?>

      </div>
      <footer class="main-footer hidden-print">
         <div class="pull-right hidden-xs">
            <b>Version</b> <?php echo $fsc->version();?>

         </div>
         Creado por <a target="_blank" href="">Miguel San Martín</a> &nbsp;
         <span class="label label-default">Consultas: <?php echo $fsc->selects();?></span>
         <span class="label label-default">Transacciones: <?php echo $fsc->transactions();?></span>
         <span class="label label-default">
            <span class="glyphicon glyphicon-time" aria-hidden="true" title="Página procesada en <?php echo $fsc->duration();?>"></span>
            &nbsp; <?php echo $fsc->duration();?>

         </span>
      </footer>
      <aside class="control-sidebar control-sidebar-dark"></aside>
      <div class="control-sidebar-bg"></div>
    </div>
</body>
</html>
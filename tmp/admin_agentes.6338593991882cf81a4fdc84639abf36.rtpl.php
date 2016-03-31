<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<script type="text/javascript">
   $(document).ready(function() {
      $("#b_nuevo_agente").click(function(event) {
         event.preventDefault();
         $("#modal_nuevo_agente").modal('show');
         document.f_nuevo_agente.snombre.focus();
      });
   });
</script>

<div class="container-fluid hidden-print" style="margin-top: 10px;">
   <div class="row">
      <div class="col-sm-6 col-xs-6">
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
         <div class="btn-group">
            <a id="b_nuevo_agente" class="btn btn-sm btn-success" href="#">
               <span class="glyphicon glyphicon-plus"></span>
               <span class="hidden-xs">&nbsp; Nuevo</span>
            </a>              
            <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <?php if( $value1->type=='button' ){ ?>

               <a href="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>" class="btn btn-sm btn-default"><?php echo $value1->text;?></a>
               <?php } ?>

            <?php } ?>

         </div>
         <button type="button" class="btn btn-sm btn-default" onclick="window.print();">
            <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
         </button>           
      </div>
      <div class="col-sm-6 col-xs-6 text-right">
         <h2 style="margin-top: 0px;">Empleados</h2>
      </div>
   </div>
</div>

<div class="table-responsive">
   <table class="table table-hover">
      <thead>
         <tr>
            <th class="text-left">Nombre + Apellidos</th>
            <th class="text-left"><?php  echo FS_CIFNIF;?></th>
            <th class="text-left">Cargo</th>
            <th class="text-left">Teléfono</th>
            <th class="text-left">Nacimiento</th>
            <th class="text-right">Fecha Alta</th>
         </tr>
      </thead>
      <?php $loop_var1=$fsc->agente->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

      <tr class='clickableRow<?php if( $value1->f_baja ){ ?> danger<?php } ?>' href='<?php echo $value1->url();?>'>
         <td>
            <?php echo $value1->get_fullname();?>

            <?php if( $value1->f_baja ){ ?>

            &nbsp; <span class="label label-danger" title="Empleado dado de baja">Baja</span>
            <?php } ?>

         </td>
         <td><?php echo $value1->dnicif;?></td>
         <td><?php echo $value1->cargo;?></td>
         <td><?php if( $value1->telefono=='' ){ ?>-<?php }else{ ?><?php echo $value1->telefono;?><?php } ?></td>
         <td><?php echo $value1->f_nacimiento;?></td>
         <td class="text-right"><?php echo $value1->f_alta;?></td>
      </tr>
      <?php }else{ ?>

      <tr class="warning">
         <td colspan="6">Sin resultados.</td>
      </tr>
      <?php } ?>

   </table>
</div>

<form class="form-horizontal" role="form" name="f_nuevo_agente" action="<?php echo $fsc->url();?>" method="post">
   <div class="modal" id="modal_nuevo_agente">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title">
                  <span class="glyphicon glyphicon-user"></span>
                  &nbsp; Nuevo empleado
               </h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <label for="snombre" class="col-sm-2 control-label">Nombre</label>
                  <div class="col-sm-10">
                     <input class="form-control" type="text" name="snombre" autocomplete="off" required=""/>
                  </div>
               </div>
               <div class="form-group">
                  <label for="sapellidos" class="col-sm-2 control-label">Apellidos</label>
                  <div class="col-sm-10">
                     <input class="form-control" type="text" name="sapellidos" autocomplete="off"/>
                  </div>
               </div>
               <div class="form-group">
                  <label for="sdnicif" class="col-sm-2 control-label"><?php  echo FS_CIFNIF;?></label>
                  <div class="col-sm-10">
                     <input class="form-control" type="text" name="sdnicif" autocomplete="off"/>
                  </div>
               </div>
               <div class="form-group">
                  <label for="stelefono" class="col-sm-2 control-label">Teléfono</label>
                  <div class="col-sm-10">
                     <input class="form-control" type="text" name="stelefono" autocomplete="off"/>
                  </div>
               </div>
               <div class="form-group">
                  <label for="semail" class="col-sm-2 control-label">Email</label>
                  <div class="col-sm-10">
                     <input class="form-control" type="text" name="semail" autocomplete="off"/>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-primary" type="submit">
                  <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp; Guardar
               </button>
            </div>
         </div>
      </div>
   </div>
</form>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
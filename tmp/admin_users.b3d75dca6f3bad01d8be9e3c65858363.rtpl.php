<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<script type="text/javascript">
   $(document).ready(function() {
      $("#b_nuevo_usuario").click(function(event) {
         event.preventDefault();
         $("#modal_nuevo_usuario").modal('show');
         document.f_nuevo_usuario.nnick.focus();
      });
   });
</script>

<div class="container-fluid" style="margin-top: 10px; margin-bottom: 5px;">
   <div class="row">
      <div class="col-sm-6 col-xs-7">
         <div class="btn-group">
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
            <a id="b_nuevo_usuario" class="btn btn-sm btn-success" href="#">
               <span class="glyphicon glyphicon-plus"></span>
               <span class="hidden-xs">&nbsp; Nuevo</span>
            </a>
            <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <?php if( $value1->type=='button' ){ ?>

               <a href="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>" class="btn btn-sm btn-default"><?php echo $value1->text;?></a>
               <?php } ?>

            <?php } ?>

         </div>
      </div>
      <div class="col-sm-6 col-xs-5 text-right">
         <h2 style="margin-top: 0px;">Usuarios</h2>
      </div>
   </div>
</div>

<div role="tabpanel">
   <ul class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active">
         <a href="#home" aria-controls="home" role="tab" data-toggle="tab">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <span class="hidden-xs">&nbsp; Usuarios</span>
         </a>
      </li>
      <li role="presentation">
         <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
            <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
            <span class="hidden-xs">&nbsp; Historial</span>
         </a>
      </li>
   </ul>
   <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="home">
         <div class="table-responsive">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th class="text-left">Nick</th>
                     <th class="text-left">Email</th>
                     <th class="text-left">Empleado</th>
                     <th class="text-center">Administrador</th>
                     <th class="text-left">IP</th>
                     <th class="text-left">Página de inicio</th>
                     <th class="text-right">Último login</th>
                  </tr>
               </thead>
               <?php $loop_var1=$fsc->user->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <tr class='clickableRow<?php if( $value1->show_last_login()=='-' ){ ?> warning<?php } ?>' href='<?php echo $value1->url();?>'>
                  <td><a href="<?php echo $value1->url();?>"><?php echo $value1->nick;?></a></td>
                  <td><?php echo $value1->email;?></td>
                  <td><?php echo $value1->get_agente_fullname();?></td>
                  <td class="text-center">
                     <?php if( $value1->admin ){ ?><span class="glyphicon glyphicon-ok"></span><?php } ?>

                  </td>
                  <td><?php if( FS_DEMO ){ ?>XX.XX.XX.XX<?php }else{ ?><?php echo $value1->last_ip;?><?php } ?></td>
                  <td><?php echo $value1->fs_page;?></td>
                  <td class="text-right"><?php echo $value1->show_last_login();?></td>
               </tr>
               <?php } ?>

            </table>
         </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="profile">
         <div class="table-responsive">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th class="text-left">Usuario</th>
                     <th class="text-left">Detalle</th>
                     <th class="text-left">IP</th>
                     <th class="text-right">Fecha</th>
                  </tr>
               </thead>
               <?php $loop_var1=$fsc->historial; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <tr<?php if( $value1->alerta ){ ?> class="danger"<?php } ?>>
                  <td><a href="index.php?page=admin_user&snick=<?php echo $value1->usuario;?>"><?php echo $value1->usuario;?></a></td>
                  <td><?php echo $value1->detalle;?></td>
                  <td><?php echo $value1->ip;?></td>
                  <td class="text-right"><?php echo $value1->fecha;?></td>
               </tr>
               <?php } ?>

            </table>
         </div>
      </div>
   </div>
</div>

<div class="modal" id="modal_nuevo_usuario">
   <div class="modal-dialog">
      <div class="modal-content">
         <form name="f_nuevo_usuario" class="form" role="form" action="<?php echo $fsc->page->url();?>" method="post">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title">
                  <span class="glyphicon glyphicon-user"></span> &nbsp; Nuevo usuario
               </h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  Nick:
                  <input class="form-control" type="text" name="nnick" maxlength="12" autocomplete="off" required=""/>
               </div>
               <div class="form-group">
                  Contraseña:
                  <input class="form-control" type="password" name="npassword" maxlength="12"/>
               </div>
               <div class="form-group">
                  <label>
                     <input type="checkbox" name="nadmin" value="TRUE"/>
                     Administrador
                  </label>
               </div>
               <div class="form-group">
                  <a target="_blank" href="<?php echo $fsc->agente->url();?>">Empleado</a>:
                  <select name="ncodagente" class="form-control">
                     <option value="">Ninguno</option>
                     <option value="">------</option>
                     <?php $loop_var1=$fsc->agente->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <option value="<?php echo $value1->codagente;?>"><?php echo $value1->get_fullname();?></option>
                     <?php } ?>

                  </select>
                  <p class="help-block">
                     Puedes tener empleados que no tengan acceso a Sartin,
                     o bien usuarios que no sean empleados, por eso está separado.
                  </p>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-primary" type="submit">
                  <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp; Guardar
               </button>
            </div>
         </form>
      </div>
   </div>
</div>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
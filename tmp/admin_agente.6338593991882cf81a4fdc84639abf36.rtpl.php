<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<?php if( $fsc->agente ){ ?>

<script type="text/javascript" src="<?php echo $fsc->get_js_location('provincias.js');?>"></script>
<script type="text/javascript">
   $(document).ready(function () {
      $("#b_delete_agente").click(function (event) {
         event.preventDefault();
         if( confirm("¿Realmente desea eliminar el agente?") )
            window.location.href = '<?php echo $fsc->ppage->url();?>&delete=<?php echo $fsc->agente->codagente;?>';
      });
   });
</script>

<div class="container-fluid">
   <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
      <div class="col-sm-4 col-xs-3">
         <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>" title="Recargar la página">
            <span class="glyphicon glyphicon-refresh"></span>
         </a>
         <a class="btn btn-sm btn-default" href="index.php?page=admin_agentes">
            <span class="glyphicon glyphicon-arrow-left"></span>
            <span class="hidden-xs">&nbsp; Doctores</span>
         </a>
      </div>
      <div class="col-sm-4 col-xs-6 text-center">
         <h2 style="margin-top: 0px;">Editar doctor</h2>
      </div>
      <div class="col-sm-4 col-xs-3 text-right">
         <?php if( $fsc->allow_delete ){ ?>

         <a href="#" id="b_delete_agente" class="btn btn-sm btn-danger">
            <span class="glyphicon glyphicon-trash"></span>
            <span class="hidden-xs">&nbsp; Eliminar</span>
         </a>
         <?php } ?>

      </div>
   </div>
   <div class="row">
      <div class="col-lg-2 col-md-3 col-sm-3">
         <div class="list-group">
            <a id="b_generales" href="<?php echo $fsc->url();?>" class="list-group-item active">
               <span class="glyphicon glyphicon-dashboard"></span> &nbsp; Datos generales
            </a>
            <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <?php if( $value1->type=='button' ){ ?>

               <a id="b_<?php echo $value1->from;?>" href="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>&codagente=<?php echo $fsc->agente->codagente;?>" class="list-group-item">
                  <?php echo $value1->text;?>

               </a>
               <?php } ?>

            <?php } ?>

         </div>
      </div>
      <div class="col-lg-10 col-md-9 col-sm-9">
         <form class="form" role="form" action="<?php echo $fsc->url();?>" method="post">
            <div class='panel <?php if( $fsc->agente->f_baja ){ ?>panel-danger<?php }else{ ?>panel-primary<?php } ?>' id='panel_generales'>
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <?php echo $fsc->agente->get_fullname();?>

                     <?php if( $fsc->agente->f_baja ){ ?>

                     &nbsp; <span class="label label-default" title="El empleado ha sido dado de baja">Baja</span>
                     <?php } ?>

                  </h3>
               </div>
               <div class="panel-body">
                  <div class="col-sm-4">
                     <div class="form-group">
                        Nombre:
                        <input class="form-control" type="text" name="nombre" value="<?php echo $fsc->agente->nombre;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Apellidos:
                        <input class="form-control" type="text" name="apellidos" value="<?php echo $fsc->agente->apellidos;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        <?php  echo FS_CIFNIF;?>:
                        <input class="form-control" type="text" name="dnicif" value="<?php echo $fsc->agente->dnicif;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Teléfono:
                        <input class="form-control" type="text" name="telefono" value="<?php echo $fsc->agente->telefono;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Email:
                        <input class="form-control" type="text" name="email" value="<?php echo $fsc->agente->email;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Cargo ocupado:
                        <input class="form-control" type="text" name="cargo" value="<?php echo $fsc->agente->cargo;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Provincia:
                        <input id="ac_provincia" class="form-control" type="text" name="provincia" value="<?php echo $fsc->agente->provincia;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Ciudad:
                        <input class="form-control" type="text" name="ciudad" value="<?php echo $fsc->agente->ciudad;?>"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Dirección:
                        <input class="form-control" type="text" name="direccion" value="<?php echo $fsc->agente->direccion;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Fecha Nacimiento:
                        <div class="input-group">
                           <span class="input-group-addon">
                              <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                           <input class="form-control datepicker" type="text" name="f_nacimiento" value="<?php echo $fsc->agente->f_nacimiento;?>" autocomplete="off"/>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Fecha Alta:
                        <div class="input-group">
                           <span class="input-group-addon">
                              <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                           <input class="form-control datepicker" type="text" name="f_alta" value="<?php echo $fsc->agente->f_alta;?>" autocomplete="off"/>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        Fecha Baja:
                        <div class="input-group">
                           <span class="input-group-addon">
                              <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                           <input class="form-control datepicker" type="text" name="f_baja" value="<?php echo $fsc->agente->f_baja;?>" autocomplete="off"/>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-5">
                     <div class="form-group">
                        Matrícula Profesional
                        <input class="form-control" type="text" name="seg_social" value="<?php echo $fsc->agente->seg_social;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-5" style="display:none">
                     <div class="form-group">
                        Cuenta Bancaria:
                        <input class="form-control" type="text" name="banco" value="<?php echo $fsc->agente->banco;?>" autocomplete="off"/>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="form-group">
                        Comisión:
                        <div class="input-group">
                           <span class="input-group-addon">%</span>
                           <input class="form-control" type="text" name="porcomision" value="<?php echo $fsc->agente->porcomision;?>" autocomplete="off"/>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="panel-footer" style="text-align: right;">
                  <button class="btn btn-sm btn-primary" type="submit" onclick="this.disabled = true; this.form.submit();">
                     <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp; Guardar
                  </button>
               </div>
            </div>
         </form>
      </div>
   </div>
</div>
<?php }else{ ?>

<div class="thumbnail">
   <img src="view/img/fuuu_face.png" alt="fuuuuu"/>
</div>
<?php } ?>


<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
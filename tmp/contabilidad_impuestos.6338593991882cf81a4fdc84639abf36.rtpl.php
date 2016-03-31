<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<script type="text/javascript">
   function delete_impuesto(cod)
   {
      if( confirm("¿Realmente desea eliminar el impuesto "+cod+"?") )
         window.location.href = '<?php echo $fsc->url();?>&delete='+cod;
   }
</script>

<div class="container">
   <div class="row">
      <div class="col-sm-12">
         <div class="page-header">
            <h1>
               Impuestos
               <a class="btn btn-xs btn-default" href="<?php echo $fsc->url();?>" title="Recargar la página">
                  <span class="glyphicon glyphicon-refresh"></span>
               </a>
               <div class="btn-group">
               <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <?php if( $value1->type=='button' ){ ?>

                  <a href="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>" class="btn btn-xs btn-default"><?php echo $value1->text;?></a>
                  <?php } ?>

               <?php } ?>

               </div>
            </h1>

            <p class="help-block">
           
            
         </div>
         <div class="table-responsive">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th class="text-left" width="150">Código</th>
                     <th class="text-left">Descripción</th>
                     <th class="text-right" width="120">% <?php  echo FS_IVA;?></th>
                     <th class="text-right" width="120" style="display:none;">% Recargo</th>
                     
                     <th class="text-right" width="180">Acciones</th>
                  </tr>
               </thead>
               <?php $loop_var1=$fsc->impuesto->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

               <form class="form" role="form" action ="<?php echo $fsc->url();?>" method="post">
                  <input type="hidden" name="codimpuesto" value="<?php echo $value1->codimpuesto;?>"/>
                  <tr>
                     <td><div class="form-control"><?php echo $value1->codimpuesto;?></div></td>
                     <td>
                        <input class="form-control" type="text" name="descripcion" value="<?php echo $value1->descripcion;?>" autocomplete="off"/>
                     </td>
                     <td>
                        <input class="form-control text-right" type="number" step="any" name="iva" value="<?php echo $value1->iva;?>" autocomplete="off"/>
                     </td>
                     <td style="display:none;">
                        <input class="form-control text-right" type="number" step="any" name="recargo" value="<?php echo $value1->recargo;?>" autocomplete="off"/>
                     </td>
                    
                     <td class="text-right">
                        <div class="btn-group">
                           <?php if( $value1->is_default() ){ ?>

                           <a href="#" class="btn btn-sm btn-success" title="Impuesto predeterminado">
                              <span class="glyphicon glyphicon-flag"></span>
                           </a>
                           <?php }else{ ?>

                           <a href="<?php echo $fsc->url();?>&set_default=<?php echo $value1->codimpuesto;?>" class="btn btn-sm btn-default" title="Marcar como impuesto predeterminado">
                              <span class="glyphicon glyphicon-flag"></span>
                           </a>
                           <?php } ?>

                        </div>
                        <div class="btn-group">
                           <?php if( $fsc->allow_delete ){ ?>

                           <button class="btn btn-sm btn-danger" type="button" title="Eliminar" onclick="delete_impuesto('<?php echo $value1->codimpuesto;?>')">
                              <span class="glyphicon glyphicon-trash"></span>
                           </button>
                           <?php } ?>

                           <button class="btn btn-sm btn-primary" type="submit" onclick="this.disabled=true;this.form.submit();" title="Guardar">
                              <span class="glyphicon glyphicon-floppy-disk"></span>
                           </button>
                        </div>
                     </td>
                  </tr>
               </form>
               <?php } ?>

               <form class="form" name="f_nuevo_impuesto" action="<?php echo $fsc->url();?>" method="post">
                  <tr class="bg-info">
                     <td><input class="form-control" type="text" name="codimpuesto" maxlength="10" placeholder="Nuevo código..." autocomplete="off"/></td>
                     <td><input class="form-control" type="text" name="descripcion" placeholder="Descripción" autocomplete="off"/></td>
                     <td><input class="form-control text-right" type="number" step="any" name="iva" value="0" autocomplete="off"/></td>
                     <td style="display:none;"><input class="form-control text-right" type="number" step="any" name="recargo" value="0" autocomplete="off"/></td>

                     <td class="text-right">
                        <button class="btn btn-sm btn-primary" type="submit" onclick="this.disabled=true;this.form.submit();" title="Guardar">
                           <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                     </td>
                  </tr>
               </form>
            </table>
         </div>
      </div>
   </div>
</div>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
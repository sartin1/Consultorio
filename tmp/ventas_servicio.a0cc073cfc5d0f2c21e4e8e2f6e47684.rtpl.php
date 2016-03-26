<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<?php if( $fsc->servicio ){ ?>

<?php if( $fsc->servicio->editable() ){ ?>

<script type="text/javascript" src="<?php echo $fsc->get_js_location('provincias.js');?>"></script>
<script type="text/javascript" src="<?php echo $fsc->get_js_location('nueva_venta.js');?>"></script>
<script type="text/javascript" src="plugins/servicios/view/js/collapse.js"></script>
<script type="text/javascript" src="plugins/servicios/view/js/transition.js"></script>
<script type="text/javascript" src="plugins/servicios/view/js/Moment.js"></script>
<script type="text/javascript" src="plugins/servicios/view/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="plugins/servicios/view/js/bootstrap-datetimepicker.es.js"></script>
<link rel="stylesheet" href="plugins/servicios/view/css/bootstrap-datetimepicker.css" />
<script type="text/javascript">
   numlineas = <?php echo count($fsc->servicio->get_lineas()); ?>;
   fs_nf0 = <?php  echo FS_NF0;?>;
   all_impuestos = <?php echo json_encode($fsc->impuesto->all()); ?>;
   all_series = <?php echo json_encode($fsc->serie->all()); ?>;
   cliente = <?php echo json_encode($fsc->cliente_s); ?>;
   nueva_venta_url = '<?php echo $fsc->nuevo_servicio_url;?>';
   kiwimaru_url = '<?php  echo FS_COMMUNITY_URL;?>/index.php?page=kiwimaru';
   function check(id) {
      if($("#"+id).is(":checked"))
      {
         $("#checked_"+id).prop("disabled",false);
      }
      else
      {
         $("#checked_"+id).prop("disabled",true);
      }
   };
   $(document).ready(function () {
      $('#numlineas').val(numlineas);
      usar_serie();
      recalcular();
      $('#ac_cliente').autocomplete({
         serviceUrl: nueva_venta_url,
         paramName: 'buscar_cliente',
         onSelect: function (suggestion) {
            if (suggestion)
            {
               if (document.f_servicio.cliente.value != suggestion.data && suggestion.data != '')
               {
                  document.f_servicio.cliente.value = suggestion.data;
                  usar_cliente(suggestion.data);
               }
            }
         }
      });
   });
</script>
<?php } ?>

<script type="text/javascript">
   function show_tab_grupos()
   {
      $('#tabs_servicio a:first').tab('show');
   }
   $(document).ready(function () {
      $('#b_imprimir').click(function (event) {
         event.preventDefault();
         $('#modal_imprimir_servicio').modal('show');
      });
      $('#b_enviar').click(function (event) {
         event.preventDefault();
         $('#modal_enviar').modal('show');
         document.enviar_email.email.select();
      });
      $('#b_eliminar').click(function (event) {
         event.preventDefault();
         $('#modal_eliminar').modal('show');
      });

      <?php if( $fsc->servicio->totalrecargo==0 ){ ?>

      $('.recargo').hide();
      <?php } ?>

      <?php if( $fsc->servicio->totalirpf==0 ){ ?>

      $('.irpf').hide();
      <?php } ?>

   });
</script>

<form name="f_servicio" action="<?php echo $fsc->servicio->url();?>" method="post" class="form">
   <input type="hidden" name="idservicio" value="<?php echo $fsc->servicio->idservicio;?>"/>
   <input type="hidden" name="cliente" value="<?php echo $fsc->servicio->codcliente;?>"/>
   <input type="hidden" id="numlineas" name="numlineas" value="0"/>
   <div class="container-fluid">
      <div class="row" style="margin-top: 10px;">
         <div class="col-md-8 col-sm-8 col-xs-8">
            <a class="btn btn-sm btn-default" href="<?php echo $fsc->url();?>" title="Recargar la página">
               <span class="glyphicon glyphicon-refresh"></span>
            </a>
            <div class="btn-group">
               <a id="b_imprimir" class="btn btn-sm btn-default" href="#">
                  <span class="glyphicon glyphicon-print"></span>
                  <span class="hidden-xs"> &nbsp; Imprimir</span>
               </a>
               <?php if( $fsc->empresa->can_send_mail() ){ ?>

               <a id="b_enviar" class="btn btn-sm btn-default" href="#">
                  <span class="glyphicon glyphicon-envelope"></span>
                  <span class="hidden-xs"> &nbsp; Enviar</span>
               </a>
               <?php } ?>

               <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <?php if( $value1->type=='button' ){ ?>

                  <a href="index.php?page=<?php echo $value1->from;?>&id=<?php echo $fsc->servicio->idservicio;?><?php echo $value1->params;?>" class="btn btn-sm btn-default"><?php echo $value1->text;?></a>
                  <?php } ?>

               <?php } ?>

            </div>
            <?php if( $fsc->servicio->idalbaran ){ ?>

            <div class="btn-group">
               <a class="btn btn-sm btn-info text-capitalize" href="<?php echo $fsc->servicio->albaran_url();?>">
                  <span class="glyphicon glyphicon-eye-open"></span>
                  <span class="hidden-xs"> &nbsp; Ver <?php  echo FS_ALBARAN;?></span>
               </a>
            </div>
            <?php } ?>

         </div>
         <div class="col-md-4 col-sm-4 col-xs-4 text-right">
            <a class="btn btn-sm btn-success" href="index.php?page=nuevo_servicio">
               <span class="glyphicon glyphicon-plus"></span>
            </a>
            <div class="btn-group">
               <?php if( $fsc->allow_delete ){ ?>

               <a id="b_eliminar" class="btn btn-sm btn-danger" href="#">
                  <span class="glyphicon glyphicon-trash"></span>
                  <span class="hidden-xs"> &nbsp; Eliminar</span>
               </a>
               <?php } ?>

               <button class="btn btn-sm btn-primary" type="submit" onclick="show_tab_grupos()">
                  <span class="glyphicon glyphicon-floppy-disk"></span>
                  <span class="hidden-xs"> &nbsp; Guardar</span>
               </button>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-md-12">
            <br/>
            <ol class="breadcrumb" style="margin-bottom: 5px;">
               <li><a href="<?php echo $fsc->ppage->url();?>">Ventas</a></li>
               <li><a href="<?php echo $fsc->ppage->url();?>">Turnos</a></li>
               <li>
                  <a href="<?php echo $fsc->servicio->cliente_url();?>"><?php echo $fsc->servicio->nombrecliente;?></a>
               </li>
               <?php if( $fsc->cliente_s ){ ?>

                  <?php if( $fsc->cliente_s->nombre!=$fsc->servicio->nombrecliente ){ ?>

                  <li>
                     <a href="#" onclick="alert('Paciente conocido como: <?php echo $fsc->cliente_s->nombre;?>')">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                     </a>
                  </li>
                  <?php } ?>

               <?php } ?>

               <li class="active"><b><?php echo $fsc->servicio->codigo;?></b></li>
            </ol>
            <p class="help-block">
               <?php if( $fsc->agente ){ ?>

               <span class="text-capitalize">Turno</span> creado por
               <a href="<?php echo $fsc->agente->url();?>"><?php echo $fsc->agente->get_fullname();?></a>.
               <?php }else{ ?>

               Sin datos de qué empleado ha creado este Turno.
               <?php } ?>

            </p>
         </div>
      </div>
      <div class="row">
         <?php if( $fsc->servicio->editable() ){ ?>

         <div class="col-md-4 col-sm-12">
            <div class="form-group">
               Paciente actual:
               <div class="input-group">
                  <input class="form-control" type="text" name="ac_cliente" id="ac_cliente" value="<?php echo $fsc->servicio->nombrecliente;?>" placeholder="Buscar" autocomplete="off"/>
                  <span class="input-group-btn">
                     <button class="btn btn-default" type="button" onclick="document.f_servicio.ac_cliente.value = '';document.f_servicio.ac_cliente.focus();">
                        <span class="glyphicon glyphicon-edit"></span>
                     </button>
                  </span>
               </div>
            </div>
         </div>
         <?php } ?>

         <div class="col-md-2 col-sm-3">
            <div class="form-group">
               <span class='text-capitalize'><?php  echo FS_NUMERO2;?>:</span>
               <input class="form-control" type="text" name="numero2" value="<?php echo $fsc->servicio->numero2;?>"/>
            </div>
         </div>
         <div class="col-md-2 col-sm-3">
            <div class="form-group">
               <a href="index.php?page=opciones_servicios#estados" target="_blank">Estado</a>:
               <select name="estado" class="form-control">
                  <?php $loop_var1=$fsc->estado->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <option value="<?php echo $value1->id;?>"<?php if( $value1->id==$fsc->servicio->idestado ){ ?> selected="selected"<?php } ?>><?php echo $value1->descripcion;?></option>
                  <?php } ?>

               </select>
            </div>
         </div>
         <div class="col-md-2 col-sm-3">
            <div class="form-group">
               Fecha:
               <?php if( $fsc->servicio->editable() ){ ?>

               <input class="form-control datepicker" type="text" name="fecha" value="<?php echo $fsc->servicio->fecha;?>" autocomplete="off"/>
               <?php }else{ ?>

               <div class="form-control"><?php echo $fsc->servicio->fecha;?></div>
               <?php } ?>

            </div>
         </div>
         <div class="col-md-2 col-sm-3">
            <div class="form-group">
               Hora:
               <?php if( $fsc->servicio->editable() ){ ?>

               <input class="form-control" type="text" name="hora" value="<?php echo $fsc->servicio->hora;?>" autocomplete="off"/>
               <?php }else{ ?>

               <div class="form-control"><?php echo $fsc->servicio->hora;?></div>
               <?php } ?>

            </div>
         </div>
      </div>
   </div>

   <div role="tabpanel">
      <ul id="tabs_servicio" class="nav nav-tabs" role="tablist">
         <li role="presentation" class="active">
            <a href="#servicio" aria-controls="servicio" role="tab" data-toggle="tab">
               <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
               <span class="hidden-xs">&nbsp; <?php echo $fsc->st['st_servicios'];?></span>
            </a>
         </li>
         <li role="presentation">
            <a href="#lineas_p" aria-controls="lineas_p" role="tab" data-toggle="tab">
               <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
               <span class="hidden-xs">&nbsp; Precios predeterminados</span>
            </a>
         </li>
         <?php if( $fsc->servicio->editable() ){ ?>

         <li role="presentation">
            <a href="#direccion_p" aria-controls="direccion_p" role="tab" data-toggle="tab">
               <span class="glyphicon glyphicon-road" aria-hidden="true"></span>
               <span class="hidden-xs">&nbsp; Dirección</span>
            </a>
         </li>
         <li>
            <a href="#detalles" aria-controls="detalles" role="tab" data-toggle="tab">
               <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
               <span class="hidden-xs">&nbsp; Comentarios</span>
               <span class="hidden-sm badge"><?php echo $fsc->servicio->num_detalles();?></span>
            </a>
        </li>
 
         <?php } ?>

         <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

            <?php if( $value1->type=='tab' ){ ?>

            <li role="presentation">
               <a href="#ext_<?php echo $value1->name;?>" aria-controls="ext_<?php echo $value1->name;?>" role="tab" data-toggle="tab"><?php echo $value1->text;?></a>
            </li>
            <?php } ?>

         <?php } ?>

      </ul>
      <div class="tab-content">
         <div role="tabpanel" class="tab-pane active" id="servicio">
            <div class="container-fluid" style="margin-top: 10px;">   
               <div class="row">
                  <?php if( $fsc->servicios_setup['servicios_mostrar_material'] ){ ?>

                  <div class="col-sm-4">
                     <div class="form-group <?php if( $fsc->servicios_setup['servicios_material'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_material'];?>

                        <textarea class="form-control" name="material" rows="2" <?php if( $fsc->servicios_setup['servicios_material'] ){ ?> required<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> readonly<?php } ?>><?php echo $fsc->servicio->material;?></textarea>
                     </div>
                  </div>
                  <?php } ?>

                  <?php if( $fsc->servicios_setup['servicios_mostrar_material_estado'] ){ ?>

                  <div class="col-sm-4">
                     <div class="form-group <?php if( $fsc->servicios_setup['servicios_material_estado'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_material_estado'];?>

                        <textarea class="form-control" name="material_estado" rows="2" <?php if( $fsc->servicios_setup['servicios_material_estado'] ){ ?> required<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> readonly<?php } ?>><?php echo $fsc->servicio->material_estado;?></textarea>
                     </div>
                  </div>
                  <?php } ?>

                  <?php if( $fsc->servicios_setup['servicios_mostrar_accesorios'] ){ ?>

                  <div class="col-sm-4">
                     <div class="form-group <?php if( $fsc->servicios_setup['servicios_accesorios'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_accesorios'];?>

                        <textarea class="form-control" name="accesorios" rows="2" <?php if( $fsc->servicios_setup['servicios_accesorios'] ){ ?> required<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> readonly<?php } ?>><?php echo $fsc->servicio->accesorios;?></textarea>
                     </div>
                  </div>
                  <?php } ?>

               </div>            
               <div class="row">
                  <?php if( $fsc->servicios_setup['servicios_mostrar_descripcion'] ){ ?>

                  <div class="col-sm-6">
                     <div class="form-group <?php if( $fsc->servicios_setup['servicios_descripcion'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_descripcion'];?>

                        <textarea class="form-control" name="descripcion" rows="2" <?php if( $fsc->servicios_setup['servicios_descripcion'] ){ ?> required<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> readonly<?php } ?>><?php echo $fsc->servicio->descripcion;?></textarea>
                     </div>
                  </div>
                  <?php } ?>

                  <?php if( $fsc->servicios_setup['servicios_mostrar_solucion'] ){ ?>

                  <div class="col-sm-6">
                     <div class="form-group <?php if( $fsc->servicios_setup['servicios_solucion'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_solucion'];?>

                        <textarea class="form-control" name="solucion" rows="2" <?php if( $fsc->servicios_setup['servicios_solucion'] ){ ?> required<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> readonly<?php } ?>><?php echo $fsc->servicio->solucion;?></textarea>
                     </div>
                  </div>
                  <?php } ?>

               </div>   
               <div class="row bg-info">
               <script type="text/javascript">
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                    
                    $('#fechainicio').datetimepicker({
                        language: 'es',
                        format: 'DD-MM-YYYY HH:mm',
                        extraFormats: [ 'DD-MM-YYYY HH:mm', 'DD-M-YYYY HH:mm' ],
                        startDate: new Date(),
                        minDate: moment(),
                    });
                    $('#fechafin').datetimepicker({
                        language: 'es',
                        format: 'DD-MM-YYYY HH:mm',
                        startDate: new Date(), 
                        minDate: moment(),
                    });
                    $('#fechainicio input').click(function(event){
                        $('#fechainicio ').data("DateTimePicker").show();
                    });
                    $('#fechafin input').click(function(event){
                        $('#fechafin ').data("DateTimePicker").show();
                    });
                });
                </script>
                  <?php if( $fsc->servicios_setup['servicios_mostrar_fechainicio'] ){ ?>

                <div class='col-sm-3'>
                    <div class="form-group <?php if( $fsc->servicios_setup['servicios_fechainicio'] ){ ?>has-error<?php } ?>">
                        <?php echo $fsc->st['st_fechainicio'];?>

                        <div class='input-group date' id='fechainicio'>
                            <input type='text' id="fechainicio" data-toggle="tooltip" data-placement="bottom" title="Fecha: : dd-mm-aaaa hh:mm" name="fechainicio" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4} ([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]" value="<?php echo $fsc->servicio->fechainicio;?>" class="form-control" <?php if( $fsc->servicios_setup['servicios_fechainicio'] ){ ?> required<?php } ?>/>
                            <span class="input-group-addon">
                                 <span class="glyphicon glyphicon-calendar"></span>
                            </span>             
                        </div>
                    </div>
                </div>   
                <?php } ?>  
                  <?php if( $fsc->servicios_setup['servicios_mostrar_fechafin'] ){ ?>

                  <div class='col-sm-3'>
                   <div class="form-group <?php if( $fsc->servicios_setup['servicios_fechafin'] ){ ?>has-error<?php } ?>">
                       <?php echo $fsc->st['st_fechafin'];?>

                        <div class='input-group date' id='fechafin' <?php if( $fsc->servicios_setup['servicios_fechafin'] ){ ?>has-error<?php } ?>>
                            <input type="text" data-toggle="tooltip" data-placement="bottom" title="Fecha: : dd-mm-aaaa hh:mm" name="fechafin" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4} ([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]" value="<?php echo $fsc->servicio->fechafin;?>" class="form-control" <?php if( $fsc->servicios_setup['servicios_fechafin'] ){ ?> required<?php } ?>/>
                            <span class="input-group-addon">
                                 <span class="glyphicon glyphicon-calendar"></span>
                            </span> 
                        </div>
                    </div>
                </div>
                  <?php } ?>

                  <?php if( $fsc->servicios_setup['servicios_mostrar_garantia'] ){ ?>

                  <div class="col-sm-1">
                     <div class="checkbox">
                        <label>
                           <input type="checkbox" name="garantia" value="TRUE"<?php if( $fsc->servicio->garantia ){ ?> checked="checked"<?php } ?><?php if( !$fsc->servicio->editable() ){ ?> disabled<?php } ?>/>
                           Es garantía
                        </label>
                     </div>
                  </div>
                  <?php } ?>

                  <div class="col-sm-2">
                     <div class="form-group">
                         Prioridad:                       
                        <select name="prioridad" class="form-control"<?php if( !$fsc->servicio->editable() ){ ?> disabled<?php } ?>>
                           <?php $loop_var1=$fsc->servicio->listar_prioridad(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <option value="<?php echo $value1['id_prioridad'];?>"<?php if( $value1['id_prioridad'] == $fsc->servicio->prioridad ){ ?> selected="selected"<?php } ?>><?php echo $value1['nombre_prioridad'];?></option>
                           <?php } ?>

                        </select>
                     </div>
                  </div>   
               </div>     
            </div>
         </div>
         <div role="tabpanel" class="tab-pane" id="lineas_p">
            <div class="table-responsive">
               <?php if( $fsc->servicio->editable() ){ ?>

               <table class="table table-condensed">
                  <thead>
                     <tr>
                        <th class="text-left" width="180">Referencia</th>
                        <th class="text-left">Descripción</th>
                        <th class="text-right" width="90">Cantidad</th>
                        <th width="60"></th>
                        <th class="text-right" width="110">Precio</th>
                        <th class="text-right" width="90">Dto. %</th>
                        <th class="text-right" width="130">Neto</th>
                        <th class="text-right" width="115"><?php  echo FS_IVA;?></th>
                        <th class="text-right recargo">RE %</th>
                        <th class="text-right irpf"><?php  echo FS_IRPF;?> %</th>
                        <th class="text-right" width="140">Total</th>
                     </tr>
                  </thead>
                  <tbody id="lineas_albaran">
                     <?php $loop_var1=$fsc->servicio->get_lineas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <tr id="linea_<?php echo $counter1;?>">
                        <td>
                           <input type="hidden" name="idlinea_<?php echo $counter1;?>" value="<?php echo $value1->idlinea;?>"/>
                           <input type="hidden" name="referencia_<?php echo $counter1;?>" value="<?php echo $value1->referencia;?>"/>
                           <div class="form-control">
                              <a target="_blank" href="<?php echo $value1->articulo_url();?>"><?php echo $value1->referencia;?></a>
                           </div>
                        </td>
                        <td><textarea class="form-control" name="desc_<?php echo $counter1;?>" rows="1" onclick="this.select()"><?php echo $value1->descripcion;?></textarea></td>
                        <td>
                           <input type="number" step="any" id="cantidad_<?php echo $counter1;?>" class="form-control text-right" name="cantidad_<?php echo $counter1;?>"
                                  value="<?php echo $value1->cantidad;?>" onchange="recalcular()" onkeyup="recalcular()" autocomplete="off" value="1"/>
                        </td>
                        <td>
                           <button class="btn btn-sm btn-danger" type="button" onclick="$('#linea_<?php echo $counter1;?>').remove();recalcular();">
                              <span class="glyphicon glyphicon-trash"></span>
                           </button>
                        </td>
                        <td>
                           <input type="text" class="form-control text-right" id="pvp_<?php echo $counter1;?>" name="pvp_<?php echo $counter1;?>" value="<?php echo $value1->pvpunitario;?>"
                                  onkeyup="recalcular()" onclick="this.select()" autocomplete="off"/>
                        </td>
                        <td>
                           <input type="text" id="dto_<?php echo $counter1;?>" name="dto_<?php echo $counter1;?>" value="<?php echo $value1->dtopor;?>" class="form-control text-right"
                                  onkeyup="recalcular()" onclick="this.select()" autocomplete="off"/>
                        </td>
                        <td>
                           <input type="text" class="form-control text-right" id="neto_<?php echo $counter1;?>" name="neto_<?php echo $counter1;?>"
                                  onchange="ajustar_neto()" onclick="this.select()" autocomplete="off"/>
                        </td>
                        <td>
                           <select class="form-control" id="iva_<?php echo $counter1;?>" name="iva_<?php echo $counter1;?>" onchange="ajustar_iva('<?php echo $counter1;?>')">
                           <?php $loop_var2=$fsc->impuesto->all(); $counter2=-1; if($loop_var2) foreach( $loop_var2 as $key2 => $value2 ){ $counter2++; ?>

                              <?php if( $value1->codimpuesto==$value2->codimpuesto ){ ?>

                              <option value="<?php echo $value2->iva;?>" selected=""><?php echo $value2->descripcion;?></option>
                              <?php }else{ ?>

                              <option value="<?php echo $value2->iva;?>"><?php echo $value2->descripcion;?></option>
                              <?php } ?>

                           <?php } ?>

                           </select>
                        </td>
                        <td class="recargo">
                           <input type="text" class="form-control text-right" id="recargo_<?php echo $counter1;?>" name="recargo_<?php echo $counter1;?>" value="<?php echo $value1->recargo;?>"
                                  onchange="recalcular()" onclick="this.select()" autocomplete="off"/>
                        </td>
                        <td class="irpf">
                           <input type="text" class="form-control text-right" id="irpf_<?php echo $counter1;?>" name="irpf_<?php echo $counter1;?>" value="<?php echo $value1->irpf;?>"
                                  onchange="recalcular()" onclick="this.select()" autocomplete="off"/>
                        </td>
                        <td>
                           <input type="text" class="form-control text-right" id="total_<?php echo $counter1;?>" name="total_<?php echo $counter1;?>"
                                  onchange="ajustar_total()" onclick="this.select()" autocomplete="off"/>
                        </td>
                     </tr>
                     <?php } ?>

                  </tbody>
                  <tbody>
                     <tr class="bg-info">
                        <td><input id="i_new_line" class="form-control" type="text" placeholder="Buscar para añadir..." autocomplete="off"/></td>
                        <td>
                           <a href="#" class="btn btn-sm btn-default" title="Añadir sin buscar" onclick="return add_linea_libre()">
                              <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                           </a>
                        </td>
                        <td colspan="4" class="text-right">Totales:</td>
                        <td><div id="aneto" class="form-control text-right" style="font-weight: bold;"><?php echo $fsc->show_numero(0);?></div></td>
                        <td><div id="aiva" class="form-control text-right" style="font-weight: bold;"><?php echo $fsc->show_numero(0);?></div></td>
                        <td class="recargo"><div id="are" class="form-control text-right" style="font-weight: bold;"><?php echo $fsc->show_numero(0);?></div></td>
                        <td class="irpf"><div id="airpf" class="form-control text-right" style="font-weight: bold;"><?php echo $fsc->show_numero(0);?></div></td>
                        <td>
                           <input type="text" name="atotal" id="atotal" class="form-control text-right" style="font-weight: bold;"
                                  value="0" onchange="recalcular()" autocomplete="off"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="6"></td>
                        <td class="text-right"><?php echo $fsc->show_precio($fsc->servicio->neto);?></td>
                        <td class="text-right"><?php echo $fsc->show_precio($fsc->servicio->totaliva);?></td>
                        <td class="recargo text-right"><?php echo $fsc->show_precio($fsc->servicio->totalrecargo);?></td>
                        <td class="irpf text-right"><?php echo $fsc->show_precio($fsc->servicio->totalirpf);?></td>
                        <td class="text-right"><?php echo $fsc->show_precio($fsc->servicio->total);?></td>
                     </tr>
                  </tbody>
               </table>
               <?php }else{ ?>

               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th class="text-left">Artículo</th>
                        <th class="text-right">Cantidad</th>
                        <th class="text-right">Precio</th>
                        <th class="text-right">Dto</th>
                        <th class="text-right">Neto</th>
                        <th class="text-right"><?php  echo FS_IVA;?></th>
                        <th class="text-right recargo">RE</th>
                        <th class="text-right irpf"><?php  echo FS_IRPF;?></th>
                        <th class="text-right">Total</th>
                     </tr>
                  </thead>
                  <?php $loop_var1=$fsc->servicio->get_lineas(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <tr>
                     <td>
                        <a target="_blank" href="<?php echo $value1->articulo_url();?>"><?php echo $value1->referencia;?></a> <?php echo $value1->descripcion;?>

                     </td>
                     <td class="text-right"><?php echo $value1->cantidad;?></td>
                     <td class="text-right"><?php echo $fsc->show_precio($value1->pvpunitario, $fsc->servicio->coddivisa);?></td>
                     <td class="text-right"><?php echo $fsc->show_numero($value1->dtopor, 2);?> %</td>
                     <td class="text-right"><?php echo $fsc->show_precio($value1->pvptotal, $fsc->servicio->coddivisa);?></td>
                     <td class="text-right"><?php echo $fsc->show_numero($value1->iva, 2);?> %</td>
                     <td class="text-right recargo"><?php echo $fsc->show_numero($value1->recargo, 2);?> %</td>
                     <td class="text-right irpf"><?php echo $fsc->show_numero($value1->irpf, 2);?> %</td>
                     <td class="text-right"><?php echo $fsc->show_precio($value1->total_iva(), $fsc->servicio->coddivisa);?></td>
                  </tr>
                  <?php } ?>

                  <tr>
                     <td colspan="4"></td>
                     <td class="text-right"><b><?php echo $fsc->show_precio($fsc->servicio->neto, $fsc->servicio->coddivisa);?></b></td>
                     <td class="text-right"><b><?php echo $fsc->show_precio($fsc->servicio->totaliva, $fsc->servicio->coddivisa);?></b></td>
                     <td class="text-right recargo"><b><?php echo $fsc->show_precio($fsc->servicio->totalrecargo, $fsc->servicio->coddivisa);?></b></td>
                     <td class="text-right irpf"><b>-<?php echo $fsc->show_precio($fsc->servicio->totalirpf, $fsc->servicio->coddivisa);?></b></td>
                     <td class="text-right"><b><?php echo $fsc->show_precio($fsc->servicio->total, $fsc->servicio->coddivisa);?></b></td>
                  </tr>
               </table>
               <?php } ?>

            </div>
         </div>
         <?php if( $fsc->servicio->editable() ){ ?>

         <div role="tabpanel" class="tab-pane" id="direccion_p">
            <div class="container-fluid" style="margin-top: 10px;">
               <div class="row">
                  <div class="col-sm-3">
                     <div class="form-group">
                        <a href="<?php echo $fsc->pais->url();?>">País</a>:
                        <select class="form-control" name="codpais">
                           <?php $loop_var1=$fsc->pais->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <option value="<?php echo $value1->codpais;?>"<?php if( $value1->codpais==$fsc->servicio->codpais ){ ?> selected="selected"<?php } ?>><?php echo $value1->nombre;?></option>
                           <?php } ?>

                        </select>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="form-group">
                        <span class="text-capitalize"><?php  echo FS_PROVINCIA;?></span>:
                        <input id="ac_provincia" class="form-control" type="text" name="provincia" autocomplete="off" value="<?php echo $fsc->servicio->provincia;?>"/>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="form-group">
                        Ciudad:
                        <input class="form-control" type="text" name="ciudad" autocomplete="off" value="<?php echo $fsc->servicio->ciudad;?>"/>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="form-group">
                        Código Postal:
                        <input class="form-control" type="text" name="codpostal" autocomplete="off" value="<?php echo $fsc->servicio->codpostal;?>"/>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="form-group">
                        Dirección:
                        <input class="form-control" type="text" name="direccion" value="<?php echo $fsc->servicio->direccion;?>" autocomplete="off"/>
                     </div>
                  </div>
               </div>
            </div>
         </div>
          <div role="tabpanel" class="tab-pane" id="detalles">
            <div class="table-responsive">
               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th class="text-left">Usuario</th>
                        <th class="text-left">Detalle</th>
                        <th class="text-right">Fecha | Hora &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th></th>
                     </tr>
                  </thead>
                  <?php $loop_var1=$fsc->listar_servicio_detalle(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <tr>
                     <td><?php echo $value1->nick;?></td>
                     <td><?php echo $value1->descripcion;?></td>
                     <td class="text-right"><?php echo $value1->fecha;?> | <?php echo $value1->show_hora_detalle();?></td>
                     <td>
                        <?php if( $fsc->allow_delete ){ ?>

                        <a href="<?php echo $fsc->servicio->url();?>&delete_detalle=<?php echo $value1->id;?>#detalles"onClick="return confirm('¿Seguro que quieres eliminar este detalle?')">
                           <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        </a>
                        <?php } ?>

                     </td>
                  </tr>
                  <?php } ?>

                  <tr>
                     <td colspan="4">
                        <a href='#' class="btn btn-info btn-block btn-sm" data-toggle="modal" data-target="#modal_nuevo_detalle">
                           <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                           &nbsp; Nuevo detalle
                        </a>
                     </td>
                  </tr>
               </table>
            </div>
          </div>     
         <div role="tabpanel" class="tab-pane" id="opciones">
            <div class="container-fluid" style="margin-top: 10px;">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="form-group">
                        <a href="<?php echo $fsc->serie->url();?>">Serie</a>:
                        <select class="form-control" name="serie" id="codserie" onchange="usar_serie();recalcular();">
                        <?php $loop_var1=$fsc->serie->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <?php if( $value1->codserie==$fsc->servicio->codserie ){ ?>

                           <option value="<?php echo $value1->codserie;?>" selected="selected"><?php echo $value1->descripcion;?></option>
                           <?php }else{ ?>

                           <option value="<?php echo $value1->codserie;?>"><?php echo $value1->descripcion;?></option>
                           <?php } ?>

                        <?php } ?>

                        </select>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="form-group">
                        <a href="<?php echo $fsc->forma_pago->url();?>">Forma de pago</a>:
                        <select name="codpago" class="form-control">
                            <?php $loop_var1=$fsc->forma_pago->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                                <?php if( !$fsc->servicio->codpago ){ ?>

                                <option value="<?php echo $value1->codpago;?>"<?php if( $fsc->cliente_s->codpago == $value1->codpago ){ ?> selected=""<?php } ?>><?php echo $value1->descripcion;?></option>
                                <?php }elseif( $value1->codpago==$fsc->servicio->codpago ){ ?>

                                <option value="<?php echo $value1->codpago;?>" selected="selected"><?php echo $value1->descripcion;?></option>
                                <?php }else{ ?>

                                <option value="<?php echo $value1->codpago;?>"><?php echo $value1->descripcion;?></option>
                                <?php } ?>

                            <?php } ?>

                         </select>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="form-group">
                        <a href="<?php echo $fsc->divisa->url();?>">Divisa</a>:
                        <select name="divisa" class="form-control">
                        <?php $loop_var1=$fsc->divisa->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <?php if( $fsc->servicio->coddivisa=='' ){ ?>

                           <option value="<?php echo $value1->coddivisa;?>"<?php if( $value1->is_default() ){ ?> selected=""<?php } ?>><?php echo $value1->descripcion;?></option>
                           <?php }elseif( $value1->coddivisa==$fsc->servicio->coddivisa ){ ?>

                           <option value="<?php echo $value1->coddivisa;?>" selected="selected"><?php echo $value1->descripcion;?></option>
                           <?php }else{ ?>

                           <option value="<?php echo $value1->coddivisa;?>"><?php echo $value1->descripcion;?></option>
                           <?php } ?>

                        <?php } ?>

                        </select>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="form-group">
                        Tasa de conversión a €
                        <input type="text" name="tasaconv" class="form-control" placeholder="<?php echo $fsc->servicio->tasaconv;?>" autocomplete="off"/>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <?php } ?>

         <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

            <?php if( $value1->type=='tab' ){ ?>

            <div role="tabpanel" class="tab-pane" id="ext_<?php echo $value1->name;?>">
               <iframe src="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>&id=<?php echo $fsc->servicio->idservicio;?>" width="100%" height="600" frameborder="0"></iframe>
            </div>
            <?php } ?>

         <?php } ?>

      </div>
   </div>
   <hr>
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-12">
            <div class="form-group">
               Observaciones:
               <textarea class="form-control" name="observaciones" rows="3"><?php echo $fsc->servicio->observaciones;?></textarea>
            </div>
         </div>
      </div>
   </div>
</form>

<div class="modal" id="modal_articulos">
   <div class="modal-dialog" style="width: 99%; max-width: 1000px;">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Buscar artículos</h4>
         </div>
         <div class="modal-body">
            <form id="f_buscar_articulos" name="f_buscar_articulos" action="<?php echo $fsc->url();?>" method="post" class="form">
               <input type="hidden" name="codcliente" value="<?php echo $fsc->servicio->codcliente;?>"/>
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-sm-4">
                        <div class="input-group">
                           <input class="form-control" type="text" name="query" autocomplete="off"/>
                           <span class="input-group-btn">
                              <button class="btn btn-primary" type="submit">
                                 <span class="glyphicon glyphicon-search"></span>
                              </button>
                           </span>
                        </div>
                        <label>
                           <input type="checkbox" name="con_stock" value="TRUE" onchange="buscar_articulos()"/>
                           sólo con stock
                        </label>
                     </div>
                     <div class="col-sm-4">
                        <select class="form-control" name="codfamilia" onchange="buscar_articulos()">
                           <option value="">Cualquier familia</option>
                           <option value="">------</option>
                           <?php $loop_var1=$fsc->familia->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <option value="<?php echo $value1->codfamilia;?>"><?php echo $value1->nivel;?><?php echo $value1->descripcion;?></option>
                           <?php } ?>

                        </select>
                     </div>
                     <div class="col-sm-4">
                        <select class="form-control" name="codfabricante" onchange="buscar_articulos()">
                           <option value="">Cualquier fabricante</option>
                           <option value="">------</option>
                           <?php $loop_var1=$fsc->fabricante->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                           <option value="<?php echo $value1->codfabricante;?>"><?php echo $value1->nombre;?></option>
                           <?php } ?>

                        </select>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <ul class="nav nav-tabs" id="nav_articulos" style="display: none;">
            <li id="li_mis_articulos">
               <a href="#" id="b_mis_articulos">Mi catálogo</a>
            </li>
            <li id="li_kiwimaru">
               <a href="#" id="b_kiwimaru">
                  <span class="glyphicon glyphicon-globe"></span>
               </a>
            </li>
            <li id="li_nuevo_articulo">
               <a href="#" id="b_nuevo_articulo">
                  <span class="glyphicon glyphicon-plus"></span> &nbsp; Nuevo
               </a>
            </li>
         </ul>
         <div id="search_results"></div>
         <div id="kiwimaru_results"></div>
         <div id="nuevo_articulo" class="modal-body" style="display: none;">
            <form name="f_nuevo_articulo" action="<?php echo $fsc->url();?>" method="post" class="form">
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-sm-3">
                        <div class="form-group">
                           Referencia:
                           <input class="form-control" type="text" name="referencia" maxlength="18" autocomplete="off"/>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                           Descripción:
                           <textarea name="descripcion" rows="1" class="form-control"></textarea>
                        </div>
                     </div>
                     <div class="col-sm-3">
                        <div class="form-group">
                           <a href="<?php echo $fsc->familia->url();?>">Familia</a>:
                           <select name="codfamilia" class="form-control">
                              <option value="">Ninguna</option>
                              <option value="">------</option>
                              <?php $loop_var1=$fsc->familia->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <option value="<?php echo $value1->codfamilia;?>"><?php echo $value1->nivel;?><?php echo $value1->descripcion;?></option>
                              <?php } ?>

                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-4">
                        <div class="form-group">
                           <a href="<?php echo $fsc->fabricante->url();?>">Fabricante</a>:
                           <select name="codfabricante" class="form-control">
                              <option value="">Ninguno</option>
                              <option value="">------</option>
                              <?php $loop_var1=$fsc->fabricante->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <option value="<?php echo $value1->codfabricante;?>"><?php echo $value1->nombre;?></option>
                              <?php } ?>

                           </select>
                        </div>
                     </div>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <a href="<?php echo $fsc->impuesto->url();?>"><?php  echo FS_IVA;?></a>:
                           <select name="codimpuesto" class="form-control">
                              <?php $loop_var1=$fsc->impuesto->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                              <option value="<?php echo $value1->codimpuesto;?>"<?php if( $value1->is_default() ){ ?> selected="selected"<?php } ?>><?php echo $value1->descripcion;?></option>
                              <?php } ?>

                           </select>
                        </div>
                     </div>
                     <div class="col-sm-4">
                        <div class="form-group">
                           Precio de venta:
                           <input type="text" name="pvp" value="0" class="form-control" autocomplete="off"/>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-12 text-right">
                        <button class="btn btn-sm btn-primary" type="submit" onclick="new_articulo();return false;">
                           <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp; Guardar y seleccionar
                        </button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="modal_imprimir_servicio">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Imprimir Turno</h4>
         </div>
         <div class="modal-body">
         <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

            <?php if( $value1->type=='pdf' ){ ?>

            <a href="index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>&id=<?php echo $fsc->servicio->idservicio;?>" target="_blank" class="btn btn-block btn-default">
               <span class="glyphicon glyphicon-print"></span> &nbsp; <?php echo $value1->text;?>

            </a>
            <?php } ?>

         <?php } ?>

         </div>
       
      </div>
   </div>
</div>

<form class="form" role="form" name="enviar_email" action="<?php echo $fsc->url();?>" method="post">
   <div class="modal" id="modal_enviar">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title">Enviar detalle de turno</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  Email del paciente:
                  <input class="form-control" type="text" name="email" value="<?php echo $fsc->cliente_s->email;?>" autocomplete="off"/>
               </div>
                <div class="form-group">
                  <label>
                     <input id="copia" onclick="check(this.id)" type="checkbox" name="concopia" value="TRUE" checked="checked"/>
                     Enviar copia:
                  </label>
                  <input id="checked_copia" class="form-control" type="text" name="email_copia" value="<?php echo $fsc->empresa->email;?>" autocomplete="off"/>
               </div>
               <div class="form-group">
                  Mensaje:
                  <textarea class="form-control" name="mensaje" rows="6">Buenos días, le adjunto su detalle de turno <?php echo $fsc->servicio->codigo;?>.
<?php echo $fsc->empresa->email_firma;?></textarea>
               </div>
               <?php $loop_var1=$fsc->extensions; $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                  <?php if( $value1->type=='email' ){ ?>

                  <button class="btn btn-sm btn-primary" type="submit" onclick="this.disabled=true;this.form.action='index.php?page=<?php echo $value1->from;?><?php echo $value1->params;?>&id=<?php echo $fsc->servicio->idservicio;?>';this.form.submit();">
                     <span class="glyphicon glyphicon-send"></span> &nbsp; <?php echo $value1->text;?>

                  </button>
                  <?php } ?>

               <?php } ?>

            </div>
         </div>
      </div>
   </div>
</form>

<form action="<?php echo $fsc->ppage->url();?>" method="post">
   <input type="hidden" name="delete" value="<?php echo $fsc->servicio->idservicio;?>"/>
   <div class="modal fade" id="modal_eliminar">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title">¿Realmente desea eliminar este Turno?</h4>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-danger" onclick="this.disabled = true;this.form.submit();">
                  <span class="glyphicon glyphicon-trash"></span> &nbsp; Eliminar
               </button>
            </div>
            <?php if( $fsc->servicio->idalbaran ){ ?>

            <div class="alert alert-info">
               Hay un <?php  echo FS_ALBARAN;?> asociado que será eliminada junto con este Turno.
            </div>
            <?php } ?>

         </div>
      </div>
   </div>
</form>

<div class="modal fade" id="modal_nuevo_detalle">
   <div class="modal-dialog">
      <div class="modal-content">
         <form name="f_nuevo_detalle" action="<?php echo $fsc->servicio->url();?>#detalles" method="post" class="form">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title">Nuevo detalle</h4>
            </div>
            <div class="modal-body">
               <textarea class="form-control" name="detalle" rows="5" autofocus></textarea>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-primary" type="submit" onclick="this.disabled = true; this.form.submit();">
                  <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp; Guardar
               </button>
            </div>
         </form>
      </div>
   </div>
</div>
<?php }else{ ?>

<div class="text-center">
   <img src="view/img/fuuu_face.png" alt="fuuuuu"/>
</div>
<?php } ?>


<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
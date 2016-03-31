<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header") . ( substr("header",-1,1) != "/" ? "/" : "" ) . basename("header") );?>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
   // Load the Visualization API and the piechart package.
   google.load('visualization', '1.0', {'packages':['corechart']});
   
   // Set a callback to run when the Google Visualization API is loaded.
   google.setOnLoadCallback(drawChart);
   
   // Callback that creates and populates a data table,
   // instantiates the pie chart, passes in the data and
   // draws it.
   function drawChart()
   {
      // Create the data table.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'día');
      data.addColumn('number', 'ventas <?php echo $fsc->simbolo_divisa();?>');
      data.addColumn('number', '');
      data.addRows([
      <?php $loop_var1=$fsc->stats_last_days(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

         ['<?php echo $value1['day'];?>', <?php echo $value1['total_cli'];?>, <?php echo $value1['total_pro'];?>],
      <?php } ?>

      ]);
      
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.ColumnChart(document.getElementById('chart_facturas_day'));
      chart.draw(data);
      
      // Create the data table.
      var data2 = new google.visualization.DataTable();
      data2.addColumn('string', 'mes');
      data2.addColumn('number', 'ventas <?php echo $fsc->simbolo_divisa();?>');
      data2.addColumn('number', '');
      data2.addColumn('number', 'beneficios <?php echo $fsc->simbolo_divisa();?>');
      data2.addRows([
      <?php $loop_var1=$fsc->stats_last_months(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

         ['<?php echo $value1['month'];?>', <?php echo $value1['total_cli'];?>, <?php echo $value1['total_pro'];?>, <?php echo $value1['beneficios'];?>],
      <?php } ?>

      ]);
      
      // Instantiate and draw our chart, passing in some options.
      var chart2 = new google.visualization.AreaChart(document.getElementById('chart_facturas_month'));
      chart2.draw(data2);
      
      // Create the data table.
      var data3 = new google.visualization.DataTable();
      data3.addColumn('string', 'año');
      data3.addColumn('number', 'ventas <?php echo $fsc->simbolo_divisa();?>');
      data3.addColumn('number', '');
      data3.addColumn('number', 'beneficios <?php echo $fsc->simbolo_divisa();?>');
      data3.addRows([
      <?php $loop_var1=$fsc->stats_last_years(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

         ['<?php echo $value1['year'];?>', <?php echo $value1['total_cli'];?>, <?php echo $value1['total_pro'];?>, <?php echo $value1['beneficios'];?>],
      <?php } ?>

      ]);
      
      // Instantiate and draw our chart, passing in some options.
      var chart3 = new google.visualization.AreaChart(document.getElementById('chart_facturas_year'));
      chart3.draw(data3);
   }
   
   $(document).ready(function() {
      $("#ac_cliente").autocomplete({
         serviceUrl: '<?php echo $fsc->url();?>',
         paramName: 'buscar_cliente',
         onSelect: function (suggestion) {
            if(suggestion)
            {
               if(document.listado_facturas.codcliente.value != suggestion.data && suggestion.data != '')
               {
                  document.listado_facturas.codcliente.value = suggestion.data;
               }
            }
         }
      });
      $("#ac_proveedor").autocomplete({
         serviceUrl: '<?php echo $fsc->url();?>',
         paramName: 'buscar_proveedor',
         onSelect: function(suggestion) {
            if(suggestion)
            {
               if(document.listado_proveedor.codproveedor.value != suggestion.data && suggestion.data != '')
               {
                  document.listado_proveedor.codproveedor.value = suggestion.data;
               }
            }
         }
      });
   });
</script>

<div class="container-fluid" style="margin-top: 15px;">
   <div class="row">
      <div class="col-sm-12">
         <ul class="nav nav-pills">
            <li role="presentation" class="active">
               <a href="#">
                  <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
                  <span class="hidden-xs">&nbsp; Estadísticas</span>
               </a>
            </li>
            <li role="presentation" style="display:none">
               <a href="#" data-toggle="modal" data-target="#modal_compras">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                  <span class="hidden-xs">&nbsp; Facturas de compra</span>
               </a>
            </li>
            <li role="presentation">
               <a href="#" data-toggle="modal" data-target="#modal_ventas">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                  <span class="hidden-xs">&nbsp; Facturas de venta</span>
               </a>
            </li>
         </ul>
      </div>
   </div>
</div>

<div class="container-fluid" style="margin-top: 10px;">
   <div class="row">
      <div class="col-sm-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h3 class="panel-title">Facturación de los últimos días</h3>
            </div>
            <div class="panel-body">
               <div id="chart_facturas_day"></div>
            </div>
            <div class="panel-footer">
               <p class="help-block">

                  En todo el mes hay <?php echo $fsc->stats['facturas_venta'];?> facturas de venta
                  por un importe total de <b><?php echo $fsc->show_precio($fsc->stats['facturas_venta_importe']);?></b>,
                  además de <?php echo $fsc->stats['alb_ptes_venta'];?> <?php  echo FS_ALBARANES;?> de venta pendientes
                  por un importe de <b><?php echo $fsc->show_precio($fsc->stats['alb_ptes_venta_importe']);?></b>.
                  Si lo sumamos todo, tenemos un importe de <mark><?php echo $fsc->show_precio($fsc->stats['total']);?></mark>.
               </p>
            </div>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h3 class="panel-title">Facturación de los últimos meses</h3>
            </div>
            <div class="panel-body">
               <div id="chart_facturas_month" style="height: 400px;"></div>
            </div>
            <div class="panel-footer">
               <p class="help-block">
                  La media de ventas es de <b><?php echo $fsc->show_precio($fsc->stats['media_ventas']);?></b>/mes,

                  y el benefinicio medio es <b><?php echo $fsc->show_precio($fsc->stats['media_beneficios']);?></b>/mes.
               </p>
            </div>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h3 class="panel-title">Facturación de los últimos años</h3>
            </div>
            <div class="panel-body">
               <div id="chart_facturas_year" style="height: 400px;"></div>
            </div>
         </div>
      </div>
   </div>
</div>

<form name="listado_proveedor" action="<?php echo $fsc->url();?>" method="post" target="_blank" class="form">
   <input type="hidden" name="listado" value="facturasprov"/>
   <?php if( $fsc->proveedor ){ ?>

   <input type="hidden" name="codproveedor" value="<?php echo $fsc->proveedor->codproveedor;?>"/>
   <?php }else{ ?>

   <input type="hidden" name="codproveedor"/>
   <?php } ?>

   <div class="modal fade" id="modal_compras" tabindex="-1" role="dialog" aria-labelledby="modal_label_compras">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="modal_label_compras">Facturas de compra</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  Desde:
                  <input class="form-control datepicker" type="text" name="desde" value="<?php echo $fsc->desde;?>" autocomplete="off"/>
               </div>
               <div class="form-group">
                  Hasta:
                  <input class="form-control datepicker" type="text" name="hasta" value="<?php echo $fsc->hasta;?>" autocomplete="off"/>
               </div>
               <div class="form-group">
                  <a href="<?php echo $fsc->serie->url();?>">Serie</a>:
                  <select class="form-control" name="codserie">
                     <option value="">Todas</option>
                     <option value="">-----</option>
                     <?php $loop_var1=$fsc->serie->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <option value="<?php echo $value1->codserie;?>"><?php echo $value1->descripcion;?></option>
                     <?php } ?>

                  </select>
               </div>
               <div class="form-group">
                  <a href="<?php echo $fsc->agente->url();?>">Doctores</a>:
                  <select name="codagente" class="form-control">
                     <option value="">Todos</option>
                     <option value="">------</option>
                     <?php $loop_var1=$fsc->agente->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <option value="<?php echo $value1->codagente;?>"><?php echo $value1->get_fullname();?></option>
                     <?php } ?>

                  </select>
               </div>
               <div class="form-group">
                  Proveedor:
                  <div class="input-group">
                     <?php if( $fsc->proveedor ){ ?>

                     <input class="form-control" type="text" name="ac_proveedor" value="<?php echo $fsc->proveedor->nombre;?>" id="ac_proveedor" placeholder="Buscar" autocomplete="off"/>
                     <?php }else{ ?>

                     <input class="form-control" type="text" name="ac_proveedor" id="ac_proveedor" placeholder="Buscar" autocomplete="off"/>
                     <?php } ?>

                     <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="document.listado_proveedor.ac_proveedor.value='';document.listado_proveedor.ac_proveedor.focus();">
                           <span class="glyphicon glyphicon-edit"></span>
                        </button>
                     </span>
                  </div>
                  <p class="help-block">Dejar en blanco para seleccionar todos los proveedores.</p>
               </div>
               <div class="form-group">
                  Estado de la factura:
                  <select class="form-control" name="estado">
                     <option value="">Todas</option>
                     <option value="pagada">Pagada</option>
                     <option value="sinpagar">Sin pagar</option>
                  </select>
               </div>
               <div class="form-group">
                  Generar:
                  <select name="generar" class="form-control">
                     <option value="pdf">PDF</option>
                     <option value="csv">CSV</option>
                  </select>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-primary" type="submit">
                  <span class="glyphicon glyphicon-eye-open"></span> &nbsp; Mostrar
               </button>
            </div>
         </div>
      </div>
   </div>
</form>

<form name ="listado_facturas" action="<?php echo $fsc->url();?>" method="post" target="_blank" class="form">
   <input type="hidden" name="listado" value="facturascli"/>
   <?php if( $fsc->cliente ){ ?>

   <input type="hidden" name="codcliente" value="<?php echo $fsc->cliente->codcliente;?>"/>
   <?php }else{ ?>

   <input type="hidden" name="codcliente"/>
   <?php } ?>

   <input type="hidden" name="nombre" value="<?php echo $fsc->cliente->nombre;?>"/>
   <div class="modal fade" id="modal_ventas" tabindex="-1" role="dialog" aria-labelledby="modal_label_ventas">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="modal_label_ventas">Facturas de venta</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  Desde:
                  <input class="form-control datepicker" type="text" name="desde" value="<?php echo $fsc->desde;?>" autocomplete="off"/>
               </div>
               <div class="form-group">
                  Hasta:
                  <input class="form-control datepicker" type="text" name="hasta" value="<?php echo $fsc->hasta;?>" autocomplete="off"/>
               </div>
               <div class="form-group" style="display:none">
                  <a href="<?php echo $fsc->serie->url();?>">Serie</a>:
                  <select class="form-control" name="codserie">
                     <option value="">Todas</option>
                     <option value="">-----</option>
                     <?php $loop_var1=$fsc->serie->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <option value="<?php echo $value1->codserie;?>"><?php echo $value1->descripcion;?></option>
                     <?php } ?>

                  </select>
               </div>
               <div class="form-group">
                  <a href="<?php echo $fsc->agente->url();?>">Doctores</a>:
                  <select name="codagente" class="form-control">
                     <option value="">Todos</option>
                     <option value="">---</option>
                     <?php $loop_var1=$fsc->agente->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                     <option value="<?php echo $value1->codagente;?>"><?php echo $value1->get_fullname();?></option>
                     <?php } ?>

                  </select>
               </div>
               <div class="form-group">
                  Paciente:
                  <div class="input-group">
                     <?php if( $fsc->cliente ){ ?>

                     <input class="form-control" type="text" name="ac_cliente" value="<?php echo $fsc->cliente->nombre;?>" id="ac_cliente" placeholder="Buscar" autocomplete="off"/>
                     <?php }else{ ?>

                     <input class="form-control" type="text" name="ac_cliente" id="ac_cliente" placeholder="Buscar" autocomplete="off"/>
                     <?php } ?>

                     <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="document.listado_facturas.ac_cliente.value='';document.listado_facturas.ac_cliente.focus();">
                           <span class="glyphicon glyphicon-edit"></span>
                        </button>
                     </span>
                  </div>
                  <p class="help-block">Dejar en blanco para seleccionar todos los pacientes.</p>
               </div>
               <div class="form-group">
                  Estado de la factura:
                  <select class="form-control" name="estado">
                     <option value="">Todas</option>
                     <option value="pagada">Pagada</option>
                     <option value="sinpagar">Sin pagar</option>
                  </select>
               </div>
               <div class="form-group">
                  Estado de la factura:
                <select class="form-control" name="codpago">
                                 <?php $loop_var1=$fsc->forma_pago->all(); $counter1=-1; if($loop_var1) foreach( $loop_var1 as $key1 => $value1 ){ $counter1++; ?>

                                 <option value="<?php echo $value1->codpago;?>"><?php echo $value1->descripcion;?></option>
                                 <?php } ?>

                              </select>
               </div>
               <div class="form-group">
                  Generar:
                  <select name="generar" class="form-control">
                     <option value="pdf">PDF</option>

                  </select>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-sm btn-primary" type="submit">
                  <span class="glyphicon glyphicon-eye-open"></span> &nbsp; Mostrar
               </button>
            </div>
         </div>
      </div>
   </div>
</form>

<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer") . ( substr("footer",-1,1) != "/" ? "/" : "" ) . basename("footer") );?>
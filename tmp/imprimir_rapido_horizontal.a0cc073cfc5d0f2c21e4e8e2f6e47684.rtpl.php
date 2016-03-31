<?php if(!class_exists('raintpl')){exit;}?><?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("header2") . ( substr("header2",-1,1) != "/" ? "/" : "" ) . basename("header2") );?>

<script type="text/javascript">
window.print()
</script>

<?php if( $fsc->servicio ){ ?>

<div class="container-fluid">
	<!-- Media Página 1 -->
	<div class="row">
		<div class="col-xs-6">
			<div class="row" style="font-size:85%">
				<div class="col-xs-12">
					
				
					<div class="col-xs-12">
						<center><h5><strong><?php echo $fsc->agente->get_fullname();?></strong><br/></h5><h6 style="margin-top:-10px;"><?php echo $fsc->agente->cargo;?> <strong>- M.P <?php echo $fsc->agente->seg_social;?></strong><br><?php echo $fsc->servicio->codigo;?></h6></center>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-xs-5">
						<strong><?php echo $fsc->st['st_fechainicio'];?></strong> <?php echo $fsc->servicio->fecha;?><br/>
					</div>
			
		
					<div class="col-xs-6">
						<strong>Hora:</strong> <?php echo $fsc->servicio->hora;?>

					</div>
			</div>
			
				<div class="col-xs-12">
					<div class="col-xs-6">
						<strong>Paciente:</strong><br/><?php echo $fsc->servicio->nombrecliente;?>

					</div>
					
					<br><br><div class="col-xs-4">
						<strong>Obra social:</strong><br/><?php echo $fsc->cliente->codpago;?>

					</div>
					<div class="col-xs-4">
						<strong>N° Afiliado:</strong><br/><?php echo $fsc->cliente->telefono2;?>

					</div>
                                        <br><br>    <br><div class="col-xs-4">
						<strong>Plan:</strong><br/><?php echo $fsc->cliente->fax;?>

					</div>
					<div class="col-xs-4">
						<strong>Vencimiento:</strong><br/><?php echo $fsc->cliente->email;?>

					</div>
				</div><div class="col-xs-4" style="font-size:70%">
						
                                    <br/><br/><br/><br><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						<br/><br/><br/><br/><br/>
						</div>


				<div class="col-xs-12">
					<br/><hr style="border: 1px solid ; height: 1px; width: 90%;">
					<?php if( $fsc->agente ){ ?>

			<div class="col-xs-6">
						<strong><?php echo $fsc->empresa->nombrecorto;?>:</strong><br/><?php echo $fsc->empresa->telefono;?>

					</div>
                                        <div class="col-xs-6">
						<strong>Hospital Meprisa:</strong><br/>485-1085
					</div>
					<?php } ?>

			
				
				
		
				
				
		
				</div>
                                <div class="col-xs-12">
					<br/>
					<?php if( $fsc->servicios_setup['servicios_mostrar_fechainicio'] ){ ?>

			
					<?php } ?>

					<?php if( $fsc->servicios_setup['servicios_mostrar_fechafin'] ){ ?>

					<div class="col-xs-6">
						<strong><?php echo $fsc->st['st_fechafin'];?>:</strong><br/><?php echo $fsc->servicio->fechafin;?>

					</div>
					<?php } ?>

				</div>
				<div class="col-xs-12">
					
					<font size="1"><p align="justify"><?php echo $fsc->condiciones();?></p></font>
				</div>
			</div>
		</div>
	<!-- PLANTILLA RECETA -->
		<div class="row">
		<div class="col-xs-6">
			<div class="row" style="font-size:85%">
				<div class="col-xs-12">
					
				
					<div class="col-xs-12">
						<center><h5><strong><?php echo $fsc->agente->get_fullname();?></strong><br/></h5><h6 style="margin-top:-10px;"><?php echo $fsc->agente->cargo;?> <strong>- M.P <?php echo $fsc->agente->seg_social;?></strong><br><?php echo $fsc->servicio->codigo;?></h6></center>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-xs-5">
						<strong><?php echo $fsc->st['st_fechainicio'];?></strong> <?php echo $fsc->servicio->fecha;?><br/>
					</div>
			
		
					<div class="col-xs-6">
						<strong>Hora:</strong> <?php echo $fsc->servicio->hora;?>

					</div>
			</div>
			
				<div class="col-xs-12">
					<div class="col-xs-6">
						<strong>Paciente:</strong><br/><?php echo $fsc->servicio->nombrecliente;?>

					</div>
				
					<div class="col-xs-4">
						<strong>Obra social:</strong><br/><?php echo $fsc->cliente->codpago;?>

					</div>
					<br><br><div class="col-xs-4">
						<strong>N° Afiliado:</strong><br/><?php echo $fsc->cliente->telefono2;?>

					</div>
                                        <br><br><br><div class="col-xs-4">
						<strong>Plan:</strong><br/><?php echo $fsc->cliente->fax;?>

					</div>
					<div class="col-xs-4">
						<strong>Vencimiento:</strong><br/><?php echo $fsc->cliente->email;?>

					</div>
				</div>
				<div class="col-xs-12"><br>
				
					<div class="col-xs-4" style="font-size:70%">
						
                                    <br/><br/><br/><br><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						<br/><br/><br/><br/><br/>
						</div>
			
				

				<div class="col-xs-12">
					<br/><hr style="border: 1px solid ; height: 1px; width: 90%;">
					<?php if( $fsc->agente ){ ?>

				<div class="col-xs-6">
						<strong><?php echo $fsc->empresa->nombrecorto;?>:</strong><br/><?php echo $fsc->empresa->telefono;?>

					</div>
                                                                <div class="col-xs-6">
						<strong>Hospital Meprisa:</strong><br/>485-1085
					</div>
					<?php } ?>

			
	
				
		
				</div>
                                <div class="col-xs-12">
					<br/>
					<?php if( $fsc->servicios_setup['servicios_mostrar_fechainicio'] ){ ?>

			
					<?php } ?>

					<?php if( $fsc->servicios_setup['servicios_mostrar_fechafin'] ){ ?>

					<div class="col-xs-6">
						<strong><?php echo $fsc->st['st_fechafin'];?>:</strong><br/><?php echo $fsc->servicio->fechafin;?>

					</div>
					<?php } ?>

				</div>
	
			</div>
		</div>
	</div> <hr>
	
<?php } ?>

</div>
<?php if( $fsc->servicio ){ ?>

<div class="container-fluid">
	<!-- Media Página 1 -->
	<div class="row">
		<div class="col-xs-6">
			<div class="row" style="font-size:85%">
				<div class="col-xs-12">
					
				
					<div class="col-xs-12">
						<center><h5><strong><?php echo $fsc->agente->get_fullname();?></strong><br/></h5><h6 style="margin-top:-10px;"><?php echo $fsc->agente->cargo;?> <strong>- M.P <?php echo $fsc->agente->seg_social;?></strong><br><?php echo $fsc->servicio->codigo;?></h6></center>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-xs-5">
						<strong><?php echo $fsc->st['st_fechainicio'];?></strong> <?php echo $fsc->servicio->fecha;?><br/>
					</div>
			
		
					<div class="col-xs-6">
						<strong>Hora:</strong> <?php echo $fsc->servicio->hora;?>

					</div>
			</div>
			
				<div class="col-xs-12">
					<div class="col-xs-6">
						<strong>Paciente:</strong><br/><?php echo $fsc->servicio->nombrecliente;?>

					</div>
				
					<br><br><div class="col-xs-4">
						<strong>Obra social:</strong><br/><?php echo $fsc->cliente->codpago;?>

					</div>
					<div class="col-xs-4">
						<strong>N° Afiliado:</strong><br/><?php echo $fsc->cliente->telefono2;?>

					</div>
                                        <br><br>    <br><div class="col-xs-4">
						<strong>Plan:</strong><br/><?php echo $fsc->cliente->fax;?>

					</div>
					<div class="col-xs-4">
						<strong>Vencimiento:</strong><br/><?php echo $fsc->cliente->email;?>

					</div>
				</div><div class="col-xs-4" style="font-size:70%">
						
                                    <br/><br/><br/><br><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						<br/><br/><br/><br/><br/>
						</div>


				<div class="col-xs-12">
					<br/><hr style="border: 1px solid ; height: 1px; width: 90%;">
					<?php if( $fsc->agente ){ ?>

			<div class="col-xs-6">
						<strong><?php echo $fsc->empresa->nombrecorto;?>:</strong><br/><?php echo $fsc->empresa->telefono;?>

					</div>
                                        <div class="col-xs-6">
						<strong>Hospital Meprisa:</strong><br/>485-1085
					</div>
					<?php } ?>

			
				
				
		
				
				
		
				</div>
                                <div class="col-xs-12">
					<br/>
					<?php if( $fsc->servicios_setup['servicios_mostrar_fechainicio'] ){ ?>

			
					<?php } ?>

					<?php if( $fsc->servicios_setup['servicios_mostrar_fechafin'] ){ ?>

					<div class="col-xs-6">
						<strong><?php echo $fsc->st['st_fechafin'];?>:</strong><br/><?php echo $fsc->servicio->fechafin;?>

					</div>
					<?php } ?>

				</div>
				<div class="col-xs-12">
					
					<font size="1"><p align="justify"><?php echo $fsc->condiciones();?></p></font>
				</div>
			</div>
		</div>
	<!-- PLANTILLA RECETA -->
		<div class="row">
		<div class="col-xs-6">
			<div class="row" style="font-size:85%">
				<div class="col-xs-12">
					
				
					<div class="col-xs-12">
						<center><h5><strong><?php echo $fsc->agente->get_fullname();?></strong><br/></h5><h6 style="margin-top:-10px;"><?php echo $fsc->agente->cargo;?> <strong>- M.P <?php echo $fsc->agente->seg_social;?></strong><br><?php echo $fsc->servicio->codigo;?></h6></center>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-xs-5">
						<strong><?php echo $fsc->st['st_fechainicio'];?></strong> <?php echo $fsc->servicio->fecha;?><br/>
					</div>
			
		
					<div class="col-xs-6">
						<strong>Hora:</strong> <?php echo $fsc->servicio->hora;?>

					</div>
			</div>
			
				<div class="col-xs-12">
					<div class="col-xs-6">
						<strong>Paciente:</strong><br/><?php echo $fsc->servicio->nombrecliente;?>

					</div>
			
					<div class="col-xs-4">
						<strong>Obra social:</strong><br/><?php echo $fsc->cliente->codpago;?>

					</div>
					<br><br><div class="col-xs-4">
						<strong>N° Afiliado:</strong><br/><?php echo $fsc->cliente->telefono2;?>

					</div>
                                        <br><br><br><div class="col-xs-4">
						<strong>Plan:</strong><br/><?php echo $fsc->cliente->fax;?>

					</div>
					<div class="col-xs-4">
						<strong>Vencimiento:</strong><br/><?php echo $fsc->cliente->email;?>

					</div>
				</div>
				<div class="col-xs-12"><br>
				
					<div class="col-xs-4" style="font-size:70%">
						
                                    <br/><br/><br/><br><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						<br/><br/><br/><br/><br/>
						</div>
			
				

				<div class="col-xs-12">
					<br/><hr style="border: 1px solid ; height: 1px; width: 90%;">
					<?php if( $fsc->agente ){ ?>

				<div class="col-xs-6">
						<strong><?php echo $fsc->empresa->nombrecorto;?>:</strong><br/><?php echo $fsc->empresa->telefono;?>

					</div>
                                                                <div class="col-xs-6">
						<strong>Hospital Meprisa:</strong><br/>485-1085
					</div>
					<?php } ?>

			
	
				
		
				</div>
                                <div class="col-xs-12">
					<br/>
					<?php if( $fsc->servicios_setup['servicios_mostrar_fechainicio'] ){ ?>

			
					<?php } ?>

					<?php if( $fsc->servicios_setup['servicios_mostrar_fechafin'] ){ ?>

					<div class="col-xs-6">
						<strong><?php echo $fsc->st['st_fechafin'];?>:</strong><br/><?php echo $fsc->servicio->fechafin;?>

					</div>
					<?php } ?>

				</div>
	
			</div>
		</div>
	</div> <hr>
	
<?php } ?>

</div>
<?php $tpl = new RainTPL;$tpl_dir_temp = self::$tpl_dir;$tpl->assign( $this->var );$tpl->draw( dirname("footer2") . ( substr("footer2",-1,1) != "/" ? "/" : "" ) . basename("footer2") );?>


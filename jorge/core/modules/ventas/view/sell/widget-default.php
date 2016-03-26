	
<div class="row">
	<div class="col-md-12">
	<h1>EMITIR LISTA DE FE </h1>
	<p><b>BUSQUE CON DNI O NOMBRE</b></p>
		<form>
		<div class="row">
			<div class="col-md-6">
				<input type="hidden" name="view" value="sell">
				<input type="text" name="product" class="form-control">
			</div>
			<div class="col-md-3">
			<button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> Buscar</button>
			</div>
		</div>
		</form>
	</div>

<?php if(isset($_GET["product"])):?>
	<?php
$products = ProductData::getLike($_GET["product"]);
if(count($products)>0){
	?>
<h3>Resultados de la Busqueda</h3>
<table class="table table-bordered table-hover">
	<thead>
		<th>Foto</th>
		<th>Nombre</th>
		<th>DNI</th>
		<th>Fecha de nacimiento</th>
	
		<th>Equipo</th>
			<th>Contacto</th>
		<th style="display:none">Cantidad</th>
		<th style="width:100px;"></th>
	</thead>
	<?php
$products_in_cero=0;
	 foreach($products as $product):
$q= OperationData::getQYesF($product->id);
	?>
	<?php 
	if($q>0):?>
		<form method="post" action="index.php?view=addtocart">
	<tr class="<?php if($q<=$product->inventary_min){ echo "danger"; }?>">
		<td style="width:80px;"><img src="storage/products/<?php echo $product->image;?>" style="width:64px;"></td>
		<td><?php echo $product->presentation; ?></td>
		<td><?php echo $product->name ?></td>
				<td><?php echo $product->description; ?></td>

		<td>
			<?php echo $product->getCategory()->name ?>
		</td>
			<td><?php echo $product->contacto ?></td>
		<td>
		<input type="hidden" name="product_id" value="<?php echo $product->id; ?>">
		<input style="display:none" type="" class="form-control"  placeholder="Cantidad de producto ..."></td>
		<td style="width:183px;">
		<button type="submit" class="btn btn-primary"> Agregar jugador a la lista</button>
		</td>
	</tr>
	</form>
<?php else:$products_in_cero++;
?>
<?php  endif; ?>
	<?php endforeach;?>
</table>
<?php if($products_in_cero>0){ echo "<p class='alert alert-warning'>Se omitieron <b>$products_in_cero productos</b> que no tienen existencias en el inventario. <a href='index.php?module=inventary'>Ir al Inventario</a>"; }?>

	<?php
}
?>
<br><hr>
<hr><br>
<?php else:
?>

<?php endif; ?>

<?php if(isset($_SESSION["errors"])):?>
<h2>Errores</h2>
<p></p>
<table class="table table-bordered table-hover">
<tr class="danger">
	<th>Codigo</th>
	<th>Producto</th>
	<th>Mensaje</th>
</tr>
<?php foreach ($_SESSION["errors"]  as $error):
$product = ProductData::getById($error["product_id"]);
?>
<tr class="danger">
	<td><?php echo $product->id; ?></td>
	<td><?php echo $product->name; ?></td>
	<td><b><?php echo $error["message"]; ?></b></td>
</tr>

<?php endforeach; ?>
</table>
<?php
unset($_SESSION["errors"]);
 endif; ?>


<!--- Carrito de compras :) -->
<?php if(isset($_SESSION["cart"])):
$total = 0;
?>
<h2>Resultados de la busqueda</h2>
<table class="table table-bordered table-hover">
<thead>
	<th style="width:30px;">Foto</th>
	<th >Nombre</th>
	<th style="width:30px;">DNI</th>
	<th>Fecha de nacimiento</th>
	<th style="width:30px;">Equipo</th>
	<th style="width:30px;">Contacto</th>
	<th style="width:30px;"></th>
	<th ></th>
</thead>
<?php foreach($_SESSION["cart"] as $p):
$product = ProductData::getById($p["product_id"]);
?>
<tr >
	<td><img src="storage/products/<?php echo $product->image;?>" style="width:64px;">	</td>
	<td ><?php echo $product->presentation; ?></td>
	<td><?php echo $product->name; ?></td>
	<td><?php echo $product->description; ?></td>
	<td> <?php echo $product->getCategory()->name ?></td>
	<td><?php echo $product->contacto; ?></td>
	<td style="display:none"><b>$ <?php  $pt = $product->price_out*$p["q"]; $total +=$pt; echo number_format($pt); ?></b></td>
	<td style="width:30px;"><a href="index.php?view=clearcart&product_id=<?php echo $product->id; ?>" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> Cancelar</a></td>
</tr>

<?php endforeach; ?>
</table>
<form method="post" class="form-horizontal" id="processsell" action="index.php?view=processsell">

<div class="form-group" style='display:none;'>
    <label for="inputEmail1" class="col-lg-2 control-label">Efectivo</label>
    <div class="col-lg-10">
      <input type="text" name="money" required class="form-control" VALUE="INF" placeholder="Efectivo">
    </div>
  </div>
  <div class="row">
<div class="col-md-6 col-md-offset-6">
<table class="table table-bordered">
<tr>
		
</tr>

</table>
  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <div class="checkbox">
        <label>
          <input name="is_oficial" type="hidden" value="1">
        </label>
      </div>
    </div>
  </div>
<div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <div class="checkbox">
        <label>
		<a href="index.php?view=clearcart" class="btn btn-lg btn-danger"><i class="glyphicon glyphicon-remove"></i> Cancelar</a>
        <button class="btn btn-lg btn-primary"> Finalizar Lista de fe</button>
        </label>
      </div>
    </div>
  </div>
</form>
<script>
	$("#processsell").submit(function(e){
		money = $("#money").val();
		if(money<<?php echo $total;?>){
			alert("No se puede efectuar la operacion");
			e.preventDefault();
		}else{
			go = confirm("guardar?"));
			if(go){}
				else{e.preventDefault();}
		}
	});
</script>
</div>
</div>

<br><br><br><br><br>
<?php endif; ?>

</div>
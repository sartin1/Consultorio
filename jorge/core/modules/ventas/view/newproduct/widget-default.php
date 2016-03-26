    <?php 
$categories = CategoryData::getAll();
    ?>
<div class="row">
	<div class="col-md-12">
	<h1>Nuevo Jugador</h1>
	<br>
		<form class="form-horizontal" method="post" enctype="multipart/form-data" id="addproduct" action="index.php?view=addproduct" role="form">

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">FOTO</label>
    <div class="col-md-6">
      <input type="file" name="image" id="image" placeholder="">
    </div>
  </div>

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">DNI:</label>
    <div class="col-md-6">
      <input type="text" name="name" required class="form-control" id="name" placeholder="">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">EQUIPO:</label>
    <div class="col-md-6">
    <select name="category_id" class="form-control">
    <option value="">-- NINGUNA --</option>
    <?php foreach($categories as $category):?>
      <option value="<?php echo $category->id;?>"><?php echo $category->name;?></option>
    <?php endforeach;?>
      </select>    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1"  class="col-lg-2 control-label">FECHA DE NACIMIENTO:</label>
    <div class="col-md-6">
      <textarea name="description" class="form-control" id="description" placeholder="00/00/0000"></textarea>
    </div>
  </div>
 


  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">APELLIDO Y NOMBRE</label>
    <div class="col-md-6">
      <input type="text" name="presentation" class="form-control" id="inputEmail1" placeholder="">
    </div>
  </div>

  <div class="form-group">
    <label for="contacto" class="col-lg-2 control-label">CONTACTO  </label>
    <div class="col-md-6">
      <input type="text" name="contacto" class="form-control" id="contacto" placeholder="">
    </div>
  </div>
  

  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <button type="submit" class="btn btn-primary">Agregar Jugador</button>
    </div>
  </div>
</form>

	</div>
</div>
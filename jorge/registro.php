<?php
 
//Configuracion de la conexion a base de datos
  $bd_host = "localhost"; 
  $bd_usuario = "root"; 
  $bd_password = ""; 
  $bd_base = "inventiolite"; 
 
$con = mysql_connect($bd_host, $bd_usuario, $bd_password); 
mysql_select_db($bd_base, $con); 
 
//variables POST

  $web=$_POST['obs'];
 
//registra los datos del empleados
  $sql="INSERT INTO sell (web) VALUES ('$web')";
mysql_query($sql,$con) or die('Error. '.mysql_error());
 
include('consulta.php');
?>
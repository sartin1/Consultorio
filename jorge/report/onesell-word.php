<?php
include "../core/autoload.php";
include "../core/modules/ventas/model/PersonData.php";
include "../core/modules/ventas/model/UserData.php";
include "../core/modules/ventas/model/SellData.php";
include "../core/modules/ventas/model/OperationData.php";
include "../core/modules/ventas/model/OperationTypeData.php";
include "../core/modules/ventas/model/ProductData.php";

require_once '../PhpWord/Autoloader.php';
use PhpOffice\PhpWord\Autoloader;
use PhpOffice\PhpWord\Settings;

Autoloader::register();

$word = new  PhpOffice\PhpWord\PhpWord();

$sell = SellData::getById($_GET["id"]);
$operations = OperationData::getAllProductsBySellId($_GET["id"]);
if($sell->person_id!=null){ $client = $sell->getPerson();}
$user = $sell->getUser();


$section1 = $word->AddSection();
$section1->addText("CONFEDERACIÓN ARGENTINA DE FUTBOL DE SALON / FUTSAL - PLANILLA DE FICHAJE",array("size"=>10,"bold"=>true,"align"=>"right"));
$section1->addText("Afiliada a la Confederación Argentina de Deportes 					Presentar por triplicado.",array("size"=>8,"bold"=>true,"align"=>"right"));

$section1->addText("Los firmantes de la presente planilla, declaran conocer y aceptar las condiciones absolutas de amateurismo del Futsal/Fútbol de Salón, conocer y aceptar las reglas de juego y el alto grado de competitividad alcanzado en los eventos organizados por las entidades afiliadas a la Confederación Argentina de Futsal, declaran conocer y aceptar la existencia de potenciales riesgos para la salud en la practica de nuestro deporte, declaran conocer y aceptar las obligaciones Estatutarias y Reglamentarias a las que adhiere al aceptar ser jugador federado de la C.A.F.S. también se comprometen a mantener vigente la cobertura del seguro propuesto por la CAFS y que por ello libera de toda responsabilidad a ésta, sus  afiliadas, sus dirigentes miembros de los diferentes cuerpos que la integran ante accidentes que pudieran ocurrir durante los traslados, antes, durante y después de la competencia que corresponde a esta Planilla de Fichaje ",array("size"=>8,"bold"=>true,"align"=>"right"));
$styleTable = array('borderSize' => 6, 'borderColor' => '888888', 'cellMargin' => 40);
$styleFirstRow = array('borderBottomColor' => '0000FF', 'bgColor' => 'AAAAAA');
foreach($operations as $operation){
	$product = $operation->getProduct();


$table1 = $section1->addTable("table1");
$table1->addRow();

$table1->addCell(4500)->addText("Fecha presentación:");
$table1->addCell(4500)->addText("Fecha:");
$table1->addRow();
$table1->addCell(2000)->addText("Club:");
$table1->addCell(4500)->addText("ASOCIACION:");
$table1->addRow();
$table1->addCell(4500)->addText("Provincia:");
$table1->addCell(4500)->addText("Delegado:");
$table1->addRow();
$table1->addCell(4500)->addText("Arbitro:");
$table1->addCell(4500)->addText("");

$section1->addText("");
}
$total=0;

$table2 = $section1->addTable("table2");
$table2->addRow();
$table2->addCell(1000)->addText(" ");
$table2->addCell(4000)->addText("Apellido nombre");
$table2->addCell(1000)->addText("DNI");
$table2->addCell(2000)->addText("Fecha nacimiento",array("size"=>8));
$table2->addCell(2000)->addText("Firma");
$table2->addCell(2000)->addText("para menores Padre o Tutor");
$table2->addCell(2000)->addText("Póliza seguro");

foreach($operations as $operation){
	$product = $operation->getProduct();
	$table2->addRow();
	$table2->addCell()->addText();
$table2->addCell()->addText($product->presentation,array("size"=>8));
$table2->addCell()->addText($product->name);
$table2->addCell()->addText($product->description);
$table2->addCell()->addText();
$table2->addCell()->addText();
$table2->addCell()->addText();


}

$section1->addText("Se deben adjuntar a la planilla los certificados médicos individuales");
$section1->addText("Certifico que los datos elevados en la presente planilla son verdaderos y avalados por nuestra entidad
",array("size"=>14));
$section1->addText("Firma");
$section1->addText("Sello");

$word->addTableStyle('table1', $styleTable);
$word->addTableStyle('table2', $styleTable,$styleFirstRow);


/// datos bancarios

$filename = "listadefe-".time().".docx";
#$word->setReadDataOnly(true);
$word->save($filename,"Word2007");
//chmod($filename,0444);
header("Content-Disposition: attachment; filename='$filename'");
readfile($filename); // or echo file_get_contents($filename);
unlink($filename);  // remove temp file



?>
<?php


if( !defined('FS_TMP_NAME') )
{
   define('FS_TMP_NAME', '');
}

if(FS_TMP_NAME != '' AND !file_exists('tmp/'.FS_TMP_NAME) )
{
   if( !file_exists('tmp') )
   {
      if( mkdir('tmp') )
      {
         file_put_contents('tmp/index.php', "<?php\necho 'No me toques los cojones!!!';");
      }
   }
   
   mkdir('tmp/'.FS_TMP_NAME);
}

if( !defined('FS_COMMUNITY_URL') )
{
   define('FS_COMMUNITY_URL', '');
}

if( file_exists('tmp/'.FS_TMP_NAME.'config2.ini') )
{
   $GLOBALS['config2'] = parse_ini_file('tmp/'.FS_TMP_NAME.'config2.ini');
   
   if( !isset($GLOBALS['config2']['cost_is_average']) )
   {
      $GLOBALS['config2']['cost_is_average'] = 1;
   }
   
   if( !isset($GLOBALS['config2']['nf0']) )
   {
      $GLOBALS['config2']['nf0'] = 2;
      $GLOBALS['config2']['nf1'] = '.';
      $GLOBALS['config2']['nf2'] = ' ';
      $GLOBALS['config2']['pos_divisa'] = 'right';
   }
   
   if( !isset($GLOBALS['config2']['homepage']) )
   {
      $GLOBALS['config2']['homepage'] = 'admin_home';
   }
   
   if( !isset($GLOBALS['config2']['check_db_types']) )
   {
      $GLOBALS['config2']['check_db_types'] = 'false';
   }
   
   if( !isset($GLOBALS['config2']['stock_negativo']) )
   {
      $GLOBALS['config2']['stock_negativo'] = 0;
      $GLOBALS['config2']['ventas_sin_stock'] = 1;
   }
   
   if( !isset($GLOBALS['config2']['precio_compra']) )
   {
      $GLOBALS['config2']['precio_compra'] = 'coste';
      $GLOBALS['config2']['ip_whitelist'] = '*';
   }
   
   if( !isset($GLOBALS['config2']['iva']) )
   {
      $GLOBALS['config2']['iva'] = 'IVA';
      $GLOBALS['config2']['irpf'] = 'IRPF';
   }
   
   if( !isset($GLOBALS['config2']['libros_contables']) )
   {
      $GLOBALS['config2']['libros_contables'] = 1;
      $GLOBALS['config2']['foreign_keys'] = 1;
   }
   
   if( !isset($GLOBALS['config2']['new_codigo']) )
   {
      $GLOBALS['config2']['new_codigo'] = 'eneboo';
   }
   
   if( !isset($GLOBALS['config2']['factura']) )
   {
      $GLOBALS['config2']['factura'] = 'factura';
      $GLOBALS['config2']['facturas'] = 'facturas';
      $GLOBALS['config2']['numero2'] = 'número 2';
   }
   
   if( !isset($GLOBALS['config2']['factura_simplificada']) )
   {
      $GLOBALS['config2']['factura_simplificada'] = 'factura simplificada';
   }
   
   if( !isset($GLOBALS['config2']['db_integer']) )
   {
      $GLOBALS['config2']['db_integer'] = 'INTEGER';
   }
}
else
{
   $GLOBALS['config2'] = array(
       'zona_horaria' => 'Europe/Madrid',
       'nf0' => 2,
       'nf1' => '.',
       'nf2' => ' ',
       'pos_divisa' => 'right',
       'factura' => 'factura',
       'facturas' => 'facturas',
       'factura_simplificada' => 'factura simplificada',
       'albaran' => 'albarán',
       'albaranes' => 'albaranes',
       'pedido' => 'pedido',
       'pedidos' => 'pedidos',
       'presupuesto' => 'presupuesto',
       'presupuestos' => 'presupuestos',
       'provincia' => 'provincia',
       'apartado' => 'apartado',
       'cifnif' => 'CIF/NIF',
       'iva' => 'IVA',
       'irpf' => 'IRPF',
       'numero2' => 'número 2',
       'cost_is_average' => 1,
       'precio_compra' => 'coste',
       'homepage' => 'admin_home',
       'check_db_types' => 'false',
       'stock_negativo' => 0,
       'ventas_sin_stock' => 1,
       'ip_whitelist' => '*',
       'libros_contables' => 1,
       'foreign_keys' => 1,
       'new_codigo' => 'eneboo',
       'db_integer' => 'INTEGER'
   );
}

foreach($GLOBALS['config2'] as $i => $value)
{
   if($i == 'zona_horaria')
   {
      date_default_timezone_set($value);
   }
   else
   {
      define('FS_'.strtoupper($i), $value);
   }
}

if( !file_exists('plugins') )
{
   mkdir('plugins');
   chmod('plugins', octdec(777));
}

/// Cargamos la lista de plugins activos
$GLOBALS['plugins'] = array();
if( file_exists('tmp/enabled_plugins.list') )
{
   $list = explode(',', file_get_contents('tmp/enabled_plugins.list'));
   if($list)
   {
      foreach($list as $f)
      {
         if( file_exists('plugins/'.$f) )
         {
            $GLOBALS['plugins'][] = $f;
         }
      }
   }
}

/// cargamos las funciones de los plugins
foreach($GLOBALS['plugins'] as $plug)
{
   if( file_exists('plugins/'.$plug.'/functions.php') )
   {
      require_once 'plugins/'.$plug.'/functions.php';
   }
}
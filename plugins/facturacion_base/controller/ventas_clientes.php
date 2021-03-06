<?php


require_model('cliente.php');
require_model('grupo_clientes.php');
require_model('pais.php');
require_model('serie.php');
require_model('tarifa.php');

class ventas_clientes extends fs_controller
{
   public $allow_delete;
   public $ciudad;
   public $cliente;
   public $codgrupo;
   public $codpais;
   public $grupo;
   public $grupos;
   public $nuevocli_setup;
   public $offset;
   public $pais;
   public $provincia;
   public $resultados;
   public $serie;
   public $tarifa;
   public $tarifas;
   public $total_resultados;
   
   public function __construct()
   {
      parent::__construct(__CLASS__, 'Pacientes', 'turnos', FALSE, TRUE);
   }
   
   protected function private_core()
   {
      /// ¿El usuario tiene permiso para eliminar en esta página?
      $this->allow_delete = $this->user->allow_delete_on(__CLASS__);
      
      $this->cliente = new cliente();
      $this->grupo = new grupo_clientes();
      $this->pais = new pais();
      $this->serie = new serie();
      $this->tarifa = new tarifa();
      $this->tarifas = $this->tarifa->all();
      
      /// cargamos la configuración
      $fsvar = new fs_var();
      $this->nuevocli_setup = $fsvar->array_get(
         array(
            'nuevocli_cifnif_req' => 0,
            'nuevocli_direccion' => 1,
            'nuevocli_direccion_req' => 0,
            'nuevocli_codpostal' => 1,
            'nuevocli_codpostal_req' => 0,
            'nuevocli_pais' => 0,
            'nuevocli_pais_req' => 0,
            'nuevocli_provincia' => 1,
            'nuevocli_provincia_req' => 0,
            'nuevocli_ciudad' => 1,
            'nuevocli_ciudad_req' => 0,
            'nuevocli_telefono1' => 0,
            'nuevocli_telefono1_req' => 0,
            'nuevocli_telefono2' => 0,
            'nuevocli_telefono2_req' => 0,
            'nuevocli_codgrupo' => '',
         ),
         FALSE
      );
      
      if( isset($_GET['delete_grupo']) ) /// eliminar un grupo
      {
         $grupo = $this->grupo->get($_GET['delete_grupo']);
         if($grupo)
         {
            if( $grupo->delete() )
            {
               $this->new_message('Grupo eliminado correctamente.');
            }
            else
               $this->new_error_msg('Imposible eliminar el grupo.');
         }
         else
            $this->new_error_msg('Grupo no encontrado.');
      }
      else if( isset($_POST['codgrupo']) ) /// añadir/modificar un grupo
      {
         $grupo = $this->grupo->get($_POST['codgrupo']);
         if(!$grupo)
         {
            $grupo = new grupo_clientes();
            $grupo->codgrupo = $_POST['codgrupo'];
         }
         $grupo->nombre = $_POST['nombre'];
         
         $grupo->codtarifa = NULL;
         if($_POST['codtarifa'] != '---')
         {
            $grupo->codtarifa = $_POST['codtarifa'];
         }
         
         if( $grupo->save() )
         {
            $this->new_message('Grupo guardado correctamente.');
         }
         else
            $this->new_error_msg('Imposible guardar el grupo.');
      }
      else if( isset($_GET['delete']) ) /// eliminar un cliente
      {
         $cliente = $this->cliente->get($_GET['delete']);
         if($cliente)
         {
            if(FS_DEMO)
            {
               $this->new_error_msg('En el modo demo no se pueden eliminar clientes. Otros usuarios podrían necesitarlos.');
            }
            else if( $cliente->delete() )
            {
               $this->new_message('Paciente eliminado correctamente.');
            }
            else
               $this->new_error_msg('Ha sido imposible eliminar el Paciente.');
         }
         else
            $this->new_error_msg('Paciente no encontrado.');
      }
      else if( isset($_POST['cifnif']) ) /// añadir un nuevo cliente
      {
         $cliente = FALSE;
         if($_POST['cifnif'] != '')
         {
            $cliente = $this->cliente->get_by_cifnif($_POST['cifnif']);
            if($cliente)
            {
               $this->new_advice('Ya existe un Paciente con el '.FS_CIFNIF.' '.$_POST['cifnif']);
               $this->query = $_POST['cifnif'];
            }
         }
         
         if(!$cliente)
         {
            $cliente = new cliente();
            $cliente->codcliente = $cliente->get_new_codigo();
            $cliente->nombre = $_POST['nombre'];
            $cliente->razonsocial = $_POST['nombre'];


            $cliente->cifnif = $_POST['cifnif'];

            
            if($_POST['scodgrupo'] != '')
            {
               $cliente->codgrupo = $_POST['scodgrupo'];
            }
            
            if( isset($_POST['telefono1']) )
            {
               $cliente->telefono1 = $_POST['telefono1'];
            }

            if( isset($_POST['edad']) )
            {
               $cliente->edad = $_POST['edad'];
            }
            
            if( isset($_POST['fnac']) )
            {
               $cliente->fnac = $_POST['fnac'];
            }
            
            if( isset($_POST['sexo']) )
            {
               $cliente->sexo = $_POST['sexo'];
            }
            
            
            if( isset($_POST['telefono2']) )
            {
               $cliente->telefono2 = $_POST['telefono2'];
            }
            
            if( $cliente->save() )
            {
               $dircliente = new direccion_cliente();
               $dircliente->codcliente = $cliente->codcliente;
               $dircliente->codpais = $this->empresa->codpais;
               $dircliente->provincia = $this->empresa->provincia;
               $dircliente->ciudad = $this->empresa->ciudad;
               $dircliente->descripcion = 'Principal';
               
               if( isset($_POST['pais']) )
               {
                  $dircliente->codpais = $_POST['pais'];
               }
               
               if( isset($_POST['provincia']) )
               {
                  $dircliente->provincia = $_POST['provincia'];
               }
               
               if( isset($_POST['ciudad']) )
               {
                  $dircliente->ciudad = $_POST['ciudad'];
               }
               
               if( isset($_POST['codpostal']) )
               {
                  $dircliente->codpostal = $_POST['codpostal'];
               }
               
               if( isset($_POST['direccion']) )
               {
                  $dircliente->direccion = $_POST['direccion'];
               }
               
               if( $dircliente->save() )
               {
                  header('location: '.$cliente->url());
               }
               else
                  $this->new_error_msg("¡Imposible guardar la dirección del paciente!");
            }
            else
               $this->new_error_msg("¡Imposible guardar los datos del paciente!");
         }
      }
      
      $this->offset = 0;
      if( isset($_GET['offset']) )
      {
         $this->offset = intval($_GET['offset']);
      }
      
      $this->ciudad = '';
      if( isset($_REQUEST['ciudad']) )
      {
         $this->ciudad = $_REQUEST['ciudad'];
      }
      
      $this->provincia = '';
      if( isset($_REQUEST['provincia']) )
      {
         $this->provincia = $_REQUEST['provincia'];
      }
      
      $this->codpais = '';
      if( isset($_POST['codpais']) )
      {
         $this->codpais = $_POST['codpais'];
      }
      
      $this->codgrupo = '';
      if( isset($_POST['bcodgrupo']) )
      {
         $this->codgrupo = $_POST['bcodgrupo'];
      }
      
      $this->buscar();
      $this->grupos = $this->grupo->all();
   }
   
   public function anterior_url()
   {
      $url = '';
      
      if($this->offset > 0)
      {
         $url = $this->url()."&query=".$this->query
                 ."&ciudad=".$this->ciudad
                 ."&provincia=".$this->provincia
                 ."&codpais=".$this->codpais
                 ."&codgrupo=".$this->codgrupo
                 ."&offset=".($this->offset-FS_ITEM_LIMIT);
      }
      
      return $url;
   }
   
   public function siguiente_url()
   {
      $url = '';
      
      if( count($this->resultados) == FS_ITEM_LIMIT )
      {
         $url = $this->url()."&query=".$this->query
                 ."&ciudad=".$this->ciudad
                 ."&provincia=".$this->provincia
                 ."&codpais=".$this->codpais
                 ."&codgrupo=".$this->codgrupo
                 ."&offset=".($this->offset+FS_ITEM_LIMIT);
      }
      
      return $url;
   }
   
   public function nombre_grupo($cod)
   {
      $nombre = '-';
      
      foreach($this->grupos as $g)
      {
         if($g->codgrupo == $cod)
         {
            $nombre = $g->nombre;
            break;
         }
      }
      
      return $nombre;
   }
   
   public function ciudades()
   {
      $final = array();
      
      $ciudades = array();
      $sql = "SELECT DISTINCT ciudad FROM dirclientes ORDER BY ciudad ASC;";
      if($this->provincia != '')
      {
         $sql = "SELECT DISTINCT ciudad FROM dirclientes WHERE lower(provincia) = '"
                 .$this->provincia."' ORDER BY ciudad ASC;";
      }
      $data = $this->db->select($sql);
      if($data)
      {
         foreach($data as $d)
            $ciudades[] = $d['ciudad'];
      }
      
      /// usamos las minúsculas para filtrar
      foreach($ciudades as $ciu)
      {
         if($ciu != '')
         {
            $final[ mb_strtolower($ciu) ] = $ciu;
         }
      }
      
      return $final;
   }
   
   public function provincias()
   {
      $final = array();
      
      $provincias = array();
      $sql = "SELECT DISTINCT provincia FROM dirclientes ORDER BY provincia ASC;";
      if($this->codpais != '')
      {
         $sql = "SELECT DISTINCT provincia FROM dirclientes WHERE codpais = '".$this->codpais
                 ."' ORDER BY provincia ASC;";
      }
      $data = $this->db->select($sql);
      if($data)
      {
         foreach($data as $d)
            $provincias[] = $d['provincia'];
      }
      
      foreach($provincias as $pro)
      {
         if($pro != '')
         {
            $final[ mb_strtolower($pro) ] = $pro;
         }
      }
      
      return $final;
   }
   
   private function buscar()
   {
      $this->total_resultados = 0;
      $query = mb_strtolower( $this->cliente->no_html($this->query) );
      $sql = " FROM clientes";
      $and = ' WHERE ';
      
      if( is_numeric($query) )
      {
         $sql .= $and."(codcliente LIKE '%".$query."%' OR cifnif LIKE '%".$query."%'"
                 . " OR telefono1 LIKE '".$query."%' OR telefono2 LIKE '".$query."%'"
                 . " OR observaciones LIKE '%".$query."%')";
         $and = ' AND ';
      }
      else
      {
         $buscar = str_replace(' ', '%', $query);
         $sql .= $and."(lower(nombre) LIKE '%".$buscar."%' OR lower(razonsocial) LIKE '%".$buscar."%'"
                 . " OR lower(cifnif) LIKE '%".$buscar."%' OR lower(observaciones) LIKE '%".$buscar."%'"
                 . " OR lower(email) LIKE '%".$buscar."%')";
         $and = ' AND ';
      }
      
      if($this->ciudad != '' OR $this->provincia != '' OR $this->codpais != '')
      {
         $sql .= $and." codcliente IN (SELECT codcliente FROM dirclientes WHERE ";
         $and2 = '';
         
         if($this->ciudad != '')
         {
            $sql .= "lower(ciudad) = '".mb_strtolower($this->ciudad)."'";
            $and2 = ' AND ';
         }
         
         if($this->provincia != '')
         {
            $sql .= $and2."lower(provincia) = '".mb_strtolower($this->provincia)."'";
            $and2 = ' AND ';
         }
         
         if($this->codpais != '')
         {
            $sql .= $and2."codpais = '".$this->codpais."'";
         }
         
         $sql .= ")";
         $and = ' AND ';
      }
      
      if($this->codgrupo != '')
      {
         $sql .= $and."codgrupo = '".$this->codgrupo."'";
      }
      
      $data = $this->db->select("SELECT COUNT(codcliente) as total".$sql);
      if($data)
      {
         $this->total_resultados = intval($data[0]['total']);
         
         $data2 = $this->db->select_limit("SELECT *".$sql." ORDER BY nombre ASC", FS_ITEM_LIMIT, $this->offset);
         if($data2)
         {
            foreach($data2 as $d)
            {
               $this->resultados[] = new cliente($d);
            }
         }
      }
   }
}

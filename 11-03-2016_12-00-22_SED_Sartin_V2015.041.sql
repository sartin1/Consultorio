#
# Respaldo de Base de Datos MySQL
# Creada con la clase MySQL_Backup - Versi√≥n. 1.0.1b
# (Adaptada y traducida por Valent√≠n Gonz√°lez)
#
# Servidor: localhost
# Generada el: 11/03/2016 a las 12:00:21
# Versi√≥n de MySQL: 5.6.21
# Versi√≥n de PHP: 5.6.3
#
# Base de Datos: `consultorio`
#


SET FOREIGN_KEY_CHECKS=0;


#
# Estructura de la tabla `agenciastrans`
#

DROP TABLE IF EXISTS `agenciastrans`;
CREATE TABLE `agenciastrans` (
  `codtrans` varchar(8) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`codtrans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `agenciastrans`
#



#
# Estructura de la tabla `agentes`
#

DROP TABLE IF EXISTS `agentes`;
CREATE TABLE `agentes` (
  `apellidos` varchar(100) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin NOT NULL,
  `coddepartamento` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnicif` varchar(15) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `idusuario` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombreap` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `seg_social` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cargo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `banco` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `f_alta` date DEFAULT NULL,
  `f_baja` date DEFAULT NULL,
  `f_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`codagente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `agentes`
#

INSERT INTO agentes VALUES ('San martin', '', '1', '', '', '', '', '38905797', 'tecnopolis9011@gmail.com', '', '', '', '', 'Miguel', '', '0', '', '2974769711', '', '', '', '2016-02-25', '', '2016-02-25');
INSERT INTO agentes VALUES ('Millan', '', '2', '', '', '', '', '', '', '', '', '', '', 'Dra. Diana', '', '0', '', '', '2070', 'MÈdico Pediatra', '', '2016-02-25', '', '2016-02-25');


#
# Estructura de la tabla `albaranescli`
#

DROP TABLE IF EXISTS `albaranescli`;
CREATE TABLE `albaranescli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `idalbaran` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ptefactura` tinyint(1) NOT NULL DEFAULT '1',
  `recfinanciero` double NOT NULL DEFAULT '0',
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idalbaran`),
  UNIQUE KEY `uniq_codigo_albaranescli` (`codigo`),
  KEY `ca_albaranescli_series2` (`codserie`),
  KEY `ca_albaranescli_ejercicios2` (`codejercicio`),
  CONSTRAINT `ca_albaranescli_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranescli_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `albaranescli`
#

INSERT INTO albaranescli VALUES ('', '15856374', 'Caleta Olivia', '2', 'ALG', '000001', '', 'ARS', '2016', '20160A000011', 'OSDIPP', 'ARG', '', 'A', '', '2016-03-08', '11:53:29', '4', '', '', '0', '300', 'Julio Rodriguez', '11', '', 'Turno: 20160A000026 | Fecha: 08-03-2016
Descripcion: diagnÛstico
SoluciÛn: tratamiento
Observaciones: Observacion extra', '0', 'Santa Cruz', '1', '0', '15.64', '340.5', '5325.42', '0', '40.5', '0');
INSERT INTO albaranescli VALUES ('', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000012', 'OSDIPP', 'ARG', '', 'A', '', '2016-03-10', '15:39:50', '5', '13', '', '0', '0', 'MIGUEL SAN MARTIN', '12', '', '', '0', 'Santa Cruz', '0', '0', '15.64', '0', '0', '0', '0', '0');


#
# Estructura de la tabla `albaranesprov`
#

DROP TABLE IF EXISTS `albaranesprov`;
CREATE TABLE `albaranesprov` (
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idalbaran` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `ptefactura` tinyint(1) NOT NULL DEFAULT '1',
  `recfinanciero` double NOT NULL DEFAULT '0',
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idalbaran`),
  UNIQUE KEY `uniq_codigo_albaranesprov` (`codigo`),
  KEY `ca_albaranesprov_series2` (`codserie`),
  KEY `ca_albaranesprov_ejercicios2` (`codejercicio`),
  CONSTRAINT `ca_albaranesprov_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranesprov_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `albaranesprov`
#

INSERT INTO albaranesprov VALUES ('17856275', '2', 'ALG', 'ARS', '2016', '20160A000002', 'CONT', '000001', 'A', '2016-02-27', '02:57:26', '2', '3', '0', '2', 'TecnopolÌs', '2', '', '', '0', '0', '15.09', '2', '30.18', '0', '0', '0');


#
# Estructura de la tabla `almacenes`
#

DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `observaciones` text COLLATE utf8_bin,
  `poblacion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `porpvp` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tipovaloracion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codalmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `almacenes`
#

INSERT INTO almacenes VALUES ('', 'ALG', 'ARG', '', '', '', '', '0', 'Deposito 1', '', '', '0', '', '', '');


#
# Estructura de la tabla `articulos`
#

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `factualizado` date DEFAULT NULL,
  `bloqueado` tinyint(1) DEFAULT '0',
  `equivalencia` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuentairpfcom` int(11) DEFAULT NULL,
  `idsubcuentacom` int(11) DEFAULT NULL,
  `stockmin` double DEFAULT '0',
  `observaciones` text COLLATE utf8_bin,
  `codbarras` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stockfis` double DEFAULT '0',
  `stockmax` double DEFAULT '0',
  `costemedio` double DEFAULT '0',
  `preciocoste` double DEFAULT '0',
  `tipocodbarras` varchar(8) COLLATE utf8_bin DEFAULT 'Code39',
  `nostock` tinyint(1) DEFAULT NULL,
  `codsubcuentacom` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin NOT NULL,
  `codsubcuentairpfcom` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `secompra` tinyint(1) DEFAULT NULL,
  `codfamilia` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `imagen` text COLLATE utf8_bin,
  `controlstock` tinyint(1) DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `tipo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `pvp` double DEFAULT '0',
  `sevende` tinyint(1) DEFAULT NULL,
  `publico` tinyint(1) DEFAULT '0',
  `codfabricante` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`referencia`),
  KEY `ca_articulos_impuestos2` (`codimpuesto`),
  CONSTRAINT `ca_articulos_impuestos2` FOREIGN KEY (`codimpuesto`) REFERENCES `impuestos` (`codimpuesto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `articulos`
#

INSERT INTO articulos VALUES ('2016-03-10', '0', '', '', '', '0', '', '', 'na', '0', '0', '0', '0', 'Code39', '1', '', 'D', '', '1', '', '', '1', 'AS', '', '2', '1', '0', '');
INSERT INTO articulos VALUES ('2016-03-10', '0', '', '', '', '0', '', '', 'na', '0', '0', '0', '0', 'Code39', '1', '', 'ASD', '', '1', '', '', '1', 'ASD', '', '0', '1', '0', '');
INSERT INTO articulos VALUES ('2016-03-10', '0', '', '', '', '0', '', '', 'na', '0', '0', '0', '2', 'Code39', '1', '', 'S', '', '1', '', '', '1', 'S', '', '2', '1', '0', '');


#
# Estructura de la tabla `articulosprov`
#

DROP TABLE IF EXISTS `articulosprov`;
CREATE TABLE `articulosprov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `refproveedor` varchar(25) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `precio` double DEFAULT NULL,
  `dto` double DEFAULT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `nostock` tinyint(1) DEFAULT '1',
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_articulo_proveedor2` (`codproveedor`,`refproveedor`),
  CONSTRAINT `ca_articulosprov_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `articulosprov`
#



#
# Estructura de la tabla `avisovenc`
#

DROP TABLE IF EXISTS `avisovenc`;
CREATE TABLE `avisovenc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `enviado` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Volcado de datos de la tabla `avisovenc`
#

INSERT INTO avisovenc VALUES ('1', 'Juan', '29', '9', '1980', '2008', 'user@mail.com');


#
# Estructura de la tabla `cajas`
#

DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fs_id` int(11) NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin NOT NULL,
  `f_inicio` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `d_inicio` double NOT NULL DEFAULT '0',
  `f_fin` timestamp NULL DEFAULT NULL,
  `d_fin` double DEFAULT NULL,
  `tickets` int(11) DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `cajas`
#

INSERT INTO cajas VALUES ('2', '2', '2', '2016-02-25 06:46:21', '0', '', '7.5', '1', '127.0.0.1');


#
# Estructura de la tabla `cajas_terminales`
#

DROP TABLE IF EXISTS `cajas_terminales`;
CREATE TABLE `cajas_terminales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `tickets` text COLLATE utf8_bin,
  `anchopapel` int(11) DEFAULT NULL,
  `comandocorte` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comandoapertura` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `num_tickets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `cajas_terminales`
#

INSERT INTO cajas_terminales VALUES ('2', 'ALG', 'A', '', 'p0 p0 p0 
Factura simplificada: 20160A000002
25-02-2016 06:54
Cliente: CONSUMIDOR FINAL
Empleado: 2

Ud. Articulo                       TOTAL
--- ------------------------- ----------
  3 Articulo                        7.50
----------------------------------------
     IVA: ARS 0.00   Total: ARS 7.50    



!8   EL PORVENIR  
      S.R.L     
!
             - Caleta Olivia            
             CIF: 123456789             i 

', '40', '27.105', '27.112.48', '1');


#
# Estructura de la tabla `chat`
#

DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) COLLATE utf8_bin NOT NULL,
  `to_user` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `sent_on` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `recd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `chat`
#

INSERT INTO chat VALUES ('1', 'admin', 'pruebas', 'eu', '2016-01-29 21:15:05', '1');
INSERT INTO chat VALUES ('2', 'pruebas', 'pruebas', 'que pasoo', '2016-01-29 21:15:18', '1');
INSERT INTO chat VALUES ('3', 'pruebas', 'admin', 'dale dale', '2016-01-29 21:15:26', '1');
INSERT INTO chat VALUES ('4', 'admin', 'pruebas', 'hey', '2016-01-29 21:16:41', '1');
INSERT INTO chat VALUES ('5', 'admin', 'pruebas', 'hey', '2016-01-29 21:17:09', '1');
INSERT INTO chat VALUES ('6', 'admin', 'pruebas', 's', '2016-01-29 21:17:23', '1');
INSERT INTO chat VALUES ('7', 'admin', 'pruebas', 'hey', '2016-01-29 21:18:40', '1');
INSERT INTO chat VALUES ('8', 'pruebas', 'admin', 'que paso', '2016-01-29 21:19:00', '1');
INSERT INTO chat VALUES ('9', 'admin', 'pruebas', 'venis hoy?', '2016-01-29 21:19:30', '1');
INSERT INTO chat VALUES ('10', 'admin', 'pruebas', 'hola', '2016-02-22 21:29:37', '1');


#
# Estructura de la tabla `clientes`
#

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `capitalimpagado` double DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codcontacto` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentadom` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentarem` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codedi` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `codgrupo` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codtiporappel` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `copiasfactura` int(11) DEFAULT NULL,
  `debaja` tinyint(1) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `fechabaja` date DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `ivaincluido` tinyint(1) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `recargo` tinyint(1) DEFAULT NULL,
  `regimeniva` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `riesgoalcanzado` double DEFAULT NULL,
  `riesgomax` double DEFAULT NULL,
  `telefono1` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `tipoidfiscal` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'NIF',
  `web` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fechaentrega` date NOT NULL,
  `fechaplan` date NOT NULL,
  `pnacimiento` text COLLATE utf8_bin,
  `egestacional` text COLLATE utf8_bin,
  `antpre` text COLLATE utf8_bin,
  `antper` text COLLATE utf8_bin,
  `antfam` text COLLATE utf8_bin,
  `sexo` text COLLATE utf8_bin,
  `edad` int(11) DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `clientes`
#

INSERT INTO clientes VALUES ('', '15856374', '', '000001', '', '', '', 'ARS', '', '', 'OSDIPP', 'A', '', '', '', '', '0', '12/17', 'Plus', '', '2016-03-08', '', '', 'Julio Rodriguez', 'Julio Rodriguez', 'asd', '0', 'General', '', '', '0000 0000 0000', '000000000000 (OSDE)', 'NIF', '', '0000-00-00', '0000-00-00', 'Peso de nacimiento', 'asdasd', 'asdasd', 'asdas', 'asdasd', 'Masculino', '48', '1968-06-12');
INSERT INTO clientes VALUES ('', '38905797', '', '000002', '', '', '', 'ARS', '', '', 'OSDIPP', 'A', '', '', '', '', '0', '', '', '', '2016-03-10', '', '', 'MIGUEL SAN MARTIN', 'MIGUEL SAN MARTIN', '', '0', 'General', '', '', '2974769711', '265846198491 (osdipp)', 'NIF', '', '0000-00-00', '0000-00-00', '', '', '', '', '2016-03-10', '', '0', '1969-12-31');


#
# Estructura de la tabla `co_asientos`
#

DROP TABLE IF EXISTS `co_asientos`;
CREATE TABLE `co_asientos` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codplanasiento` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `documento` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `idasiento` int(11) NOT NULL AUTO_INCREMENT,
  `idconcepto` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `tipodocumento` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idasiento`),
  KEY `ca_co_asientos_ejercicios2` (`codejercicio`),
  CONSTRAINT `ca_co_asientos_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_asientos`
#

INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000002 - Prueba', '20150A000002', '0', '2015-10-21', '2', '', '3.63', '2', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000003 - Prueba', '20150A000003', '0', '2015-10-21', '3', '', '181.5', '3', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000003 - CONSUMIDOR FINAL', '20150A000003', '0', '2015-10-22', '4', '', '24.2', '4', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '20150A000004', '0', '2015-10-22', '5', '', '12.1', '5', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '20150A000005', '0', '2015-10-28', '6', '', '29.77', '6', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '20150A000006', '0', '2015-10-28', '7', '', '50.82', '7', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000004 - Prueba', '20150A000004', '0', '2015-10-28', '8', '', '169.4', '8', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000005 - Prueba', '20150A000005', '0', '2015-10-28', '9', '', '0', '9', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000006 - Prueba', '20150A000006', '0', '2015-10-28', '10', '', '25.85', '10', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'REGULARIZACI?N IVA T3', '', '0', '2015-09-30', '11', '', '0', '11', '');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de compra 20150A000007 - INTERNET', '20150A000007', '0', '2015-10-29', '12', '', '60.5', '12', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000002 - CONSUMIDOR FINAL', '20150A000002', '0', '2015-10-22', '13', '', '12.4', '13', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '20150A000007', '0', '2015-10-29', '14', '', '12.4', '14', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '20150A000008', '0', '2015-10-29', '15', '', '12.4', '15', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '20150A000009', '0', '2015-10-30', '16', '', '26.92', '16', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000001 - CONSUMIDOR FINAL', '20150A000001', '0', '2015-10-31', '21', '', '12.4', '21', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000002 - Miguel san martin', '20150A000002', '0', '2015-12-09', '22', '', '12.4', '22', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000003 - Camila siares', '20150A000003', '0', '2015-12-09', '23', '', '2000', '23', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '20150A000004', '0', '2015-12-10', '24', '', '14.52', '24', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '20150A000005', '0', '2015-12-10', '25', '', '0', '25', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '20150A000006', '0', '2015-12-10', '26', '', '14.52', '26', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '20150A000007', '0', '2015-12-10', '27', '', '14.52', '27', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '20150A000008', '0', '2015-12-10', '28', '', '12.4', '28', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '20150A000009', '0', '2015-12-10', '29', '', '12.4', '29', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000010 - CONSUMIDOR FINAL', '20150A000010', '0', '2015-12-10', '30', '', '12.4', '30', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000011 - CONSUMIDOR FINAL', '20150A000011', '0', '2015-12-10', '31', '', '12.4', '31', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000012 - CONSUMIDOR FINAL', '20150A000012', '0', '2015-12-10', '32', '', '12.4', '32', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000013 - CONSUMIDOR FINAL', '20150A000013', '0', '2015-12-10', '33', '', '12.4', '33', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000014 - CONSUMIDOR FINAL', '20150A000014', '0', '2015-12-10', '34', '', '0', '34', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000015 - CONSUMIDOR FINAL', '20150A000015', '0', '2015-12-10', '35', '', '0', '35', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000016 - CONSUMIDOR FINAL', '20150A000016', '0', '2015-12-10', '36', '', '0', '36', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000017 - CONSUMIDOR FINAL', '20150A000017', '0', '2015-12-10', '37', '', '0', '37', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000018 - CONSUMIDOR FINAL', '20150A000018', '0', '2015-12-10', '38', '', '0', '38', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000019 - CONSUMIDOR FINAL', '20150A000019', '0', '2015-12-10', '39', '', '0', '39', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000020 - CONSUMIDOR FINAL', '20150A000020', '0', '2015-12-10', '40', '', '0', '40', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000021 - CONSUMIDOR FINAL', '20150A000021', '0', '2015-12-10', '41', '', '0', '41', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000022 - CONSUMIDOR FINAL', '20150A000022', '0', '2015-12-10', '42', '', '0', '42', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000023 - Miguel san martin', '20150A000023', '0', '2015-12-10', '43', '', '12.4', '43', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000024 - Miguel san martin', '20150A000024', '0', '2015-12-10', '44', '', '12.4', '44', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000025 - Miguel san martin', '20150A000025', '0', '2015-12-10', '45', '', '14.52', '45', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000026 - Miguel san martin', '20150A000026', '0', '2015-12-10', '46', '', '14.52', '46', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000027 - Camila siares', '20150A000027', '0', '2015-12-10', '47', '', '3', '47', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000028 - Camila siares', '20150A000028', '0', '2015-12-10', '48', '', '3', '48', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000029 - Camila siares', '20150A000029', '0', '2015-12-10', '49', '', '12.4', '49', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000030 - Camila siares', '20150A000030', '0', '2015-12-10', '50', '', '12.4', '50', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000031 - Camila siares', '20150A000031', '0', '2015-12-10', '51', '', '12.4', '51', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000032 - Camila siares', '20150A000032', '0', '2015-12-10', '52', '', '12.4', '52', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000033 - Camila siares', '20150A000033', '0', '2015-12-10', '53', '', '12.4', '53', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000034 - Miguel san martin', '20150A000034', '0', '2015-12-10', '54', '', '0', '54', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000035 - Miguel san martin', '20150A000035', '0', '2015-12-10', '55', '', '0', '55', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000036 - Miguel san martin', '20150A000036', '0', '2015-12-10', '56', '', '0', '56', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000037 - Miguel san martin', '20150A000037', '0', '2015-12-10', '57', '', '0', '57', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000038 - Miguel san martin', '20150A000038', '0', '2015-12-10', '58', '', '0', '58', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000039 - Miguel san martin', '20150A000039', '0', '2015-12-10', '59', '', '0', '59', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000040 - Miguel san martin', '20150A000040', '0', '2015-12-10', '60', '', '0', '60', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000041 - Miguel san martin', '20150A000041', '0', '2015-12-10', '61', '', '0', '61', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000042 - Miguel san martin', '20150A000042', '0', '2015-12-10', '62', '', '0', '62', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000043 - Miguel san martin', '20150A000043', '0', '2015-12-10', '63', '', '0', '63', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000044 - Miguel san martin', '20150A000044', '0', '2015-12-10', '64', '', '0', '64', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000045 - Miguel san martin', '20150A000045', '0', '2015-12-10', '65', '', '0', '65', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000046 - Miguel san martin', '20150A000046', '0', '2015-12-10', '66', '', '0', '66', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000047 - Miguel san martin', '20150A000047', '0', '2015-12-10', '67', '', '0', '67', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000048 - Miguel san martin', '20150A000048', '0', '2015-12-10', '68', '', '0', '68', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000049 - Miguel san martin', '20150A000049', '0', '2015-12-10', '69', '', '3', '69', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000050 - Miguel san martin', '20150A000050', '0', '2015-12-10', '70', '', '3', '70', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000051 - Miguel san martin', '20150A000051', '0', '2015-12-10', '71', '', '3', '71', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000052 - Miguel san martin', '20150A000052', '0', '2015-12-10', '72', '', '3', '72', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000053 - Miguel san martin', '20150A000053', '0', '2015-12-10', '73', '', '3', '73', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000054 - Miguel san martin', '20150A000054', '0', '2015-12-10', '74', '', '3', '74', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000055 - Miguel san martin', '20150A000055', '0', '2015-12-10', '75', '', '3', '75', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000056 - Miguel san martin', '20150A000056', '0', '2015-12-10', '76', '', '3', '76', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000057 - Miguel san martin', '20150A000057', '0', '2015-12-10', '77', '', '3', '77', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000058 - Miguel san martin', '20150A000058', '0', '2015-12-10', '78', '', '3', '78', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000059 - Miguel san martin', '20150A000059', '0', '2015-12-10', '79', '', '3', '79', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000060 - Miguel san martin', '20150A000060', '0', '2015-12-10', '80', '', '3', '80', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000061 - Miguel san martin', '20150A000061', '0', '2015-12-10', '81', '', '3', '81', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000062 - Camila siares', '20150A000062', '0', '2015-12-10', '82', '', '12.4', '82', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000063 - Camila siares', '20150A000063', '0', '2015-12-10', '83', '', '12.4', '83', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000064 - Camila siares', '20150A000064', '0', '2015-12-10', '84', '', '12.4', '84', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000065 - Camila siares', '20150A000065', '0', '2015-12-10', '85', '', '12.4', '85', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000066 - Camila siares', '20150A000066', '0', '2015-12-10', '86', '', '12.4', '86', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000067 - Camila siares', '20150A000067', '0', '2015-12-10', '87', '', '0', '87', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2015', '', 'Factura de venta 20150A000068 - Camila siares', '20150A000068', '0', '2015-12-10', '88', '', '0', '88', 'Factura de cliente');
INSERT INTO co_asientos VALUES ('2016', '', 'Factura de compra 20160A000001 - TecnopolÌs', '20160A000001', '0', '2016-02-27', '101', '', '2', '14', 'Factura de proveedor');
INSERT INTO co_asientos VALUES ('2016', '', 'Factura de venta 20160A000002 - MIGUEL SAN MARTIN', '20160A000002', '0', '2016-03-10', '105', '', '0', '18', 'Factura de cliente');


#
# Estructura de la tabla `co_codbalances08`
#

DROP TABLE IF EXISTS `co_codbalances08`;
CREATE TABLE `co_codbalances08` (
  `descripcion4ba` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `descripcion4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel4` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `descripcion3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orden3` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `nivel3` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `descripcion2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel2` int(11) DEFAULT NULL,
  `descripcion1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel1` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `naturaleza` varchar(15) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codbalance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_codbalances08`
#

INSERT INTO co_codbalances08 VALUES ('', '1. Desarrollo.', '1', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Concesiones.', '2', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Patentes, licencias, marcas y similares.', '3', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Fondo de comercio.', '4', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Aplicaciones inform?ticas.', '5', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-5');
INSERT INTO co_codbalances08 VALUES ('', '6. Otro inmovilizado intangible.', '6', 'I. Inmovilizado intangible.', '1', 'I', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--I-6');
INSERT INTO co_codbalances08 VALUES ('', '1. Terrenos y construcciones.', '1', 'II. Inmovilizado material.', '2', 'II', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--II-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Instalaciones t?cnicas, y otro inmovilizado material.', '2', 'II. Inmovilizado material.', '2', 'II', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--II-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Inmovilizado en curso y anticipos.', '3', 'II. Inmovilizado material.', '2', 'II', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--II-3');
INSERT INTO co_codbalances08 VALUES ('', '1. Terrenos.', '1', 'III. Inversiones inmobiliarias.', '3', 'III', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--III-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Construcciones.', '2', 'III. Inversiones inmobiliarias.', '3', 'III', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--III-2');
INSERT INTO co_codbalances08 VALUES ('', '1. Instrumentos de patrimonio.', '1', 'IV. Inversiones en empresas del grupo y asociadas a largo plazo', '4', 'IV', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--IV-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Cr?ditos a empresas.', '2', 'IV. Inversiones en empresas del grupo y asociadas a largo plazo', '4', 'IV', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--IV-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Valores representativos de deuda.', '3', 'IV. Inversiones en empresas del grupo y asociadas a largo plazo', '4', 'IV', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--IV-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'IV. Inversiones en empresas del grupo y asociadas a largo plazo', '4', 'IV', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--IV-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros activos financieros.', '5', 'IV. Inversiones en empresas del grupo y asociadas a largo plazo', '4', 'IV', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--IV-5');
INSERT INTO co_codbalances08 VALUES ('', '1. Instrumentos de patrimonio.', '1', 'V. Inversiones financieras a largo plazo.', '5', 'V', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--V-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Cr?ditos a terceros', '2', 'V. Inversiones financieras a largo plazo.', '5', 'V', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--V-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Valores representativos de deuda', '3', 'V. Inversiones financieras a largo plazo.', '5', 'V', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--V-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'V. Inversiones financieras a largo plazo.', '5', 'V', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--V-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros activos financieros.', '5', 'V. Inversiones financieras a largo plazo.', '5', 'V', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--V-5');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VI. Activos por impuesto diferido.', '6', 'VI', '', '0', 'A) ACTIVO NO CORRIENTE', 'A', 'A', 'A-A--VI-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'I. Activos no corrientes mantenidos para la venta.', '1', 'I', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--I-');
INSERT INTO co_codbalances08 VALUES ('', '1. Comerciales.', '1', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Materias primas y otros aprovisionamientos.', '2', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Productos en curso.', '3', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Productos terminados.', '4', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Subproductos, residuos y materiales recuperados.', '5', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-5');
INSERT INTO co_codbalances08 VALUES ('', '6. Anticipos a proveedores', '6', 'II. Existencias.', '2', 'II', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--II-6');
INSERT INTO co_codbalances08 VALUES ('1. Clientes por ventas y prestaciones de servicios', '1. Clientes por ventas y prestaciones de servicios.', '1', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-1');
INSERT INTO co_codbalances08 VALUES ('2. Accionistas (socios) por desembolsos exigidos', '2. Clientes, empresas del grupo y asociadas.', '2', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-2');
INSERT INTO co_codbalances08 VALUES ('3. Otros deudores', '3. Deudores varios.', '3', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Personal.', '4', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Activos por impuesto corriente.', '5', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-5');
INSERT INTO co_codbalances08 VALUES ('', '6. Otros cr?ditos con las Administraciones P?blicas.', '6', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-6');
INSERT INTO co_codbalances08 VALUES ('', '7. Accionistas (socios) por desembolsos exigidos', '7', 'III. Deudores comerciales y otras cuentas a cobrar.', '3', 'III', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--III-7');
INSERT INTO co_codbalances08 VALUES ('', '1. Instrumentos de patrimonio.', '1', 'IV. Inversiones en empresas del grupo y asociadas a corto plazo', '4', 'IV', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--IV-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Cr?ditos a empresas.', '2', 'IV. Inversiones en empresas del grupo y asociadas a corto plazo', '4', 'IV', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--IV-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Valores representativos de deuda.', '3', 'IV. Inversiones en empresas del grupo y asociadas a corto plazo', '4', 'IV', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--IV-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'IV. Inversiones en empresas del grupo y asociadas a corto plazo', '4', 'IV', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--IV-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros activos financieros.', '5', 'IV. Inversiones en empresas del grupo y asociadas a corto plazo', '4', 'IV', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--IV-5');
INSERT INTO co_codbalances08 VALUES ('', '1. Instrumentos de patrimonio.', '1', 'V. Inversiones financieras a corto plazo.', '5', 'V', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--V-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Cr?ditos a empresas', '2', 'V. Inversiones financieras a corto plazo.', '5', 'V', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--V-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Valores representativos de deuda.', '3', 'V. Inversiones financieras a corto plazo.', '5', 'V', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--V-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'V. Inversiones financieras a corto plazo.', '5', 'V', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--V-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros activos financieros.', '5', 'V. Inversiones financieras a corto plazo.', '5', 'V', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--V-5');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VI. Periodificaciones a corto plazo.', '6', 'VI', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--VI-');
INSERT INTO co_codbalances08 VALUES ('', '1. Tesorer?a.', '1', 'VII. Efectivo y otros activos l?quidos equivalentes.', '7', 'VII', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--VII-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Otros activos l?quidos equivalentes.', '2', 'VII. Efectivo y otros activos l?quidos equivalentes.', '7', 'VII', '', '0', 'B) ACTIVO CORRIENTE', 'B', 'A', 'A-B--VII-2');
INSERT INTO co_codbalances08 VALUES ('', '1. Activos financieros disponibles para la venta. ', '1', 'I. Por valoraci?n instrumentos financieros. ', '1', 'I', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--I-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Otros ingresos/gastos. ', '2', 'I. Por valoraci?n instrumentos financieros. ', '1', 'I', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--I-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'II. Por coberturas de flujos de efectivo. ', '2', 'II', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--II-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'III. Subvenciones, donaciones y legados recibidos. ', '3', 'III', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--III-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IV. Por ganancias y p?rdidas actuariales y otros ajustes. ', '4', 'IV', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--IV-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'V. Efecto impositivo. ', '5', 'V', '', '0', 'Ingresos y gastos imputados directamente al patrimonio neto ', 'A', 'IG', 'IG-A--V-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IX. Efecto impositivo. ', '9', 'IX', '', '0', 'Transferencias a la cuenta de p?rdidas y ganancias ', 'B', 'IG', 'IG-B--IX-');
INSERT INTO co_codbalances08 VALUES ('', '1.Activos financieros disponibles para la venta. ', '1', 'VI. Por valoraci?n de instrumentos financieros. ', '6', 'VI', '', '0', 'Transferencias a la cuenta de p?rdidas y ganancias ', 'B', 'IG', 'IG-B--VI-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Otros ingresos/gastos. ', '2', 'VI. Por valoraci?n de instrumentos financieros. ', '6', 'VI', '', '0', 'Transferencias a la cuenta de p?rdidas y ganancias ', 'B', 'IG', 'IG-B--VI-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VII. Por coberturas de flujos de efectivo. ', '7', 'VII', '', '0', 'Transferencias a la cuenta de p?rdidas y ganancias ', 'B', 'IG', 'IG-B--VII-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VIII. Subvenciones, donaciones y legados recibidos. ', '8', 'VIII', '', '0', 'Transferencias a la cuenta de p?rdidas y ganancias ', 'B', 'IG', 'IG-B--VIII-');
INSERT INTO co_codbalances08 VALUES ('', '2. Otros activos l?quidos equivalentes.', '2', 'VII. Efectivo y otros activos l?quidos equivalentes.', '7', 'VII', '', '0', '', '', 'P', 'P---VII-2');
INSERT INTO co_codbalances08 VALUES ('1. Capital escriturado', '1. Capital escriturado.', '1', 'I. Capital.', '1', 'I', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-I-1');
INSERT INTO co_codbalances08 VALUES ('2. (Capital no exigido)', '2. (Capital no exigido).', '2', 'I. Capital.', '1', 'I', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-I-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'II. Prima de emisi', '2', 'II', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-II-');
INSERT INTO co_codbalances08 VALUES ('', '1. Legal y estatutarias.', '1', 'III. Reservas.', '3', 'III', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-III-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Otras reservas.', '2', 'III. Reservas.', '3', 'III', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-III-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IV. (Acciones y participaciones en patrimonio propias).', '4', 'IV', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-IV-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IX. Otros instrumentos de patrimonio neto.', '9', 'IX', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-IX-');
INSERT INTO co_codbalances08 VALUES ('', '1. Remanente.', '1', 'V. Resultados de ejercicios anteriores.', '5', 'V', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-V-1');
INSERT INTO co_codbalances08 VALUES ('', '2. (Resultados negativos de ejercicios anteriores).', '2', 'V. Resultados de ejercicios anteriores.', '5', 'V', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-V-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VI. Otras aportaciones de socios.', '6', 'VI', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-VI-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VII. Resultado del ejercicio.', '7', 'VII', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-VII-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VIII. (Dividendo a cuenta).', '8', 'VIII', 'A-1) Fondos propios.', '1', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-1-VIII-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'I. Activos financieros disponibles para la venta', '1', 'I', 'A-2) Ajustes por cambios de valor.', '2', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-2-I-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'II. Operaciones de cobertura.', '2', 'II', 'A-2) Ajustes por cambios de valor.', '2', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-2-II-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'III. Otros.', '3', 'III', 'A-2) Ajustes por cambios de valor.', '2', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-2-III-');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', 'A-3) Subvenciones, donaciones y legados recibidos.', '3', 'A) PATRIMONIO NETO', 'A', 'P', 'P-A-3--');
INSERT INTO co_codbalances08 VALUES ('', '1. Obligaciones por prestaciones a largo plazo al personal.', '1', 'I. Provisiones a largo plazo.', '1', 'I', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--I-1');
INSERT INTO co_codbalances08 VALUES ('', '2. Actuaciones medioambientales.', '2', 'I. Provisiones a largo plazo.', '1', 'I', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--I-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Provisiones por reestructuraci', '3', 'I. Provisiones a largo plazo.', '1', 'I', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--I-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Otras provisiones.', '4', 'I. Provisiones a largo plazo.', '1', 'I', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--I-4');
INSERT INTO co_codbalances08 VALUES ('1. Deudas con entidades de cr?dito', '1. Obligaciones y otros valores negociables.', '1', 'II. Deudas a largo plazo.', '2', 'II', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--II-1');
INSERT INTO co_codbalances08 VALUES ('2. Acreedores por arrendamiento financiero', '2. Deudas con entidades de cr?dito.', '2', 'II. Deudas a largo plazo.', '2', 'II', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--II-2');
INSERT INTO co_codbalances08 VALUES ('3. Otras deudas a largo plazo', '3. Acreedores por arrendamiento financiero.', '3', 'II. Deudas a largo plazo.', '2', 'II', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--II-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'II. Deudas a largo plazo.', '2', 'II', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--II-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros pasivos financieros.', '5', 'II. Deudas a largo plazo.', '2', 'II', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--II-5');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'III. Deudas con empresas del grupo y asociadas a largo plazo.', '3', 'III', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--III-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IV. Pasivos por impuesto diferido.', '4', 'IV', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--IV-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'V. Periodificaciones a largo plazo.', '5', 'V', '', '0', 'B) PASIVO NO CORRIENTE', 'B', 'P', 'P-B--V-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'I. Pasivos vinculados con activos no corrientes mantenidos para la venta', '1', 'I', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--I-');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'II. Provisiones a corto plazo.', '2', 'II', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--II-');
INSERT INTO co_codbalances08 VALUES ('1. Deudas con entidades de cr?dito', '1. Obligaciones y otros valores negociables.', '1', 'III. Deudas a corto plazo.', '3', 'III', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--III-1');
INSERT INTO co_codbalances08 VALUES ('2. Acreedores por arrendamiento financiero', '2. Deudas con entidades de cr?dito.', '2', 'III. Deudas a corto plazo.', '3', 'III', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--III-2');
INSERT INTO co_codbalances08 VALUES ('3. Otras deudas a corto plazo', '3. Acreedores por arrendamiento financiero.', '3', 'III. Deudas a corto plazo.', '3', 'III', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--III-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Derivados.', '4', 'III. Deudas a corto plazo.', '3', 'III', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--III-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Otros pasivos financieros.', '5', 'III. Deudas a corto plazo.', '3', 'III', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--III-5');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'IV. Deudas con empresas del grupo y asociadas a corto plazo.', '4', 'IV', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--IV-');
INSERT INTO co_codbalances08 VALUES ('1. Proveedores', '1. Proveedores', '1', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-1');
INSERT INTO co_codbalances08 VALUES ('2. Otros acreedores', '2. Proveedores, empresas del grupo y asociadas.', '2', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-2');
INSERT INTO co_codbalances08 VALUES ('', '3. Acreedores varios.', '3', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-3');
INSERT INTO co_codbalances08 VALUES ('', '4. Personal (remuneraciones pendientes de pago).', '4', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-4');
INSERT INTO co_codbalances08 VALUES ('', '5. Pasivos por impuesto corriente.', '5', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-5');
INSERT INTO co_codbalances08 VALUES ('', '6. Otras deudas con las Administraciones P?blicas.', '6', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-6');
INSERT INTO co_codbalances08 VALUES ('', '7. Anticipos de clientes.', '7', 'V. Acreedores comerciales y otras cuentas a pagar.', '5', 'V', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--V-7');
INSERT INTO co_codbalances08 VALUES ('', '', '', 'VI. Periodificaciones a corto plazo.', '6', 'VI', '', '0', 'C) PASIVO CORRIENTE', 'C', 'P', 'P-C--VI-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Ventas ', 'a', 'a', '1. Importe neto de la cifra de negocios. ', '1', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-1-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Prestaciones de servicios ', 'b', 'b', '1. Importe neto de la cifra de negocios. ', '1', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-1-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '10. Excesos de provisiones ', '10', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-10--');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Deterioros y p?rdidas ', 'a', 'a', '11. Deterioro y resultado por enajenaciones del inmovilizado ', '11', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-11-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Resultados por enajenaciones y otras ', 'b', 'b', '11. Deterioro y resultado por enajenaciones del inmovilizado ', '11', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-11-b-');
INSERT INTO co_codbalances08 VALUES ('', ' a1) En empresas del grupo y asociadas ', '1', ' a) De participaciones en instrumentos de patrimonio ', 'a', 'a', '12. Ingresos financieros ', '12', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-12-a-1');
INSERT INTO co_codbalances08 VALUES ('', ' a2) En empresas terceros ', '2', ' a) De participaciones en instrumentos de patrimonio ', 'a', 'a', '12. Ingresos financieros ', '12', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-12-a-2');
INSERT INTO co_codbalances08 VALUES ('', ' b1) De empresas del grupo y asociadas ', '1', ' b) De valores negociables y otros instrumentos financieros ', 'b', 'b', '12. Ingresos financieros ', '12', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-12-b-1');
INSERT INTO co_codbalances08 VALUES ('', ' b2) De terceros ', '2', ' b) De valores negociables y otros instrumentos financieros ', 'b', 'b', '12. Ingresos financieros ', '12', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-12-b-2');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Por deudas con empresas del grupo y asociadas ', 'a', 'a', '13. Gastos financieros ', '13', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-13-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Por deudas con terceros ', 'b', 'b', '13. Gastos financieros ', '13', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-13-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' c) Por actualizaci?n de provisiones ', 'c', 'c', '13. Gastos financieros ', '13', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-13-c-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Cartera de negociaci?n y otros ', 'a', 'a', '14. Variaci?n de valor razonable en instrumentos financieros ', '14', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-14-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Imputaci?n al resultado del ejercicio por activos fros. disponibles para la venta ', 'b', 'b', '14. Variaci?n de valor razonable en instrumentos financieros ', '14', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-14-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '15. Diferencias de cambio ', '15', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-15--');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Deterioros y p?rdidas ', 'a', 'a', '16. Deterioro y resultado por enajenaciones de instrumentos financieros ', '16', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-16-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Resultados por enajenaciones y otras ', 'b', 'b', '16. Deterioro y resultado por enajenaciones de instrumentos financieros ', '16', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-16-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', '  ', '', '', '17. Impuesto sobre beneficios ', '17', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-17--');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '2. Variaci?n de existencias de productos terminados y en curso de fabricaci', '2', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-2--');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '3. Trabajos realizados por la empresa para su activo ', '3', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-3--');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Consumo de mercader?as ', 'a', 'a', '4. Aprovisionamientos ', '4', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-4-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Consumo de materias primas y otras materias consumibles ', 'b', 'b', '4. Aprovisionamientos ', '4', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-4-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' c) Trabajos realizados por otras empresas ', 'c', 'c', '4. Aprovisionamientos ', '4', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-4-c-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' d) Deterioro de mercaderias , materias primas y otros aprovisioamientos ', 'd', 'd', '4. Aprovisionamientos ', '4', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-4-d-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Ingresos accesorios y otros de gesti?n corriente ', 'a', 'a', '5. Otros ingresos de explotaci', '5', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-5-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Subvenciones de explotaci?n incorporadas al resultado del ejercicio ', 'b', 'b', '5. Otros ingresos de explotaci', '5', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-5-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Sueldos , salarios y asimilados ', 'a', 'a', '6. Gastos de personal ', '6', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-6-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Cargas sociales ', 'b', 'b', '6. Gastos de personal ', '6', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-6-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' c) Provisiones ', 'c', 'c', '6. Gastos de personal ', '6', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-6-c-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' a) Servicios exteriores ', 'a', 'a', '7. Otros gastos de explotaci', '7', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-7-a-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' b) Tributos ', 'b', 'b', '7. Otros gastos de explotaci', '7', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-7-b-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' c) P?rdidas , deterioro y variaci?n de provisiones por operaciones comerciales ', 'c', 'c', '7. Otros gastos de explotaci', '7', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-7-c-');
INSERT INTO co_codbalances08 VALUES ('', '', '', ' d) Otros gastos de gesti?n corriente ', 'd', 'd', '7. Otros gastos de explotaci', '7', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-7-d-');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '8. Amortizaci?n del inmovilizado ', '8', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-8--');
INSERT INTO co_codbalances08 VALUES ('', '', '', '', '', '', '9. Imputaci?n de subvenciones de inmovilizado no financiero y otras ', '9', 'A) OPERACIONES CONTINUADAS ', 'A', 'PG', 'PG-A-9--');
INSERT INTO co_codbalances08 VALUES ('', '', '', '  ', '', '', '18. Resultado del ejercicio procedente de operaciones interrumpidas neto de impuestos ', '18', 'B) OPERACIONES INTERRUMPIDAS ', 'B', 'PG', 'PG-B-18--');


#
# Estructura de la tabla `co_conceptospar`
#

DROP TABLE IF EXISTS `co_conceptospar`;
CREATE TABLE `co_conceptospar` (
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idconceptopar` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idconceptopar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_conceptospar`
#



#
# Estructura de la tabla `co_cuentas`
#

DROP TABLE IF EXISTS `co_cuentas`;
CREATE TABLE `co_cuentas` (
  `codbalance` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codepigrafe` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `idcuentaesp` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `idepigrafe` int(11) NOT NULL,
  PRIMARY KEY (`idcuenta`),
  KEY `ca_co_cuentas_ejercicios` (`codejercicio`),
  KEY `ca_co_cuentas_epigrafes2` (`idepigrafe`),
  CONSTRAINT `ca_co_cuentas_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_cuentas_epigrafes2` FOREIGN KEY (`idepigrafe`) REFERENCES `co_epigrafes` (`idepigrafe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_cuentas`
#

INSERT INTO co_cuentas VALUES ('', '100', '2015', '10', 'Capital social', '1', '', '1');
INSERT INTO co_cuentas VALUES ('', '101', '2015', '10', 'Fondo social', '2', '', '1');
INSERT INTO co_cuentas VALUES ('', '102', '2015', '10', 'Capital', '3', '', '1');
INSERT INTO co_cuentas VALUES ('', '1030', '2015', '10', 'Socios por desembolsos no exigidos, capital social', '4', '', '1');
INSERT INTO co_cuentas VALUES ('', '1034', '2015', '10', 'Socios por desembolsos no exigidos, capital pendiente de inscripci', '5', '', '1');
INSERT INTO co_cuentas VALUES ('', '1040', '2015', '10', 'Socios por aportaciones no dinerarias pendientes, capital social', '6', '', '1');
INSERT INTO co_cuentas VALUES ('', '1044', '2015', '10', 'Socios por aportaciones no dinerarias pendientes, capital pendiente de inscripci', '7', '', '1');
INSERT INTO co_cuentas VALUES ('', '108', '2015', '10', 'Acciones o participaciones propias en situaciones especiales', '8', '', '1');
INSERT INTO co_cuentas VALUES ('', '109', '2015', '10', 'Acciones o participaciones propias para reducci?n de capital', '9', '', '1');
INSERT INTO co_cuentas VALUES ('', '110', '2015', '11', 'Prima de emisi?n o asunci', '10', '', '2');
INSERT INTO co_cuentas VALUES ('', '1110', '2015', '11', 'Patrimonio neto por emisi?n de instrumentos financieros compuestos', '11', '', '2');
INSERT INTO co_cuentas VALUES ('', '1111', '2015', '11', 'Resto de instrumentos de patrimonio neto', '12', '', '2');
INSERT INTO co_cuentas VALUES ('', '112', '2015', '11', 'Reserva legal', '13', '', '2');
INSERT INTO co_cuentas VALUES ('', '113', '2015', '11', 'Reservas voluntarias', '14', '', '2');
INSERT INTO co_cuentas VALUES ('', '1140', '2015', '11', 'Reservas para acciones o participaciones de la sociedad dominante', '15', '', '2');
INSERT INTO co_cuentas VALUES ('', '1141', '2015', '11', 'Reservas estatutarias', '16', '', '2');
INSERT INTO co_cuentas VALUES ('', '1142', '2015', '11', 'Reserva por capital amortizado', '17', '', '2');
INSERT INTO co_cuentas VALUES ('', '1143', '2015', '11', 'Reserva por fondo de comercio', '18', '', '2');
INSERT INTO co_cuentas VALUES ('', '1144', '2015', '11', 'Reservas por acciones propias aceptadas en garant', '19', '', '2');
INSERT INTO co_cuentas VALUES ('', '115', '2015', '11', 'Reservas por p?rdidas y ganancias actuariales y otros ajustes', '20', '', '2');
INSERT INTO co_cuentas VALUES ('', '118', '2015', '11', 'Aportaciones de socios o propietarios', '21', '', '2');
INSERT INTO co_cuentas VALUES ('', '119', '2015', '11', 'Diferencias por ajuste del capital a euros', '22', '', '2');
INSERT INTO co_cuentas VALUES ('', '120', '2015', '12', 'Remanente', '23', 'PREVIO', '3');
INSERT INTO co_cuentas VALUES ('', '121', '2015', '12', 'Resultados negativos de ejercicios anteriores', '24', 'PREVIO', '3');
INSERT INTO co_cuentas VALUES ('', '129', '2015', '12', 'Resultado del ejercicio', '25', 'PYG', '3');
INSERT INTO co_cuentas VALUES ('', '130', '2015', '13', 'Subvenciones oficiales de capital', '26', '', '4');
INSERT INTO co_cuentas VALUES ('', '131', '2015', '13', 'Donaciones y legados de capital', '27', '', '4');
INSERT INTO co_cuentas VALUES ('', '132', '2015', '13', 'Otras subvenciones, donaciones y legados', '28', '', '4');
INSERT INTO co_cuentas VALUES ('', '133', '2015', '13', 'Ajustes por valoraci?n en activos financieros disponibles para la venta', '29', '', '4');
INSERT INTO co_cuentas VALUES ('', '1340', '2015', '13', 'Cobertura de flujos de efectivo', '30', '', '4');
INSERT INTO co_cuentas VALUES ('', '1341', '2015', '13', 'Cobertura de una inversi?n neta en un negocio en el extranjero', '31', '', '4');
INSERT INTO co_cuentas VALUES ('', '135', '2015', '13', 'Diferencias de conversi', '32', 'DIVPOS', '4');
INSERT INTO co_cuentas VALUES ('', '136', '2015', '13', 'Ajustes por valoraci?n en activos no corrientes y grupos enajenables de elementos, mantenidos para la venta', '33', '', '4');
INSERT INTO co_cuentas VALUES ('', '1370', '2015', '13', 'Ingresos fiscales por diferencias permanentes a distribuir en varios ejercicios', '34', '', '4');
INSERT INTO co_cuentas VALUES ('', '1371', '2015', '13', 'Ingresos fiscales por deducciones y bonificaciones a distribuir en varios ejercicios', '35', '', '4');
INSERT INTO co_cuentas VALUES ('', '140', '2015', '14', 'Provisi?n por retribuciones a largo plazo al personal', '36', '', '5');
INSERT INTO co_cuentas VALUES ('', '141', '2015', '14', 'Provisi?n para impuestos', '37', '', '5');
INSERT INTO co_cuentas VALUES ('', '142', '2015', '14', 'Provisi?n para otras responsabilidades', '38', '', '5');
INSERT INTO co_cuentas VALUES ('', '143', '2015', '14', 'Provisi?n por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '39', '', '5');
INSERT INTO co_cuentas VALUES ('', '145', '2015', '14', 'Provisi?n para actuaciones medioambientales', '40', '', '5');
INSERT INTO co_cuentas VALUES ('', '146', '2015', '14', 'Provisi?n para reestructuraciones', '41', '', '5');
INSERT INTO co_cuentas VALUES ('', '147', '2015', '14', 'Provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '42', '', '5');
INSERT INTO co_cuentas VALUES ('', '150', '2015', '15', 'Acciones o participaciones a largo plazo consideradas como pasivos financieros', '43', '', '6');
INSERT INTO co_cuentas VALUES ('', '1533', '2015', '15', 'Desembolsos no exigidos, empresas del grupo', '44', '', '6');
INSERT INTO co_cuentas VALUES ('', '1534', '2015', '15', 'Desembolsos no exigidos, empresas asociadas', '45', '', '6');
INSERT INTO co_cuentas VALUES ('', '1535', '2015', '15', 'Desembolsos no exigidos, otras partes vinculadas', '46', '', '6');
INSERT INTO co_cuentas VALUES ('', '1536', '2015', '15', 'Otros desembolsos no exigidos', '47', '', '6');
INSERT INTO co_cuentas VALUES ('', '1543', '2015', '15', 'Aportaciones no dinerarias pendientes, empresas del grupo', '48', '', '6');
INSERT INTO co_cuentas VALUES ('', '1544', '2015', '15', 'Aportaciones no dinerarias pendientes, empresas asociadas', '49', '', '6');
INSERT INTO co_cuentas VALUES ('', '1545', '2015', '15', 'Aportaciones no dinerarias pendientes, otras partes vinculadas', '50', '', '6');
INSERT INTO co_cuentas VALUES ('', '1546', '2015', '15', 'Otras aportaciones no dinerarias pendientes', '51', '', '6');
INSERT INTO co_cuentas VALUES ('', '1603', '2015', '16', 'Deudas a largo plazo con entidades de cr?dito, empresas del grupo', '52', '', '7');
INSERT INTO co_cuentas VALUES ('', '1604', '2015', '16', 'Deudas a largo plazo con entidades de cr?dito, empresas asociadas', '53', '', '7');
INSERT INTO co_cuentas VALUES ('', '1605', '2015', '16', 'Deudas a largo plazo con otras entidades de cr?dito vinculadas', '54', '', '7');
INSERT INTO co_cuentas VALUES ('', '1613', '2015', '16', 'Proveedores de inmovilizado a largo plazo, empresas del grupo', '55', '', '7');
INSERT INTO co_cuentas VALUES ('', '1614', '2015', '16', 'Proveedores de inmovilizado a largo plazo, empresas asociadas', '56', '', '7');
INSERT INTO co_cuentas VALUES ('', '1615', '2015', '16', 'Proveedores de inmovilizado a largo plazo, otras partes vinculadas', '57', '', '7');
INSERT INTO co_cuentas VALUES ('', '1623', '2015', '16', 'Acreedores por arrendamiento financiero a largo plazo, empresas de grupo', '58', '', '7');
INSERT INTO co_cuentas VALUES ('', '1624', '2015', '16', 'Acreedores por arrendamiento financiero a largo plazo, empresas asociadas', '59', '', '7');
INSERT INTO co_cuentas VALUES ('', '1625', '2015', '16', 'Acreedores por arrendamiento financiero a largo plazo, otras partes vinculadas.', '60', '', '7');
INSERT INTO co_cuentas VALUES ('', '1633', '2015', '16', 'Otras deudas a largo plazo, empresas del grupo', '61', '', '7');
INSERT INTO co_cuentas VALUES ('', '1634', '2015', '16', 'Otras deudas a largo plazo, empresas asociadas', '62', '', '7');
INSERT INTO co_cuentas VALUES ('', '1635', '2015', '16', 'Otras deudas a largo plazo, con otras partes vinculadas', '63', '', '7');
INSERT INTO co_cuentas VALUES ('', '170', '2015', '17', 'Deudas a largo plazo con entidades de cr?dito', '64', '', '8');
INSERT INTO co_cuentas VALUES ('', '171', '2015', '17', 'Deudas a largo plazo', '65', '', '8');
INSERT INTO co_cuentas VALUES ('', '172', '2015', '17', 'Deudas a largo plazo transformables en subvenciones, donaciones y legados', '66', '', '8');
INSERT INTO co_cuentas VALUES ('', '173', '2015', '17', 'Proveedores de inmovilizado a largo plazo', '67', '', '8');
INSERT INTO co_cuentas VALUES ('', '174', '2015', '17', 'Acreedores por arrendamiento financiero a largo plazo', '68', '', '8');
INSERT INTO co_cuentas VALUES ('', '175', '2015', '17', 'Efectos a pagar a largo plazo', '69', '', '8');
INSERT INTO co_cuentas VALUES ('', '1765', '2015', '17', 'Pasivos por derivados financieros a largo plazo, cartera de negociaci', '70', '', '8');
INSERT INTO co_cuentas VALUES ('', '1768', '2015', '17', 'Pasivos por derivados financieros a largo plazo, instrumentos de cobertura', '71', '', '8');
INSERT INTO co_cuentas VALUES ('', '177', '2015', '17', 'Obligaciones y bonos', '72', '', '8');
INSERT INTO co_cuentas VALUES ('', '178', '2015', '17', 'Obligaciones y bonos convertibles', '73', '', '8');
INSERT INTO co_cuentas VALUES ('', '179', '2015', '17', 'Deudas representadas en otros valores negociables', '74', '', '8');
INSERT INTO co_cuentas VALUES ('', '180', '2015', '18', 'Fianzas recibidas a largo plazo', '75', '', '9');
INSERT INTO co_cuentas VALUES ('', '181', '2015', '18', 'Anticipos recibidos por ventas o prestaciones de servicios a largo plazo', '76', '', '9');
INSERT INTO co_cuentas VALUES ('', '185', '2015', '18', 'Dep?sitos recibidos a largo plazo', '77', '', '9');
INSERT INTO co_cuentas VALUES ('', '189', '2015', '18', 'Garant?as financieras a largo plazo', '78', '', '9');
INSERT INTO co_cuentas VALUES ('', '190', '2015', '19', 'Acciones o participaciones emitidas', '79', '', '10');
INSERT INTO co_cuentas VALUES ('', '192', '2015', '19', 'Suscriptores de acciones', '80', '', '10');
INSERT INTO co_cuentas VALUES ('', '194', '2015', '19', 'Capital emitido pendiente de inscripci', '81', '', '10');
INSERT INTO co_cuentas VALUES ('', '195', '2015', '19', 'Acciones o participaciones emitidas consideradas como pasivos financieros', '82', '', '10');
INSERT INTO co_cuentas VALUES ('', '197', '2015', '19', 'Suscriptores de acciones consideradas como pasivos financieros', '83', '', '10');
INSERT INTO co_cuentas VALUES ('', '199', '2015', '19', 'Acciones o participaciones emitidas consideradas como pasivos financieros pendientes de inscripci', '84', '', '10');
INSERT INTO co_cuentas VALUES ('', '200', '2015', '20', 'Investigaci', '85', '', '11');
INSERT INTO co_cuentas VALUES ('', '201', '2015', '20', 'Desarrollo', '86', '', '11');
INSERT INTO co_cuentas VALUES ('', '202', '2015', '20', 'Concesiones administrativas', '87', '', '11');
INSERT INTO co_cuentas VALUES ('', '203', '2015', '20', 'Propiedad industrial', '88', '', '11');
INSERT INTO co_cuentas VALUES ('', '204', '2015', '20', 'Fondo de comercio', '89', '', '11');
INSERT INTO co_cuentas VALUES ('', '205', '2015', '20', 'Derechos de traspaso', '90', '', '11');
INSERT INTO co_cuentas VALUES ('', '206', '2015', '20', 'Aplicaciones inform?ticas', '91', '', '11');
INSERT INTO co_cuentas VALUES ('', '209', '2015', '20', 'Anticipos para inmovilizaciones intangibles', '92', '', '11');
INSERT INTO co_cuentas VALUES ('', '210', '2015', '21', 'Terrenos y bienes naturales', '93', '', '12');
INSERT INTO co_cuentas VALUES ('', '211', '2015', '21', 'Construcciones', '94', '', '12');
INSERT INTO co_cuentas VALUES ('', '212', '2015', '21', 'Instalaciones t?cnicas', '95', '', '12');
INSERT INTO co_cuentas VALUES ('', '213', '2015', '21', 'Maquinaria', '96', '', '12');
INSERT INTO co_cuentas VALUES ('', '214', '2015', '21', 'Utillaje', '97', '', '12');
INSERT INTO co_cuentas VALUES ('', '215', '2015', '21', 'Otras instalaciones', '98', '', '12');
INSERT INTO co_cuentas VALUES ('', '216', '2015', '21', 'Mobiliario', '99', '', '12');
INSERT INTO co_cuentas VALUES ('', '217', '2015', '21', 'Equipos para procesos de informaci', '100', '', '12');
INSERT INTO co_cuentas VALUES ('', '218', '2015', '21', 'Elementos de transporte', '101', '', '12');
INSERT INTO co_cuentas VALUES ('', '219', '2015', '21', 'Otro inmovilizado material', '102', '', '12');
INSERT INTO co_cuentas VALUES ('', '220', '2015', '22', 'Inversiones en terrenos y bienes naturales', '103', '', '13');
INSERT INTO co_cuentas VALUES ('', '221', '2015', '22', 'Inversiones en construcciones', '104', '', '13');
INSERT INTO co_cuentas VALUES ('', '230', '2015', '23', 'Adaptaci?n de terrenos y bienes naturales', '105', '', '14');
INSERT INTO co_cuentas VALUES ('', '231', '2015', '23', 'Construcciones en curso', '106', '', '14');
INSERT INTO co_cuentas VALUES ('', '232', '2015', '23', 'Instalaciones t?cnicas en montaje', '107', '', '14');
INSERT INTO co_cuentas VALUES ('', '233', '2015', '23', 'Maquinaria en montaje', '108', '', '14');
INSERT INTO co_cuentas VALUES ('', '237', '2015', '23', 'Equipos para procesos de informaci?n en montaje', '109', '', '14');
INSERT INTO co_cuentas VALUES ('', '239', '2015', '23', 'Anticipos para inmovilizaciones materiales', '110', '', '14');
INSERT INTO co_cuentas VALUES ('', '2403', '2015', '24', 'Participaciones a largo plazo en empresas del grupo', '111', '', '15');
INSERT INTO co_cuentas VALUES ('', '2404', '2015', '24', 'Participaciones a largo plazo en empresas asociadas', '112', '', '15');
INSERT INTO co_cuentas VALUES ('', '2405', '2015', '24', 'Participaciones a largo plazo en otras partes vinculadas', '113', '', '15');
INSERT INTO co_cuentas VALUES ('', '2413', '2015', '24', 'Valores representativos de deuda a largo plazo de empresas del grupo', '114', '', '15');
INSERT INTO co_cuentas VALUES ('', '2414', '2015', '24', 'Valores representativos de deuda a largo plazo de empresas asociadas', '115', '', '15');
INSERT INTO co_cuentas VALUES ('', '2415', '2015', '24', 'Valores representativos de deuda a largo plazo de otras partes vinculadas', '116', '', '15');
INSERT INTO co_cuentas VALUES ('', '2423', '2015', '24', 'Cr?ditos a largo plazo a empresas del grupo', '117', '', '15');
INSERT INTO co_cuentas VALUES ('', '2424', '2015', '24', 'Cr?ditos a largo plazo a empresas asociadas', '118', '', '15');
INSERT INTO co_cuentas VALUES ('', '2425', '2015', '24', 'Cr?ditos a largo plazo a otras partes vinculadas', '119', '', '15');
INSERT INTO co_cuentas VALUES ('', '2493', '2015', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas del grupo.', '120', '', '15');
INSERT INTO co_cuentas VALUES ('', '2494', '2015', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas asociadas.', '121', '', '15');
INSERT INTO co_cuentas VALUES ('', '2495', '2015', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en otras partes vinculadas', '122', '', '15');
INSERT INTO co_cuentas VALUES ('', '250', '2015', '25', 'Inversiones financieras a largo plazo en instrumentos de patrimonio', '123', '', '16');
INSERT INTO co_cuentas VALUES ('', '251', '2015', '25', 'Valores representativos de deuda a largo plazo', '124', '', '16');
INSERT INTO co_cuentas VALUES ('', '252', '2015', '25', 'Cr?ditos a largo plazo', '125', '', '16');
INSERT INTO co_cuentas VALUES ('', '253', '2015', '25', 'Cr?ditos a largo plazo por enajenaci?n de inmovilizado', '126', '', '16');
INSERT INTO co_cuentas VALUES ('', '254', '2015', '25', 'Cr?ditos a largo plazo al personal', '127', '', '16');
INSERT INTO co_cuentas VALUES ('', '2550', '2015', '25', 'Activos por derivados financieros a largo plazo, cartera de negociaci', '128', '', '16');
INSERT INTO co_cuentas VALUES ('', '2553', '2015', '25', 'Activos por derivados financieros a largo plazo, instrumentos de cobertura', '129', '', '16');
INSERT INTO co_cuentas VALUES ('', '257', '2015', '25', 'Derechos de reembolso derivados de contratos de seguro relativos a retribuciones a largo plazo al personal', '130', '', '16');
INSERT INTO co_cuentas VALUES ('', '258', '2015', '25', 'Imposiciones a largo plazo', '131', '', '16');
INSERT INTO co_cuentas VALUES ('', '259', '2015', '25', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a largo plazo', '132', '', '16');
INSERT INTO co_cuentas VALUES ('', '260', '2015', '26', 'Fianzas constituidas a largo plazo', '133', '', '17');
INSERT INTO co_cuentas VALUES ('', '265', '2015', '26', 'Dep?sitos constituidos a largo plazo', '134', '', '17');
INSERT INTO co_cuentas VALUES ('', '2800', '2015', '28', 'Amortizaci?n acumulada de investigaci', '135', '', '18');
INSERT INTO co_cuentas VALUES ('', '2801', '2015', '28', 'Amortizaci?n acumulada de desarrollo', '136', '', '18');
INSERT INTO co_cuentas VALUES ('', '2802', '2015', '28', 'Amortizaci?n acumulada de concesiones administrativas', '137', '', '18');
INSERT INTO co_cuentas VALUES ('', '2803', '2015', '28', 'Amortizaci?n acumulada de propiedad industrial', '138', '', '18');
INSERT INTO co_cuentas VALUES ('', '2805', '2015', '28', 'Amortizaci?n acumulada de derechos de traspaso', '139', '', '18');
INSERT INTO co_cuentas VALUES ('', '2806', '2015', '28', 'Amortizaci?n acumulada de aplicaciones inform?ticas', '140', '', '18');
INSERT INTO co_cuentas VALUES ('', '2811', '2015', '28', 'Amortizaci?n acumulada de construcciones', '141', '', '18');
INSERT INTO co_cuentas VALUES ('', '2812', '2015', '28', 'Amortizaci?n acumulada de instalaciones t?cnicas', '142', '', '18');
INSERT INTO co_cuentas VALUES ('', '2813', '2015', '28', 'Amortizaci?n acumulada de maquinaria', '143', '', '18');
INSERT INTO co_cuentas VALUES ('', '2814', '2015', '28', 'Amortizaci?n acumulada de utillaje', '144', '', '18');
INSERT INTO co_cuentas VALUES ('', '2815', '2015', '28', 'Amortizaci?n acumulada de otras instalaciones', '145', '', '18');
INSERT INTO co_cuentas VALUES ('', '2816', '2015', '28', 'Amortizaci?n acumulada de mobiliario', '146', '', '18');
INSERT INTO co_cuentas VALUES ('', '2817', '2015', '28', 'Amortizaci?n acumulada de equipos para procesos de informaci', '147', '', '18');
INSERT INTO co_cuentas VALUES ('', '2818', '2015', '28', 'Amortizaci?n acumulada de elementos de transporte', '148', '', '18');
INSERT INTO co_cuentas VALUES ('', '2819', '2015', '28', 'Amortizaci?n acumulada de otro inmovilizado material', '149', '', '18');
INSERT INTO co_cuentas VALUES ('', '282', '2015', '28', 'Amortizaci?n acumulada de las inversiones inmobiliarias', '150', '', '18');
INSERT INTO co_cuentas VALUES ('', '2900', '2015', '29', 'Deterioro de valor de investigaci', '151', '', '19');
INSERT INTO co_cuentas VALUES ('', '2901', '2015', '29', 'Deterioro del valor de desarrollo', '152', '', '19');
INSERT INTO co_cuentas VALUES ('', '2902', '2015', '29', 'Deterioro de valor de concesiones administrativas', '153', '', '19');
INSERT INTO co_cuentas VALUES ('', '2903', '2015', '29', 'Deterioro de valor de propiedad industrial', '154', '', '19');
INSERT INTO co_cuentas VALUES ('', '2905', '2015', '29', 'Deterioro de valor de derechos de traspaso', '155', '', '19');
INSERT INTO co_cuentas VALUES ('', '2906', '2015', '29', 'Deterioro de valor de aplicaciones inform?ticas', '156', '', '19');
INSERT INTO co_cuentas VALUES ('', '2910', '2015', '29', 'Deterioro de valor de terrenos y bienes naturales', '157', '', '19');
INSERT INTO co_cuentas VALUES ('', '2911', '2015', '29', 'Deterioro de valor de construcciones', '158', '', '19');
INSERT INTO co_cuentas VALUES ('', '2912', '2015', '29', 'Deterioro de valor de instalaciones t?cnicas', '159', '', '19');
INSERT INTO co_cuentas VALUES ('', '2913', '2015', '29', 'Deterioro de valor de maquinaria', '160', '', '19');
INSERT INTO co_cuentas VALUES ('', '2914', '2015', '29', 'Deterioro de valor de utillaje', '161', '', '19');
INSERT INTO co_cuentas VALUES ('', '2915', '2015', '29', 'Deterioro de valor de otras instalaciones', '162', '', '19');
INSERT INTO co_cuentas VALUES ('', '2916', '2015', '29', 'Deterioro de valor de mobiliario', '163', '', '19');
INSERT INTO co_cuentas VALUES ('', '2917', '2015', '29', 'Deterioro de valor de equipos para procesos de informaci', '164', '', '19');
INSERT INTO co_cuentas VALUES ('', '2918', '2015', '29', 'Deterioro de valor de elementos de transporte', '165', '', '19');
INSERT INTO co_cuentas VALUES ('', '2919', '2015', '29', 'Deterioro de valor de otro inmovilizado material', '166', '', '19');
INSERT INTO co_cuentas VALUES ('', '2920', '2015', '29', 'Deterioro de valor de los terrenos y bienes naturales', '167', '', '19');
INSERT INTO co_cuentas VALUES ('', '2921', '2015', '29', 'Deterioro de valor de construcciones', '168', '', '19');
INSERT INTO co_cuentas VALUES ('', '2933', '2015', '29', 'Deterioro de valor de participaciones a largo plazo en empresas del grupo', '169', '', '19');
INSERT INTO co_cuentas VALUES ('', '2934', '2015', '29', 'Deterioro de valor de participaciones a largo plazo en empresas asociadas', '170', '', '19');
INSERT INTO co_cuentas VALUES ('', '2943', '2015', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas del grupo', '171', '', '19');
INSERT INTO co_cuentas VALUES ('', '2944', '2015', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas asociadas', '172', '', '19');
INSERT INTO co_cuentas VALUES ('', '2945', '2015', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de otras partes vinculadas', '173', '', '19');
INSERT INTO co_cuentas VALUES ('', '2953', '2015', '29', 'Deterioro de valor de cr?ditos a largo plazo a empresas del grupo', '174', '', '19');
INSERT INTO co_cuentas VALUES ('', '2954', '2015', '29', 'Deterioro de valor de cr?ditos a largo plazo a empresas asociadas', '175', '', '19');
INSERT INTO co_cuentas VALUES ('', '2955', '2015', '29', 'Deterioro de valor de cr?ditos a largo plazo a otras partes vinculadas', '176', '', '19');
INSERT INTO co_cuentas VALUES ('', '297', '2015', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo', '177', '', '19');
INSERT INTO co_cuentas VALUES ('', '298', '2015', '29', 'Deterioro de valor de cr?ditos a largo plazo', '178', '', '19');
INSERT INTO co_cuentas VALUES ('', '300', '2015', '30', 'Mercader?as a', '179', '', '20');
INSERT INTO co_cuentas VALUES ('', '301', '2015', '30', 'Mercader?as b', '180', '', '20');
INSERT INTO co_cuentas VALUES ('', '310', '2015', '31', 'Materias primas a', '181', '', '21');
INSERT INTO co_cuentas VALUES ('', '311', '2015', '31', 'Materias primas b', '182', '', '21');
INSERT INTO co_cuentas VALUES ('', '320', '2015', '32', 'Elementos y conjuntos incorporables', '183', '', '22');
INSERT INTO co_cuentas VALUES ('', '321', '2015', '32', 'Combustibles', '184', '', '22');
INSERT INTO co_cuentas VALUES ('', '322', '2015', '32', 'Repuestos', '185', '', '22');
INSERT INTO co_cuentas VALUES ('', '325', '2015', '32', 'Materiales diversos', '186', '', '22');
INSERT INTO co_cuentas VALUES ('', '326', '2015', '32', 'Embalajes', '187', '', '22');
INSERT INTO co_cuentas VALUES ('', '327', '2015', '32', 'Envases', '188', '', '22');
INSERT INTO co_cuentas VALUES ('', '328', '2015', '32', 'Material de oficina', '189', '', '22');
INSERT INTO co_cuentas VALUES ('', '330', '2015', '33', 'Productos en curso a', '190', '', '23');
INSERT INTO co_cuentas VALUES ('', '331', '2015', '33', 'Productos en curso b', '191', '', '23');
INSERT INTO co_cuentas VALUES ('', '340', '2015', '34', 'Productos semiterminados a', '192', '', '24');
INSERT INTO co_cuentas VALUES ('', '341', '2015', '34', 'Productos semiterminados b', '193', '', '24');
INSERT INTO co_cuentas VALUES ('', '350', '2015', '35', 'Productos terminados a', '194', '', '25');
INSERT INTO co_cuentas VALUES ('', '351', '2015', '35', 'Productos terminados b', '195', '', '25');
INSERT INTO co_cuentas VALUES ('', '360', '2015', '36', 'Subproductos a', '196', '', '26');
INSERT INTO co_cuentas VALUES ('', '361', '2015', '36', 'Subproductos b', '197', '', '26');
INSERT INTO co_cuentas VALUES ('', '365', '2015', '36', 'Residuos a', '198', '', '26');
INSERT INTO co_cuentas VALUES ('', '366', '2015', '36', 'Residuos b', '199', '', '26');
INSERT INTO co_cuentas VALUES ('', '368', '2015', '36', 'Materiales recuperados a', '200', '', '26');
INSERT INTO co_cuentas VALUES ('', '369', '2015', '36', 'Materiales recuperados b', '201', '', '26');
INSERT INTO co_cuentas VALUES ('', '390', '2015', '39', 'Deterioro de valor de las mercader?as', '202', '', '27');
INSERT INTO co_cuentas VALUES ('', '391', '2015', '39', 'Deterioro de valor de las materias primas', '203', '', '27');
INSERT INTO co_cuentas VALUES ('', '392', '2015', '39', 'Deterioro de valor de otros aprovisionamientos', '204', '', '27');
INSERT INTO co_cuentas VALUES ('', '393', '2015', '39', 'Deterioro de valor de los productos en curso', '205', '', '27');
INSERT INTO co_cuentas VALUES ('', '394', '2015', '39', 'Deterioro de valor de los productos semiterminados', '206', '', '27');
INSERT INTO co_cuentas VALUES ('', '395', '2015', '39', 'Deterioro de valor de los productos terminados', '207', '', '27');
INSERT INTO co_cuentas VALUES ('', '396', '2015', '39', 'Deterioro de valor de los subproductos, residuos y materiales recuperados', '208', '', '27');
INSERT INTO co_cuentas VALUES ('', '400', '2015', '40', 'Proveedores', '209', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4000', '2015', '40', 'Proveedores (euros)', '210', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4004', '2015', '40', 'Proveedores (moneda extranjera)', '211', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4009', '2015', '40', 'Proveedores, facturas pendientes de recibir o de formalizar', '212', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '401', '2015', '40', 'Proveedores, efectos comerciales a pagar', '213', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4030', '2015', '40', 'Proveedores, empresas del grupo (euros)', '214', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4031', '2015', '40', 'Efectos comerciales a pagar, empresas del grupo', '215', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4034', '2015', '40', 'Proveedores, empresas del grupo (moneda extranjera)', '216', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4036', '2015', '40', 'Envases y embalajes a devolver a proveedores, empresas del grupo', '217', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '4039', '2015', '40', 'Proveedores, empresas del grupo, facturas pendientes de recibir o de formalizar', '218', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '404', '2015', '40', 'Proveedores, empresas asociadas', '219', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '405', '2015', '40', 'Proveedores, otras partes vinculadas', '220', '', '28');
INSERT INTO co_cuentas VALUES ('', '406', '2015', '40', 'Envases y embalajes a devolver a proveedores', '221', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '407', '2015', '40', 'Anticipos a proveedores', '222', 'PROVEE', '28');
INSERT INTO co_cuentas VALUES ('', '410', '2015', '41', 'Acreedores', '223', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '4100', '2015', '41', 'Acreedores por prestaciones de servicios (euros)', '224', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '4104', '2015', '41', 'Acreedores por prestaciones de servicios, (moneda extranjera)', '225', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '4109', '2015', '41', 'Acreedores por prestaciones de servicios, facturas pendientes de recibir o de formalizar', '226', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '411', '2015', '41', 'Acreedores, efectos comerciales a pagar', '227', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '419', '2015', '41', 'Acreedores por operaciones en com?n', '228', 'ACREED', '29');
INSERT INTO co_cuentas VALUES ('', '430', '2015', '43', 'Clientes', '229', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4300', '2015', '43', 'Clientes (euros)', '230', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4304', '2015', '43', 'Clientes (moneda extranjera)', '231', '', '30');
INSERT INTO co_cuentas VALUES ('', '4309', '2015', '43', 'Clientes, facturas pendientes de formalizar', '232', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4310', '2015', '43', 'Efectos comerciales en cartera', '233', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4311', '2015', '43', 'Efectos comerciales descontados', '234', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4312', '2015', '43', 'Efectos comerciales en gesti?n de cobro', '235', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4315', '2015', '43', 'Efectos comerciales impagados', '236', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '432', '2015', '43', 'Clientes, operaciones de factoring', '237', '', '30');
INSERT INTO co_cuentas VALUES ('', '4330', '2015', '43', 'Clientes empresas del grupo (euros)', '238', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4331', '2015', '43', 'Efectos comerciales a cobrar, empresas del grupo', '239', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4332', '2015', '43', 'Clientes empresas del grupo, operaciones de factoring', '240', '', '30');
INSERT INTO co_cuentas VALUES ('', '4334', '2015', '43', 'Clientes empresas del grupo (moneda extranjera)', '241', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4336', '2015', '43', 'Clientes empresas del grupo de dudoso cobro', '242', '', '30');
INSERT INTO co_cuentas VALUES ('', '4337', '2015', '43', 'Envases y embalajes a devolver a clientes, empresas del grupo', '243', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4339', '2015', '43', 'Clientes empresas del grupo, facturas pendientes de formalizar', '244', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '434', '2015', '43', 'Clientes, empresas asociadas', '245', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '435', '2015', '43', 'Clientes, otras partes vinculadas', '246', '', '30');
INSERT INTO co_cuentas VALUES ('', '436', '2015', '43', 'Clientes de dudoso cobro', '247', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '437', '2015', '43', 'Envases y embalajes a devolver por clientes', '248', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '438', '2015', '43', 'Anticipos de clientes', '249', 'CLIENT', '30');
INSERT INTO co_cuentas VALUES ('', '4400', '2015', '44', 'Deudores (euros)', '250', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4404', '2015', '44', 'Deudores (moneda extranjera)', '251', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4409', '2015', '44', 'Deudores, facturas pendientes de formalizar', '252', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4410', '2015', '44', 'Deudores, efectos comerciales en cartera', '253', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4411', '2015', '44', 'Deudores, efectos comerciales descontados', '254', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4412', '2015', '44', 'Deudores, efectos comerciales en gesti?n de cobro', '255', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '4415', '2015', '44', 'Deudores, efectos comerciales impagados', '256', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '446', '2015', '44', 'Deudores de dudoso cobro', '257', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '449', '2015', '44', 'Deudores por operaciones en com?n', '258', 'CLIENT', '31');
INSERT INTO co_cuentas VALUES ('', '460', '2015', '46', 'Anticipos de remuneraciones', '259', '', '32');
INSERT INTO co_cuentas VALUES ('', '465', '2015', '46', 'Remuneraciones pendientes de pago', '260', '', '32');
INSERT INTO co_cuentas VALUES ('', '466', '2015', '46', 'Remuneraciones mediante sistemas de aportaci?n definida pendientes de pago', '261', '', '32');
INSERT INTO co_cuentas VALUES ('', '4700', '2015', '47', 'Hacienda p?blica, deudora por iva', '262', 'IVADEU', '33');
INSERT INTO co_cuentas VALUES ('', '4708', '2015', '47', 'Hacienda p?blica, deudora por subvenciones concedidas', '263', '', '33');
INSERT INTO co_cuentas VALUES ('', '4709', '2015', '47', 'Hacienda p?blica, deudora por devoluci?n de impuestos', '264', '', '33');
INSERT INTO co_cuentas VALUES ('', '471', '2015', '47', 'Organismos de la seguridad social, deudores', '265', '', '33');
INSERT INTO co_cuentas VALUES ('', '472', '2015', '47', 'Hacienda p?blica, iva soportado', '266', 'IVASOP', '33');
INSERT INTO co_cuentas VALUES ('', '473', '2015', '47', 'Hacienda p?blica, retenciones y pagos a cuenta', '267', 'IRPF', '33');
INSERT INTO co_cuentas VALUES ('', '4740', '2015', '47', 'Activos por diferencias temporarias deducibles', '268', '', '33');
INSERT INTO co_cuentas VALUES ('', '4742', '2015', '47', 'Derechos por deducciones y bonificaciones pendientes de aplicar', '269', '', '33');
INSERT INTO co_cuentas VALUES ('', '4745', '2015', '47', 'Cr?dito por p?rdidas a compensar del ejercicio', '270', '', '33');
INSERT INTO co_cuentas VALUES ('', '4750', '2015', '47', 'Hacienda p?blica, acreedora por iva', '271', 'IVAACR', '33');
INSERT INTO co_cuentas VALUES ('', '4751', '2015', '47', 'Hacienda p?blica, acreedora por retenciones practicadas', '272', 'IRPFPR', '33');
INSERT INTO co_cuentas VALUES ('', '4752', '2015', '47', 'Hacienda p?blica, acreedora por impuesto sobre sociedades', '273', '', '33');
INSERT INTO co_cuentas VALUES ('', '4758', '2015', '47', 'Hacienda p?blica, acreedora por subvenciones a reintegrar', '274', '', '33');
INSERT INTO co_cuentas VALUES ('', '476', '2015', '47', 'Organismos de la seguridad social, acreedores', '275', '', '33');
INSERT INTO co_cuentas VALUES ('', '477', '2015', '47', 'Hacienda p?blica, iva repercutido', '276', 'IVAREP', '33');
INSERT INTO co_cuentas VALUES ('', '479', '2015', '47', 'Pasivos por diferencias temporarias imponibles', '277', '', '33');
INSERT INTO co_cuentas VALUES ('', '480', '2015', '48', 'Gastos anticipados', '278', '', '34');
INSERT INTO co_cuentas VALUES ('', '485', '2015', '48', 'Ingresos anticipados', '279', '', '34');
INSERT INTO co_cuentas VALUES ('', '490', '2015', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales', '280', '', '35');
INSERT INTO co_cuentas VALUES ('', '4933', '2015', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas del grupo', '281', '', '35');
INSERT INTO co_cuentas VALUES ('', '4934', '2015', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas asociadas', '282', '', '35');
INSERT INTO co_cuentas VALUES ('', '4935', '2015', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con otras partes vinculadas', '283', '', '35');
INSERT INTO co_cuentas VALUES ('', '4994', '2015', '49', 'Provisi?n por contratos onerosos', '284', '', '35');
INSERT INTO co_cuentas VALUES ('', '4999', '2015', '49', 'Provisi?n para otras operaciones comerciales', '285', '', '35');
INSERT INTO co_cuentas VALUES ('', '500', '2015', '50', 'Obligaciones y bonos a corto plazo', '286', '', '36');
INSERT INTO co_cuentas VALUES ('', '501', '2015', '50', 'Obligaciones y bonos convertibles a corto plazo', '287', '', '36');
INSERT INTO co_cuentas VALUES ('', '502', '2015', '50', 'Acciones o participaciones a corto plazo consideradas como pasivos financieros', '288', '', '36');
INSERT INTO co_cuentas VALUES ('', '505', '2015', '50', 'Deudas representadas en otros valores negociables a corto plazo', '289', '', '36');
INSERT INTO co_cuentas VALUES ('', '506', '2015', '50', 'Intereses a corto plazo de empr?stitos y otras emisiones an?logas', '290', '', '36');
INSERT INTO co_cuentas VALUES ('', '507', '2015', '50', 'Dividendos de acciones o participaciones consideradas como pasivos financieros', '291', '', '36');
INSERT INTO co_cuentas VALUES ('', '5090', '2015', '50', 'Obligaciones y bonos amortizados', '292', '', '36');
INSERT INTO co_cuentas VALUES ('', '5091', '2015', '50', 'Obligaciones y bonos convertibles amortizados', '293', '', '36');
INSERT INTO co_cuentas VALUES ('', '5095', '2015', '50', 'Otros valores negociables amortizados', '294', '', '36');
INSERT INTO co_cuentas VALUES ('', '5103', '2015', '51', 'Deudas a corto plazo con entidades de cr?dito, empresas del grupo', '295', '', '37');
INSERT INTO co_cuentas VALUES ('', '5104', '2015', '51', 'Deudas a corto plazo con entidades de cr?dito, empresas asociadas', '296', '', '37');
INSERT INTO co_cuentas VALUES ('', '5105', '2015', '51', 'Deudas a corto plazo con otras entidades de cr?dito vinculadas', '297', '', '37');
INSERT INTO co_cuentas VALUES ('', '5113', '2015', '51', 'Proveedores de inmovilizado a corto plazo, empresas del grupo', '298', '', '37');
INSERT INTO co_cuentas VALUES ('', '5114', '2015', '51', 'Proveedores de inmovilizado a corto plazo, empresas asociadas', '299', '', '37');
INSERT INTO co_cuentas VALUES ('', '5115', '2015', '51', 'Proveedores de inmovilizado a corto plazo, otras partes vinculadas', '300', '', '37');
INSERT INTO co_cuentas VALUES ('', '5123', '2015', '51', 'Acreedores por arrendamiento financiero a corto plazo, empresas del grupo', '301', '', '37');
INSERT INTO co_cuentas VALUES ('', '5124', '2015', '51', 'Acreedores por arrendamiento financiero a corto plazo, empresas asociadas', '302', '', '37');
INSERT INTO co_cuentas VALUES ('', '5125', '2015', '51', 'Acreedores por arrendamiento financiero a corto plazo, otras partes vinculadas', '303', '', '37');
INSERT INTO co_cuentas VALUES ('', '5133', '2015', '51', 'Otras deudas a corto plazo con empresas del grupo', '304', '', '37');
INSERT INTO co_cuentas VALUES ('', '5134', '2015', '51', 'Otras deudas a corto plazo con empresas asociadas', '305', '', '37');
INSERT INTO co_cuentas VALUES ('', '5135', '2015', '51', 'Otras deudas a corto plazo con otras partes vinculadas', '306', '', '37');
INSERT INTO co_cuentas VALUES ('', '5143', '2015', '51', 'Intereses a corto plazo de deudas, empresas del grupo', '307', '', '37');
INSERT INTO co_cuentas VALUES ('', '5144', '2015', '51', 'Intereses a corto plazo de deudas, empresas asociadas', '308', '', '37');
INSERT INTO co_cuentas VALUES ('', '5145', '2015', '51', 'Intereses a corto plazo de deudas, otras partes vinculadas', '309', '', '37');
INSERT INTO co_cuentas VALUES ('', '5200', '2015', '52', 'Pr?stamos a corto plazo de entidades de cr?dito', '310', '', '38');
INSERT INTO co_cuentas VALUES ('', '5201', '2015', '52', 'Deudas a corto plazo por cr?dito dispuesto', '311', '', '38');
INSERT INTO co_cuentas VALUES ('', '5208', '2015', '52', 'Deudas por efectos descontados', '312', '', '38');
INSERT INTO co_cuentas VALUES ('', '5209', '2015', '52', 'Deudas por operaciones de factoring', '313', '', '38');
INSERT INTO co_cuentas VALUES ('', '521', '2015', '52', 'Deudas a corto plazo', '314', '', '38');
INSERT INTO co_cuentas VALUES ('', '522', '2015', '52', 'Deudas a corto plazo transformables en subvenciones, donaciones y legados', '315', '', '38');
INSERT INTO co_cuentas VALUES ('', '523', '2015', '52', 'Proveedores de inmovilizado a corto plazo', '316', '', '38');
INSERT INTO co_cuentas VALUES ('', '524', '2015', '52', 'Acreedores por arrendamiento financiero a corto plazo', '317', '', '38');
INSERT INTO co_cuentas VALUES ('', '525', '2015', '52', 'Efectos a pagar a corto plazo', '318', '', '38');
INSERT INTO co_cuentas VALUES ('', '526', '2015', '52', 'Dividendo activo a pagar', '319', '', '38');
INSERT INTO co_cuentas VALUES ('', '527', '2015', '52', 'Intereses a corto plazo de deudas con entidades de cr?dito', '320', '', '38');
INSERT INTO co_cuentas VALUES ('', '528', '2015', '52', 'Intereses a corto plazo de deudas', '321', '', '38');
INSERT INTO co_cuentas VALUES ('', '5290', '2015', '52', 'Provisi?n a corto plazo por retribuciones al personal', '322', '', '38');
INSERT INTO co_cuentas VALUES ('', '5291', '2015', '52', 'Provisi?n a corto plazo para impuestos', '323', '', '38');
INSERT INTO co_cuentas VALUES ('', '5292', '2015', '52', 'Provisi?n a corto plazo para otras responsabilidades', '324', '', '38');
INSERT INTO co_cuentas VALUES ('', '5293', '2015', '52', 'Provisi?n a corto plazo por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '325', '', '38');
INSERT INTO co_cuentas VALUES ('', '5295', '2015', '52', 'Provisi?n a corto plazo para actuaciones medioambientales', '326', '', '38');
INSERT INTO co_cuentas VALUES ('', '5296', '2015', '52', 'Provisi?n a corto plazo para reestructuraciones', '327', '', '38');
INSERT INTO co_cuentas VALUES ('', '5297', '2015', '52', 'Provisi?n a corto plazo por transacciones con pagos basados en instrumentos de patrimonio', '328', '', '38');
INSERT INTO co_cuentas VALUES ('', '5303', '2015', '53', 'Participaciones a corto plazo, en empresas del grupo', '329', '', '39');
INSERT INTO co_cuentas VALUES ('', '5304', '2015', '53', 'Participaciones a corto plazo, en empresas asociadas', '330', '', '39');
INSERT INTO co_cuentas VALUES ('', '5305', '2015', '53', 'Participaciones a corto plazo, en otras partes vinculadas', '331', '', '39');
INSERT INTO co_cuentas VALUES ('', '5313', '2015', '53', 'Valores representativos de deuda a corto plazo de empresas del grupo', '332', '', '39');
INSERT INTO co_cuentas VALUES ('', '5314', '2015', '53', 'Valores representativos de deuda a corto plazo de empresas asociadas', '333', '', '39');
INSERT INTO co_cuentas VALUES ('', '5315', '2015', '53', 'Valores representativos de deuda a corto plazo de otras partes vinculadas', '334', '', '39');
INSERT INTO co_cuentas VALUES ('', '5323', '2015', '53', 'Cr?ditos a corto plazo a empresas del grupo', '335', '', '39');
INSERT INTO co_cuentas VALUES ('', '5324', '2015', '53', 'Cr?ditos a corto plazo a empresas asociadas', '336', '', '39');
INSERT INTO co_cuentas VALUES ('', '5325', '2015', '53', 'Cr?ditos a corto plazo a otras partes vinculadas', '337', '', '39');
INSERT INTO co_cuentas VALUES ('', '5333', '2015', '53', 'Intereses a corto plazo de valores representativos de deuda de empresas del grupo', '338', '', '39');
INSERT INTO co_cuentas VALUES ('', '5334', '2015', '53', 'Intereses a corto plazo de valores representativos de deuda de empresas asociadas', '339', '', '39');
INSERT INTO co_cuentas VALUES ('', '5335', '2015', '53', 'Intereses a corto plazo de valores representativos de deuda de otras partes vinculadas', '340', '', '39');
INSERT INTO co_cuentas VALUES ('', '5343', '2015', '53', 'Intereses a corto plazo de cr?ditos a empresas del grupo', '341', '', '39');
INSERT INTO co_cuentas VALUES ('', '5344', '2015', '53', 'Intereses a corto plazo de cr?ditos a empresas asociadas', '342', '', '39');
INSERT INTO co_cuentas VALUES ('', '5345', '2015', '53', 'Intereses a corto plazo de cr?ditos a otras partes vinculadas', '343', '', '39');
INSERT INTO co_cuentas VALUES ('', '5353', '2015', '53', 'Dividendo a cobrar de empresas de grupo', '344', '', '39');
INSERT INTO co_cuentas VALUES ('', '5354', '2015', '53', 'Dividendo a cobrar de empresas asociadas', '345', '', '39');
INSERT INTO co_cuentas VALUES ('', '5355', '2015', '53', 'Dividendo a cobrar de otras partes vinculadas', '346', '', '39');
INSERT INTO co_cuentas VALUES ('', '5393', '2015', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas del grupo.', '347', '', '39');
INSERT INTO co_cuentas VALUES ('', '5394', '2015', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas asociadas.', '348', '', '39');
INSERT INTO co_cuentas VALUES ('', '5395', '2015', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en otras partes vinculadas', '349', '', '39');
INSERT INTO co_cuentas VALUES ('', '540', '2015', '54', 'Inversiones financieras a corto plazo en instrumentos de patrimonio', '350', '', '40');
INSERT INTO co_cuentas VALUES ('', '541', '2015', '54', 'Valores representativos de deuda a corto plazo', '351', '', '40');
INSERT INTO co_cuentas VALUES ('', '542', '2015', '54', 'Cr?ditos a corto plazo', '352', '', '40');
INSERT INTO co_cuentas VALUES ('', '543', '2015', '54', 'Cr?ditos a corto plazo por enajenaci?n de inmovilizado', '353', '', '40');
INSERT INTO co_cuentas VALUES ('', '544', '2015', '54', 'Cr?ditos a corto plazo al personal', '354', '', '40');
INSERT INTO co_cuentas VALUES ('', '545', '2015', '54', 'Dividendo a cobrar', '355', '', '40');
INSERT INTO co_cuentas VALUES ('', '546', '2015', '54', 'Intereses a corto plazo de valores representativos de deudas', '356', '', '40');
INSERT INTO co_cuentas VALUES ('', '547', '2015', '54', 'Intereses a corto plazo de cr?ditos', '357', '', '40');
INSERT INTO co_cuentas VALUES ('', '548', '2015', '54', 'Imposiciones a corto plazo', '358', '', '40');
INSERT INTO co_cuentas VALUES ('', '549', '2015', '54', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a corto plazo', '359', '', '40');
INSERT INTO co_cuentas VALUES ('', '550', '2015', '55', 'Titular de la explotaci', '360', '', '41');
INSERT INTO co_cuentas VALUES ('', '551', '2015', '55', 'Cuenta corriente con socios y administradores', '361', '', '41');
INSERT INTO co_cuentas VALUES ('', '5523', '2015', '55', 'Cuenta corriente con empresas del grupo', '362', '', '41');
INSERT INTO co_cuentas VALUES ('', '5524', '2015', '55', 'Cuenta corriente con empresas asociadas', '363', '', '41');
INSERT INTO co_cuentas VALUES ('', '5525', '2015', '55', 'Cuenta corriente con otras partes vinculadas', '364', '', '41');
INSERT INTO co_cuentas VALUES ('', '5530', '2015', '55', 'Socios de sociedad disuelta', '365', '', '41');
INSERT INTO co_cuentas VALUES ('', '5531', '2015', '55', 'Socios, cuenta de fusi', '366', '', '41');
INSERT INTO co_cuentas VALUES ('', '5532', '2015', '55', 'Socios de sociedad escindida', '367', '', '41');
INSERT INTO co_cuentas VALUES ('', '5533', '2015', '55', 'Socios, cuenta de escisi', '368', '', '41');
INSERT INTO co_cuentas VALUES ('', '554', '2015', '55', 'Cuenta corriente con uniones temporales de empresas y comunidades de bienes', '369', '', '41');
INSERT INTO co_cuentas VALUES ('', '555', '2015', '55', 'Partidas pendientes de aplicaci', '370', '', '41');
INSERT INTO co_cuentas VALUES ('', '5563', '2015', '55', 'Desembolsos exigidos sobre participaciones, empresas del grupo', '371', '', '41');
INSERT INTO co_cuentas VALUES ('', '5564', '2015', '55', 'Desembolsos exigidos sobre participaciones, empresas asociadas', '372', '', '41');
INSERT INTO co_cuentas VALUES ('', '5565', '2015', '55', 'Desembolsos exigidos sobre participaciones, otras partes vinculadas', '373', '', '41');
INSERT INTO co_cuentas VALUES ('', '5566', '2015', '55', 'Desembolsos exigidos sobre participaciones de otras empresas', '374', '', '41');
INSERT INTO co_cuentas VALUES ('', '557', '2015', '55', 'Dividendo activo a cuenta', '375', '', '41');
INSERT INTO co_cuentas VALUES ('', '5580', '2015', '55', 'Socios por desembolsos exigidos sobre acciones o participaciones ordinarias', '376', '', '41');
INSERT INTO co_cuentas VALUES ('', '5585', '2015', '55', 'Socios por desembolsos exigidos sobre acciones o participaciones consideradas como pasivos financieros', '377', '', '41');
INSERT INTO co_cuentas VALUES ('', '5590', '2015', '55', 'Activos por derivados financieros a corto plazo, cartera de negociaci', '378', '', '41');
INSERT INTO co_cuentas VALUES ('', '5593', '2015', '55', 'Activos por derivados financieros a corto plazo, instrumentos de cobertura', '379', '', '41');
INSERT INTO co_cuentas VALUES ('', '5595', '2015', '55', 'Pasivos por derivados financieros a corto plazo, cartera de negociaci', '380', '', '41');
INSERT INTO co_cuentas VALUES ('', '5598', '2015', '55', 'Pasivos por derivados financieros a corto plazo, instrumentos de cobertura', '381', '', '41');
INSERT INTO co_cuentas VALUES ('', '560', '2015', '56', 'Fianzas recibidas a corto plazo', '382', '', '42');
INSERT INTO co_cuentas VALUES ('', '561', '2015', '56', 'Dep?sitos recibidos a corto plazo', '383', '', '42');
INSERT INTO co_cuentas VALUES ('', '565', '2015', '56', 'Fianzas constituidas a corto plazo', '384', '', '42');
INSERT INTO co_cuentas VALUES ('', '566', '2015', '56', 'Dep?sitos constituidos a corto plazo', '385', '', '42');
INSERT INTO co_cuentas VALUES ('', '567', '2015', '56', 'Intereses pagados por anticipado', '386', '', '42');
INSERT INTO co_cuentas VALUES ('', '568', '2015', '56', 'Intereses cobrados por anticipado', '387', '', '42');
INSERT INTO co_cuentas VALUES ('', '569', '2015', '56', 'Garant?as financieras a corto plazo', '388', '', '42');
INSERT INTO co_cuentas VALUES ('', '570', '2015', '57', 'Caja, euros', '389', 'CAJA', '43');
INSERT INTO co_cuentas VALUES ('', '571', '2015', '57', 'Caja, moneda extranjera', '390', '', '43');
INSERT INTO co_cuentas VALUES ('', '572', '2015', '57', 'Bancos e instituciones de cr?dito c/c vista, euros', '391', '', '43');
INSERT INTO co_cuentas VALUES ('', '573', '2015', '57', 'Bancos e instituciones de cr?dito c/c vista, moneda extranjera', '392', '', '43');
INSERT INTO co_cuentas VALUES ('', '574', '2015', '57', 'Bancos e instituciones de cr?dito, cuentas de ahorro, euros', '393', '', '43');
INSERT INTO co_cuentas VALUES ('', '575', '2015', '57', 'Bancos e instituciones de cr?dito, cuentas de ahorro, moneda extranjera', '394', '', '43');
INSERT INTO co_cuentas VALUES ('', '576', '2015', '57', 'Inversiones a corto plazo de gran liquidez', '395', '', '43');
INSERT INTO co_cuentas VALUES ('', '580', '2015', '58', 'Inmovilizado', '396', '', '44');
INSERT INTO co_cuentas VALUES ('', '581', '2015', '58', 'Inversiones con personas y entidades vinculadas', '397', '', '44');
INSERT INTO co_cuentas VALUES ('', '582', '2015', '58', 'Inversiones financieras', '398', '', '44');
INSERT INTO co_cuentas VALUES ('', '583', '2015', '58', 'Existencias, deudores comerciales y otras cuentas a cobrar', '399', '', '44');
INSERT INTO co_cuentas VALUES ('', '584', '2015', '58', 'Otros activos', '400', '', '44');
INSERT INTO co_cuentas VALUES ('', '585', '2015', '58', 'Provisiones', '401', '', '44');
INSERT INTO co_cuentas VALUES ('', '586', '2015', '58', 'Deudas con caracter?sticas especiales', '402', '', '44');
INSERT INTO co_cuentas VALUES ('', '587', '2015', '58', 'Deudas con personas y entidades vinculadas', '403', '', '44');
INSERT INTO co_cuentas VALUES ('', '588', '2015', '58', 'Acreedores comerciales y otras cuentas a pagar', '404', '', '44');
INSERT INTO co_cuentas VALUES ('', '589', '2015', '58', 'Otros pasivos', '405', '', '44');
INSERT INTO co_cuentas VALUES ('', '5933', '2015', '59', 'Deterioro de valor de participaciones a corto plazo en empresas del grupo', '406', '', '45');
INSERT INTO co_cuentas VALUES ('', '5934', '2015', '59', 'Deterioro de valor de participaciones a corto plazo en empresas asociadas', '407', '', '45');
INSERT INTO co_cuentas VALUES ('', '5943', '2015', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas del grupo', '408', '', '45');
INSERT INTO co_cuentas VALUES ('', '5944', '2015', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas asociadas', '409', '', '45');
INSERT INTO co_cuentas VALUES ('', '5945', '2015', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de otras partes vinculadas', '410', '', '45');
INSERT INTO co_cuentas VALUES ('', '5953', '2015', '59', 'Deterioro de valor de cr?ditos a corto plazo a empresas del grupo', '411', '', '45');
INSERT INTO co_cuentas VALUES ('', '5954', '2015', '59', 'Deterioro de valor de cr?ditos a corto plazo a empresas asociadas', '412', '', '45');
INSERT INTO co_cuentas VALUES ('', '5955', '2015', '59', 'Deterioro de valor de cr?ditos a corto plazo a otras partes vinculadas', '413', '', '45');
INSERT INTO co_cuentas VALUES ('', '597', '2015', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo', '414', '', '45');
INSERT INTO co_cuentas VALUES ('', '598', '2015', '59', 'Deterioro de valor de cr?ditos a corto plazo', '415', '', '45');
INSERT INTO co_cuentas VALUES ('', '5990', '2015', '59', 'Deterioro de valor de inmovilizado no corriente mantenido para la venta', '416', '', '45');
INSERT INTO co_cuentas VALUES ('', '5991', '2015', '59', 'Deterioro de valor de inversiones con personas y entidades vinculadas no corrientes mantenidas para la venta', '417', '', '45');
INSERT INTO co_cuentas VALUES ('', '5992', '2015', '59', 'Deterioro de valor de inversiones financieras no corrientes mantenidas para la venta', '418', '', '45');
INSERT INTO co_cuentas VALUES ('', '5993', '2015', '59', 'Deterioro de valor de existencias, deudores comerciales y otras cuentas a cobrar integrados en un grupo enajenable mantenido para la venta', '419', '', '45');
INSERT INTO co_cuentas VALUES ('', '5994', '2015', '59', 'Deterioro de valor de otros activos mantenidos para la venta', '420', '', '45');
INSERT INTO co_cuentas VALUES ('', '600', '2015', '60', 'Compras de mercader?as', '421', 'COMPRA', '46');
INSERT INTO co_cuentas VALUES ('', '601', '2015', '60', 'Compras de materias primas', '422', '', '46');
INSERT INTO co_cuentas VALUES ('', '602', '2015', '60', 'Compras de otros aprovisionamientos', '423', '', '46');
INSERT INTO co_cuentas VALUES ('', '6060', '2015', '60', 'Descuentos sobre compras por pronto pago de mercader?as', '424', '', '46');
INSERT INTO co_cuentas VALUES ('', '6061', '2015', '60', 'Descuentos sobre compras por pronto pago de materias primas', '425', '', '46');
INSERT INTO co_cuentas VALUES ('', '6062', '2015', '60', 'Descuentos sobre compras por pronto pago de otros aprovisionamientos', '426', '', '46');
INSERT INTO co_cuentas VALUES ('', '607', '2015', '60', 'Trabajos realizados por otras empresas', '427', '', '46');
INSERT INTO co_cuentas VALUES ('', '6080', '2015', '60', 'Devoluciones de compras de mercader?as', '428', '', '46');
INSERT INTO co_cuentas VALUES ('', '6081', '2015', '60', 'Devoluciones de compras de materias primas', '429', '', '46');
INSERT INTO co_cuentas VALUES ('', '6082', '2015', '60', 'Devoluciones de compras de otros aprovisionamientos', '430', '', '46');
INSERT INTO co_cuentas VALUES ('', '6090', '2015', '60', 'Rappels por compras de mercader?as', '431', '', '46');
INSERT INTO co_cuentas VALUES ('', '6091', '2015', '60', 'Rappels por compras de materias primas', '432', '', '46');
INSERT INTO co_cuentas VALUES ('', '6092', '2015', '60', 'Rappels por compras de otros aprovisionamientos', '433', '', '46');
INSERT INTO co_cuentas VALUES ('', '610', '2015', '61', 'Variaci?n de existencias de mercader?as', '434', '', '47');
INSERT INTO co_cuentas VALUES ('', '611', '2015', '61', 'Variaci?n de existencias de materias primas', '435', '', '47');
INSERT INTO co_cuentas VALUES ('', '612', '2015', '61', 'Variaci?n de existencias de otros aprovisionamientos', '436', '', '47');
INSERT INTO co_cuentas VALUES ('', '620', '2015', '62', 'Gastos en investigaci?n y desarrollo del ejercicio', '437', '', '48');
INSERT INTO co_cuentas VALUES ('', '621', '2015', '62', 'Arrendamientos y c?nones', '438', '', '48');
INSERT INTO co_cuentas VALUES ('', '622', '2015', '62', 'Reparaciones y conservaci', '439', '', '48');
INSERT INTO co_cuentas VALUES ('', '623', '2015', '62', 'Servicios de profesionales independientes', '440', '', '48');
INSERT INTO co_cuentas VALUES ('', '624', '2015', '62', 'Transportes', '441', '', '48');
INSERT INTO co_cuentas VALUES ('', '625', '2015', '62', 'Primas de seguros', '442', '', '48');
INSERT INTO co_cuentas VALUES ('', '626', '2015', '62', 'Servicios bancarios y similares', '443', '', '48');
INSERT INTO co_cuentas VALUES ('', '627', '2015', '62', 'Publicidad, propaganda y relaciones p?blicas', '444', '', '48');
INSERT INTO co_cuentas VALUES ('', '628', '2015', '62', 'Suministros', '445', '', '48');
INSERT INTO co_cuentas VALUES ('', '629', '2015', '62', 'Otros servicios', '446', '', '48');
INSERT INTO co_cuentas VALUES ('', '6300', '2015', '63', 'Impuesto corriente', '447', '', '49');
INSERT INTO co_cuentas VALUES ('', '6301', '2015', '63', 'Impuesto diferido', '448', '', '49');
INSERT INTO co_cuentas VALUES ('', '631', '2015', '63', 'Otros tributos', '449', '', '49');
INSERT INTO co_cuentas VALUES ('', '633', '2015', '63', 'Ajustes negativos en la imposici?n sobre beneficios', '450', '', '49');
INSERT INTO co_cuentas VALUES ('', '6341', '2015', '63', 'Ajustes negativos en iva de activo corriente', '451', '', '49');
INSERT INTO co_cuentas VALUES ('', '6342', '2015', '63', 'Ajustes negativos en iva de inversiones', '452', '', '49');
INSERT INTO co_cuentas VALUES ('', '636', '2015', '63', 'Devoluci?n de impuestos', '453', '', '49');
INSERT INTO co_cuentas VALUES ('', '638', '2015', '63', 'Ajustes positivos en la imposici?n sobre beneficios', '454', '', '49');
INSERT INTO co_cuentas VALUES ('', '6391', '2015', '63', 'Ajustes positivos en iva de activo corriente', '455', '', '49');
INSERT INTO co_cuentas VALUES ('', '6392', '2015', '63', 'Ajustes positivos en iva de inversiones', '456', '', '49');
INSERT INTO co_cuentas VALUES ('', '640', '2015', '64', 'Sueldos y salarios', '457', '', '50');
INSERT INTO co_cuentas VALUES ('', '641', '2015', '64', 'Indemnizaciones', '458', '', '50');
INSERT INTO co_cuentas VALUES ('', '642', '2015', '64', 'Seguridad social a cargo de la empresa', '459', '', '50');
INSERT INTO co_cuentas VALUES ('', '643', '2015', '64', 'Retribuciones a largo plazo mediante sistemas de aportaci?n definida', '460', '', '50');
INSERT INTO co_cuentas VALUES ('', '6440', '2015', '64', 'Contribuciones anuales', '461', '', '50');
INSERT INTO co_cuentas VALUES ('', '6442', '2015', '64', 'Otros costes', '462', '', '50');
INSERT INTO co_cuentas VALUES ('', '6450', '2015', '64', 'Retribuciones al personal liquidados con instrumentos de patrimonio', '463', '', '50');
INSERT INTO co_cuentas VALUES ('', '6457', '2015', '64', 'Retribuciones al personal liquidados en efectivo basado en instrumentos de patrimonio', '464', '', '50');
INSERT INTO co_cuentas VALUES ('', '649', '2015', '64', 'Otros gastos sociales', '465', '', '50');
INSERT INTO co_cuentas VALUES ('', '650', '2015', '65', 'P?rdidas de cr?ditos comerciales incobrables', '466', '', '51');
INSERT INTO co_cuentas VALUES ('', '6510', '2015', '65', 'Beneficio transferido (gestor)', '467', '', '51');
INSERT INTO co_cuentas VALUES ('', '6511', '2015', '65', 'P?rdida soportada (part?cipe o asociado no gestor)', '468', '', '51');
INSERT INTO co_cuentas VALUES ('', '659', '2015', '65', 'Otras p?rdidas en gesti?n corriente', '469', '', '51');
INSERT INTO co_cuentas VALUES ('', '660', '2015', '66', 'Gastos financieros por actualizaci?n de provisiones', '470', '', '52');
INSERT INTO co_cuentas VALUES ('', '6610', '2015', '66', 'Intereses de obligaciones y bonos a largo plazo, empresas del grupo', '471', '', '52');
INSERT INTO co_cuentas VALUES ('', '6611', '2015', '66', 'Intereses de obligaciones y bonos a largo plazo, empresas asociadas', '472', '', '52');
INSERT INTO co_cuentas VALUES ('', '6612', '2015', '66', 'Intereses de obligaciones y bonos a largo plazo, otras partes vinculadas', '473', '', '52');
INSERT INTO co_cuentas VALUES ('', '6613', '2015', '66', 'Intereses de obligaciones y bonos a largo plazo, otras empresas', '474', '', '52');
INSERT INTO co_cuentas VALUES ('', '6615', '2015', '66', 'Intereses de obligaciones y bonos a corto plazo, empresas del grupo', '475', '', '52');
INSERT INTO co_cuentas VALUES ('', '6616', '2015', '66', 'Intereses de obligaciones y bonos a corto plazo, empresas asociadas', '476', '', '52');
INSERT INTO co_cuentas VALUES ('', '6617', '2015', '66', 'Intereses de obligaciones y bonos a corto plazo, otras partes vinculadas', '477', '', '52');
INSERT INTO co_cuentas VALUES ('', '6618', '2015', '66', 'Intereses de obligaciones y bonos a corto plazo, otras empresas', '478', '', '52');
INSERT INTO co_cuentas VALUES ('', '6620', '2015', '66', 'Intereses de deudas, empresas del grupo', '479', '', '52');
INSERT INTO co_cuentas VALUES ('', '6621', '2015', '66', 'Intereses de deudas, empresas asociadas', '480', '', '52');
INSERT INTO co_cuentas VALUES ('', '6622', '2015', '66', 'Intereses de deudas, otras partes vinculadas', '481', '', '52');
INSERT INTO co_cuentas VALUES ('', '6623', '2015', '66', 'Intereses de deudas con entidades de cr?dito', '482', '', '52');
INSERT INTO co_cuentas VALUES ('', '6624', '2015', '66', 'Intereses de deudas, otras empresas', '483', '', '52');
INSERT INTO co_cuentas VALUES ('', '6630', '2015', '66', 'P?rdidas de cartera de negociaci', '484', '', '52');
INSERT INTO co_cuentas VALUES ('', '6631', '2015', '66', 'P?rdidas de designados por la empresa', '485', '', '52');
INSERT INTO co_cuentas VALUES ('', '6632', '2015', '66', 'P?rdidas de disponibles para la venta', '486', '', '52');
INSERT INTO co_cuentas VALUES ('', '6633', '2015', '66', 'P?rdidas de instrumentos de cobertura', '487', '', '52');
INSERT INTO co_cuentas VALUES ('', '6640', '2015', '66', 'Dividendos de pasivos, empresas del grupo', '488', '', '52');
INSERT INTO co_cuentas VALUES ('', '6641', '2015', '66', 'Dividendos de pasivos, empresas asociadas', '489', '', '52');
INSERT INTO co_cuentas VALUES ('', '6642', '2015', '66', 'Dividendos de pasivos, otras partes vinculadas', '490', '', '52');
INSERT INTO co_cuentas VALUES ('', '6643', '2015', '66', 'Dividendos de pasivos, otras empresas', '491', '', '52');
INSERT INTO co_cuentas VALUES ('', '6650', '2015', '66', 'Intereses por descuento de efectos en entidades de cr?dito del grupo', '492', '', '52');
INSERT INTO co_cuentas VALUES ('', '6651', '2015', '66', 'Intereses por descuento de efectos en entidades de cr?dito asociadas', '493', '', '52');
INSERT INTO co_cuentas VALUES ('', '6652', '2015', '66', 'Intereses por descuento de efectos en otras entidades de cr?dito vinculadas', '494', '', '52');
INSERT INTO co_cuentas VALUES ('', '6653', '2015', '66', 'Intereses por descuento de efectos en otras entidades de cr?dito', '495', '', '52');
INSERT INTO co_cuentas VALUES ('', '6654', '2015', '66', 'Intereses por operaciones de factoring con entidades de cr?dito del grupo', '496', '', '52');
INSERT INTO co_cuentas VALUES ('', '6655', '2015', '66', 'Intereses por operaciones de factoring con entidades de cr?dito asociadas', '497', '', '52');
INSERT INTO co_cuentas VALUES ('', '6656', '2015', '66', 'Intereses por operaciones de factoring con otras entidades de cr?dito vinculadas', '498', '', '52');
INSERT INTO co_cuentas VALUES ('', '6657', '2015', '66', 'Intereses por operaciones de factoring con otras entidades de cr?dito', '499', '', '52');
INSERT INTO co_cuentas VALUES ('', '6660', '2015', '66', 'P?rdidas en valores representativos de deuda a largo plazo, empresas del grupo', '500', '', '52');
INSERT INTO co_cuentas VALUES ('', '6661', '2015', '66', 'P?rdidas en valores representativos de deuda a largo plazo, empresas asociadas', '501', '', '52');
INSERT INTO co_cuentas VALUES ('', '6662', '2015', '66', 'P?rdidas en valores representativos de deuda a largo plazo, otras partes vinculadas', '502', '', '52');
INSERT INTO co_cuentas VALUES ('', '6663', '2015', '66', 'P?rdidas en participaciones y valores representativos de deuda a largo plazo, otras empresas', '503', '', '52');
INSERT INTO co_cuentas VALUES ('', '6665', '2015', '66', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '504', '', '52');
INSERT INTO co_cuentas VALUES ('', '6666', '2015', '66', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '505', '', '52');
INSERT INTO co_cuentas VALUES ('', '6667', '2015', '66', 'P?rdidas en valores representativos de deuda a corto plazo, otras partes vinculadas', '506', '', '52');
INSERT INTO co_cuentas VALUES ('', '6668', '2015', '66', 'P?rdidas en valores representativos de deuda a corto plazo, otras empresas', '507', '', '52');
INSERT INTO co_cuentas VALUES ('', '6670', '2015', '66', 'P?rdidas de cr?ditos a largo plazo, empresas del grupo', '508', '', '52');
INSERT INTO co_cuentas VALUES ('', '6671', '2015', '66', 'P?rdidas de cr?ditos a largo plazo, empresas asociadas', '509', '', '52');
INSERT INTO co_cuentas VALUES ('', '6672', '2015', '66', 'P?rdidas de cr?ditos a largo plazo, otras partes vinculadas', '510', '', '52');
INSERT INTO co_cuentas VALUES ('', '6673', '2015', '66', 'P?rdidas de cr?ditos a largo plazo, otras empresas', '511', '', '52');
INSERT INTO co_cuentas VALUES ('', '6675', '2015', '66', 'P?rdidas de cr?ditos a corto plazo, empresas del grupo', '512', '', '52');
INSERT INTO co_cuentas VALUES ('', '6676', '2015', '66', 'P?rdidas de cr?ditos a corto plazo, empresas asociadas', '513', '', '52');
INSERT INTO co_cuentas VALUES ('', '6677', '2015', '66', 'P?rdidas de cr?ditos a corto plazo, otras partes vinculadas', '514', '', '52');
INSERT INTO co_cuentas VALUES ('', '6678', '2015', '66', 'P?rdidas de cr?ditos a corto plazo, otras empresas', '515', '', '52');
INSERT INTO co_cuentas VALUES ('', '668', '2015', '66', 'Diferencias negativas de cambio', '516', 'EURNEG', '52');
INSERT INTO co_cuentas VALUES ('', '669', '2015', '66', 'Otros gastos financieros', '517', '', '52');
INSERT INTO co_cuentas VALUES ('', '670', '2015', '67', 'P?rdidas procedentes del inmovilizado intangible', '518', '', '53');
INSERT INTO co_cuentas VALUES ('', '671', '2015', '67', 'P?rdidas procedentes del inmovilizado material', '519', '', '53');
INSERT INTO co_cuentas VALUES ('', '672', '2015', '67', 'P?rdidas procedentes de las inversiones inmobiliarias', '520', '', '53');
INSERT INTO co_cuentas VALUES ('', '6733', '2015', '67', 'P?rdidas procedentes de participaciones a largo plazo, empresas del grupo', '521', '', '53');
INSERT INTO co_cuentas VALUES ('', '6734', '2015', '67', 'P?rdidas procedentes de participaciones a largo plazo, empresas asociadas', '522', '', '53');
INSERT INTO co_cuentas VALUES ('', '6735', '2015', '67', 'P?rdidas procedentes de participaciones a largo plazo, otras partes vinculadas', '523', '', '53');
INSERT INTO co_cuentas VALUES ('', '675', '2015', '67', 'P?rdidas por operaciones con obligaciones propias', '524', '', '53');
INSERT INTO co_cuentas VALUES ('', '678', '2015', '67', 'Gastos excepcionales', '525', '', '53');
INSERT INTO co_cuentas VALUES ('', '680', '2015', '68', 'Amortizaci?n del inmovilizado intangible', '526', '', '54');
INSERT INTO co_cuentas VALUES ('', '681', '2015', '68', 'Amortizaci?n del inmovilizado material', '527', '', '54');
INSERT INTO co_cuentas VALUES ('', '682', '2015', '68', 'Amortizaci?n de las inversiones inmobiliarias', '528', '', '54');
INSERT INTO co_cuentas VALUES ('', '690', '2015', '69', 'P?rdidas por deterioro del inmovilizado intangible', '529', '', '55');
INSERT INTO co_cuentas VALUES ('', '691', '2015', '69', 'P?rdidas por deterioro del inmovilizado material', '530', '', '55');
INSERT INTO co_cuentas VALUES ('', '692', '2015', '69', 'P?rdidas por deterioro de las inversiones inmobiliarias', '531', '', '55');
INSERT INTO co_cuentas VALUES ('', '6930', '2015', '69', 'P?rdidas por deterioro de productos terminados y en curso de fabricaci', '532', '', '55');
INSERT INTO co_cuentas VALUES ('', '6931', '2015', '69', 'P?rdidas por deterioro de mercader?as', '533', '', '55');
INSERT INTO co_cuentas VALUES ('', '6932', '2015', '69', 'P?rdidas por deterioro de materias primas', '534', '', '55');
INSERT INTO co_cuentas VALUES ('', '6933', '2015', '69', 'P?rdidas por deterioro de otros aprovisionamientos', '535', '', '55');
INSERT INTO co_cuentas VALUES ('', '694', '2015', '69', 'P?rdidas por deterioro de cr?ditos por operaciones comerciales', '536', '', '55');
INSERT INTO co_cuentas VALUES ('', '6954', '2015', '69', 'Dotaci?n a la provisi?n por contratos onerosos', '537', '', '55');
INSERT INTO co_cuentas VALUES ('', '6959', '2015', '69', 'Dotaci?n a la provisi?n para otras operaciones comerciales', '538', '', '55');
INSERT INTO co_cuentas VALUES ('', '6960', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '539', '', '55');
INSERT INTO co_cuentas VALUES ('', '6961', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '540', '', '55');
INSERT INTO co_cuentas VALUES ('', '6962', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras partes vinculadas', '541', '', '55');
INSERT INTO co_cuentas VALUES ('', '6963', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras empresas', '542', '', '55');
INSERT INTO co_cuentas VALUES ('', '6965', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas del grupo', '543', '', '55');
INSERT INTO co_cuentas VALUES ('', '6966', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas asociadas', '544', '', '55');
INSERT INTO co_cuentas VALUES ('', '6967', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, otras partes vinculadas', '545', '', '55');
INSERT INTO co_cuentas VALUES ('', '6968', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, de otras empresas', '546', '', '55');
INSERT INTO co_cuentas VALUES ('', '6970', '2015', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas del grupo', '547', '', '55');
INSERT INTO co_cuentas VALUES ('', '6971', '2015', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas asociadas', '548', '', '55');
INSERT INTO co_cuentas VALUES ('', '6972', '2015', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras partes vinculadas', '549', '', '55');
INSERT INTO co_cuentas VALUES ('', '6973', '2015', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras empresas', '550', '', '55');
INSERT INTO co_cuentas VALUES ('', '6980', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '551', '', '55');
INSERT INTO co_cuentas VALUES ('', '6981', '2015', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '552', '', '55');
INSERT INTO co_cuentas VALUES ('', '6985', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '553', '', '55');
INSERT INTO co_cuentas VALUES ('', '6986', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '554', '', '55');
INSERT INTO co_cuentas VALUES ('', '6987', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '555', '', '55');
INSERT INTO co_cuentas VALUES ('', '6988', '2015', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, de otras empresas', '556', '', '55');
INSERT INTO co_cuentas VALUES ('', '6990', '2015', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas del grupo', '557', '', '55');
INSERT INTO co_cuentas VALUES ('', '6991', '2015', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas asociadas', '558', '', '55');
INSERT INTO co_cuentas VALUES ('', '6992', '2015', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras partes vinculadas', '559', '', '55');
INSERT INTO co_cuentas VALUES ('', '6993', '2015', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras empresas', '560', '', '55');
INSERT INTO co_cuentas VALUES ('', '700', '2015', '70', 'Ventas de mercader?as', '561', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '701', '2015', '70', 'Ventas de productos terminados', '562', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '702', '2015', '70', 'Ventas de productos semiterminados', '563', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '703', '2015', '70', 'Ventas de subproductos y residuos', '564', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '704', '2015', '70', 'Ventas de envases y embalajes', '565', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '705', '2015', '70', 'Prestaciones de servicios', '566', 'VENTAS', '56');
INSERT INTO co_cuentas VALUES ('', '7060', '2015', '70', 'Descuentos sobre ventas por pronto pago de mercader?as', '567', '', '56');
INSERT INTO co_cuentas VALUES ('', '7061', '2015', '70', 'Descuentos sobre ventas por pronto pago de productos terminados', '568', '', '56');
INSERT INTO co_cuentas VALUES ('', '7062', '2015', '70', 'Descuentos sobre ventas por pronto pago de productos semiterminados', '569', '', '56');
INSERT INTO co_cuentas VALUES ('', '7063', '2015', '70', 'Descuentos sobre ventas por pronto pago de subproductos y residuos', '570', '', '56');
INSERT INTO co_cuentas VALUES ('', '7080', '2015', '70', 'Devoluciones de ventas de mercader?as', '571', '', '56');
INSERT INTO co_cuentas VALUES ('', '7081', '2015', '70', 'Devoluciones de ventas de productos terminados', '572', '', '56');
INSERT INTO co_cuentas VALUES ('', '7082', '2015', '70', 'Devoluciones de ventas de productos semiterminados', '573', '', '56');
INSERT INTO co_cuentas VALUES ('', '7083', '2015', '70', 'Devoluciones de ventas de subproductos y residuos', '574', '', '56');
INSERT INTO co_cuentas VALUES ('', '7084', '2015', '70', 'Devoluciones de ventas de envases y embalajes', '575', '', '56');
INSERT INTO co_cuentas VALUES ('', '7090', '2015', '70', 'Rappels sobre ventas de mercader?as', '576', '', '56');
INSERT INTO co_cuentas VALUES ('', '7091', '2015', '70', 'Rappels sobre ventas de productos terminados', '577', '', '56');
INSERT INTO co_cuentas VALUES ('', '7092', '2015', '70', 'Rappels sobre ventas de productos semiterminados', '578', '', '56');
INSERT INTO co_cuentas VALUES ('', '7093', '2015', '70', 'Rappels sobre ventas de subproductos y residuos', '579', '', '56');
INSERT INTO co_cuentas VALUES ('', '7094', '2015', '70', 'Rappels sobre ventas de envases y embalajes', '580', '', '56');
INSERT INTO co_cuentas VALUES ('', '710', '2015', '71', 'Variaci?n de existencias de productos en curso', '581', '', '57');
INSERT INTO co_cuentas VALUES ('', '711', '2015', '71', 'Variaci?n de existencias de productos semiterminados', '582', '', '57');
INSERT INTO co_cuentas VALUES ('', '712', '2015', '71', 'Variaci?n de existencias de productos terminados', '583', '', '57');
INSERT INTO co_cuentas VALUES ('', '713', '2015', '71', 'Variaci?n de existencias de subproductos,residuos y materiales recuperados', '584', '', '57');
INSERT INTO co_cuentas VALUES ('', '730', '2015', '73', 'Trabajos realizados para el inmovilizado intangible', '585', '', '58');
INSERT INTO co_cuentas VALUES ('', '731', '2015', '73', 'Trabajos realizados para el inmovilizado material', '586', '', '58');
INSERT INTO co_cuentas VALUES ('', '732', '2015', '73', 'Trabajos realizados en inversiones inmobiliarias', '587', '', '58');
INSERT INTO co_cuentas VALUES ('', '733', '2015', '73', 'Trabajos realizados para el inmovilizado material en curso', '588', '', '58');
INSERT INTO co_cuentas VALUES ('', '740', '2015', '74', 'Subvenciones, donaciones y legados a la explotaci', '589', '', '59');
INSERT INTO co_cuentas VALUES ('', '746', '2015', '74', 'Subvenciones, donaciones y legados de capital transferidos al resultado del ejercicio', '590', '', '59');
INSERT INTO co_cuentas VALUES ('', '747', '2015', '74', 'Otras subvenciones, donaciones y legados transferidos al resultado del ejercicio', '591', '', '59');
INSERT INTO co_cuentas VALUES ('', '7510', '2015', '75', 'P?rdida transferida (gestor)', '592', '', '60');
INSERT INTO co_cuentas VALUES ('', '7511', '2015', '75', 'Beneficio atribuido (part?cipe o asociado no gestor)', '593', '', '60');
INSERT INTO co_cuentas VALUES ('', '752', '2015', '75', 'Ingresos por arrendamientos', '594', '', '60');
INSERT INTO co_cuentas VALUES ('', '753', '2015', '75', 'Ingresos de propiedad industrial cedida en explotaci', '595', '', '60');
INSERT INTO co_cuentas VALUES ('', '754', '2015', '75', 'Ingresos por comisiones', '596', '', '60');
INSERT INTO co_cuentas VALUES ('', '755', '2015', '75', 'Ingresos por servicios al personal', '597', '', '60');
INSERT INTO co_cuentas VALUES ('', '759', '2015', '75', 'Ingresos por servicios diversos', '598', '', '60');
INSERT INTO co_cuentas VALUES ('', '7600', '2015', '76', 'Ingresos de participaciones en instrumentos de patrimonio, empresas del grupo', '599', '', '61');
INSERT INTO co_cuentas VALUES ('', '7601', '2015', '76', 'Ingresos de participaciones en instrumentos de patrimonio, empresas asociadas', '600', '', '61');
INSERT INTO co_cuentas VALUES ('', '7602', '2015', '76', 'Ingresos de participaciones en instrumentos de patrimonio, otras partes vinculadas', '601', '', '61');
INSERT INTO co_cuentas VALUES ('', '7603', '2015', '76', 'Ingresos de participaciones en instrumentos de patrimonio, otras empresas', '602', '', '61');
INSERT INTO co_cuentas VALUES ('', '7610', '2015', '76', 'Ingresos de valores representativos de deuda, empresas del grupo', '603', '', '61');
INSERT INTO co_cuentas VALUES ('', '7611', '2015', '76', 'Ingresos de valores representativos de deuda, empresas asociadas', '604', '', '61');
INSERT INTO co_cuentas VALUES ('', '7612', '2015', '76', 'Ingresos de valores representativos de deuda, otras partes vinculadas', '605', '', '61');
INSERT INTO co_cuentas VALUES ('', '7613', '2015', '76', 'Ingresos de valores representativos de deuda, otras empresas', '606', '', '61');
INSERT INTO co_cuentas VALUES ('', '76200', '2015', '76', 'Ingresos de cr?ditos a largo plazo, empresas del grupo', '607', '', '61');
INSERT INTO co_cuentas VALUES ('', '76201', '2015', '76', 'Ingresos de cr?ditos a largo plazo, empresas asociadas', '608', '', '61');
INSERT INTO co_cuentas VALUES ('', '76202', '2015', '76', 'Ingresos de cr?ditos a largo plazo, otras partes vinculadas', '609', '', '61');
INSERT INTO co_cuentas VALUES ('', '76203', '2015', '76', 'Ingresos de cr?ditos a largo plazo, otras empresas', '610', '', '61');
INSERT INTO co_cuentas VALUES ('', '76210', '2015', '76', 'Ingresos de cr?ditos a corto plazo, empresas del grupo', '611', '', '61');
INSERT INTO co_cuentas VALUES ('', '76211', '2015', '76', 'Ingresos de cr?ditos a corto plazo, empresas asociadas', '612', '', '61');
INSERT INTO co_cuentas VALUES ('', '76212', '2015', '76', 'Ingresos de cr?ditos a corto plazo, otras partes vinculadas', '613', '', '61');
INSERT INTO co_cuentas VALUES ('', '76213', '2015', '76', 'Ingresos de cr?ditos a corto plazo, otras empresas', '614', '', '61');
INSERT INTO co_cuentas VALUES ('', '7630', '2015', '76', 'Beneficios de cartera de negociaci', '615', '', '61');
INSERT INTO co_cuentas VALUES ('', '7631', '2015', '76', 'Beneficios de designados por la empresa', '616', '', '61');
INSERT INTO co_cuentas VALUES ('', '7632', '2015', '76', 'Beneficios de disponibles para la venta', '617', '', '61');
INSERT INTO co_cuentas VALUES ('', '7633', '2015', '76', 'Beneficios de instrumentos de cobertura', '618', '', '61');
INSERT INTO co_cuentas VALUES ('', '7660', '2015', '76', 'Beneficios en valores representativos de deuda a largo plazo, empresas del grupo', '619', '', '61');
INSERT INTO co_cuentas VALUES ('', '7661', '2015', '76', 'Beneficios en valores representativos de deuda a largo plazo, empresas asociadas', '620', '', '61');
INSERT INTO co_cuentas VALUES ('', '7662', '2015', '76', 'Beneficios en valores representativos de deuda a largo plazo, otras partes vinculadas', '621', '', '61');
INSERT INTO co_cuentas VALUES ('', '7663', '2015', '76', 'Beneficios en participaciones y valores representativos de deuda a largo plazo, otras empresas', '622', '', '61');
INSERT INTO co_cuentas VALUES ('', '7665', '2015', '76', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '623', '', '61');
INSERT INTO co_cuentas VALUES ('', '7666', '2015', '76', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '624', '', '61');
INSERT INTO co_cuentas VALUES ('', '7667', '2015', '76', 'Beneficios en valores representativos de deuda a corto plazo, otras partes vinculadas', '625', '', '61');
INSERT INTO co_cuentas VALUES ('', '7668', '2015', '76', 'Beneficios en valores representativos de deuda a corto plazo, otras empresas', '626', '', '61');
INSERT INTO co_cuentas VALUES ('', '767', '2015', '76', 'Ingresos de activos afectos y de derechos de reembolso relativos a retribuciones a largo plazo', '627', '', '61');
INSERT INTO co_cuentas VALUES ('', '768', '2015', '76', 'Diferencias positivas de cambio', '628', 'EURPOS', '61');
INSERT INTO co_cuentas VALUES ('', '769', '2015', '76', 'Otros ingresos financieros', '629', '', '61');
INSERT INTO co_cuentas VALUES ('', '770', '2015', '77', 'Beneficios procedentes del inmovilizado intangible', '630', '', '62');
INSERT INTO co_cuentas VALUES ('', '771', '2015', '77', 'Beneficios procedentes del inmovilizado material', '631', '', '62');
INSERT INTO co_cuentas VALUES ('', '772', '2015', '77', 'Beneficios procedentes de las inversiones inmobiliarias', '632', '', '62');
INSERT INTO co_cuentas VALUES ('', '7733', '2015', '77', 'Beneficios procedentes de participaciones a largo plazo, empresas del grupo', '633', '', '62');
INSERT INTO co_cuentas VALUES ('', '7734', '2015', '77', 'Beneficios procedentes de participaciones a largo plazo, empresas asociadas', '634', '', '62');
INSERT INTO co_cuentas VALUES ('', '7735', '2015', '77', 'Beneficios procedentes de participaciones a largo plazo, otras partes vinculadas', '635', '', '62');
INSERT INTO co_cuentas VALUES ('', '774', '2015', '77', 'Diferencia negativa en combinaciones de negocios', '636', '', '62');
INSERT INTO co_cuentas VALUES ('', '775', '2015', '77', 'Beneficios por operaciones con obligaciones propias', '637', '', '62');
INSERT INTO co_cuentas VALUES ('', '778', '2015', '77', 'Ingresos excepcionales', '638', '', '62');
INSERT INTO co_cuentas VALUES ('', '790', '2015', '79', 'Reversi?n del deterioro del inmovilizado intangible', '639', '', '63');
INSERT INTO co_cuentas VALUES ('', '791', '2015', '79', 'Reversi?n del deterioro del inmovilizado material', '640', '', '63');
INSERT INTO co_cuentas VALUES ('', '792', '2015', '79', 'Reversi?n del deterioro de las inversiones inmobiliarias', '641', '', '63');
INSERT INTO co_cuentas VALUES ('', '7930', '2015', '79', 'Reversi?n del deterioro de productos terminados y en curso de fabricaci', '642', '', '63');
INSERT INTO co_cuentas VALUES ('', '7931', '2015', '79', 'Reversi?n del deterioro de mercader?as', '643', '', '63');
INSERT INTO co_cuentas VALUES ('', '7932', '2015', '79', 'Reversi?n del deterioro de materias primas', '644', '', '63');
INSERT INTO co_cuentas VALUES ('', '7933', '2015', '79', 'Reversi?n del deterioro de otros aprovisionamientos', '645', '', '63');
INSERT INTO co_cuentas VALUES ('', '794', '2015', '79', 'Reversi?n del deterioro de cr?ditos por operaciones comerciales', '646', '', '63');
INSERT INTO co_cuentas VALUES ('', '7950', '2015', '79', 'Exceso de provisi?n por retribuciones al personal', '647', '', '63');
INSERT INTO co_cuentas VALUES ('', '7951', '2015', '79', 'Exceso de provisi?n para impuestos', '648', '', '63');
INSERT INTO co_cuentas VALUES ('', '7952', '2015', '79', 'Exceso de provisi?n para otras responsabilidades', '649', '', '63');
INSERT INTO co_cuentas VALUES ('', '79544', '2015', '79', 'Exceso de provisi?n por contratos onerosos', '650', '', '63');
INSERT INTO co_cuentas VALUES ('', '79549', '2015', '79', 'Exceso de provisi?n para otras operaciones comerciales', '651', '', '63');
INSERT INTO co_cuentas VALUES ('', '7955', '2015', '79', 'Exceso de provisi?n para actuaciones medioambientales', '652', '', '63');
INSERT INTO co_cuentas VALUES ('', '7956', '2015', '79', 'Exceso de provisi?n para reestructuraciones', '653', '', '63');
INSERT INTO co_cuentas VALUES ('', '7957', '2015', '79', 'Exceso de provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '654', '', '63');
INSERT INTO co_cuentas VALUES ('', '7960', '2015', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '655', '', '63');
INSERT INTO co_cuentas VALUES ('', '7961', '2015', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '656', '', '63');
INSERT INTO co_cuentas VALUES ('', '7965', '2015', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas del grupo', '657', '', '63');
INSERT INTO co_cuentas VALUES ('', '7966', '2015', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas asociadas', '658', '', '63');
INSERT INTO co_cuentas VALUES ('', '7967', '2015', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras partes vinculadas', '659', '', '63');
INSERT INTO co_cuentas VALUES ('', '7968', '2015', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras empresas', '660', '', '63');
INSERT INTO co_cuentas VALUES ('', '7970', '2015', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas del grupo', '661', '', '63');
INSERT INTO co_cuentas VALUES ('', '7971', '2015', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas asociadas', '662', '', '63');
INSERT INTO co_cuentas VALUES ('', '7972', '2015', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras partes vinculadas', '663', '', '63');
INSERT INTO co_cuentas VALUES ('', '7973', '2015', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras empresas', '664', '', '63');
INSERT INTO co_cuentas VALUES ('', '7980', '2015', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '665', '', '63');
INSERT INTO co_cuentas VALUES ('', '7981', '2015', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '666', '', '63');
INSERT INTO co_cuentas VALUES ('', '7985', '2015', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '667', '', '63');
INSERT INTO co_cuentas VALUES ('', '7986', '2015', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '668', '', '63');
INSERT INTO co_cuentas VALUES ('', '7987', '2015', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '669', '', '63');
INSERT INTO co_cuentas VALUES ('', '7988', '2015', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras empresas', '670', '', '63');
INSERT INTO co_cuentas VALUES ('', '7990', '2015', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas del grupo', '671', '', '63');
INSERT INTO co_cuentas VALUES ('', '7991', '2015', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas asociadas', '672', '', '63');
INSERT INTO co_cuentas VALUES ('', '7992', '2015', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras partes vinculadas', '673', '', '63');
INSERT INTO co_cuentas VALUES ('', '7993', '2015', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras empresas', '674', '', '63');
INSERT INTO co_cuentas VALUES ('', '800', '2015', '80', 'P?rdidas en activos financieros disponibles para la venta', '675', '', '64');
INSERT INTO co_cuentas VALUES ('', '802', '2015', '80', 'Transferencia de beneficios en activos financieros disponibles para la venta', '676', '', '64');
INSERT INTO co_cuentas VALUES ('', '810', '2015', '81', 'P?rdidas por coberturas de flujos de efectivo', '677', '', '65');
INSERT INTO co_cuentas VALUES ('', '811', '2015', '81', 'P?rdidas por coberturas de inversiones netas en un negocio en el extranjero', '678', '', '65');
INSERT INTO co_cuentas VALUES ('', '812', '2015', '81', 'Transferencia de beneficios por coberturas de flujos de efectivo', '679', '', '65');
INSERT INTO co_cuentas VALUES ('', '813', '2015', '81', 'Transferencia de beneficios por coberturas de inversiones netas en un negocio en el extranjero', '680', '', '65');
INSERT INTO co_cuentas VALUES ('', '820', '2015', '82', 'Diferencias de conversi?n negativas', '681', '', '66');
INSERT INTO co_cuentas VALUES ('', '821', '2015', '82', 'Transferencia de diferencias de conversi?n positivas', '682', '', '66');
INSERT INTO co_cuentas VALUES ('', '8300', '2015', '83', 'Impuesto corriente', '683', '', '67');
INSERT INTO co_cuentas VALUES ('', '8301', '2015', '83', 'Impuesto diferido', '684', '', '67');
INSERT INTO co_cuentas VALUES ('', '833', '2015', '83', 'Ajustes negativos en la imposici?n sobre beneficios', '685', '', '67');
INSERT INTO co_cuentas VALUES ('', '834', '2015', '83', 'Ingresos fiscales por diferencias permanentes', '686', '', '67');
INSERT INTO co_cuentas VALUES ('', '835', '2015', '83', 'Ingresos fiscales por deducciones y bonificaciones', '687', '', '67');
INSERT INTO co_cuentas VALUES ('', '836', '2015', '83', 'Transferencia de diferencias permanentes', '688', '', '67');
INSERT INTO co_cuentas VALUES ('', '837', '2015', '83', 'Transferencia de deducciones y bonificaciones', '689', '', '67');
INSERT INTO co_cuentas VALUES ('', '838', '2015', '83', 'Ajustes positivos en la imposici?n sobre beneficios', '690', '', '67');
INSERT INTO co_cuentas VALUES ('', '840', '2015', '84', 'Transferencia de subvenciones oficiales de capital', '691', '', '68');
INSERT INTO co_cuentas VALUES ('', '841', '2015', '84', 'Transferencia de donaciones y legados de capital', '692', '', '68');
INSERT INTO co_cuentas VALUES ('', '842', '2015', '84', 'Transferencia de otras subvenciones, donaciones y legados', '693', '', '68');
INSERT INTO co_cuentas VALUES ('', '850', '2015', '85', 'P?rdidas actuariales', '694', '', '69');
INSERT INTO co_cuentas VALUES ('', '851', '2015', '85', 'Ajustes negativos en activos por retribuciones a largo plazo de prestaci?n definida', '695', '', '69');
INSERT INTO co_cuentas VALUES ('', '860', '2015', '86', 'P?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '696', '', '70');
INSERT INTO co_cuentas VALUES ('', '862', '2015', '86', 'Transferencia de beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '697', '', '70');
INSERT INTO co_cuentas VALUES ('', '891', '2015', '89', 'Deterioro de participaciones en el patrimonio, empresas del grupo', '698', '', '71');
INSERT INTO co_cuentas VALUES ('', '892', '2015', '89', 'Deterioro de participaciones en el patrimonio, empresas asociadas', '699', '', '71');
INSERT INTO co_cuentas VALUES ('', '900', '2015', '90', 'Beneficios en activos financieros disponibles para la venta', '700', '', '72');
INSERT INTO co_cuentas VALUES ('', '902', '2015', '90', 'Transferencia de p?rdidas de activos financieros disponibles para la venta', '701', '', '72');
INSERT INTO co_cuentas VALUES ('', '910', '2015', '91', 'Beneficios por coberturas de flujos de efectivo', '702', '', '73');
INSERT INTO co_cuentas VALUES ('', '911', '2015', '91', 'Beneficios por coberturas de una inversi?n neta en un negocio en el extranjero', '703', '', '73');
INSERT INTO co_cuentas VALUES ('', '912', '2015', '91', 'Transferencia de p?rdidas por coberturas de flujos de efectivo', '704', '', '73');
INSERT INTO co_cuentas VALUES ('', '913', '2015', '91', 'Transferencia de p?rdidas por coberturas de una inversi?n neta en un negocio en el extranjero', '705', '', '73');
INSERT INTO co_cuentas VALUES ('', '920', '2015', '92', 'Diferencias de conversi?n positivas', '706', '', '74');
INSERT INTO co_cuentas VALUES ('', '921', '2015', '92', 'Transferencia de diferencias de conversi?n negativas', '707', '', '74');
INSERT INTO co_cuentas VALUES ('', '940', '2015', '94', 'Ingresos de subvenciones oficiales de capital', '708', '', '75');
INSERT INTO co_cuentas VALUES ('', '941', '2015', '94', 'Ingresos de donaciones y legados de capital', '709', '', '75');
INSERT INTO co_cuentas VALUES ('', '942', '2015', '94', 'Ingresos de otras subvenciones, donaciones y legados', '710', '', '75');
INSERT INTO co_cuentas VALUES ('', '950', '2015', '95', 'Ganancias actuariales', '711', '', '76');
INSERT INTO co_cuentas VALUES ('', '951', '2015', '95', 'Ajustes positivos en activos por retribuciones a largo plazo de prestaci?n definida', '712', '', '76');
INSERT INTO co_cuentas VALUES ('', '960', '2015', '96', 'Beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '713', '', '77');
INSERT INTO co_cuentas VALUES ('', '962', '2015', '96', 'Transferencia de p?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '714', '', '77');
INSERT INTO co_cuentas VALUES ('', '991', '2015', '99', 'Recuperaci?n de ajustes valorativos negativos previos, empresas del grupo', '715', '', '78');
INSERT INTO co_cuentas VALUES ('', '992', '2015', '99', 'Recuperaci?n de ajustes valorativos negativos previos, empresas asociadas', '716', '', '78');
INSERT INTO co_cuentas VALUES ('', '993', '2015', '99', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas del grupo', '717', '', '78');
INSERT INTO co_cuentas VALUES ('', '994', '2015', '99', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas asociadas', '718', '', '78');
INSERT INTO co_cuentas VALUES ('', '100', '2016', '10', 'Capital social', '719', '', '79');
INSERT INTO co_cuentas VALUES ('', '101', '2016', '10', 'Fondo social', '720', '', '79');
INSERT INTO co_cuentas VALUES ('', '102', '2016', '10', 'Capital', '721', '', '79');
INSERT INTO co_cuentas VALUES ('', '1030', '2016', '10', 'Socios por desembolsos no exigidos, capital social', '722', '', '79');
INSERT INTO co_cuentas VALUES ('', '1034', '2016', '10', 'Socios por desembolsos no exigidos, capital pendiente de inscripci', '723', '', '79');
INSERT INTO co_cuentas VALUES ('', '1040', '2016', '10', 'Socios por aportaciones no dinerarias pendientes, capital social', '724', '', '79');
INSERT INTO co_cuentas VALUES ('', '1044', '2016', '10', 'Socios por aportaciones no dinerarias pendientes, capital pendiente de inscripci', '725', '', '79');
INSERT INTO co_cuentas VALUES ('', '108', '2016', '10', 'Acciones o participaciones propias en situaciones especiales', '726', '', '79');
INSERT INTO co_cuentas VALUES ('', '109', '2016', '10', 'Acciones o participaciones propias para reducci?n de capital', '727', '', '79');
INSERT INTO co_cuentas VALUES ('', '110', '2016', '11', 'Prima de emisi?n o asunci', '728', '', '80');
INSERT INTO co_cuentas VALUES ('', '1110', '2016', '11', 'Patrimonio neto por emisi?n de instrumentos financieros compuestos', '729', '', '80');
INSERT INTO co_cuentas VALUES ('', '1111', '2016', '11', 'Resto de instrumentos de patrimonio neto', '730', '', '80');
INSERT INTO co_cuentas VALUES ('', '112', '2016', '11', 'Reserva legal', '731', '', '80');
INSERT INTO co_cuentas VALUES ('', '113', '2016', '11', 'Reservas voluntarias', '732', '', '80');
INSERT INTO co_cuentas VALUES ('', '1140', '2016', '11', 'Reservas para acciones o participaciones de la sociedad dominante', '733', '', '80');
INSERT INTO co_cuentas VALUES ('', '1141', '2016', '11', 'Reservas estatutarias', '734', '', '80');
INSERT INTO co_cuentas VALUES ('', '1142', '2016', '11', 'Reserva por capital amortizado', '735', '', '80');
INSERT INTO co_cuentas VALUES ('', '1143', '2016', '11', 'Reserva por fondo de comercio', '736', '', '80');
INSERT INTO co_cuentas VALUES ('', '1144', '2016', '11', 'Reservas por acciones propias aceptadas en garant', '737', '', '80');
INSERT INTO co_cuentas VALUES ('', '115', '2016', '11', 'Reservas por p?rdidas y ganancias actuariales y otros ajustes', '738', '', '80');
INSERT INTO co_cuentas VALUES ('', '118', '2016', '11', 'Aportaciones de socios o propietarios', '739', '', '80');
INSERT INTO co_cuentas VALUES ('', '119', '2016', '11', 'Diferencias por ajuste del capital a euros', '740', '', '80');
INSERT INTO co_cuentas VALUES ('', '120', '2016', '12', 'Remanente', '741', 'PREVIO', '81');
INSERT INTO co_cuentas VALUES ('', '121', '2016', '12', 'Resultados negativos de ejercicios anteriores', '742', 'PREVIO', '81');
INSERT INTO co_cuentas VALUES ('', '129', '2016', '12', 'Resultado del ejercicio', '743', 'PYG', '81');
INSERT INTO co_cuentas VALUES ('', '130', '2016', '13', 'Subvenciones oficiales de capital', '744', '', '82');
INSERT INTO co_cuentas VALUES ('', '131', '2016', '13', 'Donaciones y legados de capital', '745', '', '82');
INSERT INTO co_cuentas VALUES ('', '132', '2016', '13', 'Otras subvenciones, donaciones y legados', '746', '', '82');
INSERT INTO co_cuentas VALUES ('', '133', '2016', '13', 'Ajustes por valoraci?n en activos financieros disponibles para la venta', '747', '', '82');
INSERT INTO co_cuentas VALUES ('', '1340', '2016', '13', 'Cobertura de flujos de efectivo', '748', '', '82');
INSERT INTO co_cuentas VALUES ('', '1341', '2016', '13', 'Cobertura de una inversi?n neta en un negocio en el extranjero', '749', '', '82');
INSERT INTO co_cuentas VALUES ('', '135', '2016', '13', 'Diferencias de conversi', '750', 'DIVPOS', '82');
INSERT INTO co_cuentas VALUES ('', '136', '2016', '13', 'Ajustes por valoraci?n en activos no corrientes y grupos enajenables de elementos, mantenidos para la venta', '751', '', '82');
INSERT INTO co_cuentas VALUES ('', '1370', '2016', '13', 'Ingresos fiscales por diferencias permanentes a distribuir en varios ejercicios', '752', '', '82');
INSERT INTO co_cuentas VALUES ('', '1371', '2016', '13', 'Ingresos fiscales por deducciones y bonificaciones a distribuir en varios ejercicios', '753', '', '82');
INSERT INTO co_cuentas VALUES ('', '140', '2016', '14', 'Provisi?n por retribuciones a largo plazo al personal', '754', '', '83');
INSERT INTO co_cuentas VALUES ('', '141', '2016', '14', 'Provisi?n para impuestos', '755', '', '83');
INSERT INTO co_cuentas VALUES ('', '142', '2016', '14', 'Provisi?n para otras responsabilidades', '756', '', '83');
INSERT INTO co_cuentas VALUES ('', '143', '2016', '14', 'Provisi?n por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '757', '', '83');
INSERT INTO co_cuentas VALUES ('', '145', '2016', '14', 'Provisi?n para actuaciones medioambientales', '758', '', '83');
INSERT INTO co_cuentas VALUES ('', '146', '2016', '14', 'Provisi?n para reestructuraciones', '759', '', '83');
INSERT INTO co_cuentas VALUES ('', '147', '2016', '14', 'Provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '760', '', '83');
INSERT INTO co_cuentas VALUES ('', '150', '2016', '15', 'Acciones o participaciones a largo plazo consideradas como pasivos financieros', '761', '', '84');
INSERT INTO co_cuentas VALUES ('', '1533', '2016', '15', 'Desembolsos no exigidos, empresas del grupo', '762', '', '84');
INSERT INTO co_cuentas VALUES ('', '1534', '2016', '15', 'Desembolsos no exigidos, empresas asociadas', '763', '', '84');
INSERT INTO co_cuentas VALUES ('', '1535', '2016', '15', 'Desembolsos no exigidos, otras partes vinculadas', '764', '', '84');
INSERT INTO co_cuentas VALUES ('', '1536', '2016', '15', 'Otros desembolsos no exigidos', '765', '', '84');
INSERT INTO co_cuentas VALUES ('', '1543', '2016', '15', 'Aportaciones no dinerarias pendientes, empresas del grupo', '766', '', '84');
INSERT INTO co_cuentas VALUES ('', '1544', '2016', '15', 'Aportaciones no dinerarias pendientes, empresas asociadas', '767', '', '84');
INSERT INTO co_cuentas VALUES ('', '1545', '2016', '15', 'Aportaciones no dinerarias pendientes, otras partes vinculadas', '768', '', '84');
INSERT INTO co_cuentas VALUES ('', '1546', '2016', '15', 'Otras aportaciones no dinerarias pendientes', '769', '', '84');
INSERT INTO co_cuentas VALUES ('', '1603', '2016', '16', 'Deudas a largo plazo con entidades de cr?dito, empresas del grupo', '770', '', '85');
INSERT INTO co_cuentas VALUES ('', '1604', '2016', '16', 'Deudas a largo plazo con entidades de cr?dito, empresas asociadas', '771', '', '85');
INSERT INTO co_cuentas VALUES ('', '1605', '2016', '16', 'Deudas a largo plazo con otras entidades de cr?dito vinculadas', '772', '', '85');
INSERT INTO co_cuentas VALUES ('', '1613', '2016', '16', 'Proveedores de inmovilizado a largo plazo, empresas del grupo', '773', '', '85');
INSERT INTO co_cuentas VALUES ('', '1614', '2016', '16', 'Proveedores de inmovilizado a largo plazo, empresas asociadas', '774', '', '85');
INSERT INTO co_cuentas VALUES ('', '1615', '2016', '16', 'Proveedores de inmovilizado a largo plazo, otras partes vinculadas', '775', '', '85');
INSERT INTO co_cuentas VALUES ('', '1623', '2016', '16', 'Acreedores por arrendamiento financiero a largo plazo, empresas de grupo', '776', '', '85');
INSERT INTO co_cuentas VALUES ('', '1624', '2016', '16', 'Acreedores por arrendamiento financiero a largo plazo, empresas asociadas', '777', '', '85');
INSERT INTO co_cuentas VALUES ('', '1625', '2016', '16', 'Acreedores por arrendamiento financiero a largo plazo, otras partes vinculadas.', '778', '', '85');
INSERT INTO co_cuentas VALUES ('', '1633', '2016', '16', 'Otras deudas a largo plazo, empresas del grupo', '779', '', '85');
INSERT INTO co_cuentas VALUES ('', '1634', '2016', '16', 'Otras deudas a largo plazo, empresas asociadas', '780', '', '85');
INSERT INTO co_cuentas VALUES ('', '1635', '2016', '16', 'Otras deudas a largo plazo, con otras partes vinculadas', '781', '', '85');
INSERT INTO co_cuentas VALUES ('', '170', '2016', '17', 'Deudas a largo plazo con entidades de cr?dito', '782', '', '86');
INSERT INTO co_cuentas VALUES ('', '171', '2016', '17', 'Deudas a largo plazo', '783', '', '86');
INSERT INTO co_cuentas VALUES ('', '172', '2016', '17', 'Deudas a largo plazo transformables en subvenciones, donaciones y legados', '784', '', '86');
INSERT INTO co_cuentas VALUES ('', '173', '2016', '17', 'Proveedores de inmovilizado a largo plazo', '785', '', '86');
INSERT INTO co_cuentas VALUES ('', '174', '2016', '17', 'Acreedores por arrendamiento financiero a largo plazo', '786', '', '86');
INSERT INTO co_cuentas VALUES ('', '175', '2016', '17', 'Efectos a pagar a largo plazo', '787', '', '86');
INSERT INTO co_cuentas VALUES ('', '1765', '2016', '17', 'Pasivos por derivados financieros a largo plazo, cartera de negociaci', '788', '', '86');
INSERT INTO co_cuentas VALUES ('', '1768', '2016', '17', 'Pasivos por derivados financieros a largo plazo, instrumentos de cobertura', '789', '', '86');
INSERT INTO co_cuentas VALUES ('', '177', '2016', '17', 'Obligaciones y bonos', '790', '', '86');
INSERT INTO co_cuentas VALUES ('', '178', '2016', '17', 'Obligaciones y bonos convertibles', '791', '', '86');
INSERT INTO co_cuentas VALUES ('', '179', '2016', '17', 'Deudas representadas en otros valores negociables', '792', '', '86');
INSERT INTO co_cuentas VALUES ('', '180', '2016', '18', 'Fianzas recibidas a largo plazo', '793', '', '87');
INSERT INTO co_cuentas VALUES ('', '181', '2016', '18', 'Anticipos recibidos por ventas o prestaciones de servicios a largo plazo', '794', '', '87');
INSERT INTO co_cuentas VALUES ('', '185', '2016', '18', 'Dep?sitos recibidos a largo plazo', '795', '', '87');
INSERT INTO co_cuentas VALUES ('', '189', '2016', '18', 'Garant?as financieras a largo plazo', '796', '', '87');
INSERT INTO co_cuentas VALUES ('', '190', '2016', '19', 'Acciones o participaciones emitidas', '797', '', '88');
INSERT INTO co_cuentas VALUES ('', '192', '2016', '19', 'Suscriptores de acciones', '798', '', '88');
INSERT INTO co_cuentas VALUES ('', '194', '2016', '19', 'Capital emitido pendiente de inscripci', '799', '', '88');
INSERT INTO co_cuentas VALUES ('', '195', '2016', '19', 'Acciones o participaciones emitidas consideradas como pasivos financieros', '800', '', '88');
INSERT INTO co_cuentas VALUES ('', '197', '2016', '19', 'Suscriptores de acciones consideradas como pasivos financieros', '801', '', '88');
INSERT INTO co_cuentas VALUES ('', '199', '2016', '19', 'Acciones o participaciones emitidas consideradas como pasivos financieros pendientes de inscripci', '802', '', '88');
INSERT INTO co_cuentas VALUES ('', '200', '2016', '20', 'Investigaci', '803', '', '89');
INSERT INTO co_cuentas VALUES ('', '201', '2016', '20', 'Desarrollo', '804', '', '89');
INSERT INTO co_cuentas VALUES ('', '202', '2016', '20', 'Concesiones administrativas', '805', '', '89');
INSERT INTO co_cuentas VALUES ('', '203', '2016', '20', 'Propiedad industrial', '806', '', '89');
INSERT INTO co_cuentas VALUES ('', '204', '2016', '20', 'Fondo de comercio', '807', '', '89');
INSERT INTO co_cuentas VALUES ('', '205', '2016', '20', 'Derechos de traspaso', '808', '', '89');
INSERT INTO co_cuentas VALUES ('', '206', '2016', '20', 'Aplicaciones inform?ticas', '809', '', '89');
INSERT INTO co_cuentas VALUES ('', '209', '2016', '20', 'Anticipos para inmovilizaciones intangibles', '810', '', '89');
INSERT INTO co_cuentas VALUES ('', '210', '2016', '21', 'Terrenos y bienes naturales', '811', '', '90');
INSERT INTO co_cuentas VALUES ('', '211', '2016', '21', 'Construcciones', '812', '', '90');
INSERT INTO co_cuentas VALUES ('', '212', '2016', '21', 'Instalaciones t?cnicas', '813', '', '90');
INSERT INTO co_cuentas VALUES ('', '213', '2016', '21', 'Maquinaria', '814', '', '90');
INSERT INTO co_cuentas VALUES ('', '214', '2016', '21', 'Utillaje', '815', '', '90');
INSERT INTO co_cuentas VALUES ('', '215', '2016', '21', 'Otras instalaciones', '816', '', '90');
INSERT INTO co_cuentas VALUES ('', '216', '2016', '21', 'Mobiliario', '817', '', '90');
INSERT INTO co_cuentas VALUES ('', '217', '2016', '21', 'Equipos para procesos de informaci', '818', '', '90');
INSERT INTO co_cuentas VALUES ('', '218', '2016', '21', 'Elementos de transporte', '819', '', '90');
INSERT INTO co_cuentas VALUES ('', '219', '2016', '21', 'Otro inmovilizado material', '820', '', '90');
INSERT INTO co_cuentas VALUES ('', '220', '2016', '22', 'Inversiones en terrenos y bienes naturales', '821', '', '91');
INSERT INTO co_cuentas VALUES ('', '221', '2016', '22', 'Inversiones en construcciones', '822', '', '91');
INSERT INTO co_cuentas VALUES ('', '230', '2016', '23', 'Adaptaci?n de terrenos y bienes naturales', '823', '', '92');
INSERT INTO co_cuentas VALUES ('', '231', '2016', '23', 'Construcciones en curso', '824', '', '92');
INSERT INTO co_cuentas VALUES ('', '232', '2016', '23', 'Instalaciones t?cnicas en montaje', '825', '', '92');
INSERT INTO co_cuentas VALUES ('', '233', '2016', '23', 'Maquinaria en montaje', '826', '', '92');
INSERT INTO co_cuentas VALUES ('', '237', '2016', '23', 'Equipos para procesos de informaci?n en montaje', '827', '', '92');
INSERT INTO co_cuentas VALUES ('', '239', '2016', '23', 'Anticipos para inmovilizaciones materiales', '828', '', '92');
INSERT INTO co_cuentas VALUES ('', '2403', '2016', '24', 'Participaciones a largo plazo en empresas del grupo', '829', '', '93');
INSERT INTO co_cuentas VALUES ('', '2404', '2016', '24', 'Participaciones a largo plazo en empresas asociadas', '830', '', '93');
INSERT INTO co_cuentas VALUES ('', '2405', '2016', '24', 'Participaciones a largo plazo en otras partes vinculadas', '831', '', '93');
INSERT INTO co_cuentas VALUES ('', '2413', '2016', '24', 'Valores representativos de deuda a largo plazo de empresas del grupo', '832', '', '93');
INSERT INTO co_cuentas VALUES ('', '2414', '2016', '24', 'Valores representativos de deuda a largo plazo de empresas asociadas', '833', '', '93');
INSERT INTO co_cuentas VALUES ('', '2415', '2016', '24', 'Valores representativos de deuda a largo plazo de otras partes vinculadas', '834', '', '93');
INSERT INTO co_cuentas VALUES ('', '2423', '2016', '24', 'Cr?ditos a largo plazo a empresas del grupo', '835', '', '93');
INSERT INTO co_cuentas VALUES ('', '2424', '2016', '24', 'Cr?ditos a largo plazo a empresas asociadas', '836', '', '93');
INSERT INTO co_cuentas VALUES ('', '2425', '2016', '24', 'Cr?ditos a largo plazo a otras partes vinculadas', '837', '', '93');
INSERT INTO co_cuentas VALUES ('', '2493', '2016', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas del grupo.', '838', '', '93');
INSERT INTO co_cuentas VALUES ('', '2494', '2016', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas asociadas.', '839', '', '93');
INSERT INTO co_cuentas VALUES ('', '2495', '2016', '24', 'Desembolsos pendientes sobre participaciones a largo plazo en otras partes vinculadas', '840', '', '93');
INSERT INTO co_cuentas VALUES ('', '250', '2016', '25', 'Inversiones financieras a largo plazo en instrumentos de patrimonio', '841', '', '94');
INSERT INTO co_cuentas VALUES ('', '251', '2016', '25', 'Valores representativos de deuda a largo plazo', '842', '', '94');
INSERT INTO co_cuentas VALUES ('', '252', '2016', '25', 'Cr?ditos a largo plazo', '843', '', '94');
INSERT INTO co_cuentas VALUES ('', '253', '2016', '25', 'Cr?ditos a largo plazo por enajenaci?n de inmovilizado', '844', '', '94');
INSERT INTO co_cuentas VALUES ('', '254', '2016', '25', 'Cr?ditos a largo plazo al personal', '845', '', '94');
INSERT INTO co_cuentas VALUES ('', '2550', '2016', '25', 'Activos por derivados financieros a largo plazo, cartera de negociaci', '846', '', '94');
INSERT INTO co_cuentas VALUES ('', '2553', '2016', '25', 'Activos por derivados financieros a largo plazo, instrumentos de cobertura', '847', '', '94');
INSERT INTO co_cuentas VALUES ('', '257', '2016', '25', 'Derechos de reembolso derivados de contratos de seguro relativos a retribuciones a largo plazo al personal', '848', '', '94');
INSERT INTO co_cuentas VALUES ('', '258', '2016', '25', 'Imposiciones a largo plazo', '849', '', '94');
INSERT INTO co_cuentas VALUES ('', '259', '2016', '25', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a largo plazo', '850', '', '94');
INSERT INTO co_cuentas VALUES ('', '260', '2016', '26', 'Fianzas constituidas a largo plazo', '851', '', '95');
INSERT INTO co_cuentas VALUES ('', '265', '2016', '26', 'Dep?sitos constituidos a largo plazo', '852', '', '95');
INSERT INTO co_cuentas VALUES ('', '2800', '2016', '28', 'Amortizaci?n acumulada de investigaci', '853', '', '96');
INSERT INTO co_cuentas VALUES ('', '2801', '2016', '28', 'Amortizaci?n acumulada de desarrollo', '854', '', '96');
INSERT INTO co_cuentas VALUES ('', '2802', '2016', '28', 'Amortizaci?n acumulada de concesiones administrativas', '855', '', '96');
INSERT INTO co_cuentas VALUES ('', '2803', '2016', '28', 'Amortizaci?n acumulada de propiedad industrial', '856', '', '96');
INSERT INTO co_cuentas VALUES ('', '2805', '2016', '28', 'Amortizaci?n acumulada de derechos de traspaso', '857', '', '96');
INSERT INTO co_cuentas VALUES ('', '2806', '2016', '28', 'Amortizaci?n acumulada de aplicaciones inform?ticas', '858', '', '96');
INSERT INTO co_cuentas VALUES ('', '2811', '2016', '28', 'Amortizaci?n acumulada de construcciones', '859', '', '96');
INSERT INTO co_cuentas VALUES ('', '2812', '2016', '28', 'Amortizaci?n acumulada de instalaciones t?cnicas', '860', '', '96');
INSERT INTO co_cuentas VALUES ('', '2813', '2016', '28', 'Amortizaci?n acumulada de maquinaria', '861', '', '96');
INSERT INTO co_cuentas VALUES ('', '2814', '2016', '28', 'Amortizaci?n acumulada de utillaje', '862', '', '96');
INSERT INTO co_cuentas VALUES ('', '2815', '2016', '28', 'Amortizaci?n acumulada de otras instalaciones', '863', '', '96');
INSERT INTO co_cuentas VALUES ('', '2816', '2016', '28', 'Amortizaci?n acumulada de mobiliario', '864', '', '96');
INSERT INTO co_cuentas VALUES ('', '2817', '2016', '28', 'Amortizaci?n acumulada de equipos para procesos de informaci', '865', '', '96');
INSERT INTO co_cuentas VALUES ('', '2818', '2016', '28', 'Amortizaci?n acumulada de elementos de transporte', '866', '', '96');
INSERT INTO co_cuentas VALUES ('', '2819', '2016', '28', 'Amortizaci?n acumulada de otro inmovilizado material', '867', '', '96');
INSERT INTO co_cuentas VALUES ('', '282', '2016', '28', 'Amortizaci?n acumulada de las inversiones inmobiliarias', '868', '', '96');
INSERT INTO co_cuentas VALUES ('', '2900', '2016', '29', 'Deterioro de valor de investigaci', '869', '', '97');
INSERT INTO co_cuentas VALUES ('', '2901', '2016', '29', 'Deterioro del valor de desarrollo', '870', '', '97');
INSERT INTO co_cuentas VALUES ('', '2902', '2016', '29', 'Deterioro de valor de concesiones administrativas', '871', '', '97');
INSERT INTO co_cuentas VALUES ('', '2903', '2016', '29', 'Deterioro de valor de propiedad industrial', '872', '', '97');
INSERT INTO co_cuentas VALUES ('', '2905', '2016', '29', 'Deterioro de valor de derechos de traspaso', '873', '', '97');
INSERT INTO co_cuentas VALUES ('', '2906', '2016', '29', 'Deterioro de valor de aplicaciones inform?ticas', '874', '', '97');
INSERT INTO co_cuentas VALUES ('', '2910', '2016', '29', 'Deterioro de valor de terrenos y bienes naturales', '875', '', '97');
INSERT INTO co_cuentas VALUES ('', '2911', '2016', '29', 'Deterioro de valor de construcciones', '876', '', '97');
INSERT INTO co_cuentas VALUES ('', '2912', '2016', '29', 'Deterioro de valor de instalaciones t?cnicas', '877', '', '97');
INSERT INTO co_cuentas VALUES ('', '2913', '2016', '29', 'Deterioro de valor de maquinaria', '878', '', '97');
INSERT INTO co_cuentas VALUES ('', '2914', '2016', '29', 'Deterioro de valor de utillaje', '879', '', '97');
INSERT INTO co_cuentas VALUES ('', '2915', '2016', '29', 'Deterioro de valor de otras instalaciones', '880', '', '97');
INSERT INTO co_cuentas VALUES ('', '2916', '2016', '29', 'Deterioro de valor de mobiliario', '881', '', '97');
INSERT INTO co_cuentas VALUES ('', '2917', '2016', '29', 'Deterioro de valor de equipos para procesos de informaci', '882', '', '97');
INSERT INTO co_cuentas VALUES ('', '2918', '2016', '29', 'Deterioro de valor de elementos de transporte', '883', '', '97');
INSERT INTO co_cuentas VALUES ('', '2919', '2016', '29', 'Deterioro de valor de otro inmovilizado material', '884', '', '97');
INSERT INTO co_cuentas VALUES ('', '2920', '2016', '29', 'Deterioro de valor de los terrenos y bienes naturales', '885', '', '97');
INSERT INTO co_cuentas VALUES ('', '2921', '2016', '29', 'Deterioro de valor de construcciones', '886', '', '97');
INSERT INTO co_cuentas VALUES ('', '2933', '2016', '29', 'Deterioro de valor de participaciones a largo plazo en empresas del grupo', '887', '', '97');
INSERT INTO co_cuentas VALUES ('', '2934', '2016', '29', 'Deterioro de valor de participaciones a largo plazo en empresas asociadas', '888', '', '97');
INSERT INTO co_cuentas VALUES ('', '2943', '2016', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas del grupo', '889', '', '97');
INSERT INTO co_cuentas VALUES ('', '2944', '2016', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas asociadas', '890', '', '97');
INSERT INTO co_cuentas VALUES ('', '2945', '2016', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo de otras partes vinculadas', '891', '', '97');
INSERT INTO co_cuentas VALUES ('', '2953', '2016', '29', 'Deterioro de valor de cr?ditos a largo plazo a empresas del grupo', '892', '', '97');
INSERT INTO co_cuentas VALUES ('', '2954', '2016', '29', 'Deterioro de valor de cr?ditos a largo plazo a empresas asociadas', '893', '', '97');
INSERT INTO co_cuentas VALUES ('', '2955', '2016', '29', 'Deterioro de valor de cr?ditos a largo plazo a otras partes vinculadas', '894', '', '97');
INSERT INTO co_cuentas VALUES ('', '297', '2016', '29', 'Deterioro de valor de valores representativos de deuda a largo plazo', '895', '', '97');
INSERT INTO co_cuentas VALUES ('', '298', '2016', '29', 'Deterioro de valor de cr?ditos a largo plazo', '896', '', '97');
INSERT INTO co_cuentas VALUES ('', '300', '2016', '30', 'Mercader?as a', '897', '', '98');
INSERT INTO co_cuentas VALUES ('', '301', '2016', '30', 'Mercader?as b', '898', '', '98');
INSERT INTO co_cuentas VALUES ('', '310', '2016', '31', 'Materias primas a', '899', '', '99');
INSERT INTO co_cuentas VALUES ('', '311', '2016', '31', 'Materias primas b', '900', '', '99');
INSERT INTO co_cuentas VALUES ('', '320', '2016', '32', 'Elementos y conjuntos incorporables', '901', '', '100');
INSERT INTO co_cuentas VALUES ('', '321', '2016', '32', 'Combustibles', '902', '', '100');
INSERT INTO co_cuentas VALUES ('', '322', '2016', '32', 'Repuestos', '903', '', '100');
INSERT INTO co_cuentas VALUES ('', '325', '2016', '32', 'Materiales diversos', '904', '', '100');
INSERT INTO co_cuentas VALUES ('', '326', '2016', '32', 'Embalajes', '905', '', '100');
INSERT INTO co_cuentas VALUES ('', '327', '2016', '32', 'Envases', '906', '', '100');
INSERT INTO co_cuentas VALUES ('', '328', '2016', '32', 'Material de oficina', '907', '', '100');
INSERT INTO co_cuentas VALUES ('', '330', '2016', '33', 'Productos en curso a', '908', '', '101');
INSERT INTO co_cuentas VALUES ('', '331', '2016', '33', 'Productos en curso b', '909', '', '101');
INSERT INTO co_cuentas VALUES ('', '340', '2016', '34', 'Productos semiterminados a', '910', '', '102');
INSERT INTO co_cuentas VALUES ('', '341', '2016', '34', 'Productos semiterminados b', '911', '', '102');
INSERT INTO co_cuentas VALUES ('', '350', '2016', '35', 'Productos terminados a', '912', '', '103');
INSERT INTO co_cuentas VALUES ('', '351', '2016', '35', 'Productos terminados b', '913', '', '103');
INSERT INTO co_cuentas VALUES ('', '360', '2016', '36', 'Subproductos a', '914', '', '104');
INSERT INTO co_cuentas VALUES ('', '361', '2016', '36', 'Subproductos b', '915', '', '104');
INSERT INTO co_cuentas VALUES ('', '365', '2016', '36', 'Residuos a', '916', '', '104');
INSERT INTO co_cuentas VALUES ('', '366', '2016', '36', 'Residuos b', '917', '', '104');
INSERT INTO co_cuentas VALUES ('', '368', '2016', '36', 'Materiales recuperados a', '918', '', '104');
INSERT INTO co_cuentas VALUES ('', '369', '2016', '36', 'Materiales recuperados b', '919', '', '104');
INSERT INTO co_cuentas VALUES ('', '390', '2016', '39', 'Deterioro de valor de las mercader?as', '920', '', '105');
INSERT INTO co_cuentas VALUES ('', '391', '2016', '39', 'Deterioro de valor de las materias primas', '921', '', '105');
INSERT INTO co_cuentas VALUES ('', '392', '2016', '39', 'Deterioro de valor de otros aprovisionamientos', '922', '', '105');
INSERT INTO co_cuentas VALUES ('', '393', '2016', '39', 'Deterioro de valor de los productos en curso', '923', '', '105');
INSERT INTO co_cuentas VALUES ('', '394', '2016', '39', 'Deterioro de valor de los productos semiterminados', '924', '', '105');
INSERT INTO co_cuentas VALUES ('', '395', '2016', '39', 'Deterioro de valor de los productos terminados', '925', '', '105');
INSERT INTO co_cuentas VALUES ('', '396', '2016', '39', 'Deterioro de valor de los subproductos, residuos y materiales recuperados', '926', '', '105');
INSERT INTO co_cuentas VALUES ('', '400', '2016', '40', 'Proveedores', '927', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4000', '2016', '40', 'Proveedores (euros)', '928', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4004', '2016', '40', 'Proveedores (moneda extranjera)', '929', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4009', '2016', '40', 'Proveedores, facturas pendientes de recibir o de formalizar', '930', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '401', '2016', '40', 'Proveedores, efectos comerciales a pagar', '931', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4030', '2016', '40', 'Proveedores, empresas del grupo (euros)', '932', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4031', '2016', '40', 'Efectos comerciales a pagar, empresas del grupo', '933', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4034', '2016', '40', 'Proveedores, empresas del grupo (moneda extranjera)', '934', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4036', '2016', '40', 'Envases y embalajes a devolver a proveedores, empresas del grupo', '935', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '4039', '2016', '40', 'Proveedores, empresas del grupo, facturas pendientes de recibir o de formalizar', '936', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '404', '2016', '40', 'Proveedores, empresas asociadas', '937', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '405', '2016', '40', 'Proveedores, otras partes vinculadas', '938', '', '106');
INSERT INTO co_cuentas VALUES ('', '406', '2016', '40', 'Envases y embalajes a devolver a proveedores', '939', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '407', '2016', '40', 'Anticipos a proveedores', '940', 'PROVEE', '106');
INSERT INTO co_cuentas VALUES ('', '410', '2016', '41', 'Acreedores', '941', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '4100', '2016', '41', 'Acreedores por prestaciones de servicios (euros)', '942', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '4104', '2016', '41', 'Acreedores por prestaciones de servicios, (moneda extranjera)', '943', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '4109', '2016', '41', 'Acreedores por prestaciones de servicios, facturas pendientes de recibir o de formalizar', '944', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '411', '2016', '41', 'Acreedores, efectos comerciales a pagar', '945', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '419', '2016', '41', 'Acreedores por operaciones en com?n', '946', 'ACREED', '107');
INSERT INTO co_cuentas VALUES ('', '430', '2016', '43', 'Clientes', '947', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4300', '2016', '43', 'Clientes (euros)', '948', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4304', '2016', '43', 'Clientes (moneda extranjera)', '949', '', '108');
INSERT INTO co_cuentas VALUES ('', '4309', '2016', '43', 'Clientes, facturas pendientes de formalizar', '950', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4310', '2016', '43', 'Efectos comerciales en cartera', '951', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4311', '2016', '43', 'Efectos comerciales descontados', '952', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4312', '2016', '43', 'Efectos comerciales en gesti?n de cobro', '953', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4315', '2016', '43', 'Efectos comerciales impagados', '954', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '432', '2016', '43', 'Clientes, operaciones de factoring', '955', '', '108');
INSERT INTO co_cuentas VALUES ('', '4330', '2016', '43', 'Clientes empresas del grupo (euros)', '956', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4331', '2016', '43', 'Efectos comerciales a cobrar, empresas del grupo', '957', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4332', '2016', '43', 'Clientes empresas del grupo, operaciones de factoring', '958', '', '108');
INSERT INTO co_cuentas VALUES ('', '4334', '2016', '43', 'Clientes empresas del grupo (moneda extranjera)', '959', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4336', '2016', '43', 'Clientes empresas del grupo de dudoso cobro', '960', '', '108');
INSERT INTO co_cuentas VALUES ('', '4337', '2016', '43', 'Envases y embalajes a devolver a clientes, empresas del grupo', '961', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4339', '2016', '43', 'Clientes empresas del grupo, facturas pendientes de formalizar', '962', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '434', '2016', '43', 'Clientes, empresas asociadas', '963', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '435', '2016', '43', 'Clientes, otras partes vinculadas', '964', '', '108');
INSERT INTO co_cuentas VALUES ('', '436', '2016', '43', 'Clientes de dudoso cobro', '965', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '437', '2016', '43', 'Envases y embalajes a devolver por clientes', '966', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '438', '2016', '43', 'Anticipos de clientes', '967', 'CLIENT', '108');
INSERT INTO co_cuentas VALUES ('', '4400', '2016', '44', 'Deudores (euros)', '968', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4404', '2016', '44', 'Deudores (moneda extranjera)', '969', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4409', '2016', '44', 'Deudores, facturas pendientes de formalizar', '970', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4410', '2016', '44', 'Deudores, efectos comerciales en cartera', '971', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4411', '2016', '44', 'Deudores, efectos comerciales descontados', '972', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4412', '2016', '44', 'Deudores, efectos comerciales en gesti?n de cobro', '973', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '4415', '2016', '44', 'Deudores, efectos comerciales impagados', '974', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '446', '2016', '44', 'Deudores de dudoso cobro', '975', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '449', '2016', '44', 'Deudores por operaciones en com?n', '976', 'CLIENT', '109');
INSERT INTO co_cuentas VALUES ('', '460', '2016', '46', 'Anticipos de remuneraciones', '977', '', '110');
INSERT INTO co_cuentas VALUES ('', '465', '2016', '46', 'Remuneraciones pendientes de pago', '978', '', '110');
INSERT INTO co_cuentas VALUES ('', '466', '2016', '46', 'Remuneraciones mediante sistemas de aportaci?n definida pendientes de pago', '979', '', '110');
INSERT INTO co_cuentas VALUES ('', '4700', '2016', '47', 'Hacienda p?blica, deudora por iva', '980', 'IVADEU', '111');
INSERT INTO co_cuentas VALUES ('', '4708', '2016', '47', 'Hacienda p?blica, deudora por subvenciones concedidas', '981', '', '111');
INSERT INTO co_cuentas VALUES ('', '4709', '2016', '47', 'Hacienda p?blica, deudora por devoluci?n de impuestos', '982', '', '111');
INSERT INTO co_cuentas VALUES ('', '471', '2016', '47', 'Organismos de la seguridad social, deudores', '983', '', '111');
INSERT INTO co_cuentas VALUES ('', '472', '2016', '47', 'Hacienda p?blica, iva soportado', '984', 'IVASOP', '111');
INSERT INTO co_cuentas VALUES ('', '473', '2016', '47', 'Hacienda p?blica, retenciones y pagos a cuenta', '985', 'IRPF', '111');
INSERT INTO co_cuentas VALUES ('', '4740', '2016', '47', 'Activos por diferencias temporarias deducibles', '986', '', '111');
INSERT INTO co_cuentas VALUES ('', '4742', '2016', '47', 'Derechos por deducciones y bonificaciones pendientes de aplicar', '987', '', '111');
INSERT INTO co_cuentas VALUES ('', '4745', '2016', '47', 'Cr?dito por p?rdidas a compensar del ejercicio', '988', '', '111');
INSERT INTO co_cuentas VALUES ('', '4750', '2016', '47', 'Hacienda p?blica, acreedora por iva', '989', 'IVAACR', '111');
INSERT INTO co_cuentas VALUES ('', '4751', '2016', '47', 'Hacienda p?blica, acreedora por retenciones practicadas', '990', 'IRPFPR', '111');
INSERT INTO co_cuentas VALUES ('', '4752', '2016', '47', 'Hacienda p?blica, acreedora por impuesto sobre sociedades', '991', '', '111');
INSERT INTO co_cuentas VALUES ('', '4758', '2016', '47', 'Hacienda p?blica, acreedora por subvenciones a reintegrar', '992', '', '111');
INSERT INTO co_cuentas VALUES ('', '476', '2016', '47', 'Organismos de la seguridad social, acreedores', '993', '', '111');
INSERT INTO co_cuentas VALUES ('', '477', '2016', '47', 'Hacienda p?blica, iva repercutido', '994', 'IVAREP', '111');
INSERT INTO co_cuentas VALUES ('', '479', '2016', '47', 'Pasivos por diferencias temporarias imponibles', '995', '', '111');
INSERT INTO co_cuentas VALUES ('', '480', '2016', '48', 'Gastos anticipados', '996', '', '112');
INSERT INTO co_cuentas VALUES ('', '485', '2016', '48', 'Ingresos anticipados', '997', '', '112');
INSERT INTO co_cuentas VALUES ('', '490', '2016', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales', '998', '', '113');
INSERT INTO co_cuentas VALUES ('', '4933', '2016', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas del grupo', '999', '', '113');
INSERT INTO co_cuentas VALUES ('', '4934', '2016', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas asociadas', '1000', '', '113');
INSERT INTO co_cuentas VALUES ('', '4935', '2016', '49', 'Deterioro de valor de cr?ditos por operaciones comerciales con otras partes vinculadas', '1001', '', '113');
INSERT INTO co_cuentas VALUES ('', '4994', '2016', '49', 'Provisi?n por contratos onerosos', '1002', '', '113');
INSERT INTO co_cuentas VALUES ('', '4999', '2016', '49', 'Provisi?n para otras operaciones comerciales', '1003', '', '113');
INSERT INTO co_cuentas VALUES ('', '500', '2016', '50', 'Obligaciones y bonos a corto plazo', '1004', '', '114');
INSERT INTO co_cuentas VALUES ('', '501', '2016', '50', 'Obligaciones y bonos convertibles a corto plazo', '1005', '', '114');
INSERT INTO co_cuentas VALUES ('', '502', '2016', '50', 'Acciones o participaciones a corto plazo consideradas como pasivos financieros', '1006', '', '114');
INSERT INTO co_cuentas VALUES ('', '505', '2016', '50', 'Deudas representadas en otros valores negociables a corto plazo', '1007', '', '114');
INSERT INTO co_cuentas VALUES ('', '506', '2016', '50', 'Intereses a corto plazo de empr?stitos y otras emisiones an?logas', '1008', '', '114');
INSERT INTO co_cuentas VALUES ('', '507', '2016', '50', 'Dividendos de acciones o participaciones consideradas como pasivos financieros', '1009', '', '114');
INSERT INTO co_cuentas VALUES ('', '5090', '2016', '50', 'Obligaciones y bonos amortizados', '1010', '', '114');
INSERT INTO co_cuentas VALUES ('', '5091', '2016', '50', 'Obligaciones y bonos convertibles amortizados', '1011', '', '114');
INSERT INTO co_cuentas VALUES ('', '5095', '2016', '50', 'Otros valores negociables amortizados', '1012', '', '114');
INSERT INTO co_cuentas VALUES ('', '5103', '2016', '51', 'Deudas a corto plazo con entidades de cr?dito, empresas del grupo', '1013', '', '115');
INSERT INTO co_cuentas VALUES ('', '5104', '2016', '51', 'Deudas a corto plazo con entidades de cr?dito, empresas asociadas', '1014', '', '115');
INSERT INTO co_cuentas VALUES ('', '5105', '2016', '51', 'Deudas a corto plazo con otras entidades de cr?dito vinculadas', '1015', '', '115');
INSERT INTO co_cuentas VALUES ('', '5113', '2016', '51', 'Proveedores de inmovilizado a corto plazo, empresas del grupo', '1016', '', '115');
INSERT INTO co_cuentas VALUES ('', '5114', '2016', '51', 'Proveedores de inmovilizado a corto plazo, empresas asociadas', '1017', '', '115');
INSERT INTO co_cuentas VALUES ('', '5115', '2016', '51', 'Proveedores de inmovilizado a corto plazo, otras partes vinculadas', '1018', '', '115');
INSERT INTO co_cuentas VALUES ('', '5123', '2016', '51', 'Acreedores por arrendamiento financiero a corto plazo, empresas del grupo', '1019', '', '115');
INSERT INTO co_cuentas VALUES ('', '5124', '2016', '51', 'Acreedores por arrendamiento financiero a corto plazo, empresas asociadas', '1020', '', '115');
INSERT INTO co_cuentas VALUES ('', '5125', '2016', '51', 'Acreedores por arrendamiento financiero a corto plazo, otras partes vinculadas', '1021', '', '115');
INSERT INTO co_cuentas VALUES ('', '5133', '2016', '51', 'Otras deudas a corto plazo con empresas del grupo', '1022', '', '115');
INSERT INTO co_cuentas VALUES ('', '5134', '2016', '51', 'Otras deudas a corto plazo con empresas asociadas', '1023', '', '115');
INSERT INTO co_cuentas VALUES ('', '5135', '2016', '51', 'Otras deudas a corto plazo con otras partes vinculadas', '1024', '', '115');
INSERT INTO co_cuentas VALUES ('', '5143', '2016', '51', 'Intereses a corto plazo de deudas, empresas del grupo', '1025', '', '115');
INSERT INTO co_cuentas VALUES ('', '5144', '2016', '51', 'Intereses a corto plazo de deudas, empresas asociadas', '1026', '', '115');
INSERT INTO co_cuentas VALUES ('', '5145', '2016', '51', 'Intereses a corto plazo de deudas, otras partes vinculadas', '1027', '', '115');
INSERT INTO co_cuentas VALUES ('', '5200', '2016', '52', 'Pr?stamos a corto plazo de entidades de cr?dito', '1028', '', '116');
INSERT INTO co_cuentas VALUES ('', '5201', '2016', '52', 'Deudas a corto plazo por cr?dito dispuesto', '1029', '', '116');
INSERT INTO co_cuentas VALUES ('', '5208', '2016', '52', 'Deudas por efectos descontados', '1030', '', '116');
INSERT INTO co_cuentas VALUES ('', '5209', '2016', '52', 'Deudas por operaciones de factoring', '1031', '', '116');
INSERT INTO co_cuentas VALUES ('', '521', '2016', '52', 'Deudas a corto plazo', '1032', '', '116');
INSERT INTO co_cuentas VALUES ('', '522', '2016', '52', 'Deudas a corto plazo transformables en subvenciones, donaciones y legados', '1033', '', '116');
INSERT INTO co_cuentas VALUES ('', '523', '2016', '52', 'Proveedores de inmovilizado a corto plazo', '1034', '', '116');
INSERT INTO co_cuentas VALUES ('', '524', '2016', '52', 'Acreedores por arrendamiento financiero a corto plazo', '1035', '', '116');
INSERT INTO co_cuentas VALUES ('', '525', '2016', '52', 'Efectos a pagar a corto plazo', '1036', '', '116');
INSERT INTO co_cuentas VALUES ('', '526', '2016', '52', 'Dividendo activo a pagar', '1037', '', '116');
INSERT INTO co_cuentas VALUES ('', '527', '2016', '52', 'Intereses a corto plazo de deudas con entidades de cr?dito', '1038', '', '116');
INSERT INTO co_cuentas VALUES ('', '528', '2016', '52', 'Intereses a corto plazo de deudas', '1039', '', '116');
INSERT INTO co_cuentas VALUES ('', '5290', '2016', '52', 'Provisi?n a corto plazo por retribuciones al personal', '1040', '', '116');
INSERT INTO co_cuentas VALUES ('', '5291', '2016', '52', 'Provisi?n a corto plazo para impuestos', '1041', '', '116');
INSERT INTO co_cuentas VALUES ('', '5292', '2016', '52', 'Provisi?n a corto plazo para otras responsabilidades', '1042', '', '116');
INSERT INTO co_cuentas VALUES ('', '5293', '2016', '52', 'Provisi?n a corto plazo por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '1043', '', '116');
INSERT INTO co_cuentas VALUES ('', '5295', '2016', '52', 'Provisi?n a corto plazo para actuaciones medioambientales', '1044', '', '116');
INSERT INTO co_cuentas VALUES ('', '5296', '2016', '52', 'Provisi?n a corto plazo para reestructuraciones', '1045', '', '116');
INSERT INTO co_cuentas VALUES ('', '5297', '2016', '52', 'Provisi?n a corto plazo por transacciones con pagos basados en instrumentos de patrimonio', '1046', '', '116');
INSERT INTO co_cuentas VALUES ('', '5303', '2016', '53', 'Participaciones a corto plazo, en empresas del grupo', '1047', '', '117');
INSERT INTO co_cuentas VALUES ('', '5304', '2016', '53', 'Participaciones a corto plazo, en empresas asociadas', '1048', '', '117');
INSERT INTO co_cuentas VALUES ('', '5305', '2016', '53', 'Participaciones a corto plazo, en otras partes vinculadas', '1049', '', '117');
INSERT INTO co_cuentas VALUES ('', '5313', '2016', '53', 'Valores representativos de deuda a corto plazo de empresas del grupo', '1050', '', '117');
INSERT INTO co_cuentas VALUES ('', '5314', '2016', '53', 'Valores representativos de deuda a corto plazo de empresas asociadas', '1051', '', '117');
INSERT INTO co_cuentas VALUES ('', '5315', '2016', '53', 'Valores representativos de deuda a corto plazo de otras partes vinculadas', '1052', '', '117');
INSERT INTO co_cuentas VALUES ('', '5323', '2016', '53', 'Cr?ditos a corto plazo a empresas del grupo', '1053', '', '117');
INSERT INTO co_cuentas VALUES ('', '5324', '2016', '53', 'Cr?ditos a corto plazo a empresas asociadas', '1054', '', '117');
INSERT INTO co_cuentas VALUES ('', '5325', '2016', '53', 'Cr?ditos a corto plazo a otras partes vinculadas', '1055', '', '117');
INSERT INTO co_cuentas VALUES ('', '5333', '2016', '53', 'Intereses a corto plazo de valores representativos de deuda de empresas del grupo', '1056', '', '117');
INSERT INTO co_cuentas VALUES ('', '5334', '2016', '53', 'Intereses a corto plazo de valores representativos de deuda de empresas asociadas', '1057', '', '117');
INSERT INTO co_cuentas VALUES ('', '5335', '2016', '53', 'Intereses a corto plazo de valores representativos de deuda de otras partes vinculadas', '1058', '', '117');
INSERT INTO co_cuentas VALUES ('', '5343', '2016', '53', 'Intereses a corto plazo de cr?ditos a empresas del grupo', '1059', '', '117');
INSERT INTO co_cuentas VALUES ('', '5344', '2016', '53', 'Intereses a corto plazo de cr?ditos a empresas asociadas', '1060', '', '117');
INSERT INTO co_cuentas VALUES ('', '5345', '2016', '53', 'Intereses a corto plazo de cr?ditos a otras partes vinculadas', '1061', '', '117');
INSERT INTO co_cuentas VALUES ('', '5353', '2016', '53', 'Dividendo a cobrar de empresas de grupo', '1062', '', '117');
INSERT INTO co_cuentas VALUES ('', '5354', '2016', '53', 'Dividendo a cobrar de empresas asociadas', '1063', '', '117');
INSERT INTO co_cuentas VALUES ('', '5355', '2016', '53', 'Dividendo a cobrar de otras partes vinculadas', '1064', '', '117');
INSERT INTO co_cuentas VALUES ('', '5393', '2016', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas del grupo.', '1065', '', '117');
INSERT INTO co_cuentas VALUES ('', '5394', '2016', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas asociadas.', '1066', '', '117');
INSERT INTO co_cuentas VALUES ('', '5395', '2016', '53', 'Desembolsos pendientes sobre participaciones a corto plazo en otras partes vinculadas', '1067', '', '117');
INSERT INTO co_cuentas VALUES ('', '540', '2016', '54', 'Inversiones financieras a corto plazo en instrumentos de patrimonio', '1068', '', '118');
INSERT INTO co_cuentas VALUES ('', '541', '2016', '54', 'Valores representativos de deuda a corto plazo', '1069', '', '118');
INSERT INTO co_cuentas VALUES ('', '542', '2016', '54', 'Cr?ditos a corto plazo', '1070', '', '118');
INSERT INTO co_cuentas VALUES ('', '543', '2016', '54', 'Cr?ditos a corto plazo por enajenaci?n de inmovilizado', '1071', '', '118');
INSERT INTO co_cuentas VALUES ('', '544', '2016', '54', 'Cr?ditos a corto plazo al personal', '1072', '', '118');
INSERT INTO co_cuentas VALUES ('', '545', '2016', '54', 'Dividendo a cobrar', '1073', '', '118');
INSERT INTO co_cuentas VALUES ('', '546', '2016', '54', 'Intereses a corto plazo de valores representativos de deudas', '1074', '', '118');
INSERT INTO co_cuentas VALUES ('', '547', '2016', '54', 'Intereses a corto plazo de cr?ditos', '1075', '', '118');
INSERT INTO co_cuentas VALUES ('', '548', '2016', '54', 'Imposiciones a corto plazo', '1076', '', '118');
INSERT INTO co_cuentas VALUES ('', '549', '2016', '54', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a corto plazo', '1077', '', '118');
INSERT INTO co_cuentas VALUES ('', '550', '2016', '55', 'Titular de la explotaci', '1078', '', '119');
INSERT INTO co_cuentas VALUES ('', '551', '2016', '55', 'Cuenta corriente con socios y administradores', '1079', '', '119');
INSERT INTO co_cuentas VALUES ('', '5523', '2016', '55', 'Cuenta corriente con empresas del grupo', '1080', '', '119');
INSERT INTO co_cuentas VALUES ('', '5524', '2016', '55', 'Cuenta corriente con empresas asociadas', '1081', '', '119');
INSERT INTO co_cuentas VALUES ('', '5525', '2016', '55', 'Cuenta corriente con otras partes vinculadas', '1082', '', '119');
INSERT INTO co_cuentas VALUES ('', '5530', '2016', '55', 'Socios de sociedad disuelta', '1083', '', '119');
INSERT INTO co_cuentas VALUES ('', '5531', '2016', '55', 'Socios, cuenta de fusi', '1084', '', '119');
INSERT INTO co_cuentas VALUES ('', '5532', '2016', '55', 'Socios de sociedad escindida', '1085', '', '119');
INSERT INTO co_cuentas VALUES ('', '5533', '2016', '55', 'Socios, cuenta de escisi', '1086', '', '119');
INSERT INTO co_cuentas VALUES ('', '554', '2016', '55', 'Cuenta corriente con uniones temporales de empresas y comunidades de bienes', '1087', '', '119');
INSERT INTO co_cuentas VALUES ('', '555', '2016', '55', 'Partidas pendientes de aplicaci', '1088', '', '119');
INSERT INTO co_cuentas VALUES ('', '5563', '2016', '55', 'Desembolsos exigidos sobre participaciones, empresas del grupo', '1089', '', '119');
INSERT INTO co_cuentas VALUES ('', '5564', '2016', '55', 'Desembolsos exigidos sobre participaciones, empresas asociadas', '1090', '', '119');
INSERT INTO co_cuentas VALUES ('', '5565', '2016', '55', 'Desembolsos exigidos sobre participaciones, otras partes vinculadas', '1091', '', '119');
INSERT INTO co_cuentas VALUES ('', '5566', '2016', '55', 'Desembolsos exigidos sobre participaciones de otras empresas', '1092', '', '119');
INSERT INTO co_cuentas VALUES ('', '557', '2016', '55', 'Dividendo activo a cuenta', '1093', '', '119');
INSERT INTO co_cuentas VALUES ('', '5580', '2016', '55', 'Socios por desembolsos exigidos sobre acciones o participaciones ordinarias', '1094', '', '119');
INSERT INTO co_cuentas VALUES ('', '5585', '2016', '55', 'Socios por desembolsos exigidos sobre acciones o participaciones consideradas como pasivos financieros', '1095', '', '119');
INSERT INTO co_cuentas VALUES ('', '5590', '2016', '55', 'Activos por derivados financieros a corto plazo, cartera de negociaci', '1096', '', '119');
INSERT INTO co_cuentas VALUES ('', '5593', '2016', '55', 'Activos por derivados financieros a corto plazo, instrumentos de cobertura', '1097', '', '119');
INSERT INTO co_cuentas VALUES ('', '5595', '2016', '55', 'Pasivos por derivados financieros a corto plazo, cartera de negociaci', '1098', '', '119');
INSERT INTO co_cuentas VALUES ('', '5598', '2016', '55', 'Pasivos por derivados financieros a corto plazo, instrumentos de cobertura', '1099', '', '119');
INSERT INTO co_cuentas VALUES ('', '560', '2016', '56', 'Fianzas recibidas a corto plazo', '1100', '', '120');
INSERT INTO co_cuentas VALUES ('', '561', '2016', '56', 'Dep?sitos recibidos a corto plazo', '1101', '', '120');
INSERT INTO co_cuentas VALUES ('', '565', '2016', '56', 'Fianzas constituidas a corto plazo', '1102', '', '120');
INSERT INTO co_cuentas VALUES ('', '566', '2016', '56', 'Dep?sitos constituidos a corto plazo', '1103', '', '120');
INSERT INTO co_cuentas VALUES ('', '567', '2016', '56', 'Intereses pagados por anticipado', '1104', '', '120');
INSERT INTO co_cuentas VALUES ('', '568', '2016', '56', 'Intereses cobrados por anticipado', '1105', '', '120');
INSERT INTO co_cuentas VALUES ('', '569', '2016', '56', 'Garant?as financieras a corto plazo', '1106', '', '120');
INSERT INTO co_cuentas VALUES ('', '570', '2016', '57', 'Caja, euros', '1107', 'CAJA', '121');
INSERT INTO co_cuentas VALUES ('', '571', '2016', '57', 'Caja, moneda extranjera', '1108', '', '121');
INSERT INTO co_cuentas VALUES ('', '572', '2016', '57', 'Bancos e instituciones de cr?dito c/c vista, euros', '1109', '', '121');
INSERT INTO co_cuentas VALUES ('', '573', '2016', '57', 'Bancos e instituciones de cr?dito c/c vista, moneda extranjera', '1110', '', '121');
INSERT INTO co_cuentas VALUES ('', '574', '2016', '57', 'Bancos e instituciones de cr?dito, cuentas de ahorro, euros', '1111', '', '121');
INSERT INTO co_cuentas VALUES ('', '575', '2016', '57', 'Bancos e instituciones de cr?dito, cuentas de ahorro, moneda extranjera', '1112', '', '121');
INSERT INTO co_cuentas VALUES ('', '576', '2016', '57', 'Inversiones a corto plazo de gran liquidez', '1113', '', '121');
INSERT INTO co_cuentas VALUES ('', '580', '2016', '58', 'Inmovilizado', '1114', '', '122');
INSERT INTO co_cuentas VALUES ('', '581', '2016', '58', 'Inversiones con personas y entidades vinculadas', '1115', '', '122');
INSERT INTO co_cuentas VALUES ('', '582', '2016', '58', 'Inversiones financieras', '1116', '', '122');
INSERT INTO co_cuentas VALUES ('', '583', '2016', '58', 'Existencias, deudores comerciales y otras cuentas a cobrar', '1117', '', '122');
INSERT INTO co_cuentas VALUES ('', '584', '2016', '58', 'Otros activos', '1118', '', '122');
INSERT INTO co_cuentas VALUES ('', '585', '2016', '58', 'Provisiones', '1119', '', '122');
INSERT INTO co_cuentas VALUES ('', '586', '2016', '58', 'Deudas con caracter?sticas especiales', '1120', '', '122');
INSERT INTO co_cuentas VALUES ('', '587', '2016', '58', 'Deudas con personas y entidades vinculadas', '1121', '', '122');
INSERT INTO co_cuentas VALUES ('', '588', '2016', '58', 'Acreedores comerciales y otras cuentas a pagar', '1122', '', '122');
INSERT INTO co_cuentas VALUES ('', '589', '2016', '58', 'Otros pasivos', '1123', '', '122');
INSERT INTO co_cuentas VALUES ('', '5933', '2016', '59', 'Deterioro de valor de participaciones a corto plazo en empresas del grupo', '1124', '', '123');
INSERT INTO co_cuentas VALUES ('', '5934', '2016', '59', 'Deterioro de valor de participaciones a corto plazo en empresas asociadas', '1125', '', '123');
INSERT INTO co_cuentas VALUES ('', '5943', '2016', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas del grupo', '1126', '', '123');
INSERT INTO co_cuentas VALUES ('', '5944', '2016', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas asociadas', '1127', '', '123');
INSERT INTO co_cuentas VALUES ('', '5945', '2016', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo de otras partes vinculadas', '1128', '', '123');
INSERT INTO co_cuentas VALUES ('', '5953', '2016', '59', 'Deterioro de valor de cr?ditos a corto plazo a empresas del grupo', '1129', '', '123');
INSERT INTO co_cuentas VALUES ('', '5954', '2016', '59', 'Deterioro de valor de cr?ditos a corto plazo a empresas asociadas', '1130', '', '123');
INSERT INTO co_cuentas VALUES ('', '5955', '2016', '59', 'Deterioro de valor de cr?ditos a corto plazo a otras partes vinculadas', '1131', '', '123');
INSERT INTO co_cuentas VALUES ('', '597', '2016', '59', 'Deterioro de valor de valores representativos de deuda a corto plazo', '1132', '', '123');
INSERT INTO co_cuentas VALUES ('', '598', '2016', '59', 'Deterioro de valor de cr?ditos a corto plazo', '1133', '', '123');
INSERT INTO co_cuentas VALUES ('', '5990', '2016', '59', 'Deterioro de valor de inmovilizado no corriente mantenido para la venta', '1134', '', '123');
INSERT INTO co_cuentas VALUES ('', '5991', '2016', '59', 'Deterioro de valor de inversiones con personas y entidades vinculadas no corrientes mantenidas para la venta', '1135', '', '123');
INSERT INTO co_cuentas VALUES ('', '5992', '2016', '59', 'Deterioro de valor de inversiones financieras no corrientes mantenidas para la venta', '1136', '', '123');
INSERT INTO co_cuentas VALUES ('', '5993', '2016', '59', 'Deterioro de valor de existencias, deudores comerciales y otras cuentas a cobrar integrados en un grupo enajenable mantenido para la venta', '1137', '', '123');
INSERT INTO co_cuentas VALUES ('', '5994', '2016', '59', 'Deterioro de valor de otros activos mantenidos para la venta', '1138', '', '123');
INSERT INTO co_cuentas VALUES ('', '600', '2016', '60', 'Compras de mercader?as', '1139', 'COMPRA', '124');
INSERT INTO co_cuentas VALUES ('', '601', '2016', '60', 'Compras de materias primas', '1140', '', '124');
INSERT INTO co_cuentas VALUES ('', '602', '2016', '60', 'Compras de otros aprovisionamientos', '1141', '', '124');
INSERT INTO co_cuentas VALUES ('', '6060', '2016', '60', 'Descuentos sobre compras por pronto pago de mercader?as', '1142', '', '124');
INSERT INTO co_cuentas VALUES ('', '6061', '2016', '60', 'Descuentos sobre compras por pronto pago de materias primas', '1143', '', '124');
INSERT INTO co_cuentas VALUES ('', '6062', '2016', '60', 'Descuentos sobre compras por pronto pago de otros aprovisionamientos', '1144', '', '124');
INSERT INTO co_cuentas VALUES ('', '607', '2016', '60', 'Trabajos realizados por otras empresas', '1145', '', '124');
INSERT INTO co_cuentas VALUES ('', '6080', '2016', '60', 'Devoluciones de compras de mercader?as', '1146', '', '124');
INSERT INTO co_cuentas VALUES ('', '6081', '2016', '60', 'Devoluciones de compras de materias primas', '1147', '', '124');
INSERT INTO co_cuentas VALUES ('', '6082', '2016', '60', 'Devoluciones de compras de otros aprovisionamientos', '1148', '', '124');
INSERT INTO co_cuentas VALUES ('', '6090', '2016', '60', 'Rappels por compras de mercader?as', '1149', '', '124');
INSERT INTO co_cuentas VALUES ('', '6091', '2016', '60', 'Rappels por compras de materias primas', '1150', '', '124');
INSERT INTO co_cuentas VALUES ('', '6092', '2016', '60', 'Rappels por compras de otros aprovisionamientos', '1151', '', '124');
INSERT INTO co_cuentas VALUES ('', '610', '2016', '61', 'Variaci?n de existencias de mercader?as', '1152', '', '125');
INSERT INTO co_cuentas VALUES ('', '611', '2016', '61', 'Variaci?n de existencias de materias primas', '1153', '', '125');
INSERT INTO co_cuentas VALUES ('', '612', '2016', '61', 'Variaci?n de existencias de otros aprovisionamientos', '1154', '', '125');
INSERT INTO co_cuentas VALUES ('', '620', '2016', '62', 'Gastos en investigaci?n y desarrollo del ejercicio', '1155', '', '126');
INSERT INTO co_cuentas VALUES ('', '621', '2016', '62', 'Arrendamientos y c?nones', '1156', '', '126');
INSERT INTO co_cuentas VALUES ('', '622', '2016', '62', 'Reparaciones y conservaci', '1157', '', '126');
INSERT INTO co_cuentas VALUES ('', '623', '2016', '62', 'Servicios de profesionales independientes', '1158', '', '126');
INSERT INTO co_cuentas VALUES ('', '624', '2016', '62', 'Transportes', '1159', '', '126');
INSERT INTO co_cuentas VALUES ('', '625', '2016', '62', 'Primas de seguros', '1160', '', '126');
INSERT INTO co_cuentas VALUES ('', '626', '2016', '62', 'Servicios bancarios y similares', '1161', '', '126');
INSERT INTO co_cuentas VALUES ('', '627', '2016', '62', 'Publicidad, propaganda y relaciones p?blicas', '1162', '', '126');
INSERT INTO co_cuentas VALUES ('', '628', '2016', '62', 'Suministros', '1163', '', '126');
INSERT INTO co_cuentas VALUES ('', '629', '2016', '62', 'Otros servicios', '1164', '', '126');
INSERT INTO co_cuentas VALUES ('', '6300', '2016', '63', 'Impuesto corriente', '1165', '', '127');
INSERT INTO co_cuentas VALUES ('', '6301', '2016', '63', 'Impuesto diferido', '1166', '', '127');
INSERT INTO co_cuentas VALUES ('', '631', '2016', '63', 'Otros tributos', '1167', '', '127');
INSERT INTO co_cuentas VALUES ('', '633', '2016', '63', 'Ajustes negativos en la imposici?n sobre beneficios', '1168', '', '127');
INSERT INTO co_cuentas VALUES ('', '6341', '2016', '63', 'Ajustes negativos en iva de activo corriente', '1169', '', '127');
INSERT INTO co_cuentas VALUES ('', '6342', '2016', '63', 'Ajustes negativos en iva de inversiones', '1170', '', '127');
INSERT INTO co_cuentas VALUES ('', '636', '2016', '63', 'Devoluci?n de impuestos', '1171', '', '127');
INSERT INTO co_cuentas VALUES ('', '638', '2016', '63', 'Ajustes positivos en la imposici?n sobre beneficios', '1172', '', '127');
INSERT INTO co_cuentas VALUES ('', '6391', '2016', '63', 'Ajustes positivos en iva de activo corriente', '1173', '', '127');
INSERT INTO co_cuentas VALUES ('', '6392', '2016', '63', 'Ajustes positivos en iva de inversiones', '1174', '', '127');
INSERT INTO co_cuentas VALUES ('', '640', '2016', '64', 'Sueldos y salarios', '1175', '', '128');
INSERT INTO co_cuentas VALUES ('', '641', '2016', '64', 'Indemnizaciones', '1176', '', '128');
INSERT INTO co_cuentas VALUES ('', '642', '2016', '64', 'Seguridad social a cargo de la empresa', '1177', '', '128');
INSERT INTO co_cuentas VALUES ('', '643', '2016', '64', 'Retribuciones a largo plazo mediante sistemas de aportaci?n definida', '1178', '', '128');
INSERT INTO co_cuentas VALUES ('', '6440', '2016', '64', 'Contribuciones anuales', '1179', '', '128');
INSERT INTO co_cuentas VALUES ('', '6442', '2016', '64', 'Otros costes', '1180', '', '128');
INSERT INTO co_cuentas VALUES ('', '6450', '2016', '64', 'Retribuciones al personal liquidados con instrumentos de patrimonio', '1181', '', '128');
INSERT INTO co_cuentas VALUES ('', '6457', '2016', '64', 'Retribuciones al personal liquidados en efectivo basado en instrumentos de patrimonio', '1182', '', '128');
INSERT INTO co_cuentas VALUES ('', '649', '2016', '64', 'Otros gastos sociales', '1183', '', '128');
INSERT INTO co_cuentas VALUES ('', '650', '2016', '65', 'P?rdidas de cr?ditos comerciales incobrables', '1184', '', '129');
INSERT INTO co_cuentas VALUES ('', '6510', '2016', '65', 'Beneficio transferido (gestor)', '1185', '', '129');
INSERT INTO co_cuentas VALUES ('', '6511', '2016', '65', 'P?rdida soportada (part?cipe o asociado no gestor)', '1186', '', '129');
INSERT INTO co_cuentas VALUES ('', '659', '2016', '65', 'Otras p?rdidas en gesti?n corriente', '1187', '', '129');
INSERT INTO co_cuentas VALUES ('', '660', '2016', '66', 'Gastos financieros por actualizaci?n de provisiones', '1188', '', '130');
INSERT INTO co_cuentas VALUES ('', '6610', '2016', '66', 'Intereses de obligaciones y bonos a largo plazo, empresas del grupo', '1189', '', '130');
INSERT INTO co_cuentas VALUES ('', '6611', '2016', '66', 'Intereses de obligaciones y bonos a largo plazo, empresas asociadas', '1190', '', '130');
INSERT INTO co_cuentas VALUES ('', '6612', '2016', '66', 'Intereses de obligaciones y bonos a largo plazo, otras partes vinculadas', '1191', '', '130');
INSERT INTO co_cuentas VALUES ('', '6613', '2016', '66', 'Intereses de obligaciones y bonos a largo plazo, otras empresas', '1192', '', '130');
INSERT INTO co_cuentas VALUES ('', '6615', '2016', '66', 'Intereses de obligaciones y bonos a corto plazo, empresas del grupo', '1193', '', '130');
INSERT INTO co_cuentas VALUES ('', '6616', '2016', '66', 'Intereses de obligaciones y bonos a corto plazo, empresas asociadas', '1194', '', '130');
INSERT INTO co_cuentas VALUES ('', '6617', '2016', '66', 'Intereses de obligaciones y bonos a corto plazo, otras partes vinculadas', '1195', '', '130');
INSERT INTO co_cuentas VALUES ('', '6618', '2016', '66', 'Intereses de obligaciones y bonos a corto plazo, otras empresas', '1196', '', '130');
INSERT INTO co_cuentas VALUES ('', '6620', '2016', '66', 'Intereses de deudas, empresas del grupo', '1197', '', '130');
INSERT INTO co_cuentas VALUES ('', '6621', '2016', '66', 'Intereses de deudas, empresas asociadas', '1198', '', '130');
INSERT INTO co_cuentas VALUES ('', '6622', '2016', '66', 'Intereses de deudas, otras partes vinculadas', '1199', '', '130');
INSERT INTO co_cuentas VALUES ('', '6623', '2016', '66', 'Intereses de deudas con entidades de cr?dito', '1200', '', '130');
INSERT INTO co_cuentas VALUES ('', '6624', '2016', '66', 'Intereses de deudas, otras empresas', '1201', '', '130');
INSERT INTO co_cuentas VALUES ('', '6630', '2016', '66', 'P?rdidas de cartera de negociaci', '1202', '', '130');
INSERT INTO co_cuentas VALUES ('', '6631', '2016', '66', 'P?rdidas de designados por la empresa', '1203', '', '130');
INSERT INTO co_cuentas VALUES ('', '6632', '2016', '66', 'P?rdidas de disponibles para la venta', '1204', '', '130');
INSERT INTO co_cuentas VALUES ('', '6633', '2016', '66', 'P?rdidas de instrumentos de cobertura', '1205', '', '130');
INSERT INTO co_cuentas VALUES ('', '6640', '2016', '66', 'Dividendos de pasivos, empresas del grupo', '1206', '', '130');
INSERT INTO co_cuentas VALUES ('', '6641', '2016', '66', 'Dividendos de pasivos, empresas asociadas', '1207', '', '130');
INSERT INTO co_cuentas VALUES ('', '6642', '2016', '66', 'Dividendos de pasivos, otras partes vinculadas', '1208', '', '130');
INSERT INTO co_cuentas VALUES ('', '6643', '2016', '66', 'Dividendos de pasivos, otras empresas', '1209', '', '130');
INSERT INTO co_cuentas VALUES ('', '6650', '2016', '66', 'Intereses por descuento de efectos en entidades de cr?dito del grupo', '1210', '', '130');
INSERT INTO co_cuentas VALUES ('', '6651', '2016', '66', 'Intereses por descuento de efectos en entidades de cr?dito asociadas', '1211', '', '130');
INSERT INTO co_cuentas VALUES ('', '6652', '2016', '66', 'Intereses por descuento de efectos en otras entidades de cr?dito vinculadas', '1212', '', '130');
INSERT INTO co_cuentas VALUES ('', '6653', '2016', '66', 'Intereses por descuento de efectos en otras entidades de cr?dito', '1213', '', '130');
INSERT INTO co_cuentas VALUES ('', '6654', '2016', '66', 'Intereses por operaciones de factoring con entidades de cr?dito del grupo', '1214', '', '130');
INSERT INTO co_cuentas VALUES ('', '6655', '2016', '66', 'Intereses por operaciones de factoring con entidades de cr?dito asociadas', '1215', '', '130');
INSERT INTO co_cuentas VALUES ('', '6656', '2016', '66', 'Intereses por operaciones de factoring con otras entidades de cr?dito vinculadas', '1216', '', '130');
INSERT INTO co_cuentas VALUES ('', '6657', '2016', '66', 'Intereses por operaciones de factoring con otras entidades de cr?dito', '1217', '', '130');
INSERT INTO co_cuentas VALUES ('', '6660', '2016', '66', 'P?rdidas en valores representativos de deuda a largo plazo, empresas del grupo', '1218', '', '130');
INSERT INTO co_cuentas VALUES ('', '6661', '2016', '66', 'P?rdidas en valores representativos de deuda a largo plazo, empresas asociadas', '1219', '', '130');
INSERT INTO co_cuentas VALUES ('', '6662', '2016', '66', 'P?rdidas en valores representativos de deuda a largo plazo, otras partes vinculadas', '1220', '', '130');
INSERT INTO co_cuentas VALUES ('', '6663', '2016', '66', 'P?rdidas en participaciones y valores representativos de deuda a largo plazo, otras empresas', '1221', '', '130');
INSERT INTO co_cuentas VALUES ('', '6665', '2016', '66', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '1222', '', '130');
INSERT INTO co_cuentas VALUES ('', '6666', '2016', '66', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '1223', '', '130');
INSERT INTO co_cuentas VALUES ('', '6667', '2016', '66', 'P?rdidas en valores representativos de deuda a corto plazo, otras partes vinculadas', '1224', '', '130');
INSERT INTO co_cuentas VALUES ('', '6668', '2016', '66', 'P?rdidas en valores representativos de deuda a corto plazo, otras empresas', '1225', '', '130');
INSERT INTO co_cuentas VALUES ('', '6670', '2016', '66', 'P?rdidas de cr?ditos a largo plazo, empresas del grupo', '1226', '', '130');
INSERT INTO co_cuentas VALUES ('', '6671', '2016', '66', 'P?rdidas de cr?ditos a largo plazo, empresas asociadas', '1227', '', '130');
INSERT INTO co_cuentas VALUES ('', '6672', '2016', '66', 'P?rdidas de cr?ditos a largo plazo, otras partes vinculadas', '1228', '', '130');
INSERT INTO co_cuentas VALUES ('', '6673', '2016', '66', 'P?rdidas de cr?ditos a largo plazo, otras empresas', '1229', '', '130');
INSERT INTO co_cuentas VALUES ('', '6675', '2016', '66', 'P?rdidas de cr?ditos a corto plazo, empresas del grupo', '1230', '', '130');
INSERT INTO co_cuentas VALUES ('', '6676', '2016', '66', 'P?rdidas de cr?ditos a corto plazo, empresas asociadas', '1231', '', '130');
INSERT INTO co_cuentas VALUES ('', '6677', '2016', '66', 'P?rdidas de cr?ditos a corto plazo, otras partes vinculadas', '1232', '', '130');
INSERT INTO co_cuentas VALUES ('', '6678', '2016', '66', 'P?rdidas de cr?ditos a corto plazo, otras empresas', '1233', '', '130');
INSERT INTO co_cuentas VALUES ('', '668', '2016', '66', 'Diferencias negativas de cambio', '1234', 'EURNEG', '130');
INSERT INTO co_cuentas VALUES ('', '669', '2016', '66', 'Otros gastos financieros', '1235', '', '130');
INSERT INTO co_cuentas VALUES ('', '670', '2016', '67', 'P?rdidas procedentes del inmovilizado intangible', '1236', '', '131');
INSERT INTO co_cuentas VALUES ('', '671', '2016', '67', 'P?rdidas procedentes del inmovilizado material', '1237', '', '131');
INSERT INTO co_cuentas VALUES ('', '672', '2016', '67', 'P?rdidas procedentes de las inversiones inmobiliarias', '1238', '', '131');
INSERT INTO co_cuentas VALUES ('', '6733', '2016', '67', 'P?rdidas procedentes de participaciones a largo plazo, empresas del grupo', '1239', '', '131');
INSERT INTO co_cuentas VALUES ('', '6734', '2016', '67', 'P?rdidas procedentes de participaciones a largo plazo, empresas asociadas', '1240', '', '131');
INSERT INTO co_cuentas VALUES ('', '6735', '2016', '67', 'P?rdidas procedentes de participaciones a largo plazo, otras partes vinculadas', '1241', '', '131');
INSERT INTO co_cuentas VALUES ('', '675', '2016', '67', 'P?rdidas por operaciones con obligaciones propias', '1242', '', '131');
INSERT INTO co_cuentas VALUES ('', '678', '2016', '67', 'Gastos excepcionales', '1243', '', '131');
INSERT INTO co_cuentas VALUES ('', '680', '2016', '68', 'Amortizaci?n del inmovilizado intangible', '1244', '', '132');
INSERT INTO co_cuentas VALUES ('', '681', '2016', '68', 'Amortizaci?n del inmovilizado material', '1245', '', '132');
INSERT INTO co_cuentas VALUES ('', '682', '2016', '68', 'Amortizaci?n de las inversiones inmobiliarias', '1246', '', '132');
INSERT INTO co_cuentas VALUES ('', '690', '2016', '69', 'P?rdidas por deterioro del inmovilizado intangible', '1247', '', '133');
INSERT INTO co_cuentas VALUES ('', '691', '2016', '69', 'P?rdidas por deterioro del inmovilizado material', '1248', '', '133');
INSERT INTO co_cuentas VALUES ('', '692', '2016', '69', 'P?rdidas por deterioro de las inversiones inmobiliarias', '1249', '', '133');
INSERT INTO co_cuentas VALUES ('', '6930', '2016', '69', 'P?rdidas por deterioro de productos terminados y en curso de fabricaci', '1250', '', '133');
INSERT INTO co_cuentas VALUES ('', '6931', '2016', '69', 'P?rdidas por deterioro de mercader?as', '1251', '', '133');
INSERT INTO co_cuentas VALUES ('', '6932', '2016', '69', 'P?rdidas por deterioro de materias primas', '1252', '', '133');
INSERT INTO co_cuentas VALUES ('', '6933', '2016', '69', 'P?rdidas por deterioro de otros aprovisionamientos', '1253', '', '133');
INSERT INTO co_cuentas VALUES ('', '694', '2016', '69', 'P?rdidas por deterioro de cr?ditos por operaciones comerciales', '1254', '', '133');
INSERT INTO co_cuentas VALUES ('', '6954', '2016', '69', 'Dotaci?n a la provisi?n por contratos onerosos', '1255', '', '133');
INSERT INTO co_cuentas VALUES ('', '6959', '2016', '69', 'Dotaci?n a la provisi?n para otras operaciones comerciales', '1256', '', '133');
INSERT INTO co_cuentas VALUES ('', '6960', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '1257', '', '133');
INSERT INTO co_cuentas VALUES ('', '6961', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '1258', '', '133');
INSERT INTO co_cuentas VALUES ('', '6962', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras partes vinculadas', '1259', '', '133');
INSERT INTO co_cuentas VALUES ('', '6963', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras empresas', '1260', '', '133');
INSERT INTO co_cuentas VALUES ('', '6965', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas del grupo', '1261', '', '133');
INSERT INTO co_cuentas VALUES ('', '6966', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas asociadas', '1262', '', '133');
INSERT INTO co_cuentas VALUES ('', '6967', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, otras partes vinculadas', '1263', '', '133');
INSERT INTO co_cuentas VALUES ('', '6968', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, de otras empresas', '1264', '', '133');
INSERT INTO co_cuentas VALUES ('', '6970', '2016', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas del grupo', '1265', '', '133');
INSERT INTO co_cuentas VALUES ('', '6971', '2016', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas asociadas', '1266', '', '133');
INSERT INTO co_cuentas VALUES ('', '6972', '2016', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras partes vinculadas', '1267', '', '133');
INSERT INTO co_cuentas VALUES ('', '6973', '2016', '69', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras empresas', '1268', '', '133');
INSERT INTO co_cuentas VALUES ('', '6980', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '1269', '', '133');
INSERT INTO co_cuentas VALUES ('', '6981', '2016', '69', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '1270', '', '133');
INSERT INTO co_cuentas VALUES ('', '6985', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '1271', '', '133');
INSERT INTO co_cuentas VALUES ('', '6986', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '1272', '', '133');
INSERT INTO co_cuentas VALUES ('', '6987', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '1273', '', '133');
INSERT INTO co_cuentas VALUES ('', '6988', '2016', '69', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, de otras empresas', '1274', '', '133');
INSERT INTO co_cuentas VALUES ('', '6990', '2016', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas del grupo', '1275', '', '133');
INSERT INTO co_cuentas VALUES ('', '6991', '2016', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas asociadas', '1276', '', '133');
INSERT INTO co_cuentas VALUES ('', '6992', '2016', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras partes vinculadas', '1277', '', '133');
INSERT INTO co_cuentas VALUES ('', '6993', '2016', '69', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras empresas', '1278', '', '133');
INSERT INTO co_cuentas VALUES ('', '700', '2016', '70', 'Ventas de mercader?as', '1279', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '701', '2016', '70', 'Ventas de productos terminados', '1280', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '702', '2016', '70', 'Ventas de productos semiterminados', '1281', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '703', '2016', '70', 'Ventas de subproductos y residuos', '1282', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '704', '2016', '70', 'Ventas de envases y embalajes', '1283', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '705', '2016', '70', 'Prestaciones de servicios', '1284', 'VENTAS', '134');
INSERT INTO co_cuentas VALUES ('', '7060', '2016', '70', 'Descuentos sobre ventas por pronto pago de mercader?as', '1285', '', '134');
INSERT INTO co_cuentas VALUES ('', '7061', '2016', '70', 'Descuentos sobre ventas por pronto pago de productos terminados', '1286', '', '134');
INSERT INTO co_cuentas VALUES ('', '7062', '2016', '70', 'Descuentos sobre ventas por pronto pago de productos semiterminados', '1287', '', '134');
INSERT INTO co_cuentas VALUES ('', '7063', '2016', '70', 'Descuentos sobre ventas por pronto pago de subproductos y residuos', '1288', '', '134');
INSERT INTO co_cuentas VALUES ('', '7080', '2016', '70', 'Devoluciones de ventas de mercader?as', '1289', '', '134');
INSERT INTO co_cuentas VALUES ('', '7081', '2016', '70', 'Devoluciones de ventas de productos terminados', '1290', '', '134');
INSERT INTO co_cuentas VALUES ('', '7082', '2016', '70', 'Devoluciones de ventas de productos semiterminados', '1291', '', '134');
INSERT INTO co_cuentas VALUES ('', '7083', '2016', '70', 'Devoluciones de ventas de subproductos y residuos', '1292', '', '134');
INSERT INTO co_cuentas VALUES ('', '7084', '2016', '70', 'Devoluciones de ventas de envases y embalajes', '1293', '', '134');
INSERT INTO co_cuentas VALUES ('', '7090', '2016', '70', 'Rappels sobre ventas de mercader?as', '1294', '', '134');
INSERT INTO co_cuentas VALUES ('', '7091', '2016', '70', 'Rappels sobre ventas de productos terminados', '1295', '', '134');
INSERT INTO co_cuentas VALUES ('', '7092', '2016', '70', 'Rappels sobre ventas de productos semiterminados', '1296', '', '134');
INSERT INTO co_cuentas VALUES ('', '7093', '2016', '70', 'Rappels sobre ventas de subproductos y residuos', '1297', '', '134');
INSERT INTO co_cuentas VALUES ('', '7094', '2016', '70', 'Rappels sobre ventas de envases y embalajes', '1298', '', '134');
INSERT INTO co_cuentas VALUES ('', '710', '2016', '71', 'Variaci?n de existencias de productos en curso', '1299', '', '135');
INSERT INTO co_cuentas VALUES ('', '711', '2016', '71', 'Variaci?n de existencias de productos semiterminados', '1300', '', '135');
INSERT INTO co_cuentas VALUES ('', '712', '2016', '71', 'Variaci?n de existencias de productos terminados', '1301', '', '135');
INSERT INTO co_cuentas VALUES ('', '713', '2016', '71', 'Variaci?n de existencias de subproductos,residuos y materiales recuperados', '1302', '', '135');
INSERT INTO co_cuentas VALUES ('', '730', '2016', '73', 'Trabajos realizados para el inmovilizado intangible', '1303', '', '136');
INSERT INTO co_cuentas VALUES ('', '731', '2016', '73', 'Trabajos realizados para el inmovilizado material', '1304', '', '136');
INSERT INTO co_cuentas VALUES ('', '732', '2016', '73', 'Trabajos realizados en inversiones inmobiliarias', '1305', '', '136');
INSERT INTO co_cuentas VALUES ('', '733', '2016', '73', 'Trabajos realizados para el inmovilizado material en curso', '1306', '', '136');
INSERT INTO co_cuentas VALUES ('', '740', '2016', '74', 'Subvenciones, donaciones y legados a la explotaci', '1307', '', '137');
INSERT INTO co_cuentas VALUES ('', '746', '2016', '74', 'Subvenciones, donaciones y legados de capital transferidos al resultado del ejercicio', '1308', '', '137');
INSERT INTO co_cuentas VALUES ('', '747', '2016', '74', 'Otras subvenciones, donaciones y legados transferidos al resultado del ejercicio', '1309', '', '137');
INSERT INTO co_cuentas VALUES ('', '7510', '2016', '75', 'P?rdida transferida (gestor)', '1310', '', '138');
INSERT INTO co_cuentas VALUES ('', '7511', '2016', '75', 'Beneficio atribuido (part?cipe o asociado no gestor)', '1311', '', '138');
INSERT INTO co_cuentas VALUES ('', '752', '2016', '75', 'Ingresos por arrendamientos', '1312', '', '138');
INSERT INTO co_cuentas VALUES ('', '753', '2016', '75', 'Ingresos de propiedad industrial cedida en explotaci', '1313', '', '138');
INSERT INTO co_cuentas VALUES ('', '754', '2016', '75', 'Ingresos por comisiones', '1314', '', '138');
INSERT INTO co_cuentas VALUES ('', '755', '2016', '75', 'Ingresos por servicios al personal', '1315', '', '138');
INSERT INTO co_cuentas VALUES ('', '759', '2016', '75', 'Ingresos por servicios diversos', '1316', '', '138');
INSERT INTO co_cuentas VALUES ('', '7600', '2016', '76', 'Ingresos de participaciones en instrumentos de patrimonio, empresas del grupo', '1317', '', '139');
INSERT INTO co_cuentas VALUES ('', '7601', '2016', '76', 'Ingresos de participaciones en instrumentos de patrimonio, empresas asociadas', '1318', '', '139');
INSERT INTO co_cuentas VALUES ('', '7602', '2016', '76', 'Ingresos de participaciones en instrumentos de patrimonio, otras partes vinculadas', '1319', '', '139');
INSERT INTO co_cuentas VALUES ('', '7603', '2016', '76', 'Ingresos de participaciones en instrumentos de patrimonio, otras empresas', '1320', '', '139');
INSERT INTO co_cuentas VALUES ('', '7610', '2016', '76', 'Ingresos de valores representativos de deuda, empresas del grupo', '1321', '', '139');
INSERT INTO co_cuentas VALUES ('', '7611', '2016', '76', 'Ingresos de valores representativos de deuda, empresas asociadas', '1322', '', '139');
INSERT INTO co_cuentas VALUES ('', '7612', '2016', '76', 'Ingresos de valores representativos de deuda, otras partes vinculadas', '1323', '', '139');
INSERT INTO co_cuentas VALUES ('', '7613', '2016', '76', 'Ingresos de valores representativos de deuda, otras empresas', '1324', '', '139');
INSERT INTO co_cuentas VALUES ('', '76200', '2016', '76', 'Ingresos de cr?ditos a largo plazo, empresas del grupo', '1325', '', '139');
INSERT INTO co_cuentas VALUES ('', '76201', '2016', '76', 'Ingresos de cr?ditos a largo plazo, empresas asociadas', '1326', '', '139');
INSERT INTO co_cuentas VALUES ('', '76202', '2016', '76', 'Ingresos de cr?ditos a largo plazo, otras partes vinculadas', '1327', '', '139');
INSERT INTO co_cuentas VALUES ('', '76203', '2016', '76', 'Ingresos de cr?ditos a largo plazo, otras empresas', '1328', '', '139');
INSERT INTO co_cuentas VALUES ('', '76210', '2016', '76', 'Ingresos de cr?ditos a corto plazo, empresas del grupo', '1329', '', '139');
INSERT INTO co_cuentas VALUES ('', '76211', '2016', '76', 'Ingresos de cr?ditos a corto plazo, empresas asociadas', '1330', '', '139');
INSERT INTO co_cuentas VALUES ('', '76212', '2016', '76', 'Ingresos de cr?ditos a corto plazo, otras partes vinculadas', '1331', '', '139');
INSERT INTO co_cuentas VALUES ('', '76213', '2016', '76', 'Ingresos de cr?ditos a corto plazo, otras empresas', '1332', '', '139');
INSERT INTO co_cuentas VALUES ('', '7630', '2016', '76', 'Beneficios de cartera de negociaci', '1333', '', '139');
INSERT INTO co_cuentas VALUES ('', '7631', '2016', '76', 'Beneficios de designados por la empresa', '1334', '', '139');
INSERT INTO co_cuentas VALUES ('', '7632', '2016', '76', 'Beneficios de disponibles para la venta', '1335', '', '139');
INSERT INTO co_cuentas VALUES ('', '7633', '2016', '76', 'Beneficios de instrumentos de cobertura', '1336', '', '139');
INSERT INTO co_cuentas VALUES ('', '7660', '2016', '76', 'Beneficios en valores representativos de deuda a largo plazo, empresas del grupo', '1337', '', '139');
INSERT INTO co_cuentas VALUES ('', '7661', '2016', '76', 'Beneficios en valores representativos de deuda a largo plazo, empresas asociadas', '1338', '', '139');
INSERT INTO co_cuentas VALUES ('', '7662', '2016', '76', 'Beneficios en valores representativos de deuda a largo plazo, otras partes vinculadas', '1339', '', '139');
INSERT INTO co_cuentas VALUES ('', '7663', '2016', '76', 'Beneficios en participaciones y valores representativos de deuda a largo plazo, otras empresas', '1340', '', '139');
INSERT INTO co_cuentas VALUES ('', '7665', '2016', '76', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '1341', '', '139');
INSERT INTO co_cuentas VALUES ('', '7666', '2016', '76', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '1342', '', '139');
INSERT INTO co_cuentas VALUES ('', '7667', '2016', '76', 'Beneficios en valores representativos de deuda a corto plazo, otras partes vinculadas', '1343', '', '139');
INSERT INTO co_cuentas VALUES ('', '7668', '2016', '76', 'Beneficios en valores representativos de deuda a corto plazo, otras empresas', '1344', '', '139');
INSERT INTO co_cuentas VALUES ('', '767', '2016', '76', 'Ingresos de activos afectos y de derechos de reembolso relativos a retribuciones a largo plazo', '1345', '', '139');
INSERT INTO co_cuentas VALUES ('', '768', '2016', '76', 'Diferencias positivas de cambio', '1346', 'EURPOS', '139');
INSERT INTO co_cuentas VALUES ('', '769', '2016', '76', 'Otros ingresos financieros', '1347', '', '139');
INSERT INTO co_cuentas VALUES ('', '770', '2016', '77', 'Beneficios procedentes del inmovilizado intangible', '1348', '', '140');
INSERT INTO co_cuentas VALUES ('', '771', '2016', '77', 'Beneficios procedentes del inmovilizado material', '1349', '', '140');
INSERT INTO co_cuentas VALUES ('', '772', '2016', '77', 'Beneficios procedentes de las inversiones inmobiliarias', '1350', '', '140');
INSERT INTO co_cuentas VALUES ('', '7733', '2016', '77', 'Beneficios procedentes de participaciones a largo plazo, empresas del grupo', '1351', '', '140');
INSERT INTO co_cuentas VALUES ('', '7734', '2016', '77', 'Beneficios procedentes de participaciones a largo plazo, empresas asociadas', '1352', '', '140');
INSERT INTO co_cuentas VALUES ('', '7735', '2016', '77', 'Beneficios procedentes de participaciones a largo plazo, otras partes vinculadas', '1353', '', '140');
INSERT INTO co_cuentas VALUES ('', '774', '2016', '77', 'Diferencia negativa en combinaciones de negocios', '1354', '', '140');
INSERT INTO co_cuentas VALUES ('', '775', '2016', '77', 'Beneficios por operaciones con obligaciones propias', '1355', '', '140');
INSERT INTO co_cuentas VALUES ('', '778', '2016', '77', 'Ingresos excepcionales', '1356', '', '140');
INSERT INTO co_cuentas VALUES ('', '790', '2016', '79', 'Reversi?n del deterioro del inmovilizado intangible', '1357', '', '141');
INSERT INTO co_cuentas VALUES ('', '791', '2016', '79', 'Reversi?n del deterioro del inmovilizado material', '1358', '', '141');
INSERT INTO co_cuentas VALUES ('', '792', '2016', '79', 'Reversi?n del deterioro de las inversiones inmobiliarias', '1359', '', '141');
INSERT INTO co_cuentas VALUES ('', '7930', '2016', '79', 'Reversi?n del deterioro de productos terminados y en curso de fabricaci', '1360', '', '141');
INSERT INTO co_cuentas VALUES ('', '7931', '2016', '79', 'Reversi?n del deterioro de mercader?as', '1361', '', '141');
INSERT INTO co_cuentas VALUES ('', '7932', '2016', '79', 'Reversi?n del deterioro de materias primas', '1362', '', '141');
INSERT INTO co_cuentas VALUES ('', '7933', '2016', '79', 'Reversi?n del deterioro de otros aprovisionamientos', '1363', '', '141');
INSERT INTO co_cuentas VALUES ('', '794', '2016', '79', 'Reversi?n del deterioro de cr?ditos por operaciones comerciales', '1364', '', '141');
INSERT INTO co_cuentas VALUES ('', '7950', '2016', '79', 'Exceso de provisi?n por retribuciones al personal', '1365', '', '141');
INSERT INTO co_cuentas VALUES ('', '7951', '2016', '79', 'Exceso de provisi?n para impuestos', '1366', '', '141');
INSERT INTO co_cuentas VALUES ('', '7952', '2016', '79', 'Exceso de provisi?n para otras responsabilidades', '1367', '', '141');
INSERT INTO co_cuentas VALUES ('', '79544', '2016', '79', 'Exceso de provisi?n por contratos onerosos', '1368', '', '141');
INSERT INTO co_cuentas VALUES ('', '79549', '2016', '79', 'Exceso de provisi?n para otras operaciones comerciales', '1369', '', '141');
INSERT INTO co_cuentas VALUES ('', '7955', '2016', '79', 'Exceso de provisi?n para actuaciones medioambientales', '1370', '', '141');
INSERT INTO co_cuentas VALUES ('', '7956', '2016', '79', 'Exceso de provisi?n para reestructuraciones', '1371', '', '141');
INSERT INTO co_cuentas VALUES ('', '7957', '2016', '79', 'Exceso de provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '1372', '', '141');
INSERT INTO co_cuentas VALUES ('', '7960', '2016', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '1373', '', '141');
INSERT INTO co_cuentas VALUES ('', '7961', '2016', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '1374', '', '141');
INSERT INTO co_cuentas VALUES ('', '7965', '2016', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas del grupo', '1375', '', '141');
INSERT INTO co_cuentas VALUES ('', '7966', '2016', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas asociadas', '1376', '', '141');
INSERT INTO co_cuentas VALUES ('', '7967', '2016', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras partes vinculadas', '1377', '', '141');
INSERT INTO co_cuentas VALUES ('', '7968', '2016', '79', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras empresas', '1378', '', '141');
INSERT INTO co_cuentas VALUES ('', '7970', '2016', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas del grupo', '1379', '', '141');
INSERT INTO co_cuentas VALUES ('', '7971', '2016', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas asociadas', '1380', '', '141');
INSERT INTO co_cuentas VALUES ('', '7972', '2016', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras partes vinculadas', '1381', '', '141');
INSERT INTO co_cuentas VALUES ('', '7973', '2016', '79', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras empresas', '1382', '', '141');
INSERT INTO co_cuentas VALUES ('', '7980', '2016', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '1383', '', '141');
INSERT INTO co_cuentas VALUES ('', '7981', '2016', '79', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '1384', '', '141');
INSERT INTO co_cuentas VALUES ('', '7985', '2016', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '1385', '', '141');
INSERT INTO co_cuentas VALUES ('', '7986', '2016', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '1386', '', '141');
INSERT INTO co_cuentas VALUES ('', '7987', '2016', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '1387', '', '141');
INSERT INTO co_cuentas VALUES ('', '7988', '2016', '79', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras empresas', '1388', '', '141');
INSERT INTO co_cuentas VALUES ('', '7990', '2016', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas del grupo', '1389', '', '141');
INSERT INTO co_cuentas VALUES ('', '7991', '2016', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas asociadas', '1390', '', '141');
INSERT INTO co_cuentas VALUES ('', '7992', '2016', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras partes vinculadas', '1391', '', '141');
INSERT INTO co_cuentas VALUES ('', '7993', '2016', '79', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras empresas', '1392', '', '141');
INSERT INTO co_cuentas VALUES ('', '800', '2016', '80', 'P?rdidas en activos financieros disponibles para la venta', '1393', '', '142');
INSERT INTO co_cuentas VALUES ('', '802', '2016', '80', 'Transferencia de beneficios en activos financieros disponibles para la venta', '1394', '', '142');
INSERT INTO co_cuentas VALUES ('', '810', '2016', '81', 'P?rdidas por coberturas de flujos de efectivo', '1395', '', '143');
INSERT INTO co_cuentas VALUES ('', '811', '2016', '81', 'P?rdidas por coberturas de inversiones netas en un negocio en el extranjero', '1396', '', '143');
INSERT INTO co_cuentas VALUES ('', '812', '2016', '81', 'Transferencia de beneficios por coberturas de flujos de efectivo', '1397', '', '143');
INSERT INTO co_cuentas VALUES ('', '813', '2016', '81', 'Transferencia de beneficios por coberturas de inversiones netas en un negocio en el extranjero', '1398', '', '143');
INSERT INTO co_cuentas VALUES ('', '820', '2016', '82', 'Diferencias de conversi?n negativas', '1399', '', '144');
INSERT INTO co_cuentas VALUES ('', '821', '2016', '82', 'Transferencia de diferencias de conversi?n positivas', '1400', '', '144');
INSERT INTO co_cuentas VALUES ('', '8300', '2016', '83', 'Impuesto corriente', '1401', '', '145');
INSERT INTO co_cuentas VALUES ('', '8301', '2016', '83', 'Impuesto diferido', '1402', '', '145');
INSERT INTO co_cuentas VALUES ('', '833', '2016', '83', 'Ajustes negativos en la imposici?n sobre beneficios', '1403', '', '145');
INSERT INTO co_cuentas VALUES ('', '834', '2016', '83', 'Ingresos fiscales por diferencias permanentes', '1404', '', '145');
INSERT INTO co_cuentas VALUES ('', '835', '2016', '83', 'Ingresos fiscales por deducciones y bonificaciones', '1405', '', '145');
INSERT INTO co_cuentas VALUES ('', '836', '2016', '83', 'Transferencia de diferencias permanentes', '1406', '', '145');
INSERT INTO co_cuentas VALUES ('', '837', '2016', '83', 'Transferencia de deducciones y bonificaciones', '1407', '', '145');
INSERT INTO co_cuentas VALUES ('', '838', '2016', '83', 'Ajustes positivos en la imposici?n sobre beneficios', '1408', '', '145');
INSERT INTO co_cuentas VALUES ('', '840', '2016', '84', 'Transferencia de subvenciones oficiales de capital', '1409', '', '146');
INSERT INTO co_cuentas VALUES ('', '841', '2016', '84', 'Transferencia de donaciones y legados de capital', '1410', '', '146');
INSERT INTO co_cuentas VALUES ('', '842', '2016', '84', 'Transferencia de otras subvenciones, donaciones y legados', '1411', '', '146');
INSERT INTO co_cuentas VALUES ('', '850', '2016', '85', 'P?rdidas actuariales', '1412', '', '147');
INSERT INTO co_cuentas VALUES ('', '851', '2016', '85', 'Ajustes negativos en activos por retribuciones a largo plazo de prestaci?n definida', '1413', '', '147');
INSERT INTO co_cuentas VALUES ('', '860', '2016', '86', 'P?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '1414', '', '148');
INSERT INTO co_cuentas VALUES ('', '862', '2016', '86', 'Transferencia de beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '1415', '', '148');
INSERT INTO co_cuentas VALUES ('', '891', '2016', '89', 'Deterioro de participaciones en el patrimonio, empresas del grupo', '1416', '', '149');
INSERT INTO co_cuentas VALUES ('', '892', '2016', '89', 'Deterioro de participaciones en el patrimonio, empresas asociadas', '1417', '', '149');
INSERT INTO co_cuentas VALUES ('', '900', '2016', '90', 'Beneficios en activos financieros disponibles para la venta', '1418', '', '150');
INSERT INTO co_cuentas VALUES ('', '902', '2016', '90', 'Transferencia de p?rdidas de activos financieros disponibles para la venta', '1419', '', '150');
INSERT INTO co_cuentas VALUES ('', '910', '2016', '91', 'Beneficios por coberturas de flujos de efectivo', '1420', '', '151');
INSERT INTO co_cuentas VALUES ('', '911', '2016', '91', 'Beneficios por coberturas de una inversi?n neta en un negocio en el extranjero', '1421', '', '151');
INSERT INTO co_cuentas VALUES ('', '912', '2016', '91', 'Transferencia de p?rdidas por coberturas de flujos de efectivo', '1422', '', '151');
INSERT INTO co_cuentas VALUES ('', '913', '2016', '91', 'Transferencia de p?rdidas por coberturas de una inversi?n neta en un negocio en el extranjero', '1423', '', '151');
INSERT INTO co_cuentas VALUES ('', '920', '2016', '92', 'Diferencias de conversi?n positivas', '1424', '', '152');
INSERT INTO co_cuentas VALUES ('', '921', '2016', '92', 'Transferencia de diferencias de conversi?n negativas', '1425', '', '152');
INSERT INTO co_cuentas VALUES ('', '940', '2016', '94', 'Ingresos de subvenciones oficiales de capital', '1426', '', '153');
INSERT INTO co_cuentas VALUES ('', '941', '2016', '94', 'Ingresos de donaciones y legados de capital', '1427', '', '153');
INSERT INTO co_cuentas VALUES ('', '942', '2016', '94', 'Ingresos de otras subvenciones, donaciones y legados', '1428', '', '153');
INSERT INTO co_cuentas VALUES ('', '950', '2016', '95', 'Ganancias actuariales', '1429', '', '154');
INSERT INTO co_cuentas VALUES ('', '951', '2016', '95', 'Ajustes positivos en activos por retribuciones a largo plazo de prestaci?n definida', '1430', '', '154');
INSERT INTO co_cuentas VALUES ('', '960', '2016', '96', 'Beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '1431', '', '155');
INSERT INTO co_cuentas VALUES ('', '962', '2016', '96', 'Transferencia de p?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '1432', '', '155');
INSERT INTO co_cuentas VALUES ('', '991', '2016', '99', 'Recuperaci?n de ajustes valorativos negativos previos, empresas del grupo', '1433', '', '156');
INSERT INTO co_cuentas VALUES ('', '992', '2016', '99', 'Recuperaci?n de ajustes valorativos negativos previos, empresas asociadas', '1434', '', '156');
INSERT INTO co_cuentas VALUES ('', '993', '2016', '99', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas del grupo', '1435', '', '156');
INSERT INTO co_cuentas VALUES ('', '994', '2016', '99', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas asociadas', '1436', '', '156');


#
# Estructura de la tabla `co_cuentascb`
#

DROP TABLE IF EXISTS `co_cuentascb`;
CREATE TABLE `co_cuentascb` (
  `desccuenta` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_cuentascb`
#

INSERT INTO co_cuentascb VALUES ('', '994', 'IG-B--VI-1', '1');
INSERT INTO co_cuentascb VALUES ('', '993', 'IG-B--VI-1', '2');
INSERT INTO co_cuentascb VALUES ('', '992', 'IG-A--I-1', '3');
INSERT INTO co_cuentascb VALUES ('', '991', 'IG-A--I-1', '4');
INSERT INTO co_cuentascb VALUES ('', '95', 'IG-A--IV-', '5');
INSERT INTO co_cuentascb VALUES ('', '94', 'IG-A--III-', '6');
INSERT INTO co_cuentascb VALUES ('', '912', 'IG-B--VII-', '7');
INSERT INTO co_cuentascb VALUES ('', '910', 'IG-A--II-', '8');
INSERT INTO co_cuentascb VALUES ('', '902', 'IG-B--VI-1', '9');
INSERT INTO co_cuentascb VALUES ('', '900', 'IG-A--I-1', '10');
INSERT INTO co_cuentascb VALUES ('', '89', 'IG-A--I-1', '11');
INSERT INTO co_cuentascb VALUES ('', '85', 'IG-A--IV-', '12');
INSERT INTO co_cuentascb VALUES ('', '84', 'IG-B--VIII-', '13');
INSERT INTO co_cuentascb VALUES ('', '838', 'IG-A--V-', '14');
INSERT INTO co_cuentascb VALUES ('', '837', 'IG-B--IX-', '15');
INSERT INTO co_cuentascb VALUES ('', '836', 'IG-B--IX-', '16');
INSERT INTO co_cuentascb VALUES ('', '835', 'IG-A--V-', '17');
INSERT INTO co_cuentascb VALUES ('', '834', 'IG-A--V-', '18');
INSERT INTO co_cuentascb VALUES ('', '833', 'IG-A--V-', '19');
INSERT INTO co_cuentascb VALUES ('', '8301', 'IG-B--IX-', '20');
INSERT INTO co_cuentascb VALUES ('', '8300', 'IG-A--V-', '21');
INSERT INTO co_cuentascb VALUES ('', '813', 'IG-B--VII-', '22');
INSERT INTO co_cuentascb VALUES ('', '812', 'IG-B--VII-', '23');
INSERT INTO co_cuentascb VALUES ('', '811', 'IG-A--II-', '24');
INSERT INTO co_cuentascb VALUES ('', '810', 'IG-A--II-', '25');
INSERT INTO co_cuentascb VALUES ('', '802', 'IG-B--VI-1', '26');
INSERT INTO co_cuentascb VALUES ('', '800', 'IG-A--I-1', '27');
INSERT INTO co_cuentascb VALUES ('', '799', 'PG-A-16-a-', '28');
INSERT INTO co_cuentascb VALUES ('', '798', 'PG-A-16-a-', '29');
INSERT INTO co_cuentascb VALUES ('', '797', 'PG-A-16-a-', '30');
INSERT INTO co_cuentascb VALUES ('', '796', 'PG-A-16-a-', '31');
INSERT INTO co_cuentascb VALUES ('', '7957', 'PG-A-6-c-', '32');
INSERT INTO co_cuentascb VALUES ('', '7956', 'PG-A-10--', '33');
INSERT INTO co_cuentascb VALUES ('', '7955', 'PG-A-10--', '34');
INSERT INTO co_cuentascb VALUES ('', '7954', 'PG-A-7-c-', '35');
INSERT INTO co_cuentascb VALUES ('', '7952', 'PG-A-10--', '36');
INSERT INTO co_cuentascb VALUES ('', '7951', 'PG-A-10--', '37');
INSERT INTO co_cuentascb VALUES ('', '7950', 'PG-A-6-c-', '38');
INSERT INTO co_cuentascb VALUES ('', '794', 'PG-A-7-c-', '39');
INSERT INTO co_cuentascb VALUES ('', '7933', 'PG-A-4-d-', '40');
INSERT INTO co_cuentascb VALUES ('', '7932', 'PG-A-4-d-', '41');
INSERT INTO co_cuentascb VALUES ('', '7931', 'PG-A-4-d-', '42');
INSERT INTO co_cuentascb VALUES ('', '7930', 'PG-A-2--', '43');
INSERT INTO co_cuentascb VALUES ('', '792', 'PG-A-11-a-', '44');
INSERT INTO co_cuentascb VALUES ('', '791', 'PG-A-11-a-', '45');
INSERT INTO co_cuentascb VALUES ('', '790', 'PG-A-11-a-', '46');
INSERT INTO co_cuentascb VALUES ('', '775', 'PG-A-16-b-', '47');
INSERT INTO co_cuentascb VALUES ('', '773', 'PG-A-16-b-', '48');
INSERT INTO co_cuentascb VALUES ('', '772', 'PG-A-11-b-', '49');
INSERT INTO co_cuentascb VALUES ('', '771', 'PG-A-11-b-', '50');
INSERT INTO co_cuentascb VALUES ('', '770', 'PG-A-11-b-', '51');
INSERT INTO co_cuentascb VALUES ('', '769', 'PG-A-12-b-2', '52');
INSERT INTO co_cuentascb VALUES ('', '768', 'PG-A-15--', '53');
INSERT INTO co_cuentascb VALUES ('', '767', 'PG-A-12-b-2', '54');
INSERT INTO co_cuentascb VALUES ('', '766', 'PG-A-16-b-', '55');
INSERT INTO co_cuentascb VALUES ('', '7633', 'PG-A-14-a-', '56');
INSERT INTO co_cuentascb VALUES ('', '7632', 'PG-A-14-b-', '57');
INSERT INTO co_cuentascb VALUES ('', '7631', 'PG-A-14-a-', '58');
INSERT INTO co_cuentascb VALUES ('', '7630', 'PG-A-14-a-', '59');
INSERT INTO co_cuentascb VALUES ('', '76213', 'PG-A-12-b-2', '60');
INSERT INTO co_cuentascb VALUES ('', '76212', 'PG-A-12-b-2', '61');
INSERT INTO co_cuentascb VALUES ('', '76211', 'PG-A-12-b-1', '62');
INSERT INTO co_cuentascb VALUES ('', '76210', 'PG-A-12-b-1', '63');
INSERT INTO co_cuentascb VALUES ('', '76203', 'PG-A-12-b-2', '64');
INSERT INTO co_cuentascb VALUES ('', '76202', 'PG-A-12-b-2', '65');
INSERT INTO co_cuentascb VALUES ('', '76201', 'PG-A-12-b-1', '66');
INSERT INTO co_cuentascb VALUES ('', '76200', 'PG-A-12-b-1', '67');
INSERT INTO co_cuentascb VALUES ('', '7613', 'PG-A-12-b-2', '68');
INSERT INTO co_cuentascb VALUES ('', '7612', 'PG-A-12-b-2', '69');
INSERT INTO co_cuentascb VALUES ('', '7611', 'PG-A-12-b-1', '70');
INSERT INTO co_cuentascb VALUES ('', '7610', 'PG-A-12-b-1', '71');
INSERT INTO co_cuentascb VALUES ('', '7603', 'PG-A-12-a-2', '72');
INSERT INTO co_cuentascb VALUES ('', '7602', 'PG-A-12-a-2', '73');
INSERT INTO co_cuentascb VALUES ('', '7601', 'PG-A-12-a-1', '74');
INSERT INTO co_cuentascb VALUES ('', '7600', 'PG-A-12-a-1', '75');
INSERT INTO co_cuentascb VALUES ('', '75', 'PG-A-5-a-', '76');
INSERT INTO co_cuentascb VALUES ('', '747', 'PG-A-5-b-', '77');
INSERT INTO co_cuentascb VALUES ('', '746', 'PG-A-9--', '78');
INSERT INTO co_cuentascb VALUES ('', '740', 'PG-A-5-b-', '79');
INSERT INTO co_cuentascb VALUES ('', '73', 'PG-A-3--', '80');
INSERT INTO co_cuentascb VALUES ('', '71', 'PG-A-2--', '81');
INSERT INTO co_cuentascb VALUES ('', '709', 'PG-A-1-a-', '82');
INSERT INTO co_cuentascb VALUES ('', '708', 'PG-A-1-a-', '83');
INSERT INTO co_cuentascb VALUES ('', '706', 'PG-A-1-a-', '84');
INSERT INTO co_cuentascb VALUES ('', '705', 'PG-A-1-b-', '85');
INSERT INTO co_cuentascb VALUES ('', '704', 'PG-A-1-a-', '86');
INSERT INTO co_cuentascb VALUES ('', '703', 'PG-A-1-a-', '87');
INSERT INTO co_cuentascb VALUES ('', '702', 'PG-A-1-a-', '88');
INSERT INTO co_cuentascb VALUES ('', '701', 'PG-A-1-a-', '89');
INSERT INTO co_cuentascb VALUES ('', '700', 'PG-A-1-a-', '90');
INSERT INTO co_cuentascb VALUES ('', '699', 'PG-A-16-a-', '91');
INSERT INTO co_cuentascb VALUES ('', '698', 'PG-A-16-a-', '92');
INSERT INTO co_cuentascb VALUES ('', '697', 'PG-A-16-a-', '93');
INSERT INTO co_cuentascb VALUES ('', '696', 'PG-A-16-a-', '94');
INSERT INTO co_cuentascb VALUES ('', '695', 'PG-A-7-c-', '95');
INSERT INTO co_cuentascb VALUES ('', '694', 'PG-A-7-c-', '96');
INSERT INTO co_cuentascb VALUES ('', '6933', 'PG-A-4-d-', '97');
INSERT INTO co_cuentascb VALUES ('', '6932', 'PG-A-4-d-', '98');
INSERT INTO co_cuentascb VALUES ('', '6931', 'PG-A-4-d-', '99');
INSERT INTO co_cuentascb VALUES ('', '6930', 'PG-A-2--', '100');
INSERT INTO co_cuentascb VALUES ('', '692', 'PG-A-11-a-', '101');
INSERT INTO co_cuentascb VALUES ('', '691', 'PG-A-11-a-', '102');
INSERT INTO co_cuentascb VALUES ('', '690', 'PG-A-11-a-', '103');
INSERT INTO co_cuentascb VALUES ('', '68', 'PG-A-8--', '104');
INSERT INTO co_cuentascb VALUES ('', '675', 'PG-A-16-b-', '105');
INSERT INTO co_cuentascb VALUES ('', '673', 'PG-A-16-b-', '106');
INSERT INTO co_cuentascb VALUES ('', '672', 'PG-A-11-b-', '107');
INSERT INTO co_cuentascb VALUES ('', '671', 'PG-A-11-b-', '108');
INSERT INTO co_cuentascb VALUES ('', '670', 'PG-A-11-b-', '109');
INSERT INTO co_cuentascb VALUES ('', '669', 'PG-A-13-b-', '110');
INSERT INTO co_cuentascb VALUES ('', '668', 'PG-A-15--', '111');
INSERT INTO co_cuentascb VALUES ('', '667', 'PG-A-16-b-', '112');
INSERT INTO co_cuentascb VALUES ('', '666', 'PG-A-16-b-', '113');
INSERT INTO co_cuentascb VALUES ('', '6657', 'PG-A-13-b-', '114');
INSERT INTO co_cuentascb VALUES ('', '6656', 'PG-A-13-b-', '115');
INSERT INTO co_cuentascb VALUES ('', '6655', 'PG-A-13-a-', '116');
INSERT INTO co_cuentascb VALUES ('', '6654', 'PG-A-13-a-', '117');
INSERT INTO co_cuentascb VALUES ('', '6653', 'PG-A-13-b-', '118');
INSERT INTO co_cuentascb VALUES ('', '6652', 'PG-A-13-b-', '119');
INSERT INTO co_cuentascb VALUES ('', '6651', 'PG-A-13-a-', '120');
INSERT INTO co_cuentascb VALUES ('', '6650', 'PG-A-13-a-', '121');
INSERT INTO co_cuentascb VALUES ('', '6643', 'PG-A-13-b-', '122');
INSERT INTO co_cuentascb VALUES ('', '6642', 'PG-A-13-b-', '123');
INSERT INTO co_cuentascb VALUES ('', '6641', 'PG-A-13-a-', '124');
INSERT INTO co_cuentascb VALUES ('', '6640', 'PG-A-13-a-', '125');
INSERT INTO co_cuentascb VALUES ('', '6633', 'PG-A-14-a-', '126');
INSERT INTO co_cuentascb VALUES ('', '6632', 'PG-A-14-b-', '127');
INSERT INTO co_cuentascb VALUES ('', '6631', 'PG-A-14-a-', '128');
INSERT INTO co_cuentascb VALUES ('', '6630', 'PG-A-14-a-', '129');
INSERT INTO co_cuentascb VALUES ('', '6624', 'PG-A-13-b-', '130');
INSERT INTO co_cuentascb VALUES ('', '6623', 'PG-A-13-b-', '131');
INSERT INTO co_cuentascb VALUES ('', '6622', 'PG-A-13-b-', '132');
INSERT INTO co_cuentascb VALUES ('', '6621', 'PG-A-13-a-', '133');
INSERT INTO co_cuentascb VALUES ('', '6620', 'PG-A-13-a-', '134');
INSERT INTO co_cuentascb VALUES ('', '6618', 'PG-A-13-b-', '135');
INSERT INTO co_cuentascb VALUES ('', '6617', 'PG-A-13-b-', '136');
INSERT INTO co_cuentascb VALUES ('', '6616', 'PG-A-13-a-', '137');
INSERT INTO co_cuentascb VALUES ('', '6615', 'PG-A-13-a-', '138');
INSERT INTO co_cuentascb VALUES ('', '6613', 'PG-A-13-b-', '139');
INSERT INTO co_cuentascb VALUES ('', '6612', 'PG-A-13-b-', '140');
INSERT INTO co_cuentascb VALUES ('', '6611', 'PG-A-13-a-', '141');
INSERT INTO co_cuentascb VALUES ('', '6610', 'PG-A-13-a-', '142');
INSERT INTO co_cuentascb VALUES ('', '660', 'PG-A-13-c-', '143');
INSERT INTO co_cuentascb VALUES ('', '659', 'PG-A-7-d-', '144');
INSERT INTO co_cuentascb VALUES ('', '651', 'PG-A-7-d-', '145');
INSERT INTO co_cuentascb VALUES ('', '650', 'PG-A-7-c-', '146');
INSERT INTO co_cuentascb VALUES ('', '649', 'PG-A-6-b-', '147');
INSERT INTO co_cuentascb VALUES ('', '6457', 'PG-A-6-c-', '148');
INSERT INTO co_cuentascb VALUES ('', '6450', 'PG-A-6-a-', '149');
INSERT INTO co_cuentascb VALUES ('', '644', 'PG-A-6-c-', '150');
INSERT INTO co_cuentascb VALUES ('', '643', 'PG-A-6-b-', '151');
INSERT INTO co_cuentascb VALUES ('', '642', 'PG-A-6-b-', '152');
INSERT INTO co_cuentascb VALUES ('', '641', 'PG-A-6-a-', '153');
INSERT INTO co_cuentascb VALUES ('', '640', 'PG-A-6-a-', '154');
INSERT INTO co_cuentascb VALUES ('', '639', 'PG-A-7-b-', '155');
INSERT INTO co_cuentascb VALUES ('', '638', 'PG-A-17--', '156');
INSERT INTO co_cuentascb VALUES ('', '636', 'PG-A-7-b-', '157');
INSERT INTO co_cuentascb VALUES ('', '634', 'PG-A-7-b-', '158');
INSERT INTO co_cuentascb VALUES ('', '633', 'PG-A-17--', '159');
INSERT INTO co_cuentascb VALUES ('', '631', 'PG-A-7-b-', '160');
INSERT INTO co_cuentascb VALUES ('', '6301', 'PG-A-17--', '161');
INSERT INTO co_cuentascb VALUES ('', '6300', 'PG-A-17--', '162');
INSERT INTO co_cuentascb VALUES ('', '62', 'PG-A-7-a-', '163');
INSERT INTO co_cuentascb VALUES ('', '612', 'PG-A-4-b-', '164');
INSERT INTO co_cuentascb VALUES ('', '611', 'PG-A-4-b-', '165');
INSERT INTO co_cuentascb VALUES ('', '610', 'PG-A-4-a-', '166');
INSERT INTO co_cuentascb VALUES ('', '6092', 'PG-A-4-b-', '167');
INSERT INTO co_cuentascb VALUES ('', '6091', 'PG-A-4-b-', '168');
INSERT INTO co_cuentascb VALUES ('', '6090', 'PG-A-4-a-', '169');
INSERT INTO co_cuentascb VALUES ('', '6082', 'PG-A-4-b-', '170');
INSERT INTO co_cuentascb VALUES ('', '6081', 'PG-A-4-b-', '171');
INSERT INTO co_cuentascb VALUES ('', '6080', 'PG-A-4-a-', '172');
INSERT INTO co_cuentascb VALUES ('', '607', 'PG-A-4-c-', '173');
INSERT INTO co_cuentascb VALUES ('', '6062', 'PG-A-4-b-', '174');
INSERT INTO co_cuentascb VALUES ('', '6061', 'PG-A-4-b-', '175');
INSERT INTO co_cuentascb VALUES ('', '6060', 'PG-A-4-a-', '176');
INSERT INTO co_cuentascb VALUES ('', '602', 'PG-A-4-b-', '177');
INSERT INTO co_cuentascb VALUES ('', '601', 'PG-A-4-b-', '178');
INSERT INTO co_cuentascb VALUES ('', '600', 'PG-A-4-a-', '179');
INSERT INTO co_cuentascb VALUES ('', '599', 'A-B--I-', '180');
INSERT INTO co_cuentascb VALUES ('', '598', 'A-B--V-2', '181');
INSERT INTO co_cuentascb VALUES ('', '597', 'A-B--V-3', '182');
INSERT INTO co_cuentascb VALUES ('', '5955', 'A-B--V-2', '183');
INSERT INTO co_cuentascb VALUES ('', '5954', 'A-B--IV-2', '184');
INSERT INTO co_cuentascb VALUES ('', '5953', 'A-B--IV-2', '185');
INSERT INTO co_cuentascb VALUES ('', '5945', 'A-B--V-3', '186');
INSERT INTO co_cuentascb VALUES ('', '5944', 'A-B--IV-3', '187');
INSERT INTO co_cuentascb VALUES ('', '5943', 'A-B--IV-3', '188');
INSERT INTO co_cuentascb VALUES ('', '593', 'A-B--IV-1', '189');
INSERT INTO co_cuentascb VALUES ('', '589', 'P-C--I-', '190');
INSERT INTO co_cuentascb VALUES ('', '588', 'P-C--I-', '191');
INSERT INTO co_cuentascb VALUES ('', '587', 'P-C--I-', '192');
INSERT INTO co_cuentascb VALUES ('', '586', 'P-C--I-', '193');
INSERT INTO co_cuentascb VALUES ('', '585', 'P-C--I-', '194');
INSERT INTO co_cuentascb VALUES ('', '584', 'A-B--I-', '195');
INSERT INTO co_cuentascb VALUES ('', '583', 'A-B--I-', '196');
INSERT INTO co_cuentascb VALUES ('', '582', 'A-B--I-', '197');
INSERT INTO co_cuentascb VALUES ('', '581', 'A-B--I-', '198');
INSERT INTO co_cuentascb VALUES ('', '580', 'A-B--I-', '199');
INSERT INTO co_cuentascb VALUES ('', '576', 'A-B--VII-2', '200');
INSERT INTO co_cuentascb VALUES ('', '575', 'A-B--VII-1', '201');
INSERT INTO co_cuentascb VALUES ('', '574', 'A-B--VII-1', '202');
INSERT INTO co_cuentascb VALUES ('', '573', 'A-B--VII-1', '203');
INSERT INTO co_cuentascb VALUES ('', '572', 'A-B--VII-1', '204');
INSERT INTO co_cuentascb VALUES ('', '571', 'A-B--VII-1', '205');
INSERT INTO co_cuentascb VALUES ('', '570', 'A-B--VII-1', '206');
INSERT INTO co_cuentascb VALUES ('', '569', 'P-C--III-5', '207');
INSERT INTO co_cuentascb VALUES ('', '568', 'P-C--VI-', '208');
INSERT INTO co_cuentascb VALUES ('', '567', 'A-B--VI-', '209');
INSERT INTO co_cuentascb VALUES ('', '566', 'A-B--V-5', '210');
INSERT INTO co_cuentascb VALUES ('', '565', 'A-B--V-5', '211');
INSERT INTO co_cuentascb VALUES ('', '561', 'P-C--III-5', '212');
INSERT INTO co_cuentascb VALUES ('', '560', 'P-C--III-5', '213');
INSERT INTO co_cuentascb VALUES ('', '5598', 'P-C--III-4', '214');
INSERT INTO co_cuentascb VALUES ('', '5595', 'P-C--III-4', '215');
INSERT INTO co_cuentascb VALUES ('', '5593', 'A-B--V-4', '216');
INSERT INTO co_cuentascb VALUES ('', '5590', 'A-B--V-4', '217');
INSERT INTO co_cuentascb VALUES ('', '5585', 'A-B--III-7', '218');
INSERT INTO co_cuentascb VALUES ('', '5580', 'A-B--III-7', '219');
INSERT INTO co_cuentascb VALUES ('', '557', 'P-A-1-VIII-', '220');
INSERT INTO co_cuentascb VALUES ('', '5566', 'P-C--III-5', '221');
INSERT INTO co_cuentascb VALUES ('', '5565', 'P-C--III-5', '222');
INSERT INTO co_cuentascb VALUES ('', '5564', 'P-C--IV-', '223');
INSERT INTO co_cuentascb VALUES ('', '5563', 'P-C--IV-', '224');
INSERT INTO co_cuentascb VALUES ('', '555', 'P-C--III-5', '225');
INSERT INTO co_cuentascb VALUES ('', '5533', 'A-B--III-3', '226');
INSERT INTO co_cuentascb VALUES ('', '5532', 'P-C--III-5', '227');
INSERT INTO co_cuentascb VALUES ('', '5531', 'A-B--III-3', '228');
INSERT INTO co_cuentascb VALUES ('', '5530', 'P-C--III-5', '229');
INSERT INTO co_cuentascb VALUES ('', '5525', 'P-C--III-5', '230');
INSERT INTO co_cuentascb VALUES ('', '5524', 'A-B--IV-5', '231');
INSERT INTO co_cuentascb VALUES ('', '5523', 'A-B--IV-5', '232');
INSERT INTO co_cuentascb VALUES ('', '551', 'P-C--III-5', '233');
INSERT INTO co_cuentascb VALUES ('', '550', 'A-B--V-5', '234');
INSERT INTO co_cuentascb VALUES ('', '549', 'A-B--V-1', '235');
INSERT INTO co_cuentascb VALUES ('', '548', 'A-B--V-5', '236');
INSERT INTO co_cuentascb VALUES ('', '547', 'A-B--V-2', '237');
INSERT INTO co_cuentascb VALUES ('', '546', 'A-B--V-3', '238');
INSERT INTO co_cuentascb VALUES ('', '545', 'A-B--V-5', '239');
INSERT INTO co_cuentascb VALUES ('', '544', 'A-B--III-4', '240');
INSERT INTO co_cuentascb VALUES ('', '543', 'A-B--V-2', '241');
INSERT INTO co_cuentascb VALUES ('', '542', 'A-B--V-2', '242');
INSERT INTO co_cuentascb VALUES ('', '541', 'A-B--V-3', '243');
INSERT INTO co_cuentascb VALUES ('', '540', 'A-B--V-1', '244');
INSERT INTO co_cuentascb VALUES ('', '5395', 'A-B--V-1', '245');
INSERT INTO co_cuentascb VALUES ('', '5394', 'A-B--IV-1', '246');
INSERT INTO co_cuentascb VALUES ('', '5393', 'A-B--IV-1', '247');
INSERT INTO co_cuentascb VALUES ('', '5355', 'A-B--V-5', '248');
INSERT INTO co_cuentascb VALUES ('', '5354', 'A-B--IV-5', '249');
INSERT INTO co_cuentascb VALUES ('', '5353', 'A-B--IV-5', '250');
INSERT INTO co_cuentascb VALUES ('', '5345', 'A-B--V-2', '251');
INSERT INTO co_cuentascb VALUES ('', '5344', 'A-B--IV-2', '252');
INSERT INTO co_cuentascb VALUES ('', '5343', 'A-B--IV-2', '253');
INSERT INTO co_cuentascb VALUES ('', '5335', 'A-B--V-3', '254');
INSERT INTO co_cuentascb VALUES ('', '5334', 'A-B--IV-3', '255');
INSERT INTO co_cuentascb VALUES ('', '5333', 'A-B--IV-3', '256');
INSERT INTO co_cuentascb VALUES ('', '5325', 'A-B--V-2', '257');
INSERT INTO co_cuentascb VALUES ('', '5324', 'A-B--IV-2', '258');
INSERT INTO co_cuentascb VALUES ('', '5323', 'A-B--IV-2', '259');
INSERT INTO co_cuentascb VALUES ('', '5315', 'A-B--V-3', '260');
INSERT INTO co_cuentascb VALUES ('', '5314', 'A-B--IV-3', '261');
INSERT INTO co_cuentascb VALUES ('', '5313', 'A-B--IV-3', '262');
INSERT INTO co_cuentascb VALUES ('', '5305', 'A-B--V-1', '263');
INSERT INTO co_cuentascb VALUES ('', '5304', 'A-B--IV-1', '264');
INSERT INTO co_cuentascb VALUES ('', '5303', 'A-B--IV-1', '265');
INSERT INTO co_cuentascb VALUES ('', '529', 'P-C--II-', '266');
INSERT INTO co_cuentascb VALUES ('', '528', 'P-C--III-5', '267');
INSERT INTO co_cuentascb VALUES ('', '527', 'P-C--III-2', '268');
INSERT INTO co_cuentascb VALUES ('', '526', 'P-C--III-5', '269');
INSERT INTO co_cuentascb VALUES ('', '525', 'P-C--III-5', '270');
INSERT INTO co_cuentascb VALUES ('', '524', 'P-C--III-3', '271');
INSERT INTO co_cuentascb VALUES ('', '523', 'P-C--III-5', '272');
INSERT INTO co_cuentascb VALUES ('', '522', 'P-C--III-5', '273');
INSERT INTO co_cuentascb VALUES ('', '521', 'P-C--III-5', '274');
INSERT INTO co_cuentascb VALUES ('', '520', 'P-C--III-2', '275');
INSERT INTO co_cuentascb VALUES ('', '5145', 'P-C--III-5', '276');
INSERT INTO co_cuentascb VALUES ('', '5144', 'P-C--IV-', '277');
INSERT INTO co_cuentascb VALUES ('', '5143', 'P-C--IV-', '278');
INSERT INTO co_cuentascb VALUES ('', '5135', 'P-C--III-5', '279');
INSERT INTO co_cuentascb VALUES ('', '5134', 'P-C--IV-', '280');
INSERT INTO co_cuentascb VALUES ('', '5133', 'P-C--IV-', '281');
INSERT INTO co_cuentascb VALUES ('', '5125', 'P-C--III-3', '282');
INSERT INTO co_cuentascb VALUES ('', '5124', 'P-C--IV-', '283');
INSERT INTO co_cuentascb VALUES ('', '5123', 'P-C--IV-', '284');
INSERT INTO co_cuentascb VALUES ('', '5115', 'P-C--III-5', '285');
INSERT INTO co_cuentascb VALUES ('', '5114', 'P-C--IV-', '286');
INSERT INTO co_cuentascb VALUES ('', '5113', 'P-C--IV-', '287');
INSERT INTO co_cuentascb VALUES ('', '5105', 'P-C--III-2', '288');
INSERT INTO co_cuentascb VALUES ('', '5104', 'P-C--IV-', '289');
INSERT INTO co_cuentascb VALUES ('', '5103', 'P-C--IV-', '290');
INSERT INTO co_cuentascb VALUES ('', '509', 'P-C--III-5', '291');
INSERT INTO co_cuentascb VALUES ('', '506', 'P-C--III-1', '292');
INSERT INTO co_cuentascb VALUES ('', '505', 'P-C--III-1', '293');
INSERT INTO co_cuentascb VALUES ('', '501', 'P-C--III-1', '294');
INSERT INTO co_cuentascb VALUES ('', '500', 'P-C--III-1', '295');
INSERT INTO co_cuentascb VALUES ('', '499', 'P-C--II-', '296');
INSERT INTO co_cuentascb VALUES ('', '4935', 'A-B--III-1', '297');
INSERT INTO co_cuentascb VALUES ('', '4934', 'A-B--III-2', '298');
INSERT INTO co_cuentascb VALUES ('', '4933', 'A-B--III-2', '299');
INSERT INTO co_cuentascb VALUES ('', '490', 'A-B--III-1', '300');
INSERT INTO co_cuentascb VALUES ('', '485', 'P-C--VI-', '301');
INSERT INTO co_cuentascb VALUES ('', '480', 'A-B--VI-', '302');
INSERT INTO co_cuentascb VALUES ('', '479', 'P-B--IV-', '303');
INSERT INTO co_cuentascb VALUES ('', '477', 'P-C--V-6', '304');
INSERT INTO co_cuentascb VALUES ('', '476', 'P-C--V-6', '305');
INSERT INTO co_cuentascb VALUES ('', '4758', 'P-C--V-6', '306');
INSERT INTO co_cuentascb VALUES ('', '4752', 'P-C--V-5', '307');
INSERT INTO co_cuentascb VALUES ('', '4751', 'P-C--V-6', '308');
INSERT INTO co_cuentascb VALUES ('', '4750', 'P-C--V-6', '309');
INSERT INTO co_cuentascb VALUES ('', '474', 'A-A--VI-', '310');
INSERT INTO co_cuentascb VALUES ('', '472', 'A-B--III-6', '311');
INSERT INTO co_cuentascb VALUES ('', '471', 'A-B--III-6', '312');
INSERT INTO co_cuentascb VALUES ('', '4709', 'A-B--III-5', '313');
INSERT INTO co_cuentascb VALUES ('', '4708', 'A-B--III-6', '314');
INSERT INTO co_cuentascb VALUES ('', '4700', 'A-B--III-6', '315');
INSERT INTO co_cuentascb VALUES ('', '466', 'P-C--V-4', '316');
INSERT INTO co_cuentascb VALUES ('', '465', 'P-C--V-4', '317');
INSERT INTO co_cuentascb VALUES ('', '460', 'A-B--III-4', '318');
INSERT INTO co_cuentascb VALUES ('', '44', 'A-B--III-3', '319');
INSERT INTO co_cuentascb VALUES ('', '438', 'P-C--V-7', '320');
INSERT INTO co_cuentascb VALUES ('', '437', 'A-B--III-1', '321');
INSERT INTO co_cuentascb VALUES ('', '436', 'A-B--III-1', '322');
INSERT INTO co_cuentascb VALUES ('', '435', 'A-B--III-1', '323');
INSERT INTO co_cuentascb VALUES ('', '434', 'A-B--III-2', '324');
INSERT INTO co_cuentascb VALUES ('', '433', 'A-B--III-2', '325');
INSERT INTO co_cuentascb VALUES ('', '432', 'A-B--III-1', '326');
INSERT INTO co_cuentascb VALUES ('', '431', 'A-B--III-1', '327');
INSERT INTO co_cuentascb VALUES ('', '430', 'A-B--III-1', '328');
INSERT INTO co_cuentascb VALUES ('', '41', 'P-C--V-3', '329');
INSERT INTO co_cuentascb VALUES ('', '407', 'A-B--II-6', '330');
INSERT INTO co_cuentascb VALUES ('', '406', 'P-C--V-1', '331');
INSERT INTO co_cuentascb VALUES ('', '405', 'P-C--V-1', '332');
INSERT INTO co_cuentascb VALUES ('', '404', 'P-C--V-2', '333');
INSERT INTO co_cuentascb VALUES ('', '403', 'P-C--V-2', '334');
INSERT INTO co_cuentascb VALUES ('', '401', 'P-C--V-1', '335');
INSERT INTO co_cuentascb VALUES ('', '400', 'P-C--V-1', '336');
INSERT INTO co_cuentascb VALUES ('', '396', 'A-B--II-5', '337');
INSERT INTO co_cuentascb VALUES ('', '395', 'A-B--II-4', '338');
INSERT INTO co_cuentascb VALUES ('', '394', 'A-B--II-3', '339');
INSERT INTO co_cuentascb VALUES ('', '393', 'A-B--II-3', '340');
INSERT INTO co_cuentascb VALUES ('', '392', 'A-B--II-2', '341');
INSERT INTO co_cuentascb VALUES ('', '391', 'A-B--II-2', '342');
INSERT INTO co_cuentascb VALUES ('', '390', 'A-B--II-1', '343');
INSERT INTO co_cuentascb VALUES ('', '36', 'A-B--II-5', '344');
INSERT INTO co_cuentascb VALUES ('', '35', 'A-B--II-4', '345');
INSERT INTO co_cuentascb VALUES ('', '34', 'A-B--II-3', '346');
INSERT INTO co_cuentascb VALUES ('', '33', 'A-B--II-3', '347');
INSERT INTO co_cuentascb VALUES ('', '32', 'A-B--II-2', '348');
INSERT INTO co_cuentascb VALUES ('', '31', 'A-B--II-2', '349');
INSERT INTO co_cuentascb VALUES ('', '30', 'A-B--II-1', '350');
INSERT INTO co_cuentascb VALUES ('', '298', 'A-A--V-2', '351');
INSERT INTO co_cuentascb VALUES ('', '297', 'A-A--V-3', '352');
INSERT INTO co_cuentascb VALUES ('', '2955', 'A-A--V-2', '353');
INSERT INTO co_cuentascb VALUES ('', '2954', 'A-A--IV-2', '354');
INSERT INTO co_cuentascb VALUES ('', '2953', 'A-A--IV-2', '355');
INSERT INTO co_cuentascb VALUES ('', '2945', 'A-A--V-3', '356');
INSERT INTO co_cuentascb VALUES ('', '2944', 'A-A--IV-3', '357');
INSERT INTO co_cuentascb VALUES ('', '2943', 'A-A--IV-3', '358');
INSERT INTO co_cuentascb VALUES ('', '293', 'A-A--IV-1', '359');
INSERT INTO co_cuentascb VALUES ('', '2921', 'A-A--III-2', '360');
INSERT INTO co_cuentascb VALUES ('', '2920', 'A-A--III-1', '361');
INSERT INTO co_cuentascb VALUES ('', '2919', 'A-A--II-2', '362');
INSERT INTO co_cuentascb VALUES ('', '2918', 'A-A--II-2', '363');
INSERT INTO co_cuentascb VALUES ('', '2917', 'A-A--II-2', '364');
INSERT INTO co_cuentascb VALUES ('', '2916', 'A-A--II-2', '365');
INSERT INTO co_cuentascb VALUES ('', '2915', 'A-A--II-2', '366');
INSERT INTO co_cuentascb VALUES ('', '2914', 'A-A--II-2', '367');
INSERT INTO co_cuentascb VALUES ('', '2913', 'A-A--II-2', '368');
INSERT INTO co_cuentascb VALUES ('', '2912', 'A-A--II-2', '369');
INSERT INTO co_cuentascb VALUES ('', '2911', 'A-A--II-1', '370');
INSERT INTO co_cuentascb VALUES ('', '2910', 'A-A--II-1', '371');
INSERT INTO co_cuentascb VALUES ('', '2906', 'A-A--I-5', '372');
INSERT INTO co_cuentascb VALUES ('', '2905', 'A-A--I-6', '373');
INSERT INTO co_cuentascb VALUES ('', '2903', 'A-A--I-3', '374');
INSERT INTO co_cuentascb VALUES ('', '2902', 'A-A--I-2', '375');
INSERT INTO co_cuentascb VALUES ('', '2901', 'A-A--I-1', '376');
INSERT INTO co_cuentascb VALUES ('', '2900', 'A-A--I-1', '377');
INSERT INTO co_cuentascb VALUES ('', '282', 'A-A--III-2', '378');
INSERT INTO co_cuentascb VALUES ('', '2819', 'A-A--II-2', '379');
INSERT INTO co_cuentascb VALUES ('', '2818', 'A-A--II-2', '380');
INSERT INTO co_cuentascb VALUES ('', '2817', 'A-A--II-2', '381');
INSERT INTO co_cuentascb VALUES ('', '2816', 'A-A--II-2', '382');
INSERT INTO co_cuentascb VALUES ('', '2815', 'A-A--II-2', '383');
INSERT INTO co_cuentascb VALUES ('', '2814', 'A-A--II-2', '384');
INSERT INTO co_cuentascb VALUES ('', '2813', 'A-A--II-2', '385');
INSERT INTO co_cuentascb VALUES ('', '2812', 'A-A--II-2', '386');
INSERT INTO co_cuentascb VALUES ('', '2811', 'A-A--II-1', '387');
INSERT INTO co_cuentascb VALUES ('', '2806', 'A-A--I-5', '388');
INSERT INTO co_cuentascb VALUES ('', '2805', 'A-A--I-6', '389');
INSERT INTO co_cuentascb VALUES ('', '2803', 'A-A--I-3', '390');
INSERT INTO co_cuentascb VALUES ('', '2802', 'A-A--I-2', '391');
INSERT INTO co_cuentascb VALUES ('', '2801', 'A-A--I-1', '392');
INSERT INTO co_cuentascb VALUES ('', '26', 'A-A--V-5', '393');
INSERT INTO co_cuentascb VALUES ('', '259', 'A-A--V-1', '394');
INSERT INTO co_cuentascb VALUES ('', '258', 'A-A--V-5', '395');
INSERT INTO co_cuentascb VALUES ('', '255', 'A-A--V-4', '396');
INSERT INTO co_cuentascb VALUES ('', '254', 'A-A--V-2', '397');
INSERT INTO co_cuentascb VALUES ('', '253', 'A-A--V-2', '398');
INSERT INTO co_cuentascb VALUES ('', '252', 'A-A--V-2', '399');
INSERT INTO co_cuentascb VALUES ('', '251', 'A-A--V-3', '400');
INSERT INTO co_cuentascb VALUES ('', '250', 'A-A--V-1', '401');
INSERT INTO co_cuentascb VALUES ('', '2495', 'A-A--V-1', '402');
INSERT INTO co_cuentascb VALUES ('', '2494', 'A-A--IV-1', '403');
INSERT INTO co_cuentascb VALUES ('', '2493', 'A-A--IV-1', '404');
INSERT INTO co_cuentascb VALUES ('', '2425', 'A-A--V-2', '405');
INSERT INTO co_cuentascb VALUES ('', '2424', 'A-A--IV-2', '406');
INSERT INTO co_cuentascb VALUES ('', '2423', 'A-A--IV-2', '407');
INSERT INTO co_cuentascb VALUES ('', '2415', 'A-A--V-3', '408');
INSERT INTO co_cuentascb VALUES ('', '2414', 'A-A--IV-3', '409');
INSERT INTO co_cuentascb VALUES ('', '2413', 'A-A--IV-3', '410');
INSERT INTO co_cuentascb VALUES ('', '2405', 'A-A--V-1', '411');
INSERT INTO co_cuentascb VALUES ('', '2404', 'A-A--IV-1', '412');
INSERT INTO co_cuentascb VALUES ('', '2403', 'A-A--IV-1', '413');
INSERT INTO co_cuentascb VALUES ('', '23', 'A-A--II-3', '414');
INSERT INTO co_cuentascb VALUES ('', '221', 'A-A--III-2', '415');
INSERT INTO co_cuentascb VALUES ('', '220', 'A-A--III-1', '416');
INSERT INTO co_cuentascb VALUES ('', '219', 'A-A--II-2', '417');
INSERT INTO co_cuentascb VALUES ('', '218', 'A-A--II-2', '418');
INSERT INTO co_cuentascb VALUES ('', '217', 'A-A--II-2', '419');
INSERT INTO co_cuentascb VALUES ('', '216', 'A-A--II-2', '420');
INSERT INTO co_cuentascb VALUES ('', '215', 'A-A--II-2', '421');
INSERT INTO co_cuentascb VALUES ('', '214', 'A-A--II-2', '422');
INSERT INTO co_cuentascb VALUES ('', '213', 'A-A--II-2', '423');
INSERT INTO co_cuentascb VALUES ('', '212', 'A-A--II-2', '424');
INSERT INTO co_cuentascb VALUES ('', '211', 'A-A--II-1', '425');
INSERT INTO co_cuentascb VALUES ('', '210', 'A-A--II-1', '426');
INSERT INTO co_cuentascb VALUES ('', '209', 'A-A--I-6', '427');
INSERT INTO co_cuentascb VALUES ('', '206', 'A-A--I-5', '428');
INSERT INTO co_cuentascb VALUES ('', '205', 'A-A--I-6', '429');
INSERT INTO co_cuentascb VALUES ('', '204', 'A-A--I-4', '430');
INSERT INTO co_cuentascb VALUES ('', '203', 'A-A--I-3', '431');
INSERT INTO co_cuentascb VALUES ('', '202', 'A-A--I-2', '432');
INSERT INTO co_cuentascb VALUES ('', '201', 'A-A--I-1', '433');
INSERT INTO co_cuentascb VALUES ('', '200', 'A-A--I-1', '434');
INSERT INTO co_cuentascb VALUES ('', '194', 'P-C--III-5', '435');
INSERT INTO co_cuentascb VALUES ('', '192', 'P-C--III-5', '436');
INSERT INTO co_cuentascb VALUES ('', '190', 'P-C--III-5', '437');
INSERT INTO co_cuentascb VALUES ('', '189', 'P-B--II-5', '438');
INSERT INTO co_cuentascb VALUES ('', '185', 'P-B--II-5', '439');
INSERT INTO co_cuentascb VALUES ('', '181', 'P-B--V-', '440');
INSERT INTO co_cuentascb VALUES ('', '180', 'P-B--II-5', '441');
INSERT INTO co_cuentascb VALUES ('', '179', 'P-B--II-1', '442');
INSERT INTO co_cuentascb VALUES ('', '178', 'P-B--II-1', '443');
INSERT INTO co_cuentascb VALUES ('', '177', 'P-B--II-1', '444');
INSERT INTO co_cuentascb VALUES ('', '176', 'P-B--II-4', '445');
INSERT INTO co_cuentascb VALUES ('', '175', 'P-B--II-5', '446');
INSERT INTO co_cuentascb VALUES ('', '174', 'P-B--II-3', '447');
INSERT INTO co_cuentascb VALUES ('', '173', 'P-B--II-5', '448');
INSERT INTO co_cuentascb VALUES ('', '172', 'P-B--II-5', '449');
INSERT INTO co_cuentascb VALUES ('', '171', 'P-B--II-5', '450');
INSERT INTO co_cuentascb VALUES ('', '170', 'P-B--II-2', '451');
INSERT INTO co_cuentascb VALUES ('', '1635', 'P-B--II-5', '452');
INSERT INTO co_cuentascb VALUES ('', '1634', 'P-B--III-', '453');
INSERT INTO co_cuentascb VALUES ('', '1633', 'P-B--III-', '454');
INSERT INTO co_cuentascb VALUES ('', '1625', 'P-B--II-3', '455');
INSERT INTO co_cuentascb VALUES ('', '1624', 'P-B--III-', '456');
INSERT INTO co_cuentascb VALUES ('', '1623', 'P-B--III-', '457');
INSERT INTO co_cuentascb VALUES ('', '1615', 'P-B--II-5', '458');
INSERT INTO co_cuentascb VALUES ('', '1614', 'P-B--III-', '459');
INSERT INTO co_cuentascb VALUES ('', '1613', 'P-B--III-', '460');
INSERT INTO co_cuentascb VALUES ('', '1605', 'P-B--II-2', '461');
INSERT INTO co_cuentascb VALUES ('', '1604', 'P-B--III-', '462');
INSERT INTO co_cuentascb VALUES ('', '1603', 'P-B--III-', '463');
INSERT INTO co_cuentascb VALUES ('', '150', 'P-B--II-5', '464');
INSERT INTO co_cuentascb VALUES ('', '147', 'P-B--I-4', '465');
INSERT INTO co_cuentascb VALUES ('', '146', 'P-B--I-3', '466');
INSERT INTO co_cuentascb VALUES ('', '145', 'P-B--I-2', '467');
INSERT INTO co_cuentascb VALUES ('', '143', 'P-B--I-4', '468');
INSERT INTO co_cuentascb VALUES ('', '142', 'P-B--I-4', '469');
INSERT INTO co_cuentascb VALUES ('', '141', 'P-B--I-4', '470');
INSERT INTO co_cuentascb VALUES ('', '140', 'P-B--I-1', '471');
INSERT INTO co_cuentascb VALUES ('', '137', 'P-A-2-III-', '472');
INSERT INTO co_cuentascb VALUES ('', '136', 'P-A-2-I-', '473');
INSERT INTO co_cuentascb VALUES ('', '135', 'P-A-2-III-', '474');
INSERT INTO co_cuentascb VALUES ('', '1341', 'P-A-2-II-', '475');
INSERT INTO co_cuentascb VALUES ('', '1340', 'P-A-2-II-', '476');
INSERT INTO co_cuentascb VALUES ('', '133', 'P-A-2-I-', '477');
INSERT INTO co_cuentascb VALUES ('', '132', 'P-A-3--', '478');
INSERT INTO co_cuentascb VALUES ('', '131', 'P-A-3--', '479');
INSERT INTO co_cuentascb VALUES ('', '130', 'P-A-3--', '480');
INSERT INTO co_cuentascb VALUES ('', '129', 'P-A-1-VII-', '481');
INSERT INTO co_cuentascb VALUES ('', '121', 'P-A-1-V-2', '482');
INSERT INTO co_cuentascb VALUES ('', '120', 'P-A-1-V-1', '483');
INSERT INTO co_cuentascb VALUES ('', '119', 'P-A-1-III-2', '484');
INSERT INTO co_cuentascb VALUES ('', '118', 'P-A-1-VI-', '485');
INSERT INTO co_cuentascb VALUES ('', '115', 'P-A-1-III-2', '486');
INSERT INTO co_cuentascb VALUES ('', '1144', 'P-A-1-III-2', '487');
INSERT INTO co_cuentascb VALUES ('', '1143', 'P-A-1-III-2', '488');
INSERT INTO co_cuentascb VALUES ('', '1142', 'P-A-1-III-2', '489');
INSERT INTO co_cuentascb VALUES ('', '1141', 'P-A-1-III-1', '490');
INSERT INTO co_cuentascb VALUES ('', '1140', 'P-A-1-III-2', '491');
INSERT INTO co_cuentascb VALUES ('', '113', 'P-A-1-III-2', '492');
INSERT INTO co_cuentascb VALUES ('', '112', 'P-A-1-III-1', '493');
INSERT INTO co_cuentascb VALUES ('', '111', 'P-A-1-IX-', '494');
INSERT INTO co_cuentascb VALUES ('', '110', 'P-A-1-II-', '495');
INSERT INTO co_cuentascb VALUES ('', '109', 'P-A-1-IV-', '496');
INSERT INTO co_cuentascb VALUES ('', '108', 'P-A-1-IV-', '497');
INSERT INTO co_cuentascb VALUES ('', '1044', 'P-C--III-5', '498');
INSERT INTO co_cuentascb VALUES ('', '1040', 'P-A-1-I-2', '499');
INSERT INTO co_cuentascb VALUES ('', '1034', 'P-C--III-5', '500');
INSERT INTO co_cuentascb VALUES ('', '1030', 'P-A-1-I-2', '501');
INSERT INTO co_cuentascb VALUES ('', '102', 'P-A-1-I-1', '502');
INSERT INTO co_cuentascb VALUES ('', '101', 'P-A-1-I-1', '503');
INSERT INTO co_cuentascb VALUES ('', '100', 'P-A-1-I-1', '504');


#
# Estructura de la tabla `co_cuentascbba`
#

DROP TABLE IF EXISTS `co_cuentascbba`;
CREATE TABLE `co_cuentascbba` (
  `desccuenta` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_cuentascbba`
#

INSERT INTO co_cuentascbba VALUES ('', '994', 'IG-B--VI-1', '1');
INSERT INTO co_cuentascbba VALUES ('', '993', 'IG-B--VI-1', '2');
INSERT INTO co_cuentascbba VALUES ('', '992', 'IG-A--I-1', '3');
INSERT INTO co_cuentascbba VALUES ('', '991', 'IG-A--I-1', '4');
INSERT INTO co_cuentascbba VALUES ('', '95', 'IG-A--IV-', '5');
INSERT INTO co_cuentascbba VALUES ('', '94', 'IG-A--III-', '6');
INSERT INTO co_cuentascbba VALUES ('', '912', 'IG-B--VII-', '7');
INSERT INTO co_cuentascbba VALUES ('', '910', 'IG-A--II-', '8');
INSERT INTO co_cuentascbba VALUES ('', '902', 'IG-B--VI-1', '9');
INSERT INTO co_cuentascbba VALUES ('', '900', 'IG-A--I-1', '10');
INSERT INTO co_cuentascbba VALUES ('', '89', 'IG-A--I-1', '11');
INSERT INTO co_cuentascbba VALUES ('', '85', 'IG-A--IV-', '12');
INSERT INTO co_cuentascbba VALUES ('', '84', 'IG-B--VIII-', '13');
INSERT INTO co_cuentascbba VALUES ('', '838', 'IG-A--V-', '14');
INSERT INTO co_cuentascbba VALUES ('', '837', 'IG-B--IX-', '15');
INSERT INTO co_cuentascbba VALUES ('', '836', 'IG-B--IX-', '16');
INSERT INTO co_cuentascbba VALUES ('', '835', 'IG-A--V-', '17');
INSERT INTO co_cuentascbba VALUES ('', '834', 'IG-A--V-', '18');
INSERT INTO co_cuentascbba VALUES ('', '833', 'IG-A--V-', '19');
INSERT INTO co_cuentascbba VALUES ('', '8301', 'IG-B--IX-', '20');
INSERT INTO co_cuentascbba VALUES ('', '8300', 'IG-A--V-', '21');
INSERT INTO co_cuentascbba VALUES ('', '812', 'IG-B--VII-', '22');
INSERT INTO co_cuentascbba VALUES ('', '810', 'IG-A--II-', '23');
INSERT INTO co_cuentascbba VALUES ('', '802', 'IG-B--VI-1', '24');
INSERT INTO co_cuentascbba VALUES ('', '800', 'IG-A--I-1', '25');
INSERT INTO co_cuentascbba VALUES ('', '799', 'PG-A-16-a-', '26');
INSERT INTO co_cuentascbba VALUES ('', '798', 'PG-A-16-a-', '27');
INSERT INTO co_cuentascbba VALUES ('', '797', 'PG-A-16-a-', '28');
INSERT INTO co_cuentascbba VALUES ('', '796', 'PG-A-16-a-', '29');
INSERT INTO co_cuentascbba VALUES ('', '7956', 'PG-A-10--', '30');
INSERT INTO co_cuentascbba VALUES ('', '7955', 'PG-A-10--', '31');
INSERT INTO co_cuentascbba VALUES ('', '7954', 'PG-A-7-a-', '32');
INSERT INTO co_cuentascbba VALUES ('', '7952', 'PG-A-10--', '33');
INSERT INTO co_cuentascbba VALUES ('', '7951', 'PG-A-10--', '34');
INSERT INTO co_cuentascbba VALUES ('', '794', 'PG-A-7-a-', '35');
INSERT INTO co_cuentascbba VALUES ('', '7933', 'PG-A-4-a-', '36');
INSERT INTO co_cuentascbba VALUES ('', '7932', 'PG-A-4-a-', '37');
INSERT INTO co_cuentascbba VALUES ('', '7931', 'PG-A-4-a-', '38');
INSERT INTO co_cuentascbba VALUES ('', '7930', 'PG-A-2--', '39');
INSERT INTO co_cuentascbba VALUES ('', '792', 'PG-A-11-a-', '40');
INSERT INTO co_cuentascbba VALUES ('', '791', 'PG-A-11-a-', '41');
INSERT INTO co_cuentascbba VALUES ('', '790', 'PG-A-11-a-', '42');
INSERT INTO co_cuentascbba VALUES ('', '775', 'PG-A-16-a-', '43');
INSERT INTO co_cuentascbba VALUES ('', '773', 'PG-A-16-a-', '44');
INSERT INTO co_cuentascbba VALUES ('', '772', 'PG-A-11-a-', '45');
INSERT INTO co_cuentascbba VALUES ('', '771', 'PG-A-11-a-', '46');
INSERT INTO co_cuentascbba VALUES ('', '770', 'PG-A-11-a-', '47');
INSERT INTO co_cuentascbba VALUES ('', '769', 'PG-A-12-a-1', '48');
INSERT INTO co_cuentascbba VALUES ('', '768', 'PG-A-15--', '49');
INSERT INTO co_cuentascbba VALUES ('', '767', 'PG-A-12-a-1', '50');
INSERT INTO co_cuentascbba VALUES ('', '766', 'PG-A-16-a-', '51');
INSERT INTO co_cuentascbba VALUES ('', '763', 'PG-A-14-a-', '52');
INSERT INTO co_cuentascbba VALUES ('', '762', 'PG-A-12-a-1', '53');
INSERT INTO co_cuentascbba VALUES ('', '761', 'PG-A-12-a-1', '54');
INSERT INTO co_cuentascbba VALUES ('', '760', 'PG-A-12-a-1', '55');
INSERT INTO co_cuentascbba VALUES ('', '75', 'PG-A-5-a-', '56');
INSERT INTO co_cuentascbba VALUES ('', '747', 'PG-A-5-a-', '57');
INSERT INTO co_cuentascbba VALUES ('', '746', 'PG-A-9--', '58');
INSERT INTO co_cuentascbba VALUES ('', '740', 'PG-A-5-a-', '59');
INSERT INTO co_cuentascbba VALUES ('', '73', 'PG-A-3--', '60');
INSERT INTO co_cuentascbba VALUES ('', '71', 'PG-A-2--', '61');
INSERT INTO co_cuentascbba VALUES ('', '709', 'PG-A-1-a-', '62');
INSERT INTO co_cuentascbba VALUES ('', '708', 'PG-A-1-a-', '63');
INSERT INTO co_cuentascbba VALUES ('', '706', 'PG-A-1-a-', '64');
INSERT INTO co_cuentascbba VALUES ('', '705', 'PG-A-1-a-', '65');
INSERT INTO co_cuentascbba VALUES ('', '704', 'PG-A-1-a-', '66');
INSERT INTO co_cuentascbba VALUES ('', '703', 'PG-A-1-a-', '67');
INSERT INTO co_cuentascbba VALUES ('', '702', 'PG-A-1-a-', '68');
INSERT INTO co_cuentascbba VALUES ('', '701', 'PG-A-1-a-', '69');
INSERT INTO co_cuentascbba VALUES ('', '700', 'PG-A-1-a-', '70');
INSERT INTO co_cuentascbba VALUES ('', '699', 'PG-A-16-a-', '71');
INSERT INTO co_cuentascbba VALUES ('', '698', 'PG-A-16-a-', '72');
INSERT INTO co_cuentascbba VALUES ('', '697', 'PG-A-16-a-', '73');
INSERT INTO co_cuentascbba VALUES ('', '696', 'PG-A-16-a-', '74');
INSERT INTO co_cuentascbba VALUES ('', '695', 'PG-A-7-a-', '75');
INSERT INTO co_cuentascbba VALUES ('', '694', 'PG-A-7-a-', '76');
INSERT INTO co_cuentascbba VALUES ('', '6933', 'PG-A-4-a-', '77');
INSERT INTO co_cuentascbba VALUES ('', '6932', 'PG-A-4-a-', '78');
INSERT INTO co_cuentascbba VALUES ('', '6931', 'PG-A-4-a-', '79');
INSERT INTO co_cuentascbba VALUES ('', '6930', 'PG-A-2--', '80');
INSERT INTO co_cuentascbba VALUES ('', '692', 'PG-A-11-a-', '81');
INSERT INTO co_cuentascbba VALUES ('', '691', 'PG-A-11-a-', '82');
INSERT INTO co_cuentascbba VALUES ('', '690', 'PG-A-11-a-', '83');
INSERT INTO co_cuentascbba VALUES ('', '68', 'PG-A-8--', '84');
INSERT INTO co_cuentascbba VALUES ('', '675', 'PG-A-16-a-', '85');
INSERT INTO co_cuentascbba VALUES ('', '672', 'PG-A-11-a-', '86');
INSERT INTO co_cuentascbba VALUES ('', '671', 'PG-A-11-a-', '87');
INSERT INTO co_cuentascbba VALUES ('', '670', 'PG-A-11-a-', '88');
INSERT INTO co_cuentascbba VALUES ('', '669', 'PG-A-13-a-', '89');
INSERT INTO co_cuentascbba VALUES ('', '668', 'PG-A-16-a-', '90');
INSERT INTO co_cuentascbba VALUES ('', '667', 'PG-A-16-a-', '91');
INSERT INTO co_cuentascbba VALUES ('', '666', 'PG-A-16-a-', '92');
INSERT INTO co_cuentascbba VALUES ('', '665', 'PG-A-13-a-', '93');
INSERT INTO co_cuentascbba VALUES ('', '664', 'PG-A-13-a-', '94');
INSERT INTO co_cuentascbba VALUES ('', '663', 'PG-A-14-a-', '95');
INSERT INTO co_cuentascbba VALUES ('', '662', 'PG-A-13-a-', '96');
INSERT INTO co_cuentascbba VALUES ('', '661', 'PG-A-13-a-', '97');
INSERT INTO co_cuentascbba VALUES ('', '660', 'PG-A-13-a-', '98');
INSERT INTO co_cuentascbba VALUES ('', '65', 'PG-A-7-a-', '99');
INSERT INTO co_cuentascbba VALUES ('', '64', 'PG-A-6-a-', '100');
INSERT INTO co_cuentascbba VALUES ('', '639', 'PG-A-7-a-', '101');
INSERT INTO co_cuentascbba VALUES ('', '638', 'PG-A-17--', '102');
INSERT INTO co_cuentascbba VALUES ('', '636', 'PG-A-7-a-', '103');
INSERT INTO co_cuentascbba VALUES ('', '634', 'PG-A-7-a-', '104');
INSERT INTO co_cuentascbba VALUES ('', '633', 'PG-A-17--', '105');
INSERT INTO co_cuentascbba VALUES ('', '631', 'PG-A-7-a-', '106');
INSERT INTO co_cuentascbba VALUES ('', '6301', 'PG-A-17--', '107');
INSERT INTO co_cuentascbba VALUES ('', '6300', 'PG-A-17--', '108');
INSERT INTO co_cuentascbba VALUES ('', '62', 'PG-A-7-a-', '109');
INSERT INTO co_cuentascbba VALUES ('', '61', 'PG-A-4-a-', '110');
INSERT INTO co_cuentascbba VALUES ('', '609', 'PG-A-4-a-', '111');
INSERT INTO co_cuentascbba VALUES ('', '608', 'PG-A-4-a-', '112');
INSERT INTO co_cuentascbba VALUES ('', '607', 'PG-A-4-a-', '113');
INSERT INTO co_cuentascbba VALUES ('', '606', 'PG-A-4-a-', '114');
INSERT INTO co_cuentascbba VALUES ('', '602', 'PG-A-4-a-', '115');
INSERT INTO co_cuentascbba VALUES ('', '601', 'PG-A-4-a-', '116');
INSERT INTO co_cuentascbba VALUES ('', '600', 'PG-A-4-a-', '117');
INSERT INTO co_cuentascbba VALUES ('', '599', 'A-B--I-', '118');
INSERT INTO co_cuentascbba VALUES ('', '598', 'A-B--V-1', '119');
INSERT INTO co_cuentascbba VALUES ('', '597', 'A-B--V-1', '120');
INSERT INTO co_cuentascbba VALUES ('', '5955', 'A-B--V-1', '121');
INSERT INTO co_cuentascbba VALUES ('', '5954', 'A-B--IV-1', '122');
INSERT INTO co_cuentascbba VALUES ('', '5953', 'A-B--IV-1', '123');
INSERT INTO co_cuentascbba VALUES ('', '5945', 'A-B--V-1', '124');
INSERT INTO co_cuentascbba VALUES ('', '5944', 'A-B--IV-1', '125');
INSERT INTO co_cuentascbba VALUES ('', '5943', 'A-B--IV-1', '126');
INSERT INTO co_cuentascbba VALUES ('', '593', 'A-B--IV-1', '127');
INSERT INTO co_cuentascbba VALUES ('', '589', 'P-C--I-', '128');
INSERT INTO co_cuentascbba VALUES ('', '588', 'P-C--I-', '129');
INSERT INTO co_cuentascbba VALUES ('', '587', 'P-C--I-', '130');
INSERT INTO co_cuentascbba VALUES ('', '586', 'P-C--I-', '131');
INSERT INTO co_cuentascbba VALUES ('', '585', 'P-C--I-', '132');
INSERT INTO co_cuentascbba VALUES ('', '584', 'A-B--I-', '133');
INSERT INTO co_cuentascbba VALUES ('', '583', 'A-B--I-', '134');
INSERT INTO co_cuentascbba VALUES ('', '582', 'A-B--I-', '135');
INSERT INTO co_cuentascbba VALUES ('', '581', 'A-B--I-', '136');
INSERT INTO co_cuentascbba VALUES ('', '580', 'A-B--I-', '137');
INSERT INTO co_cuentascbba VALUES ('', '57', 'A-B--VII-1', '138');
INSERT INTO co_cuentascbba VALUES ('', '569', 'P-C--III-3', '139');
INSERT INTO co_cuentascbba VALUES ('', '568', 'P-C--VI-', '140');
INSERT INTO co_cuentascbba VALUES ('', '567', 'A-B--VI-', '141');
INSERT INTO co_cuentascbba VALUES ('', '566', 'A-B--V-1', '142');
INSERT INTO co_cuentascbba VALUES ('', '565', 'A-B--V-1', '143');
INSERT INTO co_cuentascbba VALUES ('', '561', 'P-C--III-3', '144');
INSERT INTO co_cuentascbba VALUES ('', '560', 'P-C--III-3', '145');
INSERT INTO co_cuentascbba VALUES ('', '5598', 'P-C--III-3', '146');
INSERT INTO co_cuentascbba VALUES ('', '5595', 'P-C--III-3', '147');
INSERT INTO co_cuentascbba VALUES ('', '5593', 'A-B--V-1', '148');
INSERT INTO co_cuentascbba VALUES ('', '5590', 'A-B--V-1', '149');
INSERT INTO co_cuentascbba VALUES ('', '5580', 'A-B--III-2', '150');
INSERT INTO co_cuentascbba VALUES ('', '557', 'P-A-1-VIII-', '151');
INSERT INTO co_cuentascbba VALUES ('', '5566', 'P-C--III-3', '152');
INSERT INTO co_cuentascbba VALUES ('', '5565', 'P-C--III-3', '153');
INSERT INTO co_cuentascbba VALUES ('', '5564', 'P-C--IV-', '154');
INSERT INTO co_cuentascbba VALUES ('', '5563', 'P-C--IV-', '155');
INSERT INTO co_cuentascbba VALUES ('', '555', 'P-C--III-3', '156');
INSERT INTO co_cuentascbba VALUES ('', '5533', 'A-B--III-3', '157');
INSERT INTO co_cuentascbba VALUES ('', '5532', 'P-C--III-3', '158');
INSERT INTO co_cuentascbba VALUES ('', '5531', 'A-B--III-3', '159');
INSERT INTO co_cuentascbba VALUES ('', '5530', 'P-C--III-3', '160');
INSERT INTO co_cuentascbba VALUES ('', '5525', 'P-C--III-3', '161');
INSERT INTO co_cuentascbba VALUES ('', '5524', 'P-C--IV-', '162');
INSERT INTO co_cuentascbba VALUES ('', '5523', 'P-C--IV-', '163');
INSERT INTO co_cuentascbba VALUES ('', '551', 'P-C--III-3', '164');
INSERT INTO co_cuentascbba VALUES ('', '549', 'A-B--V-1', '165');
INSERT INTO co_cuentascbba VALUES ('', '548', 'A-B--V-1', '166');
INSERT INTO co_cuentascbba VALUES ('', '547', 'A-B--V-1', '167');
INSERT INTO co_cuentascbba VALUES ('', '546', 'A-B--V-1', '168');
INSERT INTO co_cuentascbba VALUES ('', '545', 'A-B--V-1', '169');
INSERT INTO co_cuentascbba VALUES ('', '544', 'A-B--III-3', '170');
INSERT INTO co_cuentascbba VALUES ('', '543', 'A-B--V-1', '171');
INSERT INTO co_cuentascbba VALUES ('', '542', 'A-B--V-1', '172');
INSERT INTO co_cuentascbba VALUES ('', '541', 'A-B--V-1', '173');
INSERT INTO co_cuentascbba VALUES ('', '540', 'A-B--V-1', '174');
INSERT INTO co_cuentascbba VALUES ('', '5395', 'A-B--V-1', '175');
INSERT INTO co_cuentascbba VALUES ('', '5394', 'A-B--IV-1', '176');
INSERT INTO co_cuentascbba VALUES ('', '5393', 'A-B--IV-1', '177');
INSERT INTO co_cuentascbba VALUES ('', '5355', 'A-B--V-1', '178');
INSERT INTO co_cuentascbba VALUES ('', '5354', 'A-B--IV-1', '179');
INSERT INTO co_cuentascbba VALUES ('', '5353', 'A-B--IV-1', '180');
INSERT INTO co_cuentascbba VALUES ('', '5345', 'A-B--V-1', '181');
INSERT INTO co_cuentascbba VALUES ('', '5344', 'A-B--IV-1', '182');
INSERT INTO co_cuentascbba VALUES ('', '5343', 'A-B--IV-1', '183');
INSERT INTO co_cuentascbba VALUES ('', '5335', 'A-B--V-1', '184');
INSERT INTO co_cuentascbba VALUES ('', '5334', 'A-B--IV-1', '185');
INSERT INTO co_cuentascbba VALUES ('', '5333', 'A-B--IV-1', '186');
INSERT INTO co_cuentascbba VALUES ('', '5325', 'A-B--V-1', '187');
INSERT INTO co_cuentascbba VALUES ('', '5324', 'A-B--IV-1', '188');
INSERT INTO co_cuentascbba VALUES ('', '5323', 'A-B--IV-1', '189');
INSERT INTO co_cuentascbba VALUES ('', '5315', 'A-B--V-1', '190');
INSERT INTO co_cuentascbba VALUES ('', '5314', 'A-B--IV-1', '191');
INSERT INTO co_cuentascbba VALUES ('', '5313', 'A-B--IV-1', '192');
INSERT INTO co_cuentascbba VALUES ('', '5305', 'A-B--V-1', '193');
INSERT INTO co_cuentascbba VALUES ('', '5304', 'A-B--IV-1', '194');
INSERT INTO co_cuentascbba VALUES ('', '5303', 'A-B--IV-1', '195');
INSERT INTO co_cuentascbba VALUES ('', '529', 'P-C--II-', '196');
INSERT INTO co_cuentascbba VALUES ('', '528', 'P-C--III-3', '197');
INSERT INTO co_cuentascbba VALUES ('', '527', 'P-C--III-1', '198');
INSERT INTO co_cuentascbba VALUES ('', '526', 'P-C--III-3', '199');
INSERT INTO co_cuentascbba VALUES ('', '525', 'P-C--III-3', '200');
INSERT INTO co_cuentascbba VALUES ('', '524', 'P-C--III-2', '201');
INSERT INTO co_cuentascbba VALUES ('', '523', 'P-C--III-3', '202');
INSERT INTO co_cuentascbba VALUES ('', '522', 'P-C--III-3', '203');
INSERT INTO co_cuentascbba VALUES ('', '521', 'P-C--III-3', '204');
INSERT INTO co_cuentascbba VALUES ('', '520', 'P-C--III-1', '205');
INSERT INTO co_cuentascbba VALUES ('', '5145', 'P-C--III-3', '206');
INSERT INTO co_cuentascbba VALUES ('', '5144', 'P-C--IV-', '207');
INSERT INTO co_cuentascbba VALUES ('', '5143', 'P-C--IV-', '208');
INSERT INTO co_cuentascbba VALUES ('', '5135', 'P-C--III-3', '209');
INSERT INTO co_cuentascbba VALUES ('', '5134', 'P-C--IV-', '210');
INSERT INTO co_cuentascbba VALUES ('', '5133', 'P-C--IV-', '211');
INSERT INTO co_cuentascbba VALUES ('', '5125', 'P-C--III-2', '212');
INSERT INTO co_cuentascbba VALUES ('', '5124', 'P-C--IV-', '213');
INSERT INTO co_cuentascbba VALUES ('', '5123', 'P-C--IV-', '214');
INSERT INTO co_cuentascbba VALUES ('', '5115', 'P-C--III-3', '215');
INSERT INTO co_cuentascbba VALUES ('', '5114', 'P-C--IV-', '216');
INSERT INTO co_cuentascbba VALUES ('', '5113', 'P-C--IV-', '217');
INSERT INTO co_cuentascbba VALUES ('', '5105', 'P-C--III-1', '218');
INSERT INTO co_cuentascbba VALUES ('', '5104', 'P-C--IV-', '219');
INSERT INTO co_cuentascbba VALUES ('', '5103', 'P-C--IV-', '220');
INSERT INTO co_cuentascbba VALUES ('', '509', 'P-C--III-3', '221');
INSERT INTO co_cuentascbba VALUES ('', '506', 'P-C--III-3', '222');
INSERT INTO co_cuentascbba VALUES ('', '505', 'P-C--III-3', '223');
INSERT INTO co_cuentascbba VALUES ('', '501', 'P-C--III-3', '224');
INSERT INTO co_cuentascbba VALUES ('', '500', 'P-C--III-3', '225');
INSERT INTO co_cuentascbba VALUES ('', '499', 'P-C--II-', '226');
INSERT INTO co_cuentascbba VALUES ('', '493', 'A-B--III-1', '227');
INSERT INTO co_cuentascbba VALUES ('', '490', 'A-B--III-1', '228');
INSERT INTO co_cuentascbba VALUES ('', '485', 'P-C--VI-', '229');
INSERT INTO co_cuentascbba VALUES ('', '480', 'A-B--VI-', '230');
INSERT INTO co_cuentascbba VALUES ('', '479', 'P-B--IV-', '231');
INSERT INTO co_cuentascbba VALUES ('', '477', 'P-C--V-2', '232');
INSERT INTO co_cuentascbba VALUES ('', '476', 'P-C--V-2', '233');
INSERT INTO co_cuentascbba VALUES ('', '475', 'P-C--V-2', '234');
INSERT INTO co_cuentascbba VALUES ('', '474', 'A-A--VI-', '235');
INSERT INTO co_cuentascbba VALUES ('', '472', 'A-B--III-3', '236');
INSERT INTO co_cuentascbba VALUES ('', '471', 'A-B--III-3', '237');
INSERT INTO co_cuentascbba VALUES ('', '470', 'A-B--III-3', '238');
INSERT INTO co_cuentascbba VALUES ('', '466', 'P-C--V-2', '239');
INSERT INTO co_cuentascbba VALUES ('', '465', 'P-C--V-2', '240');
INSERT INTO co_cuentascbba VALUES ('', '460', 'A-B--III-3', '241');
INSERT INTO co_cuentascbba VALUES ('', '44', 'A-B--III-3', '242');
INSERT INTO co_cuentascbba VALUES ('', '438', 'P-C--V-2', '243');
INSERT INTO co_cuentascbba VALUES ('', '437', 'A-B--III-1', '244');
INSERT INTO co_cuentascbba VALUES ('', '436', 'A-B--III-1', '245');
INSERT INTO co_cuentascbba VALUES ('', '435', 'A-B--III-1', '246');
INSERT INTO co_cuentascbba VALUES ('', '434', 'A-B--III-1', '247');
INSERT INTO co_cuentascbba VALUES ('', '433', 'A-B--III-1', '248');
INSERT INTO co_cuentascbba VALUES ('', '432', 'A-B--III-1', '249');
INSERT INTO co_cuentascbba VALUES ('', '431', 'A-B--III-1', '250');
INSERT INTO co_cuentascbba VALUES ('', '430', 'A-B--III-1', '251');
INSERT INTO co_cuentascbba VALUES ('', '41', 'P-C--V-2', '252');
INSERT INTO co_cuentascbba VALUES ('', '407', 'A-B--II-1', '253');
INSERT INTO co_cuentascbba VALUES ('', '406', 'P-C--V-1', '254');
INSERT INTO co_cuentascbba VALUES ('', '405', 'P-C--V-1', '255');
INSERT INTO co_cuentascbba VALUES ('', '404', 'P-C--V-1', '256');
INSERT INTO co_cuentascbba VALUES ('', '403', 'P-C--V-1', '257');
INSERT INTO co_cuentascbba VALUES ('', '401', 'P-C--V-1', '258');
INSERT INTO co_cuentascbba VALUES ('', '400', 'P-C--V-1', '259');
INSERT INTO co_cuentascbba VALUES ('', '39', 'A-B--II-1', '260');
INSERT INTO co_cuentascbba VALUES ('', '36', 'A-B--II-1', '261');
INSERT INTO co_cuentascbba VALUES ('', '35', 'A-B--II-1', '262');
INSERT INTO co_cuentascbba VALUES ('', '34', 'A-B--II-1', '263');
INSERT INTO co_cuentascbba VALUES ('', '33', 'A-B--II-1', '264');
INSERT INTO co_cuentascbba VALUES ('', '32', 'A-B--II-1', '265');
INSERT INTO co_cuentascbba VALUES ('', '31', 'A-B--II-1', '266');
INSERT INTO co_cuentascbba VALUES ('', '30', 'A-B--II-1', '267');
INSERT INTO co_cuentascbba VALUES ('', '298', 'A-A--V-1', '268');
INSERT INTO co_cuentascbba VALUES ('', '297', 'A-A--V-1', '269');
INSERT INTO co_cuentascbba VALUES ('', '2955', 'A-A--V-1', '270');
INSERT INTO co_cuentascbba VALUES ('', '2954', 'A-A--IV-1', '271');
INSERT INTO co_cuentascbba VALUES ('', '2953', 'A-A--IV-1', '272');
INSERT INTO co_cuentascbba VALUES ('', '2945', 'A-A--V-1', '273');
INSERT INTO co_cuentascbba VALUES ('', '2944', 'A-A--IV-1', '274');
INSERT INTO co_cuentascbba VALUES ('', '2943', 'A-A--IV-1', '275');
INSERT INTO co_cuentascbba VALUES ('', '293', 'A-A--IV-1', '276');
INSERT INTO co_cuentascbba VALUES ('', '292', 'A-A--III-1', '277');
INSERT INTO co_cuentascbba VALUES ('', '291', 'A-A--II-1', '278');
INSERT INTO co_cuentascbba VALUES ('', '290', 'A-A--I-1', '279');
INSERT INTO co_cuentascbba VALUES ('', '282', 'A-A--III-1', '280');
INSERT INTO co_cuentascbba VALUES ('', '281', 'A-A--II-1', '281');
INSERT INTO co_cuentascbba VALUES ('', '280', 'A-A--I-1', '282');
INSERT INTO co_cuentascbba VALUES ('', '26', 'A-A--V-1', '283');
INSERT INTO co_cuentascbba VALUES ('', '259', 'A-A--V-1', '284');
INSERT INTO co_cuentascbba VALUES ('', '258', 'A-A--V-1', '285');
INSERT INTO co_cuentascbba VALUES ('', '257', 'A-A--V-1', '286');
INSERT INTO co_cuentascbba VALUES ('', '255', 'A-A--V-1', '287');
INSERT INTO co_cuentascbba VALUES ('', '254', 'A-A--V-1', '288');
INSERT INTO co_cuentascbba VALUES ('', '253', 'A-A--V-1', '289');
INSERT INTO co_cuentascbba VALUES ('', '252', 'A-A--V-1', '290');
INSERT INTO co_cuentascbba VALUES ('', '251', 'A-A--V-1', '291');
INSERT INTO co_cuentascbba VALUES ('', '250', 'A-A--V-1', '292');
INSERT INTO co_cuentascbba VALUES ('', '2495', 'A-A--V-1', '293');
INSERT INTO co_cuentascbba VALUES ('', '2494', 'A-A--IV-1', '294');
INSERT INTO co_cuentascbba VALUES ('', '2493', 'A-A--IV-1', '295');
INSERT INTO co_cuentascbba VALUES ('', '2425', 'A-A--V-1', '296');
INSERT INTO co_cuentascbba VALUES ('', '2424', 'A-A--IV-1', '297');
INSERT INTO co_cuentascbba VALUES ('', '2423', 'A-A--IV-1', '298');
INSERT INTO co_cuentascbba VALUES ('', '2415', 'A-A--V-1', '299');
INSERT INTO co_cuentascbba VALUES ('', '2414', 'A-A--IV-1', '300');
INSERT INTO co_cuentascbba VALUES ('', '2413', 'A-A--IV-1', '301');
INSERT INTO co_cuentascbba VALUES ('', '2405', 'A-A--V-1', '302');
INSERT INTO co_cuentascbba VALUES ('', '2404', 'A-A--IV-1', '303');
INSERT INTO co_cuentascbba VALUES ('', '2403', 'A-A--IV-1', '304');
INSERT INTO co_cuentascbba VALUES ('', '23', 'A-A--II-1', '305');
INSERT INTO co_cuentascbba VALUES ('', '22', 'A-A--III-1', '306');
INSERT INTO co_cuentascbba VALUES ('', '21', 'A-A--II-1', '307');
INSERT INTO co_cuentascbba VALUES ('', '20', 'A-A--I-1', '308');
INSERT INTO co_cuentascbba VALUES ('', '194', 'P-C--III-3', '309');
INSERT INTO co_cuentascbba VALUES ('', '192', 'P-C--III-3', '310');
INSERT INTO co_cuentascbba VALUES ('', '190', 'P-C--III-3', '311');
INSERT INTO co_cuentascbba VALUES ('', '189', 'P-B--II-3', '312');
INSERT INTO co_cuentascbba VALUES ('', '185', 'P-B--II-3', '313');
INSERT INTO co_cuentascbba VALUES ('', '181', 'P-B--V-', '314');
INSERT INTO co_cuentascbba VALUES ('', '180', 'P-B--II-3', '315');
INSERT INTO co_cuentascbba VALUES ('', '179', 'P-B--II-3', '316');
INSERT INTO co_cuentascbba VALUES ('', '178', 'P-B--II-3', '317');
INSERT INTO co_cuentascbba VALUES ('', '177', 'P-B--II-3', '318');
INSERT INTO co_cuentascbba VALUES ('', '176', 'P-B--II-3', '319');
INSERT INTO co_cuentascbba VALUES ('', '175', 'P-B--II-3', '320');
INSERT INTO co_cuentascbba VALUES ('', '174', 'P-B--II-2', '321');
INSERT INTO co_cuentascbba VALUES ('', '173', 'P-B--II-3', '322');
INSERT INTO co_cuentascbba VALUES ('', '172', 'P-B--II-3', '323');
INSERT INTO co_cuentascbba VALUES ('', '171', 'P-B--II-3', '324');
INSERT INTO co_cuentascbba VALUES ('', '170', 'P-B--II-1', '325');
INSERT INTO co_cuentascbba VALUES ('', '1635', 'P-B--II-3', '326');
INSERT INTO co_cuentascbba VALUES ('', '1634', 'P-B--III-', '327');
INSERT INTO co_cuentascbba VALUES ('', '1633', 'P-B--III-', '328');
INSERT INTO co_cuentascbba VALUES ('', '1625', 'P-B--II-2', '329');
INSERT INTO co_cuentascbba VALUES ('', '1624', 'P-B--III-', '330');
INSERT INTO co_cuentascbba VALUES ('', '1623', 'P-B--III-', '331');
INSERT INTO co_cuentascbba VALUES ('', '1615', 'P-B--II-3', '332');
INSERT INTO co_cuentascbba VALUES ('', '1614', 'P-B--III-', '333');
INSERT INTO co_cuentascbba VALUES ('', '1613', 'P-B--III-', '334');
INSERT INTO co_cuentascbba VALUES ('', '1605', 'P-B--II-1', '335');
INSERT INTO co_cuentascbba VALUES ('', '1604', 'P-B--III-', '336');
INSERT INTO co_cuentascbba VALUES ('', '1603', 'P-B--III-', '337');
INSERT INTO co_cuentascbba VALUES ('', '14', 'P-B--I-1', '338');
INSERT INTO co_cuentascbba VALUES ('', '137', 'P-A-2-I-', '339');
INSERT INTO co_cuentascbba VALUES ('', '1340', 'P-A-2-I-', '340');
INSERT INTO co_cuentascbba VALUES ('', '133', 'P-A-2-I-', '341');
INSERT INTO co_cuentascbba VALUES ('', '132', 'P-A-3--', '342');
INSERT INTO co_cuentascbba VALUES ('', '131', 'P-A-3--', '343');
INSERT INTO co_cuentascbba VALUES ('', '130', 'P-A-3--', '344');
INSERT INTO co_cuentascbba VALUES ('', '129', 'P-A-1-VII-', '345');
INSERT INTO co_cuentascbba VALUES ('', '121', 'P-A-1-V-1', '346');
INSERT INTO co_cuentascbba VALUES ('', '120', 'P-A-1-V-1', '347');
INSERT INTO co_cuentascbba VALUES ('', '119', 'P-A-1-III-1', '348');
INSERT INTO co_cuentascbba VALUES ('', '118', 'P-A-1-VI-', '349');
INSERT INTO co_cuentascbba VALUES ('', '115', 'P-A-1-III-1', '350');
INSERT INTO co_cuentascbba VALUES ('', '114', 'P-A-1-III-1', '351');
INSERT INTO co_cuentascbba VALUES ('', '113', 'P-A-1-III-1', '352');
INSERT INTO co_cuentascbba VALUES ('', '112', 'P-A-1-III-1', '353');
INSERT INTO co_cuentascbba VALUES ('', '111', 'P-A-1-IX-', '354');
INSERT INTO co_cuentascbba VALUES ('', '110', 'P-A-1-II-', '355');
INSERT INTO co_cuentascbba VALUES ('', '109', 'P-A-1-IV-', '356');
INSERT INTO co_cuentascbba VALUES ('', '108', 'P-A-1-IV-', '357');
INSERT INTO co_cuentascbba VALUES ('', '1044', 'P-C--III-3', '358');
INSERT INTO co_cuentascbba VALUES ('', '1040', 'P-A-1-I-2', '359');
INSERT INTO co_cuentascbba VALUES ('', '1034', 'P-C--III-3', '360');
INSERT INTO co_cuentascbba VALUES ('', '1030', 'P-A-1-I-2', '361');
INSERT INTO co_cuentascbba VALUES ('', '102', 'P-A-1-I-1', '362');
INSERT INTO co_cuentascbba VALUES ('', '101', 'P-A-1-I-1', '363');
INSERT INTO co_cuentascbba VALUES ('', '100', 'P-A-1-I-1', '364');


#
# Estructura de la tabla `co_cuentasesp`
#

DROP TABLE IF EXISTS `co_cuentasesp`;
CREATE TABLE `co_cuentasesp` (
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idcuentaesp` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idcuentaesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_cuentasesp`
#

INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de acreedores', 'ACREED');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de caja', 'CAJA');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de diferencias negativas de cambio', 'CAMNEG');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de diferencias positivas de cambio', 'CAMPOS');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de clientes', 'CLIENT');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de compras', 'COMPRA');
INSERT INTO co_cuentasesp VALUES ('', '', 'Devoluciones de compras', 'DEVCOM');
INSERT INTO co_cuentasesp VALUES ('', '', 'Devoluciones de ventas', 'DEVVEN');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas por diferencias positivas en divisa extranjera', 'DIVPOS');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas por diferencias negativas de conversi?n a la moneda local', 'EURNEG');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas por diferencias positivas de conversi?n a la moneda local', 'EURPOS');
INSERT INTO co_cuentasesp VALUES ('', '', 'Gastos por recargo financiero', 'GTORF');
INSERT INTO co_cuentasesp VALUES ('', '', 'Ingresos por recargo financiero', 'INGRF');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de retenciones IRPF', 'IRPF');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de retenciones para proveedores IRPFPR', 'IRPFPR');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas acreedoras de IVA en la regularizaci', 'IVAACR');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas deudoras de IVA en la regularizaci', 'IVADEU');
INSERT INTO co_cuentasesp VALUES ('', '', 'IVA en entregas intracomunitarias U.E.', 'IVAEUE');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA repercutido', 'IVAREP');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA repercutido para clientes exentos de IVA', 'IVAREX');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA soportado UE', 'IVARUE');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA repercutido en exportaciones', 'IVARXP');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA soportado en importaciones', 'IVASIM');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA soportado', 'IVASOP');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de IVA soportado UE', 'IVASUE');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas relativas al ejercicio previo', 'PREVIO');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de proveedores', 'PROVEE');
INSERT INTO co_cuentasesp VALUES ('', '', 'P?rdidas y ganancias', 'PYG');
INSERT INTO co_cuentasesp VALUES ('', '', 'Cuentas de ventas', 'VENTAS');


#
# Estructura de la tabla `co_epigrafes`
#

DROP TABLE IF EXISTS `co_epigrafes`;
CREATE TABLE `co_epigrafes` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codepigrafe` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idepigrafe` int(11) NOT NULL AUTO_INCREMENT,
  `idgrupo` int(11) DEFAULT NULL,
  `idpadre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idepigrafe`),
  KEY `ca_co_epigrafes_ejercicios` (`codejercicio`),
  KEY `ca_co_epigrafes_gruposepigrafes2` (`idgrupo`),
  CONSTRAINT `ca_co_epigrafes_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_epigrafes_gruposepigrafes2` FOREIGN KEY (`idgrupo`) REFERENCES `co_gruposepigrafes` (`idgrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_epigrafes`
#

INSERT INTO co_epigrafes VALUES ('2015', '10', 'Capital', '1', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '11', 'Reservas y otros instrumentos de patrimonio', '2', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '12', 'Resultados pendientes de aplicacion', '3', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '13', 'Subvenciones, donaciones y ajustes por cambios de valor', '4', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '14', 'Provisiones', '5', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '15', 'Deudas a largo plazo con caracteristicas especiales', '6', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '16', 'Deudas a largo plazo con partes vinculadas', '7', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '17', 'Deudas a largo plazo por prestamos recibidos, emprestitos y otros conceptos', '8', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '18', 'Pasivos por fianzas, garantias y otros conceptos a largo plazo', '9', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '19', 'Situaciones transitorias de financiacion', '10', '1', '0');
INSERT INTO co_epigrafes VALUES ('2015', '20', 'Inmovilizaciones intangibles', '11', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '21', 'Inmovilizaciones materiales', '12', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '22', 'Inversiones inmobiliarias', '13', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '23', 'Inmovilizaciones materiales en curso', '14', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '24', 'Inversiones financieras a largo plazo en partes vinculadas', '15', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '25', 'Otras inversiones financieras a largo plazo', '16', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '26', 'Fianzas y depositos constituidos a largo plazo', '17', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '28', 'Amortizacion acumulada del inmovilizado', '18', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '29', 'Deterioro de valor de activos no corrientes', '19', '2', '0');
INSERT INTO co_epigrafes VALUES ('2015', '30', 'Comerciales', '20', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '31', 'Materias primas', '21', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '32', 'Otros aprovisionamientos', '22', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '33', 'Productos en curso', '23', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '34', 'Productos semiterminados', '24', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '35', 'Productos terminados', '25', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '36', 'Subproductos, residuos y materiales recuperados', '26', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '39', 'Deterioro de valor de las existencias', '27', '3', '0');
INSERT INTO co_epigrafes VALUES ('2015', '40', 'Proveedores', '28', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '41', 'Acreedores varios', '29', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '43', 'Clientes', '30', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '44', 'Deudores varios', '31', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '46', 'Personal', '32', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '47', 'Administraciones publicas', '33', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '48', 'Ajustes por periodificacion', '34', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '49', 'Deterioro de valor de creditos comerciales y provisiones a corto plazo', '35', '4', '0');
INSERT INTO co_epigrafes VALUES ('2015', '50', 'Emprestitos, deudas con caracteristicas especiales y otras emisiones analogas a corto plazo', '36', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '51', 'Deudas a corto plazo con partes vinculadas', '37', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '52', 'Deudas a corto plazo por prestamos recibidos y otros conceptos', '38', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '53', 'Inversiones financieras a corto plazo en partes vinculadas', '39', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '54', 'Otras inversiones financieras a corto plazo', '40', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '55', 'Otras cuentas no bancarias', '41', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '56', 'Fianzas y dep?sitos recibidos y constituidos a corto plazo y ajustes por periodificaci', '42', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '57', 'Tesorer', '43', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '58', 'Activos no corrientes mantenidos para la venta y activos y pasivos asociados', '44', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '59', 'Deterioro del valor de inversiones financieras a corto plazo y de activos no corrientes mantenidos para la venta', '45', '5', '0');
INSERT INTO co_epigrafes VALUES ('2015', '60', 'Compras', '46', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '61', 'Variaci?n de existencias', '47', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '62', 'Servicios exteriores', '48', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '63', 'Tributos', '49', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '64', 'Gastos de personal', '50', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '65', 'Otros gastos de gesti', '51', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '66', 'Gastos financieros', '52', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '67', 'P?rdidas procedentes de activos no corrientes y gastos excepcionales', '53', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '68', 'Dotaciones para amortizaciones', '54', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '69', 'P?rdidas por deterioro y otras dotaciones', '55', '6', '0');
INSERT INTO co_epigrafes VALUES ('2015', '70', 'Ventas de mercader?as, de producci?n propia, de servicios, etc', '56', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '71', 'Variaci?n de existencias', '57', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '73', 'Trabajos realizados para la empresa', '58', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '74', 'Subvenciones, donaciones y legados', '59', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '75', 'Otros ingresos de gesti', '60', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '76', 'Ingresos financieros', '61', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '77', 'Beneficios procedentes de activos no corrientes e ingresos excepcionales', '62', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '79', 'Excesos y aplicaciones de provisiones y de p?rdidas por deterioro', '63', '7', '0');
INSERT INTO co_epigrafes VALUES ('2015', '80', 'Gastos financieros por valoraci?n de activos y pasivos', '64', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '81', 'Gastos en operaciones de cobertura', '65', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '82', 'Gastos por diferencias de conversi', '66', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '83', 'Impuesto sobre beneficios', '67', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '84', 'Transferencias de subvenciones, donaciones y legados', '68', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '85', 'Gastos por p?rdidas actuariales y ajustes en los activos por retribuciones a largo plazo de prestaci?n definida', '69', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '86', 'Gastos por activos no corrientes en venta', '70', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '89', 'Gastos de participaciones en empresas del grupo o asociadas con ajustes valorativos positivos previos', '71', '8', '0');
INSERT INTO co_epigrafes VALUES ('2015', '90', 'Ingresos financieros por valoraci?n de activos y pasivos', '72', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '91', 'Ingresos en operaciones de cobertura', '73', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '92', 'Ingresos por diferencias de conversion', '74', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '94', 'Ingresos por subvenciones, donaciones y legados', '75', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '95', 'Ingresos por ganancias actuariales y ajustes en los activos por retribuciones a largo plazo de prestacion definida', '76', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '96', 'Ingresos por activos no corrientes en venta', '77', '9', '0');
INSERT INTO co_epigrafes VALUES ('2015', '99', 'Ingresos de participaciones en empresas del grupo o asociadas con ajustes valorativos negativos previos', '78', '9', '0');
INSERT INTO co_epigrafes VALUES ('2016', '10', 'Capital', '79', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '11', 'Reservas y otros instrumentos de patrimonio', '80', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '12', 'Resultados pendientes de aplicacion', '81', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '13', 'Subvenciones, donaciones y ajustes por cambios de valor', '82', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '14', 'Provisiones', '83', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '15', 'Deudas a largo plazo con caracteristicas especiales', '84', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '16', 'Deudas a largo plazo con partes vinculadas', '85', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '17', 'Deudas a largo plazo por prestamos recibidos, emprestitos y otros conceptos', '86', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '18', 'Pasivos por fianzas, garantias y otros conceptos a largo plazo', '87', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '19', 'Situaciones transitorias de financiacion', '88', '10', '0');
INSERT INTO co_epigrafes VALUES ('2016', '20', 'Inmovilizaciones intangibles', '89', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '21', 'Inmovilizaciones materiales', '90', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '22', 'Inversiones inmobiliarias', '91', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '23', 'Inmovilizaciones materiales en curso', '92', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '24', 'Inversiones financieras a largo plazo en partes vinculadas', '93', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '25', 'Otras inversiones financieras a largo plazo', '94', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '26', 'Fianzas y depositos constituidos a largo plazo', '95', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '28', 'Amortizacion acumulada del inmovilizado', '96', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '29', 'Deterioro de valor de activos no corrientes', '97', '11', '0');
INSERT INTO co_epigrafes VALUES ('2016', '30', 'Comerciales', '98', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '31', 'Materias primas', '99', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '32', 'Otros aprovisionamientos', '100', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '33', 'Productos en curso', '101', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '34', 'Productos semiterminados', '102', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '35', 'Productos terminados', '103', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '36', 'Subproductos, residuos y materiales recuperados', '104', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '39', 'Deterioro de valor de las existencias', '105', '12', '0');
INSERT INTO co_epigrafes VALUES ('2016', '40', 'Proveedores', '106', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '41', 'Acreedores varios', '107', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '43', 'Clientes', '108', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '44', 'Deudores varios', '109', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '46', 'Personal', '110', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '47', 'Administraciones publicas', '111', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '48', 'Ajustes por periodificacion', '112', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '49', 'Deterioro de valor de creditos comerciales y provisiones a corto plazo', '113', '13', '0');
INSERT INTO co_epigrafes VALUES ('2016', '50', 'Emprestitos, deudas con caracteristicas especiales y otras emisiones analogas a corto plazo', '114', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '51', 'Deudas a corto plazo con partes vinculadas', '115', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '52', 'Deudas a corto plazo por prestamos recibidos y otros conceptos', '116', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '53', 'Inversiones financieras a corto plazo en partes vinculadas', '117', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '54', 'Otras inversiones financieras a corto plazo', '118', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '55', 'Otras cuentas no bancarias', '119', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '56', 'Fianzas y dep?sitos recibidos y constituidos a corto plazo y ajustes por periodificaci', '120', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '57', 'Tesorer', '121', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '58', 'Activos no corrientes mantenidos para la venta y activos y pasivos asociados', '122', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '59', 'Deterioro del valor de inversiones financieras a corto plazo y de activos no corrientes mantenidos para la venta', '123', '14', '0');
INSERT INTO co_epigrafes VALUES ('2016', '60', 'Compras', '124', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '61', 'Variaci?n de existencias', '125', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '62', 'Servicios exteriores', '126', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '63', 'Tributos', '127', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '64', 'Gastos de personal', '128', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '65', 'Otros gastos de gesti', '129', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '66', 'Gastos financieros', '130', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '67', 'P?rdidas procedentes de activos no corrientes y gastos excepcionales', '131', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '68', 'Dotaciones para amortizaciones', '132', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '69', 'P?rdidas por deterioro y otras dotaciones', '133', '15', '0');
INSERT INTO co_epigrafes VALUES ('2016', '70', 'Ventas de mercader?as, de producci?n propia, de servicios, etc', '134', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '71', 'Variaci?n de existencias', '135', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '73', 'Trabajos realizados para la empresa', '136', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '74', 'Subvenciones, donaciones y legados', '137', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '75', 'Otros ingresos de gesti', '138', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '76', 'Ingresos financieros', '139', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '77', 'Beneficios procedentes de activos no corrientes e ingresos excepcionales', '140', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '79', 'Excesos y aplicaciones de provisiones y de p?rdidas por deterioro', '141', '16', '0');
INSERT INTO co_epigrafes VALUES ('2016', '80', 'Gastos financieros por valoraci?n de activos y pasivos', '142', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '81', 'Gastos en operaciones de cobertura', '143', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '82', 'Gastos por diferencias de conversi', '144', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '83', 'Impuesto sobre beneficios', '145', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '84', 'Transferencias de subvenciones, donaciones y legados', '146', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '85', 'Gastos por p?rdidas actuariales y ajustes en los activos por retribuciones a largo plazo de prestaci?n definida', '147', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '86', 'Gastos por activos no corrientes en venta', '148', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '89', 'Gastos de participaciones en empresas del grupo o asociadas con ajustes valorativos positivos previos', '149', '17', '0');
INSERT INTO co_epigrafes VALUES ('2016', '90', 'Ingresos financieros por valoraci?n de activos y pasivos', '150', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '91', 'Ingresos en operaciones de cobertura', '151', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '92', 'Ingresos por diferencias de conversion', '152', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '94', 'Ingresos por subvenciones, donaciones y legados', '153', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '95', 'Ingresos por ganancias actuariales y ajustes en los activos por retribuciones a largo plazo de prestacion definida', '154', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '96', 'Ingresos por activos no corrientes en venta', '155', '18', '0');
INSERT INTO co_epigrafes VALUES ('2016', '99', 'Ingresos de participaciones en empresas del grupo o asociadas con ajustes valorativos negativos previos', '156', '18', '0');


#
# Estructura de la tabla `co_gruposepigrafes`
#

DROP TABLE IF EXISTS `co_gruposepigrafes`;
CREATE TABLE `co_gruposepigrafes` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codgrupo` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idgrupo`),
  KEY `ca_co_gruposepigrafes_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_co_gruposepigrafes_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_gruposepigrafes`
#

INSERT INTO co_gruposepigrafes VALUES ('2015', '1', 'Financiaci?n b?sica', '1');
INSERT INTO co_gruposepigrafes VALUES ('2015', '2', 'Activo no corriente', '2');
INSERT INTO co_gruposepigrafes VALUES ('2015', '3', 'Existencias', '3');
INSERT INTO co_gruposepigrafes VALUES ('2015', '4', 'Acreedores y deudores por operaciones comerciales', '4');
INSERT INTO co_gruposepigrafes VALUES ('2015', '5', 'Cuentas financieras', '5');
INSERT INTO co_gruposepigrafes VALUES ('2015', '6', 'Compras y gastos', '6');
INSERT INTO co_gruposepigrafes VALUES ('2015', '7', 'Ventas e ingresos', '7');
INSERT INTO co_gruposepigrafes VALUES ('2015', '8', 'Gastos imputados al patrimonio neto', '8');
INSERT INTO co_gruposepigrafes VALUES ('2015', '9', 'Ingresos imputados al patrimonio neto', '9');
INSERT INTO co_gruposepigrafes VALUES ('2016', '1', 'Financiaci?n b?sica', '10');
INSERT INTO co_gruposepigrafes VALUES ('2016', '2', 'Activo no corriente', '11');
INSERT INTO co_gruposepigrafes VALUES ('2016', '3', 'Existencias', '12');
INSERT INTO co_gruposepigrafes VALUES ('2016', '4', 'Acreedores y deudores por operaciones comerciales', '13');
INSERT INTO co_gruposepigrafes VALUES ('2016', '5', 'Cuentas financieras', '14');
INSERT INTO co_gruposepigrafes VALUES ('2016', '6', 'Compras y gastos', '15');
INSERT INTO co_gruposepigrafes VALUES ('2016', '7', 'Ventas e ingresos', '16');
INSERT INTO co_gruposepigrafes VALUES ('2016', '8', 'Gastos imputados al patrimonio neto', '17');
INSERT INTO co_gruposepigrafes VALUES ('2016', '9', 'Ingresos imputados al patrimonio neto', '18');


#
# Estructura de la tabla `co_partidas`
#

DROP TABLE IF EXISTS `co_partidas`;
CREATE TABLE `co_partidas` (
  `baseimponible` double NOT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codcontrapartida` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `debe` double NOT NULL DEFAULT '0',
  `debeme` double NOT NULL,
  `documento` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `factura` double DEFAULT NULL,
  `haber` double NOT NULL DEFAULT '0',
  `haberme` double NOT NULL,
  `idasiento` int(11) NOT NULL,
  `idconcepto` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `idcontrapartida` int(11) DEFAULT NULL,
  `idpartida` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  `iva` double NOT NULL,
  `punteada` tinyint(1) NOT NULL DEFAULT '0',
  `recargo` double NOT NULL,
  `tasaconv` double NOT NULL,
  `tipodocumento` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idpartida`),
  KEY `ca_co_partidas_co_asientos2` (`idasiento`),
  CONSTRAINT `ca_co_partidas_co_asientos2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_partidas`
#

INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20150A000002 - Prueba', '0', '0', '', '0', '3.63', '0', '2', '', '0', '4', '210', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000002 - Prueba', '0.63', '0', '20150A000002', '2', '0', '0', '2', '', '210', '5', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000002 - Prueba', '3', '0', '', '0', '0', '0', '2', '', '0', '6', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20150A000003 - Prueba', '0', '0', '', '0', '181.5', '0', '3', '', '0', '7', '210', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('150', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000003 - Prueba', '31.5', '0', '20150A000003', '3', '0', '0', '3', '', '210', '8', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000003 - Prueba', '150', '0', '', '0', '0', '0', '3', '', '0', '9', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000003 - CONSUMIDOR FINAL', '24.2', '0', '', '0', '0', '0', '4', '', '0', '10', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('20', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000003 - CONSUMIDOR FINAL', '0', '0', '20150A000003', '3', '4.2', '0', '4', '', '230', '11', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000003 - CONSUMIDOR FINAL', '0', '0', '', '0', '20', '0', '4', '', '0', '12', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '12.1', '0', '', '0', '0', '0', '5', '', '0', '13', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '0', '0', '20150A000004', '4', '2.1', '0', '5', '', '230', '14', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '0', '0', '', '0', '10', '0', '5', '', '0', '15', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '29.77', '0', '', '0', '0', '0', '6', '', '0', '16', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('24.6', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '0', '0', '20150A000005', '5', '5.17', '0', '6', '', '230', '17', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '0', '0', '', '0', '24.6', '0', '6', '', '0', '18', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '50.82', '0', '', '0', '0', '0', '7', '', '0', '19', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('42', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '0', '0', '20150A000006', '6', '8.82', '0', '7', '', '230', '20', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '0', '0', '', '0', '42', '0', '7', '', '0', '21', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20150A000004 - Prueba', '0', '0', '', '0', '169.4', '0', '8', '', '0', '22', '210', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('140', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000004 - Prueba', '29.4', '0', '20150A000004', '4', '0', '0', '8', '', '210', '23', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000004 - Prueba', '140', '0', '', '0', '0', '0', '8', '', '0', '24', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20150A000005 - Prueba', '0', '0', '', '0', '0', '0', '9', '', '0', '25', '210', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000005 - Prueba', '0', '0', '20150A000005', '5', '0', '0', '9', '', '210', '26', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000005 - Prueba', '0', '0', '', '0', '0', '0', '9', '', '0', '27', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20150A000006 - Prueba', '0', '0', '', '0', '25.85', '0', '10', '', '0', '28', '210', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000006 - Prueba', '1.08', '0', '20150A000006', '6', '0', '0', '10', '', '210', '29', '266', '10.5', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('12', '1', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000006 - Prueba', '2.52', '0', '20150A000006', '6', '0', '0', '10', '', '210', '30', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000006 - Prueba', '22.25', '0', '', '0', '0', '0', '10', '', '0', '31', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'EUR', '', '4720000000', 'REGULARIZACI?N IVA T3', '0', '0', '', '0', '0', '0', '11', '', '0', '32', '266', '0', '0', '0', '1', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'EUR', '', '4770000000', 'REGULARIZACI?N IVA T3', '0', '0', '', '0', '0', '0', '11', '', '0', '33', '276', '0', '0', '0', '1', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4100000002', 'Factura de compra 20150A000007 - INTERNET', '0', '0', '', '0', '60.5', '0', '12', '', '0', '34', '719', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('50', '123', '4100000002', 'ARS', 'A', '4720000000', 'Factura de compra 20150A000007 - INTERNET', '10.5', '0', '20150A000007', '7', '0', '0', '12', '', '719', '35', '266', '21', '0', '0', '10.83', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20150A000007 - INTERNET', '50', '0', '', '0', '0', '0', '12', '', '0', '36', '421', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000002 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '13', '', '0', '37', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000002 - CONSUMIDOR FINAL', '0', '0', '20150A000002', '2', '2.15', '0', '13', '', '230', '38', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000002 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '13', '', '0', '39', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '14', '', '0', '40', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '0', '0', '20150A000007', '7', '2.15', '0', '14', '', '230', '41', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '14', '', '0', '42', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '15', '', '0', '43', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '0', '0', '20150A000008', '8', '2.15', '0', '15', '', '230', '44', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '15', '', '0', '45', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '26.92', '0', '', '0', '0', '0', '16', '', '0', '46', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('22.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '0', '0', '20150A000009', '9', '4.67', '0', '16', '', '230', '47', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '0', '0', '', '0', '22.25', '0', '16', '', '0', '48', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000001 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '21', '', '0', '61', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000001 - CONSUMIDOR FINAL', '0', '0', '20150A000001', '1', '2.15', '0', '21', '', '230', '62', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000001 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '21', '', '0', '63', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000002 - Miguel san martin', '12.4', '0', '', '0', '0', '0', '22', '', '0', '64', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000002 - Miguel san martin', '0', '0', '20150A000002', '2', '2.15', '0', '22', '', '720', '65', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000002 - Miguel san martin', '0', '0', '', '0', '10.25', '0', '22', '', '0', '66', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000003 - Camila siares', '2000', '0', '', '0', '0', '0', '23', '', '0', '67', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('2000', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000003 - Camila siares', '0', '0', '20150A000003', '3', '0', '0', '23', '', '721', '68', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000003 - Camila siares', '0', '0', '', '0', '2000', '0', '23', '', '0', '69', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '14.52', '0', '', '0', '0', '0', '24', '', '0', '70', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('12', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '0', '0', '20150A000004', '4', '2.52', '0', '24', '', '230', '71', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000004 - CONSUMIDOR FINAL', '0', '0', '', '0', '12', '0', '24', '', '0', '72', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '25', '', '0', '73', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000005 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '25', '', '0', '74', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '14.52', '0', '', '0', '0', '0', '26', '', '0', '75', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('12', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '0', '0', '20150A000006', '6', '2.52', '0', '26', '', '230', '76', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000006 - CONSUMIDOR FINAL', '0', '0', '', '0', '12', '0', '26', '', '0', '77', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '14.52', '0', '', '0', '0', '0', '27', '', '0', '78', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('12', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '0', '0', '20150A000007', '7', '2.52', '0', '27', '', '230', '79', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000007 - CONSUMIDOR FINAL', '0', '0', '', '0', '12', '0', '27', '', '0', '80', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '28', '', '0', '81', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '0', '0', '20150A000008', '8', '2.15', '0', '28', '', '230', '82', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000008 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '28', '', '0', '83', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '29', '', '0', '84', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '0', '0', '20150A000009', '9', '2.15', '0', '29', '', '230', '85', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000009 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '29', '', '0', '86', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000010 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '30', '', '0', '87', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000010 - CONSUMIDOR FINAL', '0', '0', '20150A000010', '10', '2.15', '0', '30', '', '230', '88', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000010 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '30', '', '0', '89', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000011 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '31', '', '0', '90', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000011 - CONSUMIDOR FINAL', '0', '0', '20150A000011', '11', '2.15', '0', '31', '', '230', '91', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000011 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '31', '', '0', '92', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000012 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '32', '', '0', '93', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000012 - CONSUMIDOR FINAL', '0', '0', '20150A000012', '12', '2.15', '0', '32', '', '230', '94', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000012 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '32', '', '0', '95', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000013 - CONSUMIDOR FINAL', '12.4', '0', '', '0', '0', '0', '33', '', '0', '96', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000001', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000013 - CONSUMIDOR FINAL', '0', '0', '20150A000013', '13', '2.15', '0', '33', '', '230', '97', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000013 - CONSUMIDOR FINAL', '0', '0', '', '0', '10.25', '0', '33', '', '0', '98', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000014 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '34', '', '0', '99', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000014 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '34', '', '0', '100', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000015 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '35', '', '0', '101', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000015 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '35', '', '0', '102', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000016 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '36', '', '0', '103', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000016 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '36', '', '0', '104', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000017 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '37', '', '0', '105', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000017 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '37', '', '0', '106', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000018 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '38', '', '0', '107', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000018 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '38', '', '0', '108', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000019 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '39', '', '0', '109', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000019 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '39', '', '0', '110', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000020 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '40', '', '0', '111', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000020 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '40', '', '0', '112', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000021 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '41', '', '0', '113', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000021 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '41', '', '0', '114', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000001', 'Factura de venta 20150A000022 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '42', '', '0', '115', '230', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000022 - CONSUMIDOR FINAL', '0', '0', '', '0', '0', '0', '42', '', '0', '116', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000023 - Miguel san martin', '12.4', '0', '', '0', '0', '0', '43', '', '0', '117', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000023 - Miguel san martin', '0', '0', '20150A000023', '23', '2.15', '0', '43', '', '720', '118', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000023 - Miguel san martin', '0', '0', '', '0', '10.25', '0', '43', '', '0', '119', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000024 - Miguel san martin', '12.4', '0', '', '0', '0', '0', '44', '', '0', '120', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000024 - Miguel san martin', '0', '0', '20150A000024', '24', '2.15', '0', '44', '', '720', '121', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000024 - Miguel san martin', '0', '0', '', '0', '10.25', '0', '44', '', '0', '122', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000025 - Miguel san martin', '14.52', '0', '', '0', '0', '0', '45', '', '0', '123', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('12', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000025 - Miguel san martin', '0', '0', '20150A000025', '25', '2.52', '0', '45', '', '720', '124', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000025 - Miguel san martin', '0', '0', '', '0', '12', '0', '45', '', '0', '125', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000026 - Miguel san martin', '14.52', '0', '', '0', '0', '0', '46', '', '0', '126', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('12', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000026 - Miguel san martin', '0', '0', '20150A000026', '26', '2.52', '0', '46', '', '720', '127', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000026 - Miguel san martin', '0', '0', '', '0', '12', '0', '46', '', '0', '128', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000027 - Camila siares', '3', '0', '', '0', '0', '0', '47', '', '0', '129', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000027 - Camila siares', '0', '0', '20150A000027', '27', '0', '0', '47', '', '721', '130', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000027 - Camila siares', '0', '0', '', '0', '3', '0', '47', '', '0', '131', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000028 - Camila siares', '3', '0', '', '0', '0', '0', '48', '', '0', '132', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000028 - Camila siares', '0', '0', '20150A000028', '28', '0', '0', '48', '', '721', '133', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000028 - Camila siares', '0', '0', '', '0', '3', '0', '48', '', '0', '134', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000029 - Camila siares', '12.4', '0', '', '0', '0', '0', '49', '', '0', '135', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000029 - Camila siares', '0', '0', '20150A000029', '29', '2.15', '0', '49', '', '721', '136', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000029 - Camila siares', '0', '0', '', '0', '10.25', '0', '49', '', '0', '137', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000030 - Camila siares', '12.4', '0', '', '0', '0', '0', '50', '', '0', '138', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000030 - Camila siares', '0', '0', '20150A000030', '30', '2.15', '0', '50', '', '721', '139', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000030 - Camila siares', '0', '0', '', '0', '10.25', '0', '50', '', '0', '140', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000031 - Camila siares', '12.4', '0', '', '0', '0', '0', '51', '', '0', '141', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000031 - Camila siares', '0', '0', '20150A000031', '31', '2.15', '0', '51', '', '721', '142', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000031 - Camila siares', '0', '0', '', '0', '10.25', '0', '51', '', '0', '143', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000032 - Camila siares', '12.4', '0', '', '0', '0', '0', '52', '', '0', '144', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000032 - Camila siares', '0', '0', '20150A000032', '32', '2.15', '0', '52', '', '721', '145', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000032 - Camila siares', '0', '0', '', '0', '10.25', '0', '52', '', '0', '146', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000033 - Camila siares', '12.4', '0', '', '0', '0', '0', '53', '', '0', '147', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000033 - Camila siares', '0', '0', '20150A000033', '33', '2.15', '0', '53', '', '721', '148', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000033 - Camila siares', '0', '0', '', '0', '10.25', '0', '53', '', '0', '149', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000034 - Miguel san martin', '0', '0', '', '0', '0', '0', '54', '', '0', '150', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000034 - Miguel san martin', '0', '0', '', '0', '0', '0', '54', '', '0', '151', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000035 - Miguel san martin', '0', '0', '', '0', '0', '0', '55', '', '0', '152', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000035 - Miguel san martin', '0', '0', '', '0', '0', '0', '55', '', '0', '153', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000036 - Miguel san martin', '0', '0', '', '0', '0', '0', '56', '', '0', '154', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000036 - Miguel san martin', '0', '0', '', '0', '0', '0', '56', '', '0', '155', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000037 - Miguel san martin', '0', '0', '', '0', '0', '0', '57', '', '0', '156', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000037 - Miguel san martin', '0', '0', '', '0', '0', '0', '57', '', '0', '157', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000038 - Miguel san martin', '0', '0', '', '0', '0', '0', '58', '', '0', '158', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000038 - Miguel san martin', '0', '0', '', '0', '0', '0', '58', '', '0', '159', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000039 - Miguel san martin', '0', '0', '', '0', '0', '0', '59', '', '0', '160', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000039 - Miguel san martin', '0', '0', '', '0', '0', '0', '59', '', '0', '161', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000040 - Miguel san martin', '0', '0', '', '0', '0', '0', '60', '', '0', '162', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000040 - Miguel san martin', '0', '0', '', '0', '0', '0', '60', '', '0', '163', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000041 - Miguel san martin', '0', '0', '', '0', '0', '0', '61', '', '0', '164', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000041 - Miguel san martin', '0', '0', '', '0', '0', '0', '61', '', '0', '165', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000042 - Miguel san martin', '0', '0', '', '0', '0', '0', '62', '', '0', '166', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000042 - Miguel san martin', '0', '0', '', '0', '0', '0', '62', '', '0', '167', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000043 - Miguel san martin', '0', '0', '', '0', '0', '0', '63', '', '0', '168', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000043 - Miguel san martin', '0', '0', '', '0', '0', '0', '63', '', '0', '169', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000044 - Miguel san martin', '0', '0', '', '0', '0', '0', '64', '', '0', '170', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000044 - Miguel san martin', '0', '0', '', '0', '0', '0', '64', '', '0', '171', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000045 - Miguel san martin', '0', '0', '', '0', '0', '0', '65', '', '0', '172', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000045 - Miguel san martin', '0', '0', '', '0', '0', '0', '65', '', '0', '173', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000046 - Miguel san martin', '0', '0', '', '0', '0', '0', '66', '', '0', '174', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000046 - Miguel san martin', '0', '0', '', '0', '0', '0', '66', '', '0', '175', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000047 - Miguel san martin', '0', '0', '', '0', '0', '0', '67', '', '0', '176', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000047 - Miguel san martin', '0', '0', '', '0', '0', '0', '67', '', '0', '177', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000048 - Miguel san martin', '0', '0', '', '0', '0', '0', '68', '', '0', '178', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000048 - Miguel san martin', '0', '0', '', '0', '0', '0', '68', '', '0', '179', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000049 - Miguel san martin', '3', '0', '', '0', '0', '0', '69', '', '0', '180', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000049 - Miguel san martin', '0', '0', '20150A000049', '49', '0', '0', '69', '', '720', '181', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000049 - Miguel san martin', '0', '0', '', '0', '3', '0', '69', '', '0', '182', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000050 - Miguel san martin', '3', '0', '', '0', '0', '0', '70', '', '0', '183', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000050 - Miguel san martin', '0', '0', '20150A000050', '50', '0', '0', '70', '', '720', '184', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000050 - Miguel san martin', '0', '0', '', '0', '3', '0', '70', '', '0', '185', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000051 - Miguel san martin', '3', '0', '', '0', '0', '0', '71', '', '0', '186', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000051 - Miguel san martin', '0', '0', '20150A000051', '51', '0', '0', '71', '', '720', '187', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000051 - Miguel san martin', '0', '0', '', '0', '3', '0', '71', '', '0', '188', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000052 - Miguel san martin', '3', '0', '', '0', '0', '0', '72', '', '0', '189', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000052 - Miguel san martin', '0', '0', '20150A000052', '52', '0', '0', '72', '', '720', '190', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000052 - Miguel san martin', '0', '0', '', '0', '3', '0', '72', '', '0', '191', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000053 - Miguel san martin', '3', '0', '', '0', '0', '0', '73', '', '0', '192', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000053 - Miguel san martin', '0', '0', '20150A000053', '53', '0', '0', '73', '', '720', '193', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000053 - Miguel san martin', '0', '0', '', '0', '3', '0', '73', '', '0', '194', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000054 - Miguel san martin', '3', '0', '', '0', '0', '0', '74', '', '0', '195', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000054 - Miguel san martin', '0', '0', '20150A000054', '54', '0', '0', '74', '', '720', '196', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000054 - Miguel san martin', '0', '0', '', '0', '3', '0', '74', '', '0', '197', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000055 - Miguel san martin', '3', '0', '', '0', '0', '0', '75', '', '0', '198', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000055 - Miguel san martin', '0', '0', '20150A000055', '55', '0', '0', '75', '', '720', '199', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000055 - Miguel san martin', '0', '0', '', '0', '3', '0', '75', '', '0', '200', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000056 - Miguel san martin', '3', '0', '', '0', '0', '0', '76', '', '0', '201', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000056 - Miguel san martin', '0', '0', '20150A000056', '56', '0', '0', '76', '', '720', '202', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000056 - Miguel san martin', '0', '0', '', '0', '3', '0', '76', '', '0', '203', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000057 - Miguel san martin', '3', '0', '', '0', '0', '0', '77', '', '0', '204', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000057 - Miguel san martin', '0', '0', '20150A000057', '57', '0', '0', '77', '', '720', '205', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000057 - Miguel san martin', '0', '0', '', '0', '3', '0', '77', '', '0', '206', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000058 - Miguel san martin', '3', '0', '', '0', '0', '0', '78', '', '0', '207', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000058 - Miguel san martin', '0', '0', '20150A000058', '58', '0', '0', '78', '', '720', '208', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000058 - Miguel san martin', '0', '0', '', '0', '3', '0', '78', '', '0', '209', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000059 - Miguel san martin', '3', '0', '', '0', '0', '0', '79', '', '0', '210', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000059 - Miguel san martin', '0', '0', '20150A000059', '59', '0', '0', '79', '', '720', '211', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000059 - Miguel san martin', '0', '0', '', '0', '3', '0', '79', '', '0', '212', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000060 - Miguel san martin', '3', '0', '', '0', '0', '0', '80', '', '0', '213', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000060 - Miguel san martin', '0', '0', '20150A000060', '60', '0', '0', '80', '', '720', '214', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000060 - Miguel san martin', '0', '0', '', '0', '3', '0', '80', '', '0', '215', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000004', 'Factura de venta 20150A000061 - Miguel san martin', '3', '0', '', '0', '0', '0', '81', '', '0', '216', '720', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('3', '123456789', '4300000004', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000061 - Miguel san martin', '0', '0', '20150A000061', '61', '0', '0', '81', '', '720', '217', '276', '0', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000061 - Miguel san martin', '0', '0', '', '0', '3', '0', '81', '', '0', '218', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000062 - Camila siares', '12.4', '0', '', '0', '0', '0', '82', '', '0', '219', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000062 - Camila siares', '0', '0', '20150A000062', '62', '2.15', '0', '82', '', '721', '220', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000062 - Camila siares', '0', '0', '', '0', '10.25', '0', '82', '', '0', '221', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000063 - Camila siares', '12.4', '0', '', '0', '0', '0', '83', '', '0', '222', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000063 - Camila siares', '0', '0', '20150A000063', '63', '2.15', '0', '83', '', '721', '223', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000063 - Camila siares', '0', '0', '', '0', '10.25', '0', '83', '', '0', '224', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000064 - Camila siares', '12.4', '0', '', '0', '0', '0', '84', '', '0', '225', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000064 - Camila siares', '0', '0', '20150A000064', '64', '2.15', '0', '84', '', '721', '226', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000064 - Camila siares', '0', '0', '', '0', '10.25', '0', '84', '', '0', '227', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000065 - Camila siares', '12.4', '0', '', '0', '0', '0', '85', '', '0', '228', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000065 - Camila siares', '0', '0', '20150A000065', '65', '2.15', '0', '85', '', '721', '229', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000065 - Camila siares', '0', '0', '', '0', '10.25', '0', '85', '', '0', '230', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000066 - Camila siares', '12.4', '0', '', '0', '0', '0', '86', '', '0', '231', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('10.25', '', '4300000003', 'ARS', 'A', '4770000000', 'Factura de venta 20150A000066 - Camila siares', '0', '0', '20150A000066', '66', '2.15', '0', '86', '', '721', '232', '276', '21', '0', '0', '10.83', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000066 - Camila siares', '0', '0', '', '0', '10.25', '0', '86', '', '0', '233', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000067 - Camila siares', '0', '0', '', '0', '0', '0', '87', '', '0', '234', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000067 - Camila siares', '0', '0', '', '0', '0', '0', '87', '', '0', '235', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000003', 'Factura de venta 20150A000068 - Camila siares', '0', '0', '', '0', '0', '0', '88', '', '0', '236', '721', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20150A000068 - Camila siares', '0', '0', '', '0', '0', '0', '88', '', '0', '237', '561', '0', '0', '0', '10.83', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4000000001', 'Factura de compra 20160A000001 - TecnopolÌs', '0', '0', '', '', '2', '0', '101', '', '', '273', '931', '0', '0', '0', '15.09', '');
INSERT INTO co_partidas VALUES ('2', '17856275', '4000000001', 'ARS', 'A', '4720000000', 'Factura de compra 20160A000001 - TecnopolÌs', '0', '0', '20160A000001', '1', '0', '0', '101', '', '931', '274', '987', '0', '0', '0', '15.09', 'Factura de proveedor');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '6000000000', 'Factura de compra 20160A000001 - TecnopolÌs', '2', '0', '', '', '0', '0', '101', '', '', '275', '1142', '0', '0', '0', '15.09', '');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '4300000002', 'Factura de venta 20160A000002 - MIGUEL SAN MARTIN', '0', '0', '', '', '0', '0', '105', '', '', '286', '1442', '0', '0', '0', '15.64', '');
INSERT INTO co_partidas VALUES ('0', '38905797', '4300000002', 'ARS', 'A', '4770000000', 'Factura de venta 20160A000002 - MIGUEL SAN MARTIN', '0', '0', '20160A000002', '2', '0', '0', '105', '', '1442', '287', '997', '0', '0', '0', '15.64', 'Factura de cliente');
INSERT INTO co_partidas VALUES ('0', '', '', 'ARS', 'A', '7000000000', 'Factura de venta 20160A000002 - MIGUEL SAN MARTIN', '0', '0', '', '', '0', '0', '105', '', '', '288', '1282', '0', '0', '0', '15.64', '');


#
# Estructura de la tabla `co_regiva`
#

DROP TABLE IF EXISTS `co_regiva`;
CREATE TABLE `co_regiva` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codsubcuentaacr` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentadeu` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `fechaasiento` date NOT NULL,
  `fechafin` date NOT NULL,
  `fechainicio` date NOT NULL,
  `idasiento` int(11) NOT NULL,
  `idregiva` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuentaacr` int(11) DEFAULT NULL,
  `idsubcuentadeu` int(11) DEFAULT NULL,
  `periodo` varchar(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idregiva`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_regiva`
#

INSERT INTO co_regiva VALUES ('2015', '', '', '2015-09-30', '2015-09-30', '2015-07-01', '11', '1', '0', '0', 'T3');


#
# Estructura de la tabla `co_secuencias`
#

DROP TABLE IF EXISTS `co_secuencias`;
CREATE TABLE `co_secuencias` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `idsecuencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `valorout` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsecuencia`),
  KEY `ca_co_secuencias_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_co_secuencias_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_secuencias`
#

INSERT INTO co_secuencias VALUES ('2015', 'Creado por FacturaScripts', '1', 'nasiento', '0', '89');
INSERT INTO co_secuencias VALUES ('2016', 'Creado por FacturaScripts', '2', 'nasiento', '', '19');


#
# Estructura de la tabla `co_subcuentas`
#

DROP TABLE IF EXISTS `co_subcuentas`;
CREATE TABLE `co_subcuentas` (
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `debe` double NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `haber` double NOT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  `idsubcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double NOT NULL,
  `recargo` double NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`idsubcuenta`),
  KEY `ca_co_subcuentas_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentas_cuentas2` (`idcuenta`),
  CONSTRAINT `ca_co_subcuentas_cuentas2` FOREIGN KEY (`idcuenta`) REFERENCES `co_cuentas` (`idcuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentas_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1445 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_subcuentas`
#

INSERT INTO co_subcuentas VALUES ('100', 'EUR', '2015', '', '1000000000', '0', 'Capital social', '0', '1', '1', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('101', 'EUR', '2015', '', '1010000000', '0', 'Fondo social', '0', '2', '2', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('102', 'EUR', '2015', '', '1020000000', '0', 'Capital', '0', '3', '3', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1030', 'EUR', '2015', '', '1030000000', '0', 'Socios por desembolsos no exigidos, capital social', '0', '4', '4', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1034', 'EUR', '2015', '', '1034000000', '0', 'Socios por desembolsos no exigidos, capital pendiente de inscripci', '0', '5', '5', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1040', 'EUR', '2015', '', '1040000000', '0', 'Socios por aportaciones no dinerarias pendientes, capital social', '0', '6', '6', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1044', 'EUR', '2015', '', '1044000000', '0', 'Socios por aportaciones no dinerarias pendientes, capital pendiente de inscripci', '0', '7', '7', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('108', 'EUR', '2015', '', '1080000000', '0', 'Acciones o participaciones propias en situaciones especiales', '0', '8', '8', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('109', 'EUR', '2015', '', '1090000000', '0', 'Acciones o participaciones propias para reducci?n de capital', '0', '9', '9', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('110', 'EUR', '2015', '', '1100000000', '0', 'Prima de emisi?n o asunci', '0', '10', '10', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1110', 'EUR', '2015', '', '1110000000', '0', 'Patrimonio neto por emisi?n de instrumentos financieros compuestos', '0', '11', '11', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1111', 'EUR', '2015', '', '1111000000', '0', 'Resto de instrumentos de patrimonio neto', '0', '12', '12', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('112', 'EUR', '2015', '', '1120000000', '0', 'Reserva legal', '0', '13', '13', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('113', 'EUR', '2015', '', '1130000000', '0', 'Reservas voluntarias', '0', '14', '14', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1140', 'EUR', '2015', '', '1140000000', '0', 'Reservas para acciones o participaciones de la sociedad dominante', '0', '15', '15', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1141', 'EUR', '2015', '', '1141000000', '0', 'Reservas estatutarias', '0', '16', '16', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1142', 'EUR', '2015', '', '1142000000', '0', 'Reserva por capital amortizado', '0', '17', '17', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1143', 'EUR', '2015', '', '1143000000', '0', 'Reserva por fondo de comercio', '0', '18', '18', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1144', 'EUR', '2015', '', '1144000000', '0', 'Reservas por acciones propias aceptadas en garant', '0', '19', '19', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('115', 'EUR', '2015', '', '1150000000', '0', 'Reservas por p?rdidas y ganancias actuariales y otros ajustes', '0', '20', '20', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('118', 'EUR', '2015', '', '1180000000', '0', 'Aportaciones de socios o propietarios', '0', '21', '21', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('119', 'EUR', '2015', '', '1190000000', '0', 'Diferencias por ajuste del capital a euros', '0', '22', '22', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('120', 'EUR', '2015', '', '1200000000', '0', 'Remanente', '0', '23', '23', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('121', 'EUR', '2015', '', '1210000000', '0', 'Resultados negativos de ejercicios anteriores', '0', '24', '24', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('129', 'EUR', '2015', '', '1290000000', '0', 'Resultado del ejercicio', '0', '25', '25', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('130', 'EUR', '2015', '', '1300000000', '0', 'Subvenciones oficiales de capital', '0', '26', '26', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('131', 'EUR', '2015', '', '1310000000', '0', 'Donaciones y legados de capital', '0', '27', '27', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('132', 'EUR', '2015', '', '1320000000', '0', 'Otras subvenciones, donaciones y legados', '0', '28', '28', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('133', 'EUR', '2015', '', '1330000000', '0', 'Ajustes por valoraci?n en activos financieros disponibles para la venta', '0', '29', '29', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1340', 'EUR', '2015', '', '1340000000', '0', 'Cobertura de flujos de efectivo', '0', '30', '30', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1341', 'EUR', '2015', '', '1341000000', '0', 'Cobertura de una inversi?n neta en un negocio en el extranjero', '0', '31', '31', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('135', 'EUR', '2015', '', '1350000000', '0', 'Diferencias de conversi', '0', '32', '32', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('136', 'EUR', '2015', '', '1360000000', '0', 'Ajustes por valoraci?n en activos no corrientes y grupos enajenables de elementos, mantenidos para la venta', '0', '33', '33', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1370', 'EUR', '2015', '', '1370000000', '0', 'Ingresos fiscales por diferencias permanentes a distribuir en varios ejercicios', '0', '34', '34', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1371', 'EUR', '2015', '', '1371000000', '0', 'Ingresos fiscales por deducciones y bonificaciones a distribuir en varios ejercicios', '0', '35', '35', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('140', 'EUR', '2015', '', '1400000000', '0', 'Provisi?n por retribuciones a largo plazo al personal', '0', '36', '36', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('141', 'EUR', '2015', '', '1410000000', '0', 'Provisi?n para impuestos', '0', '37', '37', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('142', 'EUR', '2015', '', '1420000000', '0', 'Provisi?n para otras responsabilidades', '0', '38', '38', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('143', 'EUR', '2015', '', '1430000000', '0', 'Provisi?n por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '0', '39', '39', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('145', 'EUR', '2015', '', '1450000000', '0', 'Provisi?n para actuaciones medioambientales', '0', '40', '40', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('146', 'EUR', '2015', '', '1460000000', '0', 'Provisi?n para reestructuraciones', '0', '41', '41', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('147', 'EUR', '2015', '', '1470000000', '0', 'Provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '0', '42', '42', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('150', 'EUR', '2015', '', '1500000000', '0', 'Acciones o participaciones a largo plazo consideradas como pasivos financieros', '0', '43', '43', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1533', 'EUR', '2015', '', '1533000000', '0', 'Desembolsos no exigidos, empresas del grupo', '0', '44', '44', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1534', 'EUR', '2015', '', '1534000000', '0', 'Desembolsos no exigidos, empresas asociadas', '0', '45', '45', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1535', 'EUR', '2015', '', '1535000000', '0', 'Desembolsos no exigidos, otras partes vinculadas', '0', '46', '46', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1536', 'EUR', '2015', '', '1536000000', '0', 'Otros desembolsos no exigidos', '0', '47', '47', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1543', 'EUR', '2015', '', '1543000000', '0', 'Aportaciones no dinerarias pendientes, empresas del grupo', '0', '48', '48', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1544', 'EUR', '2015', '', '1544000000', '0', 'Aportaciones no dinerarias pendientes, empresas asociadas', '0', '49', '49', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1545', 'EUR', '2015', '', '1545000000', '0', 'Aportaciones no dinerarias pendientes, otras partes vinculadas', '0', '50', '50', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1546', 'EUR', '2015', '', '1546000000', '0', 'Otras aportaciones no dinerarias pendientes', '0', '51', '51', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1603', 'EUR', '2015', '', '1603000000', '0', 'Deudas a largo plazo con entidades de cr?dito, empresas del grupo', '0', '52', '52', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1604', 'EUR', '2015', '', '1604000000', '0', 'Deudas a largo plazo con entidades de cr?dito, empresas asociadas', '0', '53', '53', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1605', 'EUR', '2015', '', '1605000000', '0', 'Deudas a largo plazo con otras entidades de cr?dito vinculadas', '0', '54', '54', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1613', 'EUR', '2015', '', '1613000000', '0', 'Proveedores de inmovilizado a largo plazo, empresas del grupo', '0', '55', '55', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1614', 'EUR', '2015', '', '1614000000', '0', 'Proveedores de inmovilizado a largo plazo, empresas asociadas', '0', '56', '56', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1615', 'EUR', '2015', '', '1615000000', '0', 'Proveedores de inmovilizado a largo plazo, otras partes vinculadas', '0', '57', '57', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1623', 'EUR', '2015', '', '1623000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, empresas de grupo', '0', '58', '58', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1624', 'EUR', '2015', '', '1624000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, empresas asociadas', '0', '59', '59', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1625', 'EUR', '2015', '', '1625000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, otras partes vinculadas.', '0', '60', '60', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1633', 'EUR', '2015', '', '1633000000', '0', 'Otras deudas a largo plazo, empresas del grupo', '0', '61', '61', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1634', 'EUR', '2015', '', '1634000000', '0', 'Otras deudas a largo plazo, empresas asociadas', '0', '62', '62', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1635', 'EUR', '2015', '', '1635000000', '0', 'Otras deudas a largo plazo, con otras partes vinculadas', '0', '63', '63', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('170', 'EUR', '2015', '', '1700000000', '0', 'Deudas a largo plazo con entidades de cr?dito', '0', '64', '64', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('171', 'EUR', '2015', '', '1710000000', '0', 'Deudas a largo plazo', '0', '65', '65', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('172', 'EUR', '2015', '', '1720000000', '0', 'Deudas a largo plazo transformables en subvenciones, donaciones y legados', '0', '66', '66', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('173', 'EUR', '2015', '', '1730000000', '0', 'Proveedores de inmovilizado a largo plazo', '0', '67', '67', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('174', 'EUR', '2015', '', '1740000000', '0', 'Acreedores por arrendamiento financiero a largo plazo', '0', '68', '68', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('175', 'EUR', '2015', '', '1750000000', '0', 'Efectos a pagar a largo plazo', '0', '69', '69', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1765', 'EUR', '2015', '', '1765000000', '0', 'Pasivos por derivados financieros a largo plazo, cartera de negociaci', '0', '70', '70', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1768', 'EUR', '2015', '', '1768000000', '0', 'Pasivos por derivados financieros a largo plazo, instrumentos de cobertura', '0', '71', '71', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('177', 'EUR', '2015', '', '1770000000', '0', 'Obligaciones y bonos', '0', '72', '72', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('178', 'EUR', '2015', '', '1780000000', '0', 'Obligaciones y bonos convertibles', '0', '73', '73', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('179', 'EUR', '2015', '', '1790000000', '0', 'Deudas representadas en otros valores negociables', '0', '74', '74', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('180', 'EUR', '2015', '', '1800000000', '0', 'Fianzas recibidas a largo plazo', '0', '75', '75', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('181', 'EUR', '2015', '', '1810000000', '0', 'Anticipos recibidos por ventas o prestaciones de servicios a largo plazo', '0', '76', '76', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('185', 'EUR', '2015', '', '1850000000', '0', 'Dep?sitos recibidos a largo plazo', '0', '77', '77', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('189', 'EUR', '2015', '', '1890000000', '0', 'Garant?as financieras a largo plazo', '0', '78', '78', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('190', 'EUR', '2015', '', '1900000000', '0', 'Acciones o participaciones emitidas', '0', '79', '79', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('192', 'EUR', '2015', '', '1920000000', '0', 'Suscriptores de acciones', '0', '80', '80', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('194', 'EUR', '2015', '', '1940000000', '0', 'Capital emitido pendiente de inscripci', '0', '81', '81', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('195', 'EUR', '2015', '', '1950000000', '0', 'Acciones o participaciones emitidas consideradas como pasivos financieros', '0', '82', '82', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('197', 'EUR', '2015', '', '1970000000', '0', 'Suscriptores de acciones consideradas como pasivos financieros', '0', '83', '83', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('199', 'EUR', '2015', '', '1990000000', '0', 'Acciones o participaciones emitidas consideradas como pasivos financieros pendientes de inscripci', '0', '84', '84', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('200', 'EUR', '2015', '', '2000000000', '0', 'Investigaci', '0', '85', '85', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('201', 'EUR', '2015', '', '2010000000', '0', 'Desarrollo', '0', '86', '86', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('202', 'EUR', '2015', '', '2020000000', '0', 'Concesiones administrativas', '0', '87', '87', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('203', 'EUR', '2015', '', '2030000000', '0', 'Propiedad industrial', '0', '88', '88', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('204', 'EUR', '2015', '', '2040000000', '0', 'Fondo de comercio', '0', '89', '89', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('205', 'EUR', '2015', '', '2050000000', '0', 'Derechos de traspaso', '0', '90', '90', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('206', 'EUR', '2015', '', '2060000000', '0', 'Aplicaciones inform?ticas', '0', '91', '91', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('209', 'EUR', '2015', '', '2090000000', '0', 'Anticipos para inmovilizaciones intangibles', '0', '92', '92', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('210', 'EUR', '2015', '', '2100000000', '0', 'Terrenos y bienes naturales', '0', '93', '93', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('211', 'EUR', '2015', '', '2110000000', '0', 'Construcciones', '0', '94', '94', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('212', 'EUR', '2015', '', '2120000000', '0', 'Instalaciones t?cnicas', '0', '95', '95', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('213', 'EUR', '2015', '', '2130000000', '0', 'Maquinaria', '0', '96', '96', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('214', 'EUR', '2015', '', '2140000000', '0', 'Utillaje', '0', '97', '97', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('215', 'EUR', '2015', '', '2150000000', '0', 'Otras instalaciones', '0', '98', '98', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('216', 'EUR', '2015', '', '2160000000', '0', 'Mobiliario', '0', '99', '99', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('217', 'EUR', '2015', '', '2170000000', '0', 'Equipos para procesos de informaci', '0', '100', '100', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('218', 'EUR', '2015', '', '2180000000', '0', 'Elementos de transporte', '0', '101', '101', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('219', 'EUR', '2015', '', '2190000000', '0', 'Otro inmovilizado material', '0', '102', '102', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('220', 'EUR', '2015', '', '2200000000', '0', 'Inversiones en terrenos y bienes naturales', '0', '103', '103', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('221', 'EUR', '2015', '', '2210000000', '0', 'Inversiones en construcciones', '0', '104', '104', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('230', 'EUR', '2015', '', '2300000000', '0', 'Adaptaci?n de terrenos y bienes naturales', '0', '105', '105', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('231', 'EUR', '2015', '', '2310000000', '0', 'Construcciones en curso', '0', '106', '106', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('232', 'EUR', '2015', '', '2320000000', '0', 'Instalaciones t?cnicas en montaje', '0', '107', '107', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('233', 'EUR', '2015', '', '2330000000', '0', 'Maquinaria en montaje', '0', '108', '108', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('237', 'EUR', '2015', '', '2370000000', '0', 'Equipos para procesos de informaci?n en montaje', '0', '109', '109', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('239', 'EUR', '2015', '', '2390000000', '0', 'Anticipos para inmovilizaciones materiales', '0', '110', '110', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2403', 'EUR', '2015', '', '2403000000', '0', 'Participaciones a largo plazo en empresas del grupo', '0', '111', '111', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2404', 'EUR', '2015', '', '2404000000', '0', 'Participaciones a largo plazo en empresas asociadas', '0', '112', '112', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2405', 'EUR', '2015', '', '2405000000', '0', 'Participaciones a largo plazo en otras partes vinculadas', '0', '113', '113', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2413', 'EUR', '2015', '', '2413000000', '0', 'Valores representativos de deuda a largo plazo de empresas del grupo', '0', '114', '114', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2414', 'EUR', '2015', '', '2414000000', '0', 'Valores representativos de deuda a largo plazo de empresas asociadas', '0', '115', '115', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2415', 'EUR', '2015', '', '2415000000', '0', 'Valores representativos de deuda a largo plazo de otras partes vinculadas', '0', '116', '116', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2423', 'EUR', '2015', '', '2423000000', '0', 'Cr?ditos a largo plazo a empresas del grupo', '0', '117', '117', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2424', 'EUR', '2015', '', '2424000000', '0', 'Cr?ditos a largo plazo a empresas asociadas', '0', '118', '118', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2425', 'EUR', '2015', '', '2425000000', '0', 'Cr?ditos a largo plazo a otras partes vinculadas', '0', '119', '119', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2493', 'EUR', '2015', '', '2493000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas del grupo.', '0', '120', '120', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2494', 'EUR', '2015', '', '2494000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas asociadas.', '0', '121', '121', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2495', 'EUR', '2015', '', '2495000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en otras partes vinculadas', '0', '122', '122', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('250', 'EUR', '2015', '', '2500000000', '0', 'Inversiones financieras a largo plazo en instrumentos de patrimonio', '0', '123', '123', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('251', 'EUR', '2015', '', '2510000000', '0', 'Valores representativos de deuda a largo plazo', '0', '124', '124', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('252', 'EUR', '2015', '', '2520000000', '0', 'Cr?ditos a largo plazo', '0', '125', '125', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('253', 'EUR', '2015', '', '2530000000', '0', 'Cr?ditos a largo plazo por enajenaci?n de inmovilizado', '0', '126', '126', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('254', 'EUR', '2015', '', '2540000000', '0', 'Cr?ditos a largo plazo al personal', '0', '127', '127', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2550', 'EUR', '2015', '', '2550000000', '0', 'Activos por derivados financieros a largo plazo, cartera de negociaci', '0', '128', '128', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2553', 'EUR', '2015', '', '2553000000', '0', 'Activos por derivados financieros a largo plazo, instrumentos de cobertura', '0', '129', '129', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('257', 'EUR', '2015', '', '2570000000', '0', 'Derechos de reembolso derivados de contratos de seguro relativos a retribuciones a largo plazo al personal', '0', '130', '130', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('258', 'EUR', '2015', '', '2580000000', '0', 'Imposiciones a largo plazo', '0', '131', '131', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('259', 'EUR', '2015', '', '2590000000', '0', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a largo plazo', '0', '132', '132', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('260', 'EUR', '2015', '', '2600000000', '0', 'Fianzas constituidas a largo plazo', '0', '133', '133', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('265', 'EUR', '2015', '', '2650000000', '0', 'Dep?sitos constituidos a largo plazo', '0', '134', '134', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2800', 'EUR', '2015', '', '2800000000', '0', 'Amortizaci?n acumulada de investigaci', '0', '135', '135', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2801', 'EUR', '2015', '', '2801000000', '0', 'Amortizaci?n acumulada de desarrollo', '0', '136', '136', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2802', 'EUR', '2015', '', '2802000000', '0', 'Amortizaci?n acumulada de concesiones administrativas', '0', '137', '137', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2803', 'EUR', '2015', '', '2803000000', '0', 'Amortizaci?n acumulada de propiedad industrial', '0', '138', '138', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2805', 'EUR', '2015', '', '2805000000', '0', 'Amortizaci?n acumulada de derechos de traspaso', '0', '139', '139', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2806', 'EUR', '2015', '', '2806000000', '0', 'Amortizaci?n acumulada de aplicaciones inform?ticas', '0', '140', '140', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2811', 'EUR', '2015', '', '2811000000', '0', 'Amortizaci?n acumulada de construcciones', '0', '141', '141', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2812', 'EUR', '2015', '', '2812000000', '0', 'Amortizaci?n acumulada de instalaciones t?cnicas', '0', '142', '142', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2813', 'EUR', '2015', '', '2813000000', '0', 'Amortizaci?n acumulada de maquinaria', '0', '143', '143', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2814', 'EUR', '2015', '', '2814000000', '0', 'Amortizaci?n acumulada de utillaje', '0', '144', '144', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2815', 'EUR', '2015', '', '2815000000', '0', 'Amortizaci?n acumulada de otras instalaciones', '0', '145', '145', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2816', 'EUR', '2015', '', '2816000000', '0', 'Amortizaci?n acumulada de mobiliario', '0', '146', '146', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2817', 'EUR', '2015', '', '2817000000', '0', 'Amortizaci?n acumulada de equipos para procesos de informaci', '0', '147', '147', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2818', 'EUR', '2015', '', '2818000000', '0', 'Amortizaci?n acumulada de elementos de transporte', '0', '148', '148', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2819', 'EUR', '2015', '', '2819000000', '0', 'Amortizaci?n acumulada de otro inmovilizado material', '0', '149', '149', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('282', 'EUR', '2015', '', '2820000000', '0', 'Amortizaci?n acumulada de las inversiones inmobiliarias', '0', '150', '150', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2900', 'EUR', '2015', '', '2900000000', '0', 'Deterioro de valor de investigaci', '0', '151', '151', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2901', 'EUR', '2015', '', '2901000000', '0', 'Deterioro del valor de desarrollo', '0', '152', '152', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2902', 'EUR', '2015', '', '2902000000', '0', 'Deterioro de valor de concesiones administrativas', '0', '153', '153', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2903', 'EUR', '2015', '', '2903000000', '0', 'Deterioro de valor de propiedad industrial', '0', '154', '154', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2905', 'EUR', '2015', '', '2905000000', '0', 'Deterioro de valor de derechos de traspaso', '0', '155', '155', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2906', 'EUR', '2015', '', '2906000000', '0', 'Deterioro de valor de aplicaciones inform?ticas', '0', '156', '156', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2910', 'EUR', '2015', '', '2910000000', '0', 'Deterioro de valor de terrenos y bienes naturales', '0', '157', '157', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2911', 'EUR', '2015', '', '2911000000', '0', 'Deterioro de valor de construcciones', '0', '158', '158', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2912', 'EUR', '2015', '', '2912000000', '0', 'Deterioro de valor de instalaciones t?cnicas', '0', '159', '159', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2913', 'EUR', '2015', '', '2913000000', '0', 'Deterioro de valor de maquinaria', '0', '160', '160', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2914', 'EUR', '2015', '', '2914000000', '0', 'Deterioro de valor de utillaje', '0', '161', '161', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2915', 'EUR', '2015', '', '2915000000', '0', 'Deterioro de valor de otras instalaciones', '0', '162', '162', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2916', 'EUR', '2015', '', '2916000000', '0', 'Deterioro de valor de mobiliario', '0', '163', '163', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2917', 'EUR', '2015', '', '2917000000', '0', 'Deterioro de valor de equipos para procesos de informaci', '0', '164', '164', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2918', 'EUR', '2015', '', '2918000000', '0', 'Deterioro de valor de elementos de transporte', '0', '165', '165', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2919', 'EUR', '2015', '', '2919000000', '0', 'Deterioro de valor de otro inmovilizado material', '0', '166', '166', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2920', 'EUR', '2015', '', '2920000000', '0', 'Deterioro de valor de los terrenos y bienes naturales', '0', '167', '167', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2921', 'EUR', '2015', '', '2921000000', '0', 'Deterioro de valor de construcciones', '0', '168', '168', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2933', 'EUR', '2015', '', '2933000000', '0', 'Deterioro de valor de participaciones a largo plazo en empresas del grupo', '0', '169', '169', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2934', 'EUR', '2015', '', '2934000000', '0', 'Deterioro de valor de participaciones a largo plazo en empresas asociadas', '0', '170', '170', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2943', 'EUR', '2015', '', '2943000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas del grupo', '0', '171', '171', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2944', 'EUR', '2015', '', '2944000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas asociadas', '0', '172', '172', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2945', 'EUR', '2015', '', '2945000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de otras partes vinculadas', '0', '173', '173', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2953', 'EUR', '2015', '', '2953000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a empresas del grupo', '0', '174', '174', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2954', 'EUR', '2015', '', '2954000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a empresas asociadas', '0', '175', '175', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2955', 'EUR', '2015', '', '2955000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a otras partes vinculadas', '0', '176', '176', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('297', 'EUR', '2015', '', '2970000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo', '0', '177', '177', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('298', 'EUR', '2015', '', '2980000000', '0', 'Deterioro de valor de cr?ditos a largo plazo', '0', '178', '178', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('300', 'EUR', '2015', '', '3000000000', '0', 'Mercader?as a', '0', '179', '179', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('301', 'EUR', '2015', '', '3010000000', '0', 'Mercader?as b', '0', '180', '180', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('310', 'EUR', '2015', '', '3100000000', '0', 'Materias primas a', '0', '181', '181', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('311', 'EUR', '2015', '', '3110000000', '0', 'Materias primas b', '0', '182', '182', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('320', 'EUR', '2015', '', '3200000000', '0', 'Elementos y conjuntos incorporables', '0', '183', '183', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('321', 'EUR', '2015', '', '3210000000', '0', 'Combustibles', '0', '184', '184', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('322', 'EUR', '2015', '', '3220000000', '0', 'Repuestos', '0', '185', '185', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('325', 'EUR', '2015', '', '3250000000', '0', 'Materiales diversos', '0', '186', '186', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('326', 'EUR', '2015', '', '3260000000', '0', 'Embalajes', '0', '187', '187', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('327', 'EUR', '2015', '', '3270000000', '0', 'Envases', '0', '188', '188', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('328', 'EUR', '2015', '', '3280000000', '0', 'Material de oficina', '0', '189', '189', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('330', 'EUR', '2015', '', '3300000000', '0', 'Productos en curso a', '0', '190', '190', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('331', 'EUR', '2015', '', '3310000000', '0', 'Productos en curso b', '0', '191', '191', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('340', 'EUR', '2015', '', '3400000000', '0', 'Productos semiterminados a', '0', '192', '192', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('341', 'EUR', '2015', '', '3410000000', '0', 'Productos semiterminados b', '0', '193', '193', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('350', 'EUR', '2015', '', '3500000000', '0', 'Productos terminados a', '0', '194', '194', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('351', 'EUR', '2015', '', '3510000000', '0', 'Productos terminados b', '0', '195', '195', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('360', 'EUR', '2015', '', '3600000000', '0', 'Subproductos a', '0', '196', '196', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('361', 'EUR', '2015', '', '3610000000', '0', 'Subproductos b', '0', '197', '197', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('365', 'EUR', '2015', '', '3650000000', '0', 'Residuos a', '0', '198', '198', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('366', 'EUR', '2015', '', '3660000000', '0', 'Residuos b', '0', '199', '199', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('368', 'EUR', '2015', '', '3680000000', '0', 'Materiales recuperados a', '0', '200', '200', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('369', 'EUR', '2015', '', '3690000000', '0', 'Materiales recuperados b', '0', '201', '201', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('390', 'EUR', '2015', '', '3900000000', '0', 'Deterioro de valor de las mercader?as', '0', '202', '202', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('391', 'EUR', '2015', '', '3910000000', '0', 'Deterioro de valor de las materias primas', '0', '203', '203', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('392', 'EUR', '2015', '', '3920000000', '0', 'Deterioro de valor de otros aprovisionamientos', '0', '204', '204', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('393', 'EUR', '2015', '', '3930000000', '0', 'Deterioro de valor de los productos en curso', '0', '205', '205', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('394', 'EUR', '2015', '', '3940000000', '0', 'Deterioro de valor de los productos semiterminados', '0', '206', '206', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('395', 'EUR', '2015', '', '3950000000', '0', 'Deterioro de valor de los productos terminados', '0', '207', '207', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('396', 'EUR', '2015', '', '3960000000', '0', 'Deterioro de valor de los subproductos, residuos y materiales recuperados', '0', '208', '208', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('400', 'EUR', '2015', '', '4000000000', '0', 'Proveedores', '0', '209', '209', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4000', 'EUR', '2015', '', '4000000001', '0', 'Prueba', '380.38', '210', '210', '0', '0', '-380.38');
INSERT INTO co_subcuentas VALUES ('4004', 'EUR', '2015', '', '4004000000', '0', 'Proveedores (moneda extranjera)', '0', '211', '211', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4009', 'EUR', '2015', '', '4009000000', '0', 'Proveedores, facturas pendientes de recibir o de formalizar', '0', '212', '212', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('401', 'EUR', '2015', '', '4010000000', '0', 'Proveedores, efectos comerciales a pagar', '0', '213', '213', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4030', 'EUR', '2015', '', '4030000000', '0', 'Proveedores, empresas del grupo (euros)', '0', '214', '214', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4031', 'EUR', '2015', '', '4031000000', '0', 'Efectos comerciales a pagar, empresas del grupo', '0', '215', '215', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4034', 'EUR', '2015', '', '4034000000', '0', 'Proveedores, empresas del grupo (moneda extranjera)', '0', '216', '216', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4036', 'EUR', '2015', '', '4036000000', '0', 'Envases y embalajes a devolver a proveedores, empresas del grupo', '0', '217', '217', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4039', 'EUR', '2015', '', '4039000000', '0', 'Proveedores, empresas del grupo, facturas pendientes de recibir o de formalizar', '0', '218', '218', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('404', 'EUR', '2015', '', '4040000000', '0', 'Proveedores, empresas asociadas', '0', '219', '219', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('405', 'EUR', '2015', '', '4050000000', '0', 'Proveedores, otras partes vinculadas', '0', '220', '220', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('406', 'EUR', '2015', '', '4060000000', '0', 'Envases y embalajes a devolver a proveedores', '0', '221', '221', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('407', 'EUR', '2015', '', '4070000000', '0', 'Anticipos a proveedores', '0', '222', '222', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('410', 'EUR', '2015', '', '4100000000', '0', 'Acreedores', '0', '223', '223', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4100', 'EUR', '2015', '', '4100000001', '0', 'Acreedores por prestaciones de servicios (euros)', '0', '224', '224', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4104', 'EUR', '2015', '', '4104000000', '0', 'Acreedores por prestaciones de servicios, (moneda extranjera)', '0', '225', '225', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4109', 'EUR', '2015', '', '4109000000', '0', 'Acreedores por prestaciones de servicios, facturas pendientes de recibir o de formalizar', '0', '226', '226', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('411', 'EUR', '2015', '', '4110000000', '0', 'Acreedores, efectos comerciales a pagar', '0', '227', '227', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('419', 'EUR', '2015', '', '4190000000', '0', 'Acreedores por operaciones en com?n', '0', '228', '228', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'EUR', '2015', '', '4300000000', '0', 'Clientes', '0', '229', '229', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4300', 'EUR', '2015', '', '4300000001', '311.37', 'CONSUMIDOR FINAL', '0', '230', '230', '0', '0', '311.37');
INSERT INTO co_subcuentas VALUES ('4304', 'EUR', '2015', '', '4304000000', '0', 'Clientes (moneda extranjera)', '0', '231', '231', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4309', 'EUR', '2015', '', '4309000000', '0', 'Clientes, facturas pendientes de formalizar', '0', '232', '232', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4310', 'EUR', '2015', '', '4310000000', '0', 'Efectos comerciales en cartera', '0', '233', '233', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4311', 'EUR', '2015', '', '4311000000', '0', 'Efectos comerciales descontados', '0', '234', '234', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4312', 'EUR', '2015', '', '4312000000', '0', 'Efectos comerciales en gesti?n de cobro', '0', '235', '235', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4315', 'EUR', '2015', '', '4315000000', '0', 'Efectos comerciales impagados', '0', '236', '236', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('432', 'EUR', '2015', '', '4320000000', '0', 'Clientes, operaciones de factoring', '0', '237', '237', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4330', 'EUR', '2015', '', '4330000000', '0', 'Clientes empresas del grupo (euros)', '0', '238', '238', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4331', 'EUR', '2015', '', '4331000000', '0', 'Efectos comerciales a cobrar, empresas del grupo', '0', '239', '239', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4332', 'EUR', '2015', '', '4332000000', '0', 'Clientes empresas del grupo, operaciones de factoring', '0', '240', '240', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4334', 'EUR', '2015', '', '4334000000', '0', 'Clientes empresas del grupo (moneda extranjera)', '0', '241', '241', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4336', 'EUR', '2015', '', '4336000000', '0', 'Clientes empresas del grupo de dudoso cobro', '0', '242', '242', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4337', 'EUR', '2015', '', '4337000000', '0', 'Envases y embalajes a devolver a clientes, empresas del grupo', '0', '243', '243', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4339', 'EUR', '2015', '', '4339000000', '0', 'Clientes empresas del grupo, facturas pendientes de formalizar', '0', '244', '244', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('434', 'EUR', '2015', '', '4340000000', '0', 'Clientes, empresas asociadas', '0', '245', '245', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('435', 'EUR', '2015', '', '4350000000', '0', 'Clientes, otras partes vinculadas', '0', '246', '246', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('436', 'EUR', '2015', '', '4360000000', '0', 'Clientes de dudoso cobro', '0', '247', '247', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('437', 'EUR', '2015', '', '4370000000', '0', 'Envases y embalajes a devolver por clientes', '0', '248', '248', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('438', 'EUR', '2015', '', '4380000000', '0', 'Anticipos de clientes', '0', '249', '249', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4400', 'EUR', '2015', '', '4400000000', '0', 'Deudores (euros)', '0', '250', '250', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4404', 'EUR', '2015', '', '4404000000', '0', 'Deudores (moneda extranjera)', '0', '251', '251', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4409', 'EUR', '2015', '', '4409000000', '0', 'Deudores, facturas pendientes de formalizar', '0', '252', '252', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4410', 'EUR', '2015', '', '4410000000', '0', 'Deudores, efectos comerciales en cartera', '0', '253', '253', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4411', 'EUR', '2015', '', '4411000000', '0', 'Deudores, efectos comerciales descontados', '0', '254', '254', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4412', 'EUR', '2015', '', '4412000000', '0', 'Deudores, efectos comerciales en gesti?n de cobro', '0', '255', '255', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4415', 'EUR', '2015', '', '4415000000', '0', 'Deudores, efectos comerciales impagados', '0', '256', '256', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('446', 'EUR', '2015', '', '4460000000', '0', 'Deudores de dudoso cobro', '0', '257', '257', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('449', 'EUR', '2015', '', '4490000000', '0', 'Deudores por operaciones en com?n', '0', '258', '258', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('460', 'EUR', '2015', '', '4600000000', '0', 'Anticipos de remuneraciones', '0', '259', '259', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('465', 'EUR', '2015', '', '4650000000', '0', 'Remuneraciones pendientes de pago', '0', '260', '260', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('466', 'EUR', '2015', '', '4660000000', '0', 'Remuneraciones mediante sistemas de aportaci?n definida pendientes de pago', '0', '261', '261', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4700', 'EUR', '2015', '', '4700000000', '0', 'Hacienda p?blica, deudora por iva', '0', '262', '262', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4708', 'EUR', '2015', '', '4708000000', '0', 'Hacienda p?blica, deudora por subvenciones concedidas', '0', '263', '263', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4709', 'EUR', '2015', '', '4709000000', '0', 'Hacienda p?blica, deudora por devoluci?n de impuestos', '0', '264', '264', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('471', 'EUR', '2015', '', '4710000000', '0', 'Organismos de la seguridad social, deudores', '0', '265', '265', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('472', 'EUR', '2015', '', '4720000000', '75.63', 'Hacienda p?blica, iva soportado', '0', '266', '266', '0', '0', '75.63');
INSERT INTO co_subcuentas VALUES ('473', 'EUR', '2015', '', '4730000000', '0', 'Hacienda p?blica, retenciones y pagos a cuenta', '0', '267', '267', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4740', 'EUR', '2015', '', '4740000000', '0', 'Activos por diferencias temporarias deducibles', '0', '268', '268', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4742', 'EUR', '2015', '', '4742000000', '0', 'Derechos por deducciones y bonificaciones pendientes de aplicar', '0', '269', '269', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4745', 'EUR', '2015', '', '4745000000', '0', 'Cr?dito por p?rdidas a compensar del ejercicio', '0', '270', '270', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4750', 'EUR', '2015', '', '4750000000', '0', 'Hacienda p?blica, acreedora por iva', '0', '271', '271', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4751', 'EUR', '2015', '', '4751000000', '0', 'Hacienda p?blica, acreedora por retenciones practicadas', '0', '272', '272', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4752', 'EUR', '2015', '', '4752000000', '0', 'Hacienda p?blica, acreedora por impuesto sobre sociedades', '0', '273', '273', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4758', 'EUR', '2015', '', '4758000000', '0', 'Hacienda p?blica, acreedora por subvenciones a reintegrar', '0', '274', '274', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('476', 'EUR', '2015', '', '4760000000', '0', 'Organismos de la seguridad social, acreedores', '0', '275', '275', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('477', 'EUR', '2015', '', '4770000000', '0', 'Hacienda p?blica, iva repercutido', '87.01', '276', '276', '0', '0', '-87.01');
INSERT INTO co_subcuentas VALUES ('479', 'EUR', '2015', '', '4790000000', '0', 'Pasivos por diferencias temporarias imponibles', '0', '277', '277', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('480', 'EUR', '2015', '', '4800000000', '0', 'Gastos anticipados', '0', '278', '278', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('485', 'EUR', '2015', '', '4850000000', '0', 'Ingresos anticipados', '0', '279', '279', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('490', 'EUR', '2015', '', '4900000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales', '0', '280', '280', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4933', 'EUR', '2015', '', '4933000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas del grupo', '0', '281', '281', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4934', 'EUR', '2015', '', '4934000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas asociadas', '0', '282', '282', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4935', 'EUR', '2015', '', '4935000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con otras partes vinculadas', '0', '283', '283', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4994', 'EUR', '2015', '', '4994000000', '0', 'Provisi?n por contratos onerosos', '0', '284', '284', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4999', 'EUR', '2015', '', '4999000000', '0', 'Provisi?n para otras operaciones comerciales', '0', '285', '285', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('500', 'EUR', '2015', '', '5000000000', '0', 'Obligaciones y bonos a corto plazo', '0', '286', '286', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('501', 'EUR', '2015', '', '5010000000', '0', 'Obligaciones y bonos convertibles a corto plazo', '0', '287', '287', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('502', 'EUR', '2015', '', '5020000000', '0', 'Acciones o participaciones a corto plazo consideradas como pasivos financieros', '0', '288', '288', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('505', 'EUR', '2015', '', '5050000000', '0', 'Deudas representadas en otros valores negociables a corto plazo', '0', '289', '289', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('506', 'EUR', '2015', '', '5060000000', '0', 'Intereses a corto plazo de empr?stitos y otras emisiones an?logas', '0', '290', '290', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('507', 'EUR', '2015', '', '5070000000', '0', 'Dividendos de acciones o participaciones consideradas como pasivos financieros', '0', '291', '291', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5090', 'EUR', '2015', '', '5090000000', '0', 'Obligaciones y bonos amortizados', '0', '292', '292', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5091', 'EUR', '2015', '', '5091000000', '0', 'Obligaciones y bonos convertibles amortizados', '0', '293', '293', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5095', 'EUR', '2015', '', '5095000000', '0', 'Otros valores negociables amortizados', '0', '294', '294', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5103', 'EUR', '2015', '', '5103000000', '0', 'Deudas a corto plazo con entidades de cr?dito, empresas del grupo', '0', '295', '295', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5104', 'EUR', '2015', '', '5104000000', '0', 'Deudas a corto plazo con entidades de cr?dito, empresas asociadas', '0', '296', '296', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5105', 'EUR', '2015', '', '5105000000', '0', 'Deudas a corto plazo con otras entidades de cr?dito vinculadas', '0', '297', '297', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5113', 'EUR', '2015', '', '5113000000', '0', 'Proveedores de inmovilizado a corto plazo, empresas del grupo', '0', '298', '298', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5114', 'EUR', '2015', '', '5114000000', '0', 'Proveedores de inmovilizado a corto plazo, empresas asociadas', '0', '299', '299', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5115', 'EUR', '2015', '', '5115000000', '0', 'Proveedores de inmovilizado a corto plazo, otras partes vinculadas', '0', '300', '300', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5123', 'EUR', '2015', '', '5123000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, empresas del grupo', '0', '301', '301', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5124', 'EUR', '2015', '', '5124000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, empresas asociadas', '0', '302', '302', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5125', 'EUR', '2015', '', '5125000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, otras partes vinculadas', '0', '303', '303', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5133', 'EUR', '2015', '', '5133000000', '0', 'Otras deudas a corto plazo con empresas del grupo', '0', '304', '304', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5134', 'EUR', '2015', '', '5134000000', '0', 'Otras deudas a corto plazo con empresas asociadas', '0', '305', '305', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5135', 'EUR', '2015', '', '5135000000', '0', 'Otras deudas a corto plazo con otras partes vinculadas', '0', '306', '306', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5143', 'EUR', '2015', '', '5143000000', '0', 'Intereses a corto plazo de deudas, empresas del grupo', '0', '307', '307', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5144', 'EUR', '2015', '', '5144000000', '0', 'Intereses a corto plazo de deudas, empresas asociadas', '0', '308', '308', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5145', 'EUR', '2015', '', '5145000000', '0', 'Intereses a corto plazo de deudas, otras partes vinculadas', '0', '309', '309', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5200', 'EUR', '2015', '', '5200000000', '0', 'Pr?stamos a corto plazo de entidades de cr?dito', '0', '310', '310', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5201', 'EUR', '2015', '', '5201000000', '0', 'Deudas a corto plazo por cr?dito dispuesto', '0', '311', '311', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5208', 'EUR', '2015', '', '5208000000', '0', 'Deudas por efectos descontados', '0', '312', '312', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5209', 'EUR', '2015', '', '5209000000', '0', 'Deudas por operaciones de factoring', '0', '313', '313', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('521', 'EUR', '2015', '', '5210000000', '0', 'Deudas a corto plazo', '0', '314', '314', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('522', 'EUR', '2015', '', '5220000000', '0', 'Deudas a corto plazo transformables en subvenciones, donaciones y legados', '0', '315', '315', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('523', 'EUR', '2015', '', '5230000000', '0', 'Proveedores de inmovilizado a corto plazo', '0', '316', '316', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('524', 'EUR', '2015', '', '5240000000', '0', 'Acreedores por arrendamiento financiero a corto plazo', '0', '317', '317', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('525', 'EUR', '2015', '', '5250000000', '0', 'Efectos a pagar a corto plazo', '0', '318', '318', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('526', 'EUR', '2015', '', '5260000000', '0', 'Dividendo activo a pagar', '0', '319', '319', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('527', 'EUR', '2015', '', '5270000000', '0', 'Intereses a corto plazo de deudas con entidades de cr?dito', '0', '320', '320', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('528', 'EUR', '2015', '', '5280000000', '0', 'Intereses a corto plazo de deudas', '0', '321', '321', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5290', 'EUR', '2015', '', '5290000000', '0', 'Provisi?n a corto plazo por retribuciones al personal', '0', '322', '322', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5291', 'EUR', '2015', '', '5291000000', '0', 'Provisi?n a corto plazo para impuestos', '0', '323', '323', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5292', 'EUR', '2015', '', '5292000000', '0', 'Provisi?n a corto plazo para otras responsabilidades', '0', '324', '324', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5293', 'EUR', '2015', '', '5293000000', '0', 'Provisi?n a corto plazo por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '0', '325', '325', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5295', 'EUR', '2015', '', '5295000000', '0', 'Provisi?n a corto plazo para actuaciones medioambientales', '0', '326', '326', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5296', 'EUR', '2015', '', '5296000000', '0', 'Provisi?n a corto plazo para reestructuraciones', '0', '327', '327', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5297', 'EUR', '2015', '', '5297000000', '0', 'Provisi?n a corto plazo por transacciones con pagos basados en instrumentos de patrimonio', '0', '328', '328', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5303', 'EUR', '2015', '', '5303000000', '0', 'Participaciones a corto plazo, en empresas del grupo', '0', '329', '329', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5304', 'EUR', '2015', '', '5304000000', '0', 'Participaciones a corto plazo, en empresas asociadas', '0', '330', '330', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5305', 'EUR', '2015', '', '5305000000', '0', 'Participaciones a corto plazo, en otras partes vinculadas', '0', '331', '331', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5313', 'EUR', '2015', '', '5313000000', '0', 'Valores representativos de deuda a corto plazo de empresas del grupo', '0', '332', '332', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5314', 'EUR', '2015', '', '5314000000', '0', 'Valores representativos de deuda a corto plazo de empresas asociadas', '0', '333', '333', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5315', 'EUR', '2015', '', '5315000000', '0', 'Valores representativos de deuda a corto plazo de otras partes vinculadas', '0', '334', '334', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5323', 'EUR', '2015', '', '5323000000', '0', 'Cr?ditos a corto plazo a empresas del grupo', '0', '335', '335', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5324', 'EUR', '2015', '', '5324000000', '0', 'Cr?ditos a corto plazo a empresas asociadas', '0', '336', '336', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5325', 'EUR', '2015', '', '5325000000', '0', 'Cr?ditos a corto plazo a otras partes vinculadas', '0', '337', '337', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5333', 'EUR', '2015', '', '5333000000', '0', 'Intereses a corto plazo de valores representativos de deuda de empresas del grupo', '0', '338', '338', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5334', 'EUR', '2015', '', '5334000000', '0', 'Intereses a corto plazo de valores representativos de deuda de empresas asociadas', '0', '339', '339', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5335', 'EUR', '2015', '', '5335000000', '0', 'Intereses a corto plazo de valores representativos de deuda de otras partes vinculadas', '0', '340', '340', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5343', 'EUR', '2015', '', '5343000000', '0', 'Intereses a corto plazo de cr?ditos a empresas del grupo', '0', '341', '341', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5344', 'EUR', '2015', '', '5344000000', '0', 'Intereses a corto plazo de cr?ditos a empresas asociadas', '0', '342', '342', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5345', 'EUR', '2015', '', '5345000000', '0', 'Intereses a corto plazo de cr?ditos a otras partes vinculadas', '0', '343', '343', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5353', 'EUR', '2015', '', '5353000000', '0', 'Dividendo a cobrar de empresas de grupo', '0', '344', '344', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5354', 'EUR', '2015', '', '5354000000', '0', 'Dividendo a cobrar de empresas asociadas', '0', '345', '345', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5355', 'EUR', '2015', '', '5355000000', '0', 'Dividendo a cobrar de otras partes vinculadas', '0', '346', '346', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5393', 'EUR', '2015', '', '5393000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas del grupo.', '0', '347', '347', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5394', 'EUR', '2015', '', '5394000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas asociadas.', '0', '348', '348', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5395', 'EUR', '2015', '', '5395000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en otras partes vinculadas', '0', '349', '349', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('540', 'EUR', '2015', '', '5400000000', '0', 'Inversiones financieras a corto plazo en instrumentos de patrimonio', '0', '350', '350', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('541', 'EUR', '2015', '', '5410000000', '0', 'Valores representativos de deuda a corto plazo', '0', '351', '351', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('542', 'EUR', '2015', '', '5420000000', '0', 'Cr?ditos a corto plazo', '0', '352', '352', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('543', 'EUR', '2015', '', '5430000000', '0', 'Cr?ditos a corto plazo por enajenaci?n de inmovilizado', '0', '353', '353', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('544', 'EUR', '2015', '', '5440000000', '0', 'Cr?ditos a corto plazo al personal', '0', '354', '354', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('545', 'EUR', '2015', '', '5450000000', '0', 'Dividendo a cobrar', '0', '355', '355', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('546', 'EUR', '2015', '', '5460000000', '0', 'Intereses a corto plazo de valores representativos de deudas', '0', '356', '356', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('547', 'EUR', '2015', '', '5470000000', '0', 'Intereses a corto plazo de cr?ditos', '0', '357', '357', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('548', 'EUR', '2015', '', '5480000000', '0', 'Imposiciones a corto plazo', '0', '358', '358', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('549', 'EUR', '2015', '', '5490000000', '0', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a corto plazo', '0', '359', '359', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('550', 'EUR', '2015', '', '5500000000', '0', 'Titular de la explotaci', '0', '360', '360', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('551', 'EUR', '2015', '', '5510000000', '0', 'Cuenta corriente con socios y administradores', '0', '361', '361', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5523', 'EUR', '2015', '', '5523000000', '0', 'Cuenta corriente con empresas del grupo', '0', '362', '362', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5524', 'EUR', '2015', '', '5524000000', '0', 'Cuenta corriente con empresas asociadas', '0', '363', '363', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5525', 'EUR', '2015', '', '5525000000', '0', 'Cuenta corriente con otras partes vinculadas', '0', '364', '364', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5530', 'EUR', '2015', '', '5530000000', '0', 'Socios de sociedad disuelta', '0', '365', '365', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5531', 'EUR', '2015', '', '5531000000', '0', 'Socios, cuenta de fusi', '0', '366', '366', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5532', 'EUR', '2015', '', '5532000000', '0', 'Socios de sociedad escindida', '0', '367', '367', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5533', 'EUR', '2015', '', '5533000000', '0', 'Socios, cuenta de escisi', '0', '368', '368', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('554', 'EUR', '2015', '', '5540000000', '0', 'Cuenta corriente con uniones temporales de empresas y comunidades de bienes', '0', '369', '369', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('555', 'EUR', '2015', '', '5550000000', '0', 'Partidas pendientes de aplicaci', '0', '370', '370', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5563', 'EUR', '2015', '', '5563000000', '0', 'Desembolsos exigidos sobre participaciones, empresas del grupo', '0', '371', '371', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5564', 'EUR', '2015', '', '5564000000', '0', 'Desembolsos exigidos sobre participaciones, empresas asociadas', '0', '372', '372', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5565', 'EUR', '2015', '', '5565000000', '0', 'Desembolsos exigidos sobre participaciones, otras partes vinculadas', '0', '373', '373', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5566', 'EUR', '2015', '', '5566000000', '0', 'Desembolsos exigidos sobre participaciones de otras empresas', '0', '374', '374', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('557', 'EUR', '2015', '', '5570000000', '0', 'Dividendo activo a cuenta', '0', '375', '375', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5580', 'EUR', '2015', '', '5580000000', '0', 'Socios por desembolsos exigidos sobre acciones o participaciones ordinarias', '0', '376', '376', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5585', 'EUR', '2015', '', '5585000000', '0', 'Socios por desembolsos exigidos sobre acciones o participaciones consideradas como pasivos financieros', '0', '377', '377', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5590', 'EUR', '2015', '', '5590000000', '0', 'Activos por derivados financieros a corto plazo, cartera de negociaci', '0', '378', '378', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5593', 'EUR', '2015', '', '5593000000', '0', 'Activos por derivados financieros a corto plazo, instrumentos de cobertura', '0', '379', '379', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5595', 'EUR', '2015', '', '5595000000', '0', 'Pasivos por derivados financieros a corto plazo, cartera de negociaci', '0', '380', '380', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5598', 'EUR', '2015', '', '5598000000', '0', 'Pasivos por derivados financieros a corto plazo, instrumentos de cobertura', '0', '381', '381', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('560', 'EUR', '2015', '', '5600000000', '0', 'Fianzas recibidas a corto plazo', '0', '382', '382', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('561', 'EUR', '2015', '', '5610000000', '0', 'Dep?sitos recibidos a corto plazo', '0', '383', '383', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('565', 'EUR', '2015', '', '5650000000', '0', 'Fianzas constituidas a corto plazo', '0', '384', '384', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('566', 'EUR', '2015', '', '5660000000', '0', 'Dep?sitos constituidos a corto plazo', '0', '385', '385', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('567', 'EUR', '2015', '', '5670000000', '0', 'Intereses pagados por anticipado', '0', '386', '386', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('568', 'EUR', '2015', '', '5680000000', '0', 'Intereses cobrados por anticipado', '0', '387', '387', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('569', 'EUR', '2015', '', '5690000000', '0', 'Garant?as financieras a corto plazo', '0', '388', '388', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('570', 'EUR', '2015', '', '5700000000', '0', 'Caja, euros', '0', '389', '389', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('571', 'EUR', '2015', '', '5710000000', '0', 'Caja, moneda extranjera', '0', '390', '390', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('572', 'EUR', '2015', '', '5720000000', '0', 'Bancos e instituciones de cr?dito c/c vista, euros', '0', '391', '391', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('573', 'EUR', '2015', '', '5730000000', '0', 'Bancos e instituciones de cr?dito c/c vista, moneda extranjera', '0', '392', '392', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('574', 'EUR', '2015', '', '5740000000', '0', 'Bancos e instituciones de cr?dito, cuentas de ahorro, euros', '0', '393', '393', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('575', 'EUR', '2015', '', '5750000000', '0', 'Bancos e instituciones de cr?dito, cuentas de ahorro, moneda extranjera', '0', '394', '394', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('576', 'EUR', '2015', '', '5760000000', '0', 'Inversiones a corto plazo de gran liquidez', '0', '395', '395', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('580', 'EUR', '2015', '', '5800000000', '0', 'Inmovilizado', '0', '396', '396', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('581', 'EUR', '2015', '', '5810000000', '0', 'Inversiones con personas y entidades vinculadas', '0', '397', '397', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('582', 'EUR', '2015', '', '5820000000', '0', 'Inversiones financieras', '0', '398', '398', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('583', 'EUR', '2015', '', '5830000000', '0', 'Existencias, deudores comerciales y otras cuentas a cobrar', '0', '399', '399', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('584', 'EUR', '2015', '', '5840000000', '0', 'Otros activos', '0', '400', '400', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('585', 'EUR', '2015', '', '5850000000', '0', 'Provisiones', '0', '401', '401', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('586', 'EUR', '2015', '', '5860000000', '0', 'Deudas con caracter?sticas especiales', '0', '402', '402', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('587', 'EUR', '2015', '', '5870000000', '0', 'Deudas con personas y entidades vinculadas', '0', '403', '403', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('588', 'EUR', '2015', '', '5880000000', '0', 'Acreedores comerciales y otras cuentas a pagar', '0', '404', '404', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('589', 'EUR', '2015', '', '5890000000', '0', 'Otros pasivos', '0', '405', '405', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5933', 'EUR', '2015', '', '5933000000', '0', 'Deterioro de valor de participaciones a corto plazo en empresas del grupo', '0', '406', '406', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5934', 'EUR', '2015', '', '5934000000', '0', 'Deterioro de valor de participaciones a corto plazo en empresas asociadas', '0', '407', '407', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5943', 'EUR', '2015', '', '5943000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas del grupo', '0', '408', '408', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5944', 'EUR', '2015', '', '5944000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas asociadas', '0', '409', '409', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5945', 'EUR', '2015', '', '5945000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de otras partes vinculadas', '0', '410', '410', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5953', 'EUR', '2015', '', '5953000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a empresas del grupo', '0', '411', '411', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5954', 'EUR', '2015', '', '5954000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a empresas asociadas', '0', '412', '412', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5955', 'EUR', '2015', '', '5955000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a otras partes vinculadas', '0', '413', '413', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('597', 'EUR', '2015', '', '5970000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo', '0', '414', '414', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('598', 'EUR', '2015', '', '5980000000', '0', 'Deterioro de valor de cr?ditos a corto plazo', '0', '415', '415', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5990', 'EUR', '2015', '', '5990000000', '0', 'Deterioro de valor de inmovilizado no corriente mantenido para la venta', '0', '416', '416', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5991', 'EUR', '2015', '', '5991000000', '0', 'Deterioro de valor de inversiones con personas y entidades vinculadas no corrientes mantenidas para la venta', '0', '417', '417', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5992', 'EUR', '2015', '', '5992000000', '0', 'Deterioro de valor de inversiones financieras no corrientes mantenidas para la venta', '0', '418', '418', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5993', 'EUR', '2015', '', '5993000000', '0', 'Deterioro de valor de existencias, deudores comerciales y otras cuentas a cobrar integrados en un grupo enajenable mantenido para la venta', '0', '419', '419', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5994', 'EUR', '2015', '', '5994000000', '0', 'Deterioro de valor de otros activos mantenidos para la venta', '0', '420', '420', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('600', 'EUR', '2015', '', '6000000000', '365.25', 'Compras de mercader?as', '0', '421', '421', '0', '0', '365.25');
INSERT INTO co_subcuentas VALUES ('601', 'EUR', '2015', '', '6010000000', '0', 'Compras de materias primas', '0', '422', '422', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('602', 'EUR', '2015', '', '6020000000', '0', 'Compras de otros aprovisionamientos', '0', '423', '423', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6060', 'EUR', '2015', '', '6060000000', '0', 'Descuentos sobre compras por pronto pago de mercader?as', '0', '424', '424', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6061', 'EUR', '2015', '', '6061000000', '0', 'Descuentos sobre compras por pronto pago de materias primas', '0', '425', '425', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6062', 'EUR', '2015', '', '6062000000', '0', 'Descuentos sobre compras por pronto pago de otros aprovisionamientos', '0', '426', '426', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('607', 'EUR', '2015', '', '6070000000', '0', 'Trabajos realizados por otras empresas', '0', '427', '427', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6080', 'EUR', '2015', '', '6080000000', '0', 'Devoluciones de compras de mercader?as', '0', '428', '428', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6081', 'EUR', '2015', '', '6081000000', '0', 'Devoluciones de compras de materias primas', '0', '429', '429', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6082', 'EUR', '2015', '', '6082000000', '0', 'Devoluciones de compras de otros aprovisionamientos', '0', '430', '430', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6090', 'EUR', '2015', '', '6090000000', '0', 'Rappels por compras de mercader?as', '0', '431', '431', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6091', 'EUR', '2015', '', '6091000000', '0', 'Rappels por compras de materias primas', '0', '432', '432', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6092', 'EUR', '2015', '', '6092000000', '0', 'Rappels por compras de otros aprovisionamientos', '0', '433', '433', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('610', 'EUR', '2015', '', '6100000000', '0', 'Variaci?n de existencias de mercader?as', '0', '434', '434', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('611', 'EUR', '2015', '', '6110000000', '0', 'Variaci?n de existencias de materias primas', '0', '435', '435', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('612', 'EUR', '2015', '', '6120000000', '0', 'Variaci?n de existencias de otros aprovisionamientos', '0', '436', '436', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('620', 'EUR', '2015', '', '6200000000', '0', 'Gastos en investigaci?n y desarrollo del ejercicio', '0', '437', '437', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('621', 'EUR', '2015', '', '6210000000', '0', 'Arrendamientos y c?nones', '0', '438', '438', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('622', 'EUR', '2015', '', '6220000000', '0', 'Reparaciones y conservaci', '0', '439', '439', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('623', 'EUR', '2015', '', '6230000000', '0', 'Servicios de profesionales independientes', '0', '440', '440', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('624', 'EUR', '2015', '', '6240000000', '0', 'Transportes', '0', '441', '441', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('625', 'EUR', '2015', '', '6250000000', '0', 'Primas de seguros', '0', '442', '442', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('626', 'EUR', '2015', '', '6260000000', '0', 'Servicios bancarios y similares', '0', '443', '443', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('627', 'EUR', '2015', '', '6270000000', '0', 'Publicidad, propaganda y relaciones p?blicas', '0', '444', '444', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('628', 'EUR', '2015', '', '6280000000', '0', 'Suministros', '0', '445', '445', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('629', 'EUR', '2015', '', '6290000000', '0', 'Otros servicios', '0', '446', '446', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6300', 'EUR', '2015', '', '6300000000', '0', 'Impuesto corriente', '0', '447', '447', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6301', 'EUR', '2015', '', '6301000000', '0', 'Impuesto diferido', '0', '448', '448', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('631', 'EUR', '2015', '', '6310000000', '0', 'Otros tributos', '0', '449', '449', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('633', 'EUR', '2015', '', '6330000000', '0', 'Ajustes negativos en la imposici?n sobre beneficios', '0', '450', '450', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6341', 'EUR', '2015', '', '6341000000', '0', 'Ajustes negativos en iva de activo corriente', '0', '451', '451', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6342', 'EUR', '2015', '', '6342000000', '0', 'Ajustes negativos en iva de inversiones', '0', '452', '452', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('636', 'EUR', '2015', '', '6360000000', '0', 'Devoluci?n de impuestos', '0', '453', '453', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('638', 'EUR', '2015', '', '6380000000', '0', 'Ajustes positivos en la imposici?n sobre beneficios', '0', '454', '454', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6391', 'EUR', '2015', '', '6391000000', '0', 'Ajustes positivos en iva de activo corriente', '0', '455', '455', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6392', 'EUR', '2015', '', '6392000000', '0', 'Ajustes positivos en iva de inversiones', '0', '456', '456', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('640', 'EUR', '2015', '', '6400000000', '0', 'Sueldos y salarios', '0', '457', '457', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('641', 'EUR', '2015', '', '6410000000', '0', 'Indemnizaciones', '0', '458', '458', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('642', 'EUR', '2015', '', '6420000000', '0', 'Seguridad social a cargo de la empresa', '0', '459', '459', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('643', 'EUR', '2015', '', '6430000000', '0', 'Retribuciones a largo plazo mediante sistemas de aportaci?n definida', '0', '460', '460', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6440', 'EUR', '2015', '', '6440000000', '0', 'Contribuciones anuales', '0', '461', '461', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6442', 'EUR', '2015', '', '6442000000', '0', 'Otros costes', '0', '462', '462', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6450', 'EUR', '2015', '', '6450000000', '0', 'Retribuciones al personal liquidados con instrumentos de patrimonio', '0', '463', '463', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6457', 'EUR', '2015', '', '6457000000', '0', 'Retribuciones al personal liquidados en efectivo basado en instrumentos de patrimonio', '0', '464', '464', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('649', 'EUR', '2015', '', '6490000000', '0', 'Otros gastos sociales', '0', '465', '465', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('650', 'EUR', '2015', '', '6500000000', '0', 'P?rdidas de cr?ditos comerciales incobrables', '0', '466', '466', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6510', 'EUR', '2015', '', '6510000000', '0', 'Beneficio transferido (gestor)', '0', '467', '467', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6511', 'EUR', '2015', '', '6511000000', '0', 'P?rdida soportada (part?cipe o asociado no gestor)', '0', '468', '468', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('659', 'EUR', '2015', '', '6590000000', '0', 'Otras p?rdidas en gesti?n corriente', '0', '469', '469', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('660', 'EUR', '2015', '', '6600000000', '0', 'Gastos financieros por actualizaci?n de provisiones', '0', '470', '470', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6610', 'EUR', '2015', '', '6610000000', '0', 'Intereses de obligaciones y bonos a largo plazo, empresas del grupo', '0', '471', '471', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6611', 'EUR', '2015', '', '6611000000', '0', 'Intereses de obligaciones y bonos a largo plazo, empresas asociadas', '0', '472', '472', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6612', 'EUR', '2015', '', '6612000000', '0', 'Intereses de obligaciones y bonos a largo plazo, otras partes vinculadas', '0', '473', '473', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6613', 'EUR', '2015', '', '6613000000', '0', 'Intereses de obligaciones y bonos a largo plazo, otras empresas', '0', '474', '474', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6615', 'EUR', '2015', '', '6615000000', '0', 'Intereses de obligaciones y bonos a corto plazo, empresas del grupo', '0', '475', '475', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6616', 'EUR', '2015', '', '6616000000', '0', 'Intereses de obligaciones y bonos a corto plazo, empresas asociadas', '0', '476', '476', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6617', 'EUR', '2015', '', '6617000000', '0', 'Intereses de obligaciones y bonos a corto plazo, otras partes vinculadas', '0', '477', '477', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6618', 'EUR', '2015', '', '6618000000', '0', 'Intereses de obligaciones y bonos a corto plazo, otras empresas', '0', '478', '478', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6620', 'EUR', '2015', '', '6620000000', '0', 'Intereses de deudas, empresas del grupo', '0', '479', '479', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6621', 'EUR', '2015', '', '6621000000', '0', 'Intereses de deudas, empresas asociadas', '0', '480', '480', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6622', 'EUR', '2015', '', '6622000000', '0', 'Intereses de deudas, otras partes vinculadas', '0', '481', '481', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6623', 'EUR', '2015', '', '6623000000', '0', 'Intereses de deudas con entidades de cr?dito', '0', '482', '482', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6624', 'EUR', '2015', '', '6624000000', '0', 'Intereses de deudas, otras empresas', '0', '483', '483', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6630', 'EUR', '2015', '', '6630000000', '0', 'P?rdidas de cartera de negociaci', '0', '484', '484', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6631', 'EUR', '2015', '', '6631000000', '0', 'P?rdidas de designados por la empresa', '0', '485', '485', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6632', 'EUR', '2015', '', '6632000000', '0', 'P?rdidas de disponibles para la venta', '0', '486', '486', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6633', 'EUR', '2015', '', '6633000000', '0', 'P?rdidas de instrumentos de cobertura', '0', '487', '487', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6640', 'EUR', '2015', '', '6640000000', '0', 'Dividendos de pasivos, empresas del grupo', '0', '488', '488', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6641', 'EUR', '2015', '', '6641000000', '0', 'Dividendos de pasivos, empresas asociadas', '0', '489', '489', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6642', 'EUR', '2015', '', '6642000000', '0', 'Dividendos de pasivos, otras partes vinculadas', '0', '490', '490', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6643', 'EUR', '2015', '', '6643000000', '0', 'Dividendos de pasivos, otras empresas', '0', '491', '491', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6650', 'EUR', '2015', '', '6650000000', '0', 'Intereses por descuento de efectos en entidades de cr?dito del grupo', '0', '492', '492', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6651', 'EUR', '2015', '', '6651000000', '0', 'Intereses por descuento de efectos en entidades de cr?dito asociadas', '0', '493', '493', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6652', 'EUR', '2015', '', '6652000000', '0', 'Intereses por descuento de efectos en otras entidades de cr?dito vinculadas', '0', '494', '494', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6653', 'EUR', '2015', '', '6653000000', '0', 'Intereses por descuento de efectos en otras entidades de cr?dito', '0', '495', '495', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6654', 'EUR', '2015', '', '6654000000', '0', 'Intereses por operaciones de factoring con entidades de cr?dito del grupo', '0', '496', '496', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6655', 'EUR', '2015', '', '6655000000', '0', 'Intereses por operaciones de factoring con entidades de cr?dito asociadas', '0', '497', '497', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6656', 'EUR', '2015', '', '6656000000', '0', 'Intereses por operaciones de factoring con otras entidades de cr?dito vinculadas', '0', '498', '498', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6657', 'EUR', '2015', '', '6657000000', '0', 'Intereses por operaciones de factoring con otras entidades de cr?dito', '0', '499', '499', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6660', 'EUR', '2015', '', '6660000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, empresas del grupo', '0', '500', '500', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6661', 'EUR', '2015', '', '6661000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, empresas asociadas', '0', '501', '501', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6662', 'EUR', '2015', '', '6662000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '502', '502', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6663', 'EUR', '2015', '', '6663000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a largo plazo, otras empresas', '0', '503', '503', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6665', 'EUR', '2015', '', '6665000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '0', '504', '504', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6666', 'EUR', '2015', '', '6666000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '0', '505', '505', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6667', 'EUR', '2015', '', '6667000000', '0', 'P?rdidas en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '506', '506', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6668', 'EUR', '2015', '', '6668000000', '0', 'P?rdidas en valores representativos de deuda a corto plazo, otras empresas', '0', '507', '507', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6670', 'EUR', '2015', '', '6670000000', '0', 'P?rdidas de cr?ditos a largo plazo, empresas del grupo', '0', '508', '508', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6671', 'EUR', '2015', '', '6671000000', '0', 'P?rdidas de cr?ditos a largo plazo, empresas asociadas', '0', '509', '509', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6672', 'EUR', '2015', '', '6672000000', '0', 'P?rdidas de cr?ditos a largo plazo, otras partes vinculadas', '0', '510', '510', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6673', 'EUR', '2015', '', '6673000000', '0', 'P?rdidas de cr?ditos a largo plazo, otras empresas', '0', '511', '511', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6675', 'EUR', '2015', '', '6675000000', '0', 'P?rdidas de cr?ditos a corto plazo, empresas del grupo', '0', '512', '512', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6676', 'EUR', '2015', '', '6676000000', '0', 'P?rdidas de cr?ditos a corto plazo, empresas asociadas', '0', '513', '513', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6677', 'EUR', '2015', '', '6677000000', '0', 'P?rdidas de cr?ditos a corto plazo, otras partes vinculadas', '0', '514', '514', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6678', 'EUR', '2015', '', '6678000000', '0', 'P?rdidas de cr?ditos a corto plazo, otras empresas', '0', '515', '515', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('668', 'EUR', '2015', '', '6680000000', '0', 'Diferencias negativas de cambio', '0', '516', '516', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('669', 'EUR', '2015', '', '6690000000', '0', 'Otros gastos financieros', '0', '517', '517', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('670', 'EUR', '2015', '', '6700000000', '0', 'P?rdidas procedentes del inmovilizado intangible', '0', '518', '518', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('671', 'EUR', '2015', '', '6710000000', '0', 'P?rdidas procedentes del inmovilizado material', '0', '519', '519', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('672', 'EUR', '2015', '', '6720000000', '0', 'P?rdidas procedentes de las inversiones inmobiliarias', '0', '520', '520', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6733', 'EUR', '2015', '', '6733000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, empresas del grupo', '0', '521', '521', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6734', 'EUR', '2015', '', '6734000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, empresas asociadas', '0', '522', '522', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6735', 'EUR', '2015', '', '6735000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, otras partes vinculadas', '0', '523', '523', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('675', 'EUR', '2015', '', '6750000000', '0', 'P?rdidas por operaciones con obligaciones propias', '0', '524', '524', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('678', 'EUR', '2015', '', '6780000000', '0', 'Gastos excepcionales', '0', '525', '525', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('680', 'EUR', '2015', '', '6800000000', '0', 'Amortizaci?n del inmovilizado intangible', '0', '526', '526', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('681', 'EUR', '2015', '', '6810000000', '0', 'Amortizaci?n del inmovilizado material', '0', '527', '527', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('682', 'EUR', '2015', '', '6820000000', '0', 'Amortizaci?n de las inversiones inmobiliarias', '0', '528', '528', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('690', 'EUR', '2015', '', '6900000000', '0', 'P?rdidas por deterioro del inmovilizado intangible', '0', '529', '529', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('691', 'EUR', '2015', '', '6910000000', '0', 'P?rdidas por deterioro del inmovilizado material', '0', '530', '530', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('692', 'EUR', '2015', '', '6920000000', '0', 'P?rdidas por deterioro de las inversiones inmobiliarias', '0', '531', '531', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6930', 'EUR', '2015', '', '6930000000', '0', 'P?rdidas por deterioro de productos terminados y en curso de fabricaci', '0', '532', '532', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6931', 'EUR', '2015', '', '6931000000', '0', 'P?rdidas por deterioro de mercader?as', '0', '533', '533', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6932', 'EUR', '2015', '', '6932000000', '0', 'P?rdidas por deterioro de materias primas', '0', '534', '534', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6933', 'EUR', '2015', '', '6933000000', '0', 'P?rdidas por deterioro de otros aprovisionamientos', '0', '535', '535', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('694', 'EUR', '2015', '', '6940000000', '0', 'P?rdidas por deterioro de cr?ditos por operaciones comerciales', '0', '536', '536', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6954', 'EUR', '2015', '', '6954000000', '0', 'Dotaci?n a la provisi?n por contratos onerosos', '0', '537', '537', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6959', 'EUR', '2015', '', '6959000000', '0', 'Dotaci?n a la provisi?n para otras operaciones comerciales', '0', '538', '538', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6960', 'EUR', '2015', '', '6960000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '0', '539', '539', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6961', 'EUR', '2015', '', '6961000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '0', '540', '540', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6962', 'EUR', '2015', '', '6962000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras partes vinculadas', '0', '541', '541', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6963', 'EUR', '2015', '', '6963000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras empresas', '0', '542', '542', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6965', 'EUR', '2015', '', '6965000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas del grupo', '0', '543', '543', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6966', 'EUR', '2015', '', '6966000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas asociadas', '0', '544', '544', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6967', 'EUR', '2015', '', '6967000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '545', '545', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6968', 'EUR', '2015', '', '6968000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, de otras empresas', '0', '546', '546', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6970', 'EUR', '2015', '', '6970000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas del grupo', '0', '547', '547', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6971', 'EUR', '2015', '', '6971000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas asociadas', '0', '548', '548', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6972', 'EUR', '2015', '', '6972000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras partes vinculadas', '0', '549', '549', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6973', 'EUR', '2015', '', '6973000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras empresas', '0', '550', '550', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6980', 'EUR', '2015', '', '6980000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '0', '551', '551', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6981', 'EUR', '2015', '', '6981000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '0', '552', '552', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6985', 'EUR', '2015', '', '6985000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '0', '553', '553', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6986', 'EUR', '2015', '', '6986000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '0', '554', '554', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6987', 'EUR', '2015', '', '6987000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '555', '555', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6988', 'EUR', '2015', '', '6988000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, de otras empresas', '0', '556', '556', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6990', 'EUR', '2015', '', '6990000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas del grupo', '0', '557', '557', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6991', 'EUR', '2015', '', '6991000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas asociadas', '0', '558', '558', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6992', 'EUR', '2015', '', '6992000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras partes vinculadas', '0', '559', '559', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6993', 'EUR', '2015', '', '6993000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras empresas', '0', '560', '560', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('700', 'EUR', '2015', '', '7000000000', '0', 'Ventas de mercader?as', '2459.6', '561', '561', '0', '0', '-2459.6');
INSERT INTO co_subcuentas VALUES ('701', 'EUR', '2015', '', '7010000000', '0', 'Ventas de productos terminados', '0', '562', '562', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('702', 'EUR', '2015', '', '7020000000', '0', 'Ventas de productos semiterminados', '0', '563', '563', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('703', 'EUR', '2015', '', '7030000000', '0', 'Ventas de subproductos y residuos', '0', '564', '564', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('704', 'EUR', '2015', '', '7040000000', '0', 'Ventas de envases y embalajes', '0', '565', '565', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('705', 'EUR', '2015', '', '7050000000', '0', 'Prestaciones de servicios', '0', '566', '566', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7060', 'EUR', '2015', '', '7060000000', '0', 'Descuentos sobre ventas por pronto pago de mercader?as', '0', '567', '567', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7061', 'EUR', '2015', '', '7061000000', '0', 'Descuentos sobre ventas por pronto pago de productos terminados', '0', '568', '568', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7062', 'EUR', '2015', '', '7062000000', '0', 'Descuentos sobre ventas por pronto pago de productos semiterminados', '0', '569', '569', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7063', 'EUR', '2015', '', '7063000000', '0', 'Descuentos sobre ventas por pronto pago de subproductos y residuos', '0', '570', '570', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7080', 'EUR', '2015', '', '7080000000', '0', 'Devoluciones de ventas de mercader?as', '0', '571', '571', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7081', 'EUR', '2015', '', '7081000000', '0', 'Devoluciones de ventas de productos terminados', '0', '572', '572', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7082', 'EUR', '2015', '', '7082000000', '0', 'Devoluciones de ventas de productos semiterminados', '0', '573', '573', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7083', 'EUR', '2015', '', '7083000000', '0', 'Devoluciones de ventas de subproductos y residuos', '0', '574', '574', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7084', 'EUR', '2015', '', '7084000000', '0', 'Devoluciones de ventas de envases y embalajes', '0', '575', '575', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7090', 'EUR', '2015', '', '7090000000', '0', 'Rappels sobre ventas de mercader?as', '0', '576', '576', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7091', 'EUR', '2015', '', '7091000000', '0', 'Rappels sobre ventas de productos terminados', '0', '577', '577', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7092', 'EUR', '2015', '', '7092000000', '0', 'Rappels sobre ventas de productos semiterminados', '0', '578', '578', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7093', 'EUR', '2015', '', '7093000000', '0', 'Rappels sobre ventas de subproductos y residuos', '0', '579', '579', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7094', 'EUR', '2015', '', '7094000000', '0', 'Rappels sobre ventas de envases y embalajes', '0', '580', '580', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('710', 'EUR', '2015', '', '7100000000', '0', 'Variaci?n de existencias de productos en curso', '0', '581', '581', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('711', 'EUR', '2015', '', '7110000000', '0', 'Variaci?n de existencias de productos semiterminados', '0', '582', '582', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('712', 'EUR', '2015', '', '7120000000', '0', 'Variaci?n de existencias de productos terminados', '0', '583', '583', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('713', 'EUR', '2015', '', '7130000000', '0', 'Variaci?n de existencias de subproductos,residuos y materiales recuperados', '0', '584', '584', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('730', 'EUR', '2015', '', '7300000000', '0', 'Trabajos realizados para el inmovilizado intangible', '0', '585', '585', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('731', 'EUR', '2015', '', '7310000000', '0', 'Trabajos realizados para el inmovilizado material', '0', '586', '586', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('732', 'EUR', '2015', '', '7320000000', '0', 'Trabajos realizados en inversiones inmobiliarias', '0', '587', '587', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('733', 'EUR', '2015', '', '7330000000', '0', 'Trabajos realizados para el inmovilizado material en curso', '0', '588', '588', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('740', 'EUR', '2015', '', '7400000000', '0', 'Subvenciones, donaciones y legados a la explotaci', '0', '589', '589', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('746', 'EUR', '2015', '', '7460000000', '0', 'Subvenciones, donaciones y legados de capital transferidos al resultado del ejercicio', '0', '590', '590', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('747', 'EUR', '2015', '', '7470000000', '0', 'Otras subvenciones, donaciones y legados transferidos al resultado del ejercicio', '0', '591', '591', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7510', 'EUR', '2015', '', '7510000000', '0', 'P?rdida transferida (gestor)', '0', '592', '592', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7511', 'EUR', '2015', '', '7511000000', '0', 'Beneficio atribuido (part?cipe o asociado no gestor)', '0', '593', '593', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('752', 'EUR', '2015', '', '7520000000', '0', 'Ingresos por arrendamientos', '0', '594', '594', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('753', 'EUR', '2015', '', '7530000000', '0', 'Ingresos de propiedad industrial cedida en explotaci', '0', '595', '595', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('754', 'EUR', '2015', '', '7540000000', '0', 'Ingresos por comisiones', '0', '596', '596', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('755', 'EUR', '2015', '', '7550000000', '0', 'Ingresos por servicios al personal', '0', '597', '597', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('759', 'EUR', '2015', '', '7590000000', '0', 'Ingresos por servicios diversos', '0', '598', '598', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7600', 'EUR', '2015', '', '7600000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, empresas del grupo', '0', '599', '599', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7601', 'EUR', '2015', '', '7601000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, empresas asociadas', '0', '600', '600', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7602', 'EUR', '2015', '', '7602000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, otras partes vinculadas', '0', '601', '601', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7603', 'EUR', '2015', '', '7603000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, otras empresas', '0', '602', '602', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7610', 'EUR', '2015', '', '7610000000', '0', 'Ingresos de valores representativos de deuda, empresas del grupo', '0', '603', '603', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7611', 'EUR', '2015', '', '7611000000', '0', 'Ingresos de valores representativos de deuda, empresas asociadas', '0', '604', '604', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7612', 'EUR', '2015', '', '7612000000', '0', 'Ingresos de valores representativos de deuda, otras partes vinculadas', '0', '605', '605', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7613', 'EUR', '2015', '', '7613000000', '0', 'Ingresos de valores representativos de deuda, otras empresas', '0', '606', '606', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76200', 'EUR', '2015', '', '7620000000', '0', 'Ingresos de cr?ditos a largo plazo, empresas del grupo', '0', '607', '607', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76201', 'EUR', '2015', '', '7620100000', '0', 'Ingresos de cr?ditos a largo plazo, empresas asociadas', '0', '608', '608', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76202', 'EUR', '2015', '', '7620200000', '0', 'Ingresos de cr?ditos a largo plazo, otras partes vinculadas', '0', '609', '609', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76203', 'EUR', '2015', '', '7620300000', '0', 'Ingresos de cr?ditos a largo plazo, otras empresas', '0', '610', '610', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76210', 'EUR', '2015', '', '7621000000', '0', 'Ingresos de cr?ditos a corto plazo, empresas del grupo', '0', '611', '611', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76211', 'EUR', '2015', '', '7621100000', '0', 'Ingresos de cr?ditos a corto plazo, empresas asociadas', '0', '612', '612', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76212', 'EUR', '2015', '', '7621200000', '0', 'Ingresos de cr?ditos a corto plazo, otras partes vinculadas', '0', '613', '613', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76213', 'EUR', '2015', '', '7621300000', '0', 'Ingresos de cr?ditos a corto plazo, otras empresas', '0', '614', '614', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7630', 'EUR', '2015', '', '7630000000', '0', 'Beneficios de cartera de negociaci', '0', '615', '615', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7631', 'EUR', '2015', '', '7631000000', '0', 'Beneficios de designados por la empresa', '0', '616', '616', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7632', 'EUR', '2015', '', '7632000000', '0', 'Beneficios de disponibles para la venta', '0', '617', '617', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7633', 'EUR', '2015', '', '7633000000', '0', 'Beneficios de instrumentos de cobertura', '0', '618', '618', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7660', 'EUR', '2015', '', '7660000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, empresas del grupo', '0', '619', '619', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7661', 'EUR', '2015', '', '7661000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, empresas asociadas', '0', '620', '620', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7662', 'EUR', '2015', '', '7662000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '621', '621', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7663', 'EUR', '2015', '', '7663000000', '0', 'Beneficios en participaciones y valores representativos de deuda a largo plazo, otras empresas', '0', '622', '622', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7665', 'EUR', '2015', '', '7665000000', '0', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '0', '623', '623', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7666', 'EUR', '2015', '', '7666000000', '0', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '0', '624', '624', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7667', 'EUR', '2015', '', '7667000000', '0', 'Beneficios en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '625', '625', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7668', 'EUR', '2015', '', '7668000000', '0', 'Beneficios en valores representativos de deuda a corto plazo, otras empresas', '0', '626', '626', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('767', 'EUR', '2015', '', '7670000000', '0', 'Ingresos de activos afectos y de derechos de reembolso relativos a retribuciones a largo plazo', '0', '627', '627', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('768', 'EUR', '2015', '', '7680000000', '0', 'Diferencias positivas de cambio', '0', '628', '628', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('769', 'EUR', '2015', '', '7690000000', '0', 'Otros ingresos financieros', '0', '629', '629', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('770', 'EUR', '2015', '', '7700000000', '0', 'Beneficios procedentes del inmovilizado intangible', '0', '630', '630', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('771', 'EUR', '2015', '', '7710000000', '0', 'Beneficios procedentes del inmovilizado material', '0', '631', '631', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('772', 'EUR', '2015', '', '7720000000', '0', 'Beneficios procedentes de las inversiones inmobiliarias', '0', '632', '632', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7733', 'EUR', '2015', '', '7733000000', '0', 'Beneficios procedentes de participaciones a largo plazo, empresas del grupo', '0', '633', '633', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7734', 'EUR', '2015', '', '7734000000', '0', 'Beneficios procedentes de participaciones a largo plazo, empresas asociadas', '0', '634', '634', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7735', 'EUR', '2015', '', '7735000000', '0', 'Beneficios procedentes de participaciones a largo plazo, otras partes vinculadas', '0', '635', '635', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('774', 'EUR', '2015', '', '7740000000', '0', 'Diferencia negativa en combinaciones de negocios', '0', '636', '636', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('775', 'EUR', '2015', '', '7750000000', '0', 'Beneficios por operaciones con obligaciones propias', '0', '637', '637', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('778', 'EUR', '2015', '', '7780000000', '0', 'Ingresos excepcionales', '0', '638', '638', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('790', 'EUR', '2015', '', '7900000000', '0', 'Reversi?n del deterioro del inmovilizado intangible', '0', '639', '639', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('791', 'EUR', '2015', '', '7910000000', '0', 'Reversi?n del deterioro del inmovilizado material', '0', '640', '640', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('792', 'EUR', '2015', '', '7920000000', '0', 'Reversi?n del deterioro de las inversiones inmobiliarias', '0', '641', '641', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7930', 'EUR', '2015', '', '7930000000', '0', 'Reversi?n del deterioro de productos terminados y en curso de fabricaci', '0', '642', '642', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7931', 'EUR', '2015', '', '7931000000', '0', 'Reversi?n del deterioro de mercader?as', '0', '643', '643', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7932', 'EUR', '2015', '', '7932000000', '0', 'Reversi?n del deterioro de materias primas', '0', '644', '644', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7933', 'EUR', '2015', '', '7933000000', '0', 'Reversi?n del deterioro de otros aprovisionamientos', '0', '645', '645', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('794', 'EUR', '2015', '', '7940000000', '0', 'Reversi?n del deterioro de cr?ditos por operaciones comerciales', '0', '646', '646', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7950', 'EUR', '2015', '', '7950000000', '0', 'Exceso de provisi?n por retribuciones al personal', '0', '647', '647', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7951', 'EUR', '2015', '', '7951000000', '0', 'Exceso de provisi?n para impuestos', '0', '648', '648', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7952', 'EUR', '2015', '', '7952000000', '0', 'Exceso de provisi?n para otras responsabilidades', '0', '649', '649', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('79544', 'EUR', '2015', '', '7954400000', '0', 'Exceso de provisi?n por contratos onerosos', '0', '650', '650', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('79549', 'EUR', '2015', '', '7954900000', '0', 'Exceso de provisi?n para otras operaciones comerciales', '0', '651', '651', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7955', 'EUR', '2015', '', '7955000000', '0', 'Exceso de provisi?n para actuaciones medioambientales', '0', '652', '652', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7956', 'EUR', '2015', '', '7956000000', '0', 'Exceso de provisi?n para reestructuraciones', '0', '653', '653', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7957', 'EUR', '2015', '', '7957000000', '0', 'Exceso de provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '0', '654', '654', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7960', 'EUR', '2015', '', '7960000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '0', '655', '655', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7961', 'EUR', '2015', '', '7961000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '0', '656', '656', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7965', 'EUR', '2015', '', '7965000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas del grupo', '0', '657', '657', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7966', 'EUR', '2015', '', '7966000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas asociadas', '0', '658', '658', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7967', 'EUR', '2015', '', '7967000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '659', '659', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7968', 'EUR', '2015', '', '7968000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras empresas', '0', '660', '660', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7970', 'EUR', '2015', '', '7970000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas del grupo', '0', '661', '661', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7971', 'EUR', '2015', '', '7971000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas asociadas', '0', '662', '662', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7972', 'EUR', '2015', '', '7972000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras partes vinculadas', '0', '663', '663', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7973', 'EUR', '2015', '', '7973000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras empresas', '0', '664', '664', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7980', 'EUR', '2015', '', '7980000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '0', '665', '665', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7981', 'EUR', '2015', '', '7981000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '0', '666', '666', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7985', 'EUR', '2015', '', '7985000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '0', '667', '667', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7986', 'EUR', '2015', '', '7986000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '0', '668', '668', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7987', 'EUR', '2015', '', '7987000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '669', '669', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7988', 'EUR', '2015', '', '7988000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras empresas', '0', '670', '670', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7990', 'EUR', '2015', '', '7990000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas del grupo', '0', '671', '671', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7991', 'EUR', '2015', '', '7991000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas asociadas', '0', '672', '672', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7992', 'EUR', '2015', '', '7992000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras partes vinculadas', '0', '673', '673', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7993', 'EUR', '2015', '', '7993000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras empresas', '0', '674', '674', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('800', 'EUR', '2015', '', '8000000000', '0', 'P?rdidas en activos financieros disponibles para la venta', '0', '675', '675', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('802', 'EUR', '2015', '', '8020000000', '0', 'Transferencia de beneficios en activos financieros disponibles para la venta', '0', '676', '676', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('810', 'EUR', '2015', '', '8100000000', '0', 'P?rdidas por coberturas de flujos de efectivo', '0', '677', '677', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('811', 'EUR', '2015', '', '8110000000', '0', 'P?rdidas por coberturas de inversiones netas en un negocio en el extranjero', '0', '678', '678', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('812', 'EUR', '2015', '', '8120000000', '0', 'Transferencia de beneficios por coberturas de flujos de efectivo', '0', '679', '679', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('813', 'EUR', '2015', '', '8130000000', '0', 'Transferencia de beneficios por coberturas de inversiones netas en un negocio en el extranjero', '0', '680', '680', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('820', 'EUR', '2015', '', '8200000000', '0', 'Diferencias de conversi?n negativas', '0', '681', '681', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('821', 'EUR', '2015', '', '8210000000', '0', 'Transferencia de diferencias de conversi?n positivas', '0', '682', '682', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('8300', 'EUR', '2015', '', '8300000000', '0', 'Impuesto corriente', '0', '683', '683', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('8301', 'EUR', '2015', '', '8301000000', '0', 'Impuesto diferido', '0', '684', '684', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('833', 'EUR', '2015', '', '8330000000', '0', 'Ajustes negativos en la imposici?n sobre beneficios', '0', '685', '685', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('834', 'EUR', '2015', '', '8340000000', '0', 'Ingresos fiscales por diferencias permanentes', '0', '686', '686', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('835', 'EUR', '2015', '', '8350000000', '0', 'Ingresos fiscales por deducciones y bonificaciones', '0', '687', '687', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('836', 'EUR', '2015', '', '8360000000', '0', 'Transferencia de diferencias permanentes', '0', '688', '688', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('837', 'EUR', '2015', '', '8370000000', '0', 'Transferencia de deducciones y bonificaciones', '0', '689', '689', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('838', 'EUR', '2015', '', '8380000000', '0', 'Ajustes positivos en la imposici?n sobre beneficios', '0', '690', '690', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('840', 'EUR', '2015', '', '8400000000', '0', 'Transferencia de subvenciones oficiales de capital', '0', '691', '691', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('841', 'EUR', '2015', '', '8410000000', '0', 'Transferencia de donaciones y legados de capital', '0', '692', '692', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('842', 'EUR', '2015', '', '8420000000', '0', 'Transferencia de otras subvenciones, donaciones y legados', '0', '693', '693', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('850', 'EUR', '2015', '', '8500000000', '0', 'P?rdidas actuariales', '0', '694', '694', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('851', 'EUR', '2015', '', '8510000000', '0', 'Ajustes negativos en activos por retribuciones a largo plazo de prestaci?n definida', '0', '695', '695', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('860', 'EUR', '2015', '', '8600000000', '0', 'P?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '696', '696', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('862', 'EUR', '2015', '', '8620000000', '0', 'Transferencia de beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '697', '697', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('891', 'EUR', '2015', '', '8910000000', '0', 'Deterioro de participaciones en el patrimonio, empresas del grupo', '0', '698', '698', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('892', 'EUR', '2015', '', '8920000000', '0', 'Deterioro de participaciones en el patrimonio, empresas asociadas', '0', '699', '699', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('900', 'EUR', '2015', '', '9000000000', '0', 'Beneficios en activos financieros disponibles para la venta', '0', '700', '700', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('902', 'EUR', '2015', '', '9020000000', '0', 'Transferencia de p?rdidas de activos financieros disponibles para la venta', '0', '701', '701', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('910', 'EUR', '2015', '', '9100000000', '0', 'Beneficios por coberturas de flujos de efectivo', '0', '702', '702', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('911', 'EUR', '2015', '', '9110000000', '0', 'Beneficios por coberturas de una inversi?n neta en un negocio en el extranjero', '0', '703', '703', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('912', 'EUR', '2015', '', '9120000000', '0', 'Transferencia de p?rdidas por coberturas de flujos de efectivo', '0', '704', '704', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('913', 'EUR', '2015', '', '9130000000', '0', 'Transferencia de p?rdidas por coberturas de una inversi?n neta en un negocio en el extranjero', '0', '705', '705', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('920', 'EUR', '2015', '', '9200000000', '0', 'Diferencias de conversi?n positivas', '0', '706', '706', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('921', 'EUR', '2015', '', '9210000000', '0', 'Transferencia de diferencias de conversi?n negativas', '0', '707', '707', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('940', 'EUR', '2015', '', '9400000000', '0', 'Ingresos de subvenciones oficiales de capital', '0', '708', '708', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('941', 'EUR', '2015', '', '9410000000', '0', 'Ingresos de donaciones y legados de capital', '0', '709', '709', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('942', 'EUR', '2015', '', '9420000000', '0', 'Ingresos de otras subvenciones, donaciones y legados', '0', '710', '710', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('950', 'EUR', '2015', '', '9500000000', '0', 'Ganancias actuariales', '0', '711', '711', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('951', 'EUR', '2015', '', '9510000000', '0', 'Ajustes positivos en activos por retribuciones a largo plazo de prestaci?n definida', '0', '712', '712', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('960', 'EUR', '2015', '', '9600000000', '0', 'Beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '713', '713', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('962', 'EUR', '2015', '', '9620000000', '0', 'Transferencia de p?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '714', '714', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('991', 'EUR', '2015', '', '9910000000', '0', 'Recuperaci?n de ajustes valorativos negativos previos, empresas del grupo', '0', '715', '715', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('992', 'EUR', '2015', '', '9920000000', '0', 'Recuperaci?n de ajustes valorativos negativos previos, empresas asociadas', '0', '716', '716', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('993', 'EUR', '2015', '', '9930000000', '0', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas del grupo', '0', '717', '717', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('994', 'EUR', '2015', '', '9940000000', '0', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas asociadas', '0', '718', '718', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('410', 'ARS', '2015', '', '4100000002', '0', 'INTERNET', '60.5', '223', '719', '0', '0', '-60.5');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2015', '', '4300000004', '105.24', 'Miguel san martin', '0', '229', '720', '0', '0', '105.24');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2015', '', '4300000003', '2130', 'Camila siares', '0', '229', '721', '0', '0', '2130');
INSERT INTO co_subcuentas VALUES ('100', 'EUR', '2016', '', '1000000000', '0', 'Capital social', '0', '719', '722', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('101', 'EUR', '2016', '', '1010000000', '0', 'Fondo social', '0', '720', '723', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('102', 'EUR', '2016', '', '1020000000', '0', 'Capital', '0', '721', '724', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1030', 'EUR', '2016', '', '1030000000', '0', 'Socios por desembolsos no exigidos, capital social', '0', '722', '725', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1034', 'EUR', '2016', '', '1034000000', '0', 'Socios por desembolsos no exigidos, capital pendiente de inscripci', '0', '723', '726', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1040', 'EUR', '2016', '', '1040000000', '0', 'Socios por aportaciones no dinerarias pendientes, capital social', '0', '724', '727', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1044', 'EUR', '2016', '', '1044000000', '0', 'Socios por aportaciones no dinerarias pendientes, capital pendiente de inscripci', '0', '725', '728', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('108', 'EUR', '2016', '', '1080000000', '0', 'Acciones o participaciones propias en situaciones especiales', '0', '726', '729', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('109', 'EUR', '2016', '', '1090000000', '0', 'Acciones o participaciones propias para reducci?n de capital', '0', '727', '730', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('110', 'EUR', '2016', '', '1100000000', '0', 'Prima de emisi?n o asunci', '0', '728', '731', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1110', 'EUR', '2016', '', '1110000000', '0', 'Patrimonio neto por emisi?n de instrumentos financieros compuestos', '0', '729', '732', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1111', 'EUR', '2016', '', '1111000000', '0', 'Resto de instrumentos de patrimonio neto', '0', '730', '733', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('112', 'EUR', '2016', '', '1120000000', '0', 'Reserva legal', '0', '731', '734', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('113', 'EUR', '2016', '', '1130000000', '0', 'Reservas voluntarias', '0', '732', '735', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1140', 'EUR', '2016', '', '1140000000', '0', 'Reservas para acciones o participaciones de la sociedad dominante', '0', '733', '736', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1141', 'EUR', '2016', '', '1141000000', '0', 'Reservas estatutarias', '0', '734', '737', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1142', 'EUR', '2016', '', '1142000000', '0', 'Reserva por capital amortizado', '0', '735', '738', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1143', 'EUR', '2016', '', '1143000000', '0', 'Reserva por fondo de comercio', '0', '736', '739', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1144', 'EUR', '2016', '', '1144000000', '0', 'Reservas por acciones propias aceptadas en garant', '0', '737', '740', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('115', 'EUR', '2016', '', '1150000000', '0', 'Reservas por p?rdidas y ganancias actuariales y otros ajustes', '0', '738', '741', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('118', 'EUR', '2016', '', '1180000000', '0', 'Aportaciones de socios o propietarios', '0', '739', '742', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('119', 'EUR', '2016', '', '1190000000', '0', 'Diferencias por ajuste del capital a euros', '0', '740', '743', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('120', 'EUR', '2016', '', '1200000000', '0', 'Remanente', '0', '741', '744', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('121', 'EUR', '2016', '', '1210000000', '0', 'Resultados negativos de ejercicios anteriores', '0', '742', '745', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('129', 'EUR', '2016', '', '1290000000', '0', 'Resultado del ejercicio', '0', '743', '746', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('130', 'EUR', '2016', '', '1300000000', '0', 'Subvenciones oficiales de capital', '0', '744', '747', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('131', 'EUR', '2016', '', '1310000000', '0', 'Donaciones y legados de capital', '0', '745', '748', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('132', 'EUR', '2016', '', '1320000000', '0', 'Otras subvenciones, donaciones y legados', '0', '746', '749', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('133', 'EUR', '2016', '', '1330000000', '0', 'Ajustes por valoraci?n en activos financieros disponibles para la venta', '0', '747', '750', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1340', 'EUR', '2016', '', '1340000000', '0', 'Cobertura de flujos de efectivo', '0', '748', '751', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1341', 'EUR', '2016', '', '1341000000', '0', 'Cobertura de una inversi?n neta en un negocio en el extranjero', '0', '749', '752', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('135', 'EUR', '2016', '', '1350000000', '0', 'Diferencias de conversi', '0', '750', '753', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('136', 'EUR', '2016', '', '1360000000', '0', 'Ajustes por valoraci?n en activos no corrientes y grupos enajenables de elementos, mantenidos para la venta', '0', '751', '754', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1370', 'EUR', '2016', '', '1370000000', '0', 'Ingresos fiscales por diferencias permanentes a distribuir en varios ejercicios', '0', '752', '755', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1371', 'EUR', '2016', '', '1371000000', '0', 'Ingresos fiscales por deducciones y bonificaciones a distribuir en varios ejercicios', '0', '753', '756', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('140', 'EUR', '2016', '', '1400000000', '0', 'Provisi?n por retribuciones a largo plazo al personal', '0', '754', '757', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('141', 'EUR', '2016', '', '1410000000', '0', 'Provisi?n para impuestos', '0', '755', '758', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('142', 'EUR', '2016', '', '1420000000', '0', 'Provisi?n para otras responsabilidades', '0', '756', '759', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('143', 'EUR', '2016', '', '1430000000', '0', 'Provisi?n por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '0', '757', '760', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('145', 'EUR', '2016', '', '1450000000', '0', 'Provisi?n para actuaciones medioambientales', '0', '758', '761', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('146', 'EUR', '2016', '', '1460000000', '0', 'Provisi?n para reestructuraciones', '0', '759', '762', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('147', 'EUR', '2016', '', '1470000000', '0', 'Provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '0', '760', '763', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('150', 'EUR', '2016', '', '1500000000', '0', 'Acciones o participaciones a largo plazo consideradas como pasivos financieros', '0', '761', '764', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1533', 'EUR', '2016', '', '1533000000', '0', 'Desembolsos no exigidos, empresas del grupo', '0', '762', '765', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1534', 'EUR', '2016', '', '1534000000', '0', 'Desembolsos no exigidos, empresas asociadas', '0', '763', '766', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1535', 'EUR', '2016', '', '1535000000', '0', 'Desembolsos no exigidos, otras partes vinculadas', '0', '764', '767', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1536', 'EUR', '2016', '', '1536000000', '0', 'Otros desembolsos no exigidos', '0', '765', '768', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1543', 'EUR', '2016', '', '1543000000', '0', 'Aportaciones no dinerarias pendientes, empresas del grupo', '0', '766', '769', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1544', 'EUR', '2016', '', '1544000000', '0', 'Aportaciones no dinerarias pendientes, empresas asociadas', '0', '767', '770', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1545', 'EUR', '2016', '', '1545000000', '0', 'Aportaciones no dinerarias pendientes, otras partes vinculadas', '0', '768', '771', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1546', 'EUR', '2016', '', '1546000000', '0', 'Otras aportaciones no dinerarias pendientes', '0', '769', '772', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1603', 'EUR', '2016', '', '1603000000', '0', 'Deudas a largo plazo con entidades de cr?dito, empresas del grupo', '0', '770', '773', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1604', 'EUR', '2016', '', '1604000000', '0', 'Deudas a largo plazo con entidades de cr?dito, empresas asociadas', '0', '771', '774', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1605', 'EUR', '2016', '', '1605000000', '0', 'Deudas a largo plazo con otras entidades de cr?dito vinculadas', '0', '772', '775', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1613', 'EUR', '2016', '', '1613000000', '0', 'Proveedores de inmovilizado a largo plazo, empresas del grupo', '0', '773', '776', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1614', 'EUR', '2016', '', '1614000000', '0', 'Proveedores de inmovilizado a largo plazo, empresas asociadas', '0', '774', '777', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1615', 'EUR', '2016', '', '1615000000', '0', 'Proveedores de inmovilizado a largo plazo, otras partes vinculadas', '0', '775', '778', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1623', 'EUR', '2016', '', '1623000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, empresas de grupo', '0', '776', '779', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1624', 'EUR', '2016', '', '1624000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, empresas asociadas', '0', '777', '780', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1625', 'EUR', '2016', '', '1625000000', '0', 'Acreedores por arrendamiento financiero a largo plazo, otras partes vinculadas.', '0', '778', '781', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1633', 'EUR', '2016', '', '1633000000', '0', 'Otras deudas a largo plazo, empresas del grupo', '0', '779', '782', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1634', 'EUR', '2016', '', '1634000000', '0', 'Otras deudas a largo plazo, empresas asociadas', '0', '780', '783', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1635', 'EUR', '2016', '', '1635000000', '0', 'Otras deudas a largo plazo, con otras partes vinculadas', '0', '781', '784', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('170', 'EUR', '2016', '', '1700000000', '0', 'Deudas a largo plazo con entidades de cr?dito', '0', '782', '785', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('171', 'EUR', '2016', '', '1710000000', '0', 'Deudas a largo plazo', '0', '783', '786', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('172', 'EUR', '2016', '', '1720000000', '0', 'Deudas a largo plazo transformables en subvenciones, donaciones y legados', '0', '784', '787', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('173', 'EUR', '2016', '', '1730000000', '0', 'Proveedores de inmovilizado a largo plazo', '0', '785', '788', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('174', 'EUR', '2016', '', '1740000000', '0', 'Acreedores por arrendamiento financiero a largo plazo', '0', '786', '789', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('175', 'EUR', '2016', '', '1750000000', '0', 'Efectos a pagar a largo plazo', '0', '787', '790', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1765', 'EUR', '2016', '', '1765000000', '0', 'Pasivos por derivados financieros a largo plazo, cartera de negociaci', '0', '788', '791', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('1768', 'EUR', '2016', '', '1768000000', '0', 'Pasivos por derivados financieros a largo plazo, instrumentos de cobertura', '0', '789', '792', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('177', 'EUR', '2016', '', '1770000000', '0', 'Obligaciones y bonos', '0', '790', '793', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('178', 'EUR', '2016', '', '1780000000', '0', 'Obligaciones y bonos convertibles', '0', '791', '794', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('179', 'EUR', '2016', '', '1790000000', '0', 'Deudas representadas en otros valores negociables', '0', '792', '795', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('180', 'EUR', '2016', '', '1800000000', '0', 'Fianzas recibidas a largo plazo', '0', '793', '796', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('181', 'EUR', '2016', '', '1810000000', '0', 'Anticipos recibidos por ventas o prestaciones de servicios a largo plazo', '0', '794', '797', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('185', 'EUR', '2016', '', '1850000000', '0', 'Dep?sitos recibidos a largo plazo', '0', '795', '798', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('189', 'EUR', '2016', '', '1890000000', '0', 'Garant?as financieras a largo plazo', '0', '796', '799', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('190', 'EUR', '2016', '', '1900000000', '0', 'Acciones o participaciones emitidas', '0', '797', '800', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('192', 'EUR', '2016', '', '1920000000', '0', 'Suscriptores de acciones', '0', '798', '801', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('194', 'EUR', '2016', '', '1940000000', '0', 'Capital emitido pendiente de inscripci', '0', '799', '802', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('195', 'EUR', '2016', '', '1950000000', '0', 'Acciones o participaciones emitidas consideradas como pasivos financieros', '0', '800', '803', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('197', 'EUR', '2016', '', '1970000000', '0', 'Suscriptores de acciones consideradas como pasivos financieros', '0', '801', '804', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('199', 'EUR', '2016', '', '1990000000', '0', 'Acciones o participaciones emitidas consideradas como pasivos financieros pendientes de inscripci', '0', '802', '805', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('200', 'EUR', '2016', '', '2000000000', '0', 'Investigaci', '0', '803', '806', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('201', 'EUR', '2016', '', '2010000000', '0', 'Desarrollo', '0', '804', '807', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('202', 'EUR', '2016', '', '2020000000', '0', 'Concesiones administrativas', '0', '805', '808', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('203', 'EUR', '2016', '', '2030000000', '0', 'Propiedad industrial', '0', '806', '809', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('204', 'EUR', '2016', '', '2040000000', '0', 'Fondo de comercio', '0', '807', '810', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('205', 'EUR', '2016', '', '2050000000', '0', 'Derechos de traspaso', '0', '808', '811', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('206', 'EUR', '2016', '', '2060000000', '0', 'Aplicaciones inform?ticas', '0', '809', '812', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('209', 'EUR', '2016', '', '2090000000', '0', 'Anticipos para inmovilizaciones intangibles', '0', '810', '813', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('210', 'EUR', '2016', '', '2100000000', '0', 'Terrenos y bienes naturales', '0', '811', '814', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('211', 'EUR', '2016', '', '2110000000', '0', 'Construcciones', '0', '812', '815', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('212', 'EUR', '2016', '', '2120000000', '0', 'Instalaciones t?cnicas', '0', '813', '816', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('213', 'EUR', '2016', '', '2130000000', '0', 'Maquinaria', '0', '814', '817', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('214', 'EUR', '2016', '', '2140000000', '0', 'Utillaje', '0', '815', '818', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('215', 'EUR', '2016', '', '2150000000', '0', 'Otras instalaciones', '0', '816', '819', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('216', 'EUR', '2016', '', '2160000000', '0', 'Mobiliario', '0', '817', '820', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('217', 'EUR', '2016', '', '2170000000', '0', 'Equipos para procesos de informaci', '0', '818', '821', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('218', 'EUR', '2016', '', '2180000000', '0', 'Elementos de transporte', '0', '819', '822', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('219', 'EUR', '2016', '', '2190000000', '0', 'Otro inmovilizado material', '0', '820', '823', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('220', 'EUR', '2016', '', '2200000000', '0', 'Inversiones en terrenos y bienes naturales', '0', '821', '824', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('221', 'EUR', '2016', '', '2210000000', '0', 'Inversiones en construcciones', '0', '822', '825', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('230', 'EUR', '2016', '', '2300000000', '0', 'Adaptaci?n de terrenos y bienes naturales', '0', '823', '826', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('231', 'EUR', '2016', '', '2310000000', '0', 'Construcciones en curso', '0', '824', '827', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('232', 'EUR', '2016', '', '2320000000', '0', 'Instalaciones t?cnicas en montaje', '0', '825', '828', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('233', 'EUR', '2016', '', '2330000000', '0', 'Maquinaria en montaje', '0', '826', '829', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('237', 'EUR', '2016', '', '2370000000', '0', 'Equipos para procesos de informaci?n en montaje', '0', '827', '830', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('239', 'EUR', '2016', '', '2390000000', '0', 'Anticipos para inmovilizaciones materiales', '0', '828', '831', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2403', 'EUR', '2016', '', '2403000000', '0', 'Participaciones a largo plazo en empresas del grupo', '0', '829', '832', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2404', 'EUR', '2016', '', '2404000000', '0', 'Participaciones a largo plazo en empresas asociadas', '0', '830', '833', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2405', 'EUR', '2016', '', '2405000000', '0', 'Participaciones a largo plazo en otras partes vinculadas', '0', '831', '834', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2413', 'EUR', '2016', '', '2413000000', '0', 'Valores representativos de deuda a largo plazo de empresas del grupo', '0', '832', '835', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2414', 'EUR', '2016', '', '2414000000', '0', 'Valores representativos de deuda a largo plazo de empresas asociadas', '0', '833', '836', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2415', 'EUR', '2016', '', '2415000000', '0', 'Valores representativos de deuda a largo plazo de otras partes vinculadas', '0', '834', '837', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2423', 'EUR', '2016', '', '2423000000', '0', 'Cr?ditos a largo plazo a empresas del grupo', '0', '835', '838', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2424', 'EUR', '2016', '', '2424000000', '0', 'Cr?ditos a largo plazo a empresas asociadas', '0', '836', '839', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2425', 'EUR', '2016', '', '2425000000', '0', 'Cr?ditos a largo plazo a otras partes vinculadas', '0', '837', '840', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2493', 'EUR', '2016', '', '2493000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas del grupo.', '0', '838', '841', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2494', 'EUR', '2016', '', '2494000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en empresas asociadas.', '0', '839', '842', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2495', 'EUR', '2016', '', '2495000000', '0', 'Desembolsos pendientes sobre participaciones a largo plazo en otras partes vinculadas', '0', '840', '843', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('250', 'EUR', '2016', '', '2500000000', '0', 'Inversiones financieras a largo plazo en instrumentos de patrimonio', '0', '841', '844', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('251', 'EUR', '2016', '', '2510000000', '0', 'Valores representativos de deuda a largo plazo', '0', '842', '845', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('252', 'EUR', '2016', '', '2520000000', '0', 'Cr?ditos a largo plazo', '0', '843', '846', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('253', 'EUR', '2016', '', '2530000000', '0', 'Cr?ditos a largo plazo por enajenaci?n de inmovilizado', '0', '844', '847', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('254', 'EUR', '2016', '', '2540000000', '0', 'Cr?ditos a largo plazo al personal', '0', '845', '848', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2550', 'EUR', '2016', '', '2550000000', '0', 'Activos por derivados financieros a largo plazo, cartera de negociaci', '0', '846', '849', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2553', 'EUR', '2016', '', '2553000000', '0', 'Activos por derivados financieros a largo plazo, instrumentos de cobertura', '0', '847', '850', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('257', 'EUR', '2016', '', '2570000000', '0', 'Derechos de reembolso derivados de contratos de seguro relativos a retribuciones a largo plazo al personal', '0', '848', '851', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('258', 'EUR', '2016', '', '2580000000', '0', 'Imposiciones a largo plazo', '0', '849', '852', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('259', 'EUR', '2016', '', '2590000000', '0', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a largo plazo', '0', '850', '853', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('260', 'EUR', '2016', '', '2600000000', '0', 'Fianzas constituidas a largo plazo', '0', '851', '854', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('265', 'EUR', '2016', '', '2650000000', '0', 'Dep?sitos constituidos a largo plazo', '0', '852', '855', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2800', 'EUR', '2016', '', '2800000000', '0', 'Amortizaci?n acumulada de investigaci', '0', '853', '856', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2801', 'EUR', '2016', '', '2801000000', '0', 'Amortizaci?n acumulada de desarrollo', '0', '854', '857', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2802', 'EUR', '2016', '', '2802000000', '0', 'Amortizaci?n acumulada de concesiones administrativas', '0', '855', '858', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2803', 'EUR', '2016', '', '2803000000', '0', 'Amortizaci?n acumulada de propiedad industrial', '0', '856', '859', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2805', 'EUR', '2016', '', '2805000000', '0', 'Amortizaci?n acumulada de derechos de traspaso', '0', '857', '860', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2806', 'EUR', '2016', '', '2806000000', '0', 'Amortizaci?n acumulada de aplicaciones inform?ticas', '0', '858', '861', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2811', 'EUR', '2016', '', '2811000000', '0', 'Amortizaci?n acumulada de construcciones', '0', '859', '862', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2812', 'EUR', '2016', '', '2812000000', '0', 'Amortizaci?n acumulada de instalaciones t?cnicas', '0', '860', '863', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2813', 'EUR', '2016', '', '2813000000', '0', 'Amortizaci?n acumulada de maquinaria', '0', '861', '864', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2814', 'EUR', '2016', '', '2814000000', '0', 'Amortizaci?n acumulada de utillaje', '0', '862', '865', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2815', 'EUR', '2016', '', '2815000000', '0', 'Amortizaci?n acumulada de otras instalaciones', '0', '863', '866', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2816', 'EUR', '2016', '', '2816000000', '0', 'Amortizaci?n acumulada de mobiliario', '0', '864', '867', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2817', 'EUR', '2016', '', '2817000000', '0', 'Amortizaci?n acumulada de equipos para procesos de informaci', '0', '865', '868', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2818', 'EUR', '2016', '', '2818000000', '0', 'Amortizaci?n acumulada de elementos de transporte', '0', '866', '869', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2819', 'EUR', '2016', '', '2819000000', '0', 'Amortizaci?n acumulada de otro inmovilizado material', '0', '867', '870', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('282', 'EUR', '2016', '', '2820000000', '0', 'Amortizaci?n acumulada de las inversiones inmobiliarias', '0', '868', '871', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2900', 'EUR', '2016', '', '2900000000', '0', 'Deterioro de valor de investigaci', '0', '869', '872', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2901', 'EUR', '2016', '', '2901000000', '0', 'Deterioro del valor de desarrollo', '0', '870', '873', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2902', 'EUR', '2016', '', '2902000000', '0', 'Deterioro de valor de concesiones administrativas', '0', '871', '874', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2903', 'EUR', '2016', '', '2903000000', '0', 'Deterioro de valor de propiedad industrial', '0', '872', '875', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2905', 'EUR', '2016', '', '2905000000', '0', 'Deterioro de valor de derechos de traspaso', '0', '873', '876', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2906', 'EUR', '2016', '', '2906000000', '0', 'Deterioro de valor de aplicaciones inform?ticas', '0', '874', '877', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2910', 'EUR', '2016', '', '2910000000', '0', 'Deterioro de valor de terrenos y bienes naturales', '0', '875', '878', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2911', 'EUR', '2016', '', '2911000000', '0', 'Deterioro de valor de construcciones', '0', '876', '879', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2912', 'EUR', '2016', '', '2912000000', '0', 'Deterioro de valor de instalaciones t?cnicas', '0', '877', '880', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2913', 'EUR', '2016', '', '2913000000', '0', 'Deterioro de valor de maquinaria', '0', '878', '881', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2914', 'EUR', '2016', '', '2914000000', '0', 'Deterioro de valor de utillaje', '0', '879', '882', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2915', 'EUR', '2016', '', '2915000000', '0', 'Deterioro de valor de otras instalaciones', '0', '880', '883', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2916', 'EUR', '2016', '', '2916000000', '0', 'Deterioro de valor de mobiliario', '0', '881', '884', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2917', 'EUR', '2016', '', '2917000000', '0', 'Deterioro de valor de equipos para procesos de informaci', '0', '882', '885', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2918', 'EUR', '2016', '', '2918000000', '0', 'Deterioro de valor de elementos de transporte', '0', '883', '886', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2919', 'EUR', '2016', '', '2919000000', '0', 'Deterioro de valor de otro inmovilizado material', '0', '884', '887', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2920', 'EUR', '2016', '', '2920000000', '0', 'Deterioro de valor de los terrenos y bienes naturales', '0', '885', '888', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2921', 'EUR', '2016', '', '2921000000', '0', 'Deterioro de valor de construcciones', '0', '886', '889', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2933', 'EUR', '2016', '', '2933000000', '0', 'Deterioro de valor de participaciones a largo plazo en empresas del grupo', '0', '887', '890', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2934', 'EUR', '2016', '', '2934000000', '0', 'Deterioro de valor de participaciones a largo plazo en empresas asociadas', '0', '888', '891', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2943', 'EUR', '2016', '', '2943000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas del grupo', '0', '889', '892', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2944', 'EUR', '2016', '', '2944000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de empresas asociadas', '0', '890', '893', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2945', 'EUR', '2016', '', '2945000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo de otras partes vinculadas', '0', '891', '894', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2953', 'EUR', '2016', '', '2953000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a empresas del grupo', '0', '892', '895', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2954', 'EUR', '2016', '', '2954000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a empresas asociadas', '0', '893', '896', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('2955', 'EUR', '2016', '', '2955000000', '0', 'Deterioro de valor de cr?ditos a largo plazo a otras partes vinculadas', '0', '894', '897', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('297', 'EUR', '2016', '', '2970000000', '0', 'Deterioro de valor de valores representativos de deuda a largo plazo', '0', '895', '898', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('298', 'EUR', '2016', '', '2980000000', '0', 'Deterioro de valor de cr?ditos a largo plazo', '0', '896', '899', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('300', 'EUR', '2016', '', '3000000000', '0', 'Mercader?as a', '0', '897', '900', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('301', 'EUR', '2016', '', '3010000000', '0', 'Mercader?as b', '0', '898', '901', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('310', 'EUR', '2016', '', '3100000000', '0', 'Materias primas a', '0', '899', '902', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('311', 'EUR', '2016', '', '3110000000', '0', 'Materias primas b', '0', '900', '903', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('320', 'EUR', '2016', '', '3200000000', '0', 'Elementos y conjuntos incorporables', '0', '901', '904', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('321', 'EUR', '2016', '', '3210000000', '0', 'Combustibles', '0', '902', '905', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('322', 'EUR', '2016', '', '3220000000', '0', 'Repuestos', '0', '903', '906', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('325', 'EUR', '2016', '', '3250000000', '0', 'Materiales diversos', '0', '904', '907', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('326', 'EUR', '2016', '', '3260000000', '0', 'Embalajes', '0', '905', '908', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('327', 'EUR', '2016', '', '3270000000', '0', 'Envases', '0', '906', '909', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('328', 'EUR', '2016', '', '3280000000', '0', 'Material de oficina', '0', '907', '910', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('330', 'EUR', '2016', '', '3300000000', '0', 'Productos en curso a', '0', '908', '911', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('331', 'EUR', '2016', '', '3310000000', '0', 'Productos en curso b', '0', '909', '912', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('340', 'EUR', '2016', '', '3400000000', '0', 'Productos semiterminados a', '0', '910', '913', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('341', 'EUR', '2016', '', '3410000000', '0', 'Productos semiterminados b', '0', '911', '914', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('350', 'EUR', '2016', '', '3500000000', '0', 'Productos terminados a', '0', '912', '915', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('351', 'EUR', '2016', '', '3510000000', '0', 'Productos terminados b', '0', '913', '916', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('360', 'EUR', '2016', '', '3600000000', '0', 'Subproductos a', '0', '914', '917', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('361', 'EUR', '2016', '', '3610000000', '0', 'Subproductos b', '0', '915', '918', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('365', 'EUR', '2016', '', '3650000000', '0', 'Residuos a', '0', '916', '919', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('366', 'EUR', '2016', '', '3660000000', '0', 'Residuos b', '0', '917', '920', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('368', 'EUR', '2016', '', '3680000000', '0', 'Materiales recuperados a', '0', '918', '921', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('369', 'EUR', '2016', '', '3690000000', '0', 'Materiales recuperados b', '0', '919', '922', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('390', 'EUR', '2016', '', '3900000000', '0', 'Deterioro de valor de las mercader?as', '0', '920', '923', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('391', 'EUR', '2016', '', '3910000000', '0', 'Deterioro de valor de las materias primas', '0', '921', '924', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('392', 'EUR', '2016', '', '3920000000', '0', 'Deterioro de valor de otros aprovisionamientos', '0', '922', '925', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('393', 'EUR', '2016', '', '3930000000', '0', 'Deterioro de valor de los productos en curso', '0', '923', '926', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('394', 'EUR', '2016', '', '3940000000', '0', 'Deterioro de valor de los productos semiterminados', '0', '924', '927', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('395', 'EUR', '2016', '', '3950000000', '0', 'Deterioro de valor de los productos terminados', '0', '925', '928', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('396', 'EUR', '2016', '', '3960000000', '0', 'Deterioro de valor de los subproductos, residuos y materiales recuperados', '0', '926', '929', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('400', 'EUR', '2016', '', '4000000000', '0', 'Proveedores', '0', '927', '930', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4000', 'EUR', '2016', '', '4000000001', '0', 'TecnopolÌs', '2', '928', '931', '0', '0', '-2');
INSERT INTO co_subcuentas VALUES ('4004', 'EUR', '2016', '', '4004000000', '0', 'Proveedores (moneda extranjera)', '0', '929', '932', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4009', 'EUR', '2016', '', '4009000000', '0', 'Proveedores, facturas pendientes de recibir o de formalizar', '0', '930', '933', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('401', 'EUR', '2016', '', '4010000000', '0', 'Proveedores, efectos comerciales a pagar', '0', '931', '934', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4030', 'EUR', '2016', '', '4030000000', '0', 'Proveedores, empresas del grupo (euros)', '0', '932', '935', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4031', 'EUR', '2016', '', '4031000000', '0', 'Efectos comerciales a pagar, empresas del grupo', '0', '933', '936', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4034', 'EUR', '2016', '', '4034000000', '0', 'Proveedores, empresas del grupo (moneda extranjera)', '0', '934', '937', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4036', 'EUR', '2016', '', '4036000000', '0', 'Envases y embalajes a devolver a proveedores, empresas del grupo', '0', '935', '938', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4039', 'EUR', '2016', '', '4039000000', '0', 'Proveedores, empresas del grupo, facturas pendientes de recibir o de formalizar', '0', '936', '939', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('404', 'EUR', '2016', '', '4040000000', '0', 'Proveedores, empresas asociadas', '0', '937', '940', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('405', 'EUR', '2016', '', '4050000000', '0', 'Proveedores, otras partes vinculadas', '0', '938', '941', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('406', 'EUR', '2016', '', '4060000000', '0', 'Envases y embalajes a devolver a proveedores', '0', '939', '942', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('407', 'EUR', '2016', '', '4070000000', '0', 'Anticipos a proveedores', '0', '940', '943', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('410', 'EUR', '2016', '', '4100000000', '0', 'Acreedores', '0', '941', '944', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4100', 'EUR', '2016', '', '4100000001', '0', 'Acreedores por prestaciones de servicios (euros)', '0', '942', '945', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4104', 'EUR', '2016', '', '4104000000', '0', 'Acreedores por prestaciones de servicios, (moneda extranjera)', '0', '943', '946', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4109', 'EUR', '2016', '', '4109000000', '0', 'Acreedores por prestaciones de servicios, facturas pendientes de recibir o de formalizar', '0', '944', '947', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('411', 'EUR', '2016', '', '4110000000', '0', 'Acreedores, efectos comerciales a pagar', '0', '945', '948', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('419', 'EUR', '2016', '', '4190000000', '0', 'Acreedores por operaciones en com?n', '0', '946', '949', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'EUR', '2016', '', '4300000000', '0', 'Clientes', '0', '947', '950', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4300', 'EUR', '2016', '', '4300000001', '0', 'Julio Rodriguez', '0', '948', '951', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4304', 'EUR', '2016', '', '4304000000', '0', 'Clientes (moneda extranjera)', '0', '949', '952', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4309', 'EUR', '2016', '', '4309000000', '0', 'Clientes, facturas pendientes de formalizar', '0', '950', '953', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4310', 'EUR', '2016', '', '4310000000', '0', 'Efectos comerciales en cartera', '0', '951', '954', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4311', 'EUR', '2016', '', '4311000000', '0', 'Efectos comerciales descontados', '0', '952', '955', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4312', 'EUR', '2016', '', '4312000000', '0', 'Efectos comerciales en gesti?n de cobro', '0', '953', '956', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4315', 'EUR', '2016', '', '4315000000', '0', 'Efectos comerciales impagados', '0', '954', '957', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('432', 'EUR', '2016', '', '4320000000', '0', 'Clientes, operaciones de factoring', '0', '955', '958', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4330', 'EUR', '2016', '', '4330000000', '0', 'Clientes empresas del grupo (euros)', '0', '956', '959', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4331', 'EUR', '2016', '', '4331000000', '0', 'Efectos comerciales a cobrar, empresas del grupo', '0', '957', '960', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4332', 'EUR', '2016', '', '4332000000', '0', 'Clientes empresas del grupo, operaciones de factoring', '0', '958', '961', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4334', 'EUR', '2016', '', '4334000000', '0', 'Clientes empresas del grupo (moneda extranjera)', '0', '959', '962', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4336', 'EUR', '2016', '', '4336000000', '0', 'Clientes empresas del grupo de dudoso cobro', '0', '960', '963', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4337', 'EUR', '2016', '', '4337000000', '0', 'Envases y embalajes a devolver a clientes, empresas del grupo', '0', '961', '964', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4339', 'EUR', '2016', '', '4339000000', '0', 'Clientes empresas del grupo, facturas pendientes de formalizar', '0', '962', '965', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('434', 'EUR', '2016', '', '4340000000', '0', 'Clientes, empresas asociadas', '0', '963', '966', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('435', 'EUR', '2016', '', '4350000000', '0', 'Clientes, otras partes vinculadas', '0', '964', '967', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('436', 'EUR', '2016', '', '4360000000', '0', 'Clientes de dudoso cobro', '0', '965', '968', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('437', 'EUR', '2016', '', '4370000000', '0', 'Envases y embalajes a devolver por clientes', '0', '966', '969', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('438', 'EUR', '2016', '', '4380000000', '0', 'Anticipos de clientes', '0', '967', '970', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4400', 'EUR', '2016', '', '4400000000', '0', 'Deudores (euros)', '0', '968', '971', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4404', 'EUR', '2016', '', '4404000000', '0', 'Deudores (moneda extranjera)', '0', '969', '972', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4409', 'EUR', '2016', '', '4409000000', '0', 'Deudores, facturas pendientes de formalizar', '0', '970', '973', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4410', 'EUR', '2016', '', '4410000000', '0', 'Deudores, efectos comerciales en cartera', '0', '971', '974', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4411', 'EUR', '2016', '', '4411000000', '0', 'Deudores, efectos comerciales descontados', '0', '972', '975', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4412', 'EUR', '2016', '', '4412000000', '0', 'Deudores, efectos comerciales en gesti?n de cobro', '0', '973', '976', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4415', 'EUR', '2016', '', '4415000000', '0', 'Deudores, efectos comerciales impagados', '0', '974', '977', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('446', 'EUR', '2016', '', '4460000000', '0', 'Deudores de dudoso cobro', '0', '975', '978', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('449', 'EUR', '2016', '', '4490000000', '0', 'Deudores por operaciones en com?n', '0', '976', '979', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('460', 'EUR', '2016', '', '4600000000', '0', 'Anticipos de remuneraciones', '0', '977', '980', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('465', 'EUR', '2016', '', '4650000000', '0', 'Remuneraciones pendientes de pago', '0', '978', '981', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('466', 'EUR', '2016', '', '4660000000', '0', 'Remuneraciones mediante sistemas de aportaci?n definida pendientes de pago', '0', '979', '982', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4700', 'EUR', '2016', '', '4700000000', '0', 'Hacienda p?blica, deudora por iva', '0', '980', '983', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4708', 'EUR', '2016', '', '4708000000', '0', 'Hacienda p?blica, deudora por subvenciones concedidas', '0', '981', '984', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4709', 'EUR', '2016', '', '4709000000', '0', 'Hacienda p?blica, deudora por devoluci?n de impuestos', '0', '982', '985', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('471', 'EUR', '2016', '', '4710000000', '0', 'Organismos de la seguridad social, deudores', '0', '983', '986', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('472', 'EUR', '2016', '', '4720000000', '0', 'Hacienda p?blica, iva soportado', '0', '984', '987', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('473', 'EUR', '2016', '', '4730000000', '0', 'Hacienda p?blica, retenciones y pagos a cuenta', '0', '985', '988', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4740', 'EUR', '2016', '', '4740000000', '0', 'Activos por diferencias temporarias deducibles', '0', '986', '989', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4742', 'EUR', '2016', '', '4742000000', '0', 'Derechos por deducciones y bonificaciones pendientes de aplicar', '0', '987', '990', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4745', 'EUR', '2016', '', '4745000000', '0', 'Cr?dito por p?rdidas a compensar del ejercicio', '0', '988', '991', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4750', 'EUR', '2016', '', '4750000000', '0', 'Hacienda p?blica, acreedora por iva', '0', '989', '992', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4751', 'EUR', '2016', '', '4751000000', '0', 'Hacienda p?blica, acreedora por retenciones practicadas', '0', '990', '993', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4752', 'EUR', '2016', '', '4752000000', '0', 'Hacienda p?blica, acreedora por impuesto sobre sociedades', '0', '991', '994', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4758', 'EUR', '2016', '', '4758000000', '0', 'Hacienda p?blica, acreedora por subvenciones a reintegrar', '0', '992', '995', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('476', 'EUR', '2016', '', '4760000000', '0', 'Organismos de la seguridad social, acreedores', '0', '993', '996', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('477', 'EUR', '2016', '', '4770000000', '0', 'Hacienda p?blica, iva repercutido', '0', '994', '997', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('479', 'EUR', '2016', '', '4790000000', '0', 'Pasivos por diferencias temporarias imponibles', '0', '995', '998', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('480', 'EUR', '2016', '', '4800000000', '0', 'Gastos anticipados', '0', '996', '999', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('485', 'EUR', '2016', '', '4850000000', '0', 'Ingresos anticipados', '0', '997', '1000', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('490', 'EUR', '2016', '', '4900000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales', '0', '998', '1001', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4933', 'EUR', '2016', '', '4933000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas del grupo', '0', '999', '1002', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4934', 'EUR', '2016', '', '4934000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con empresas asociadas', '0', '1000', '1003', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4935', 'EUR', '2016', '', '4935000000', '0', 'Deterioro de valor de cr?ditos por operaciones comerciales con otras partes vinculadas', '0', '1001', '1004', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4994', 'EUR', '2016', '', '4994000000', '0', 'Provisi?n por contratos onerosos', '0', '1002', '1005', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('4999', 'EUR', '2016', '', '4999000000', '0', 'Provisi?n para otras operaciones comerciales', '0', '1003', '1006', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('500', 'EUR', '2016', '', '5000000000', '0', 'Obligaciones y bonos a corto plazo', '0', '1004', '1007', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('501', 'EUR', '2016', '', '5010000000', '0', 'Obligaciones y bonos convertibles a corto plazo', '0', '1005', '1008', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('502', 'EUR', '2016', '', '5020000000', '0', 'Acciones o participaciones a corto plazo consideradas como pasivos financieros', '0', '1006', '1009', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('505', 'EUR', '2016', '', '5050000000', '0', 'Deudas representadas en otros valores negociables a corto plazo', '0', '1007', '1010', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('506', 'EUR', '2016', '', '5060000000', '0', 'Intereses a corto plazo de empr?stitos y otras emisiones an?logas', '0', '1008', '1011', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('507', 'EUR', '2016', '', '5070000000', '0', 'Dividendos de acciones o participaciones consideradas como pasivos financieros', '0', '1009', '1012', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5090', 'EUR', '2016', '', '5090000000', '0', 'Obligaciones y bonos amortizados', '0', '1010', '1013', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5091', 'EUR', '2016', '', '5091000000', '0', 'Obligaciones y bonos convertibles amortizados', '0', '1011', '1014', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5095', 'EUR', '2016', '', '5095000000', '0', 'Otros valores negociables amortizados', '0', '1012', '1015', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5103', 'EUR', '2016', '', '5103000000', '0', 'Deudas a corto plazo con entidades de cr?dito, empresas del grupo', '0', '1013', '1016', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5104', 'EUR', '2016', '', '5104000000', '0', 'Deudas a corto plazo con entidades de cr?dito, empresas asociadas', '0', '1014', '1017', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5105', 'EUR', '2016', '', '5105000000', '0', 'Deudas a corto plazo con otras entidades de cr?dito vinculadas', '0', '1015', '1018', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5113', 'EUR', '2016', '', '5113000000', '0', 'Proveedores de inmovilizado a corto plazo, empresas del grupo', '0', '1016', '1019', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5114', 'EUR', '2016', '', '5114000000', '0', 'Proveedores de inmovilizado a corto plazo, empresas asociadas', '0', '1017', '1020', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5115', 'EUR', '2016', '', '5115000000', '0', 'Proveedores de inmovilizado a corto plazo, otras partes vinculadas', '0', '1018', '1021', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5123', 'EUR', '2016', '', '5123000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, empresas del grupo', '0', '1019', '1022', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5124', 'EUR', '2016', '', '5124000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, empresas asociadas', '0', '1020', '1023', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5125', 'EUR', '2016', '', '5125000000', '0', 'Acreedores por arrendamiento financiero a corto plazo, otras partes vinculadas', '0', '1021', '1024', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5133', 'EUR', '2016', '', '5133000000', '0', 'Otras deudas a corto plazo con empresas del grupo', '0', '1022', '1025', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5134', 'EUR', '2016', '', '5134000000', '0', 'Otras deudas a corto plazo con empresas asociadas', '0', '1023', '1026', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5135', 'EUR', '2016', '', '5135000000', '0', 'Otras deudas a corto plazo con otras partes vinculadas', '0', '1024', '1027', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5143', 'EUR', '2016', '', '5143000000', '0', 'Intereses a corto plazo de deudas, empresas del grupo', '0', '1025', '1028', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5144', 'EUR', '2016', '', '5144000000', '0', 'Intereses a corto plazo de deudas, empresas asociadas', '0', '1026', '1029', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5145', 'EUR', '2016', '', '5145000000', '0', 'Intereses a corto plazo de deudas, otras partes vinculadas', '0', '1027', '1030', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5200', 'EUR', '2016', '', '5200000000', '0', 'Pr?stamos a corto plazo de entidades de cr?dito', '0', '1028', '1031', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5201', 'EUR', '2016', '', '5201000000', '0', 'Deudas a corto plazo por cr?dito dispuesto', '0', '1029', '1032', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5208', 'EUR', '2016', '', '5208000000', '0', 'Deudas por efectos descontados', '0', '1030', '1033', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5209', 'EUR', '2016', '', '5209000000', '0', 'Deudas por operaciones de factoring', '0', '1031', '1034', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('521', 'EUR', '2016', '', '5210000000', '0', 'Deudas a corto plazo', '0', '1032', '1035', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('522', 'EUR', '2016', '', '5220000000', '0', 'Deudas a corto plazo transformables en subvenciones, donaciones y legados', '0', '1033', '1036', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('523', 'EUR', '2016', '', '5230000000', '0', 'Proveedores de inmovilizado a corto plazo', '0', '1034', '1037', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('524', 'EUR', '2016', '', '5240000000', '0', 'Acreedores por arrendamiento financiero a corto plazo', '0', '1035', '1038', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('525', 'EUR', '2016', '', '5250000000', '0', 'Efectos a pagar a corto plazo', '0', '1036', '1039', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('526', 'EUR', '2016', '', '5260000000', '0', 'Dividendo activo a pagar', '0', '1037', '1040', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('527', 'EUR', '2016', '', '5270000000', '0', 'Intereses a corto plazo de deudas con entidades de cr?dito', '0', '1038', '1041', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('528', 'EUR', '2016', '', '5280000000', '0', 'Intereses a corto plazo de deudas', '0', '1039', '1042', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5290', 'EUR', '2016', '', '5290000000', '0', 'Provisi?n a corto plazo por retribuciones al personal', '0', '1040', '1043', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5291', 'EUR', '2016', '', '5291000000', '0', 'Provisi?n a corto plazo para impuestos', '0', '1041', '1044', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5292', 'EUR', '2016', '', '5292000000', '0', 'Provisi?n a corto plazo para otras responsabilidades', '0', '1042', '1045', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5293', 'EUR', '2016', '', '5293000000', '0', 'Provisi?n a corto plazo por desmantelamiento, retiro o rehabilitaci?n del inmovilizado', '0', '1043', '1046', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5295', 'EUR', '2016', '', '5295000000', '0', 'Provisi?n a corto plazo para actuaciones medioambientales', '0', '1044', '1047', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5296', 'EUR', '2016', '', '5296000000', '0', 'Provisi?n a corto plazo para reestructuraciones', '0', '1045', '1048', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5297', 'EUR', '2016', '', '5297000000', '0', 'Provisi?n a corto plazo por transacciones con pagos basados en instrumentos de patrimonio', '0', '1046', '1049', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5303', 'EUR', '2016', '', '5303000000', '0', 'Participaciones a corto plazo, en empresas del grupo', '0', '1047', '1050', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5304', 'EUR', '2016', '', '5304000000', '0', 'Participaciones a corto plazo, en empresas asociadas', '0', '1048', '1051', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5305', 'EUR', '2016', '', '5305000000', '0', 'Participaciones a corto plazo, en otras partes vinculadas', '0', '1049', '1052', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5313', 'EUR', '2016', '', '5313000000', '0', 'Valores representativos de deuda a corto plazo de empresas del grupo', '0', '1050', '1053', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5314', 'EUR', '2016', '', '5314000000', '0', 'Valores representativos de deuda a corto plazo de empresas asociadas', '0', '1051', '1054', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5315', 'EUR', '2016', '', '5315000000', '0', 'Valores representativos de deuda a corto plazo de otras partes vinculadas', '0', '1052', '1055', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5323', 'EUR', '2016', '', '5323000000', '0', 'Cr?ditos a corto plazo a empresas del grupo', '0', '1053', '1056', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5324', 'EUR', '2016', '', '5324000000', '0', 'Cr?ditos a corto plazo a empresas asociadas', '0', '1054', '1057', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5325', 'EUR', '2016', '', '5325000000', '0', 'Cr?ditos a corto plazo a otras partes vinculadas', '0', '1055', '1058', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5333', 'EUR', '2016', '', '5333000000', '0', 'Intereses a corto plazo de valores representativos de deuda de empresas del grupo', '0', '1056', '1059', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5334', 'EUR', '2016', '', '5334000000', '0', 'Intereses a corto plazo de valores representativos de deuda de empresas asociadas', '0', '1057', '1060', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5335', 'EUR', '2016', '', '5335000000', '0', 'Intereses a corto plazo de valores representativos de deuda de otras partes vinculadas', '0', '1058', '1061', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5343', 'EUR', '2016', '', '5343000000', '0', 'Intereses a corto plazo de cr?ditos a empresas del grupo', '0', '1059', '1062', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5344', 'EUR', '2016', '', '5344000000', '0', 'Intereses a corto plazo de cr?ditos a empresas asociadas', '0', '1060', '1063', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5345', 'EUR', '2016', '', '5345000000', '0', 'Intereses a corto plazo de cr?ditos a otras partes vinculadas', '0', '1061', '1064', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5353', 'EUR', '2016', '', '5353000000', '0', 'Dividendo a cobrar de empresas de grupo', '0', '1062', '1065', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5354', 'EUR', '2016', '', '5354000000', '0', 'Dividendo a cobrar de empresas asociadas', '0', '1063', '1066', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5355', 'EUR', '2016', '', '5355000000', '0', 'Dividendo a cobrar de otras partes vinculadas', '0', '1064', '1067', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5393', 'EUR', '2016', '', '5393000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas del grupo.', '0', '1065', '1068', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5394', 'EUR', '2016', '', '5394000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en empresas asociadas.', '0', '1066', '1069', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5395', 'EUR', '2016', '', '5395000000', '0', 'Desembolsos pendientes sobre participaciones a corto plazo en otras partes vinculadas', '0', '1067', '1070', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('540', 'EUR', '2016', '', '5400000000', '0', 'Inversiones financieras a corto plazo en instrumentos de patrimonio', '0', '1068', '1071', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('541', 'EUR', '2016', '', '5410000000', '0', 'Valores representativos de deuda a corto plazo', '0', '1069', '1072', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('542', 'EUR', '2016', '', '5420000000', '0', 'Cr?ditos a corto plazo', '0', '1070', '1073', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('543', 'EUR', '2016', '', '5430000000', '0', 'Cr?ditos a corto plazo por enajenaci?n de inmovilizado', '0', '1071', '1074', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('544', 'EUR', '2016', '', '5440000000', '0', 'Cr?ditos a corto plazo al personal', '0', '1072', '1075', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('545', 'EUR', '2016', '', '5450000000', '0', 'Dividendo a cobrar', '0', '1073', '1076', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('546', 'EUR', '2016', '', '5460000000', '0', 'Intereses a corto plazo de valores representativos de deudas', '0', '1074', '1077', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('547', 'EUR', '2016', '', '5470000000', '0', 'Intereses a corto plazo de cr?ditos', '0', '1075', '1078', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('548', 'EUR', '2016', '', '5480000000', '0', 'Imposiciones a corto plazo', '0', '1076', '1079', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('549', 'EUR', '2016', '', '5490000000', '0', 'Desembolsos pendientes sobre participaciones en el patrimonio neto a corto plazo', '0', '1077', '1080', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('550', 'EUR', '2016', '', '5500000000', '0', 'Titular de la explotaci', '0', '1078', '1081', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('551', 'EUR', '2016', '', '5510000000', '0', 'Cuenta corriente con socios y administradores', '0', '1079', '1082', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5523', 'EUR', '2016', '', '5523000000', '0', 'Cuenta corriente con empresas del grupo', '0', '1080', '1083', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5524', 'EUR', '2016', '', '5524000000', '0', 'Cuenta corriente con empresas asociadas', '0', '1081', '1084', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5525', 'EUR', '2016', '', '5525000000', '0', 'Cuenta corriente con otras partes vinculadas', '0', '1082', '1085', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5530', 'EUR', '2016', '', '5530000000', '0', 'Socios de sociedad disuelta', '0', '1083', '1086', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5531', 'EUR', '2016', '', '5531000000', '0', 'Socios, cuenta de fusi', '0', '1084', '1087', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5532', 'EUR', '2016', '', '5532000000', '0', 'Socios de sociedad escindida', '0', '1085', '1088', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5533', 'EUR', '2016', '', '5533000000', '0', 'Socios, cuenta de escisi', '0', '1086', '1089', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('554', 'EUR', '2016', '', '5540000000', '0', 'Cuenta corriente con uniones temporales de empresas y comunidades de bienes', '0', '1087', '1090', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('555', 'EUR', '2016', '', '5550000000', '0', 'Partidas pendientes de aplicaci', '0', '1088', '1091', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5563', 'EUR', '2016', '', '5563000000', '0', 'Desembolsos exigidos sobre participaciones, empresas del grupo', '0', '1089', '1092', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5564', 'EUR', '2016', '', '5564000000', '0', 'Desembolsos exigidos sobre participaciones, empresas asociadas', '0', '1090', '1093', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5565', 'EUR', '2016', '', '5565000000', '0', 'Desembolsos exigidos sobre participaciones, otras partes vinculadas', '0', '1091', '1094', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5566', 'EUR', '2016', '', '5566000000', '0', 'Desembolsos exigidos sobre participaciones de otras empresas', '0', '1092', '1095', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('557', 'EUR', '2016', '', '5570000000', '0', 'Dividendo activo a cuenta', '0', '1093', '1096', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5580', 'EUR', '2016', '', '5580000000', '0', 'Socios por desembolsos exigidos sobre acciones o participaciones ordinarias', '0', '1094', '1097', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5585', 'EUR', '2016', '', '5585000000', '0', 'Socios por desembolsos exigidos sobre acciones o participaciones consideradas como pasivos financieros', '0', '1095', '1098', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5590', 'EUR', '2016', '', '5590000000', '0', 'Activos por derivados financieros a corto plazo, cartera de negociaci', '0', '1096', '1099', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5593', 'EUR', '2016', '', '5593000000', '0', 'Activos por derivados financieros a corto plazo, instrumentos de cobertura', '0', '1097', '1100', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5595', 'EUR', '2016', '', '5595000000', '0', 'Pasivos por derivados financieros a corto plazo, cartera de negociaci', '0', '1098', '1101', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5598', 'EUR', '2016', '', '5598000000', '0', 'Pasivos por derivados financieros a corto plazo, instrumentos de cobertura', '0', '1099', '1102', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('560', 'EUR', '2016', '', '5600000000', '0', 'Fianzas recibidas a corto plazo', '0', '1100', '1103', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('561', 'EUR', '2016', '', '5610000000', '0', 'Dep?sitos recibidos a corto plazo', '0', '1101', '1104', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('565', 'EUR', '2016', '', '5650000000', '0', 'Fianzas constituidas a corto plazo', '0', '1102', '1105', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('566', 'EUR', '2016', '', '5660000000', '0', 'Dep?sitos constituidos a corto plazo', '0', '1103', '1106', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('567', 'EUR', '2016', '', '5670000000', '0', 'Intereses pagados por anticipado', '0', '1104', '1107', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('568', 'EUR', '2016', '', '5680000000', '0', 'Intereses cobrados por anticipado', '0', '1105', '1108', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('569', 'EUR', '2016', '', '5690000000', '0', 'Garant?as financieras a corto plazo', '0', '1106', '1109', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('570', 'EUR', '2016', '', '5700000000', '0', 'Caja, euros', '0', '1107', '1110', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('571', 'EUR', '2016', '', '5710000000', '0', 'Caja, moneda extranjera', '0', '1108', '1111', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('572', 'EUR', '2016', '', '5720000000', '0', 'Bancos e instituciones de cr?dito c/c vista, euros', '0', '1109', '1112', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('573', 'EUR', '2016', '', '5730000000', '0', 'Bancos e instituciones de cr?dito c/c vista, moneda extranjera', '0', '1110', '1113', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('574', 'EUR', '2016', '', '5740000000', '0', 'Bancos e instituciones de cr?dito, cuentas de ahorro, euros', '0', '1111', '1114', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('575', 'EUR', '2016', '', '5750000000', '0', 'Bancos e instituciones de cr?dito, cuentas de ahorro, moneda extranjera', '0', '1112', '1115', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('576', 'EUR', '2016', '', '5760000000', '0', 'Inversiones a corto plazo de gran liquidez', '0', '1113', '1116', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('580', 'EUR', '2016', '', '5800000000', '0', 'Inmovilizado', '0', '1114', '1117', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('581', 'EUR', '2016', '', '5810000000', '0', 'Inversiones con personas y entidades vinculadas', '0', '1115', '1118', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('582', 'EUR', '2016', '', '5820000000', '0', 'Inversiones financieras', '0', '1116', '1119', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('583', 'EUR', '2016', '', '5830000000', '0', 'Existencias, deudores comerciales y otras cuentas a cobrar', '0', '1117', '1120', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('584', 'EUR', '2016', '', '5840000000', '0', 'Otros activos', '0', '1118', '1121', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('585', 'EUR', '2016', '', '5850000000', '0', 'Provisiones', '0', '1119', '1122', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('586', 'EUR', '2016', '', '5860000000', '0', 'Deudas con caracter?sticas especiales', '0', '1120', '1123', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('587', 'EUR', '2016', '', '5870000000', '0', 'Deudas con personas y entidades vinculadas', '0', '1121', '1124', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('588', 'EUR', '2016', '', '5880000000', '0', 'Acreedores comerciales y otras cuentas a pagar', '0', '1122', '1125', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('589', 'EUR', '2016', '', '5890000000', '0', 'Otros pasivos', '0', '1123', '1126', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5933', 'EUR', '2016', '', '5933000000', '0', 'Deterioro de valor de participaciones a corto plazo en empresas del grupo', '0', '1124', '1127', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5934', 'EUR', '2016', '', '5934000000', '0', 'Deterioro de valor de participaciones a corto plazo en empresas asociadas', '0', '1125', '1128', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5943', 'EUR', '2016', '', '5943000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas del grupo', '0', '1126', '1129', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5944', 'EUR', '2016', '', '5944000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de empresas asociadas', '0', '1127', '1130', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5945', 'EUR', '2016', '', '5945000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo de otras partes vinculadas', '0', '1128', '1131', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5953', 'EUR', '2016', '', '5953000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a empresas del grupo', '0', '1129', '1132', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5954', 'EUR', '2016', '', '5954000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a empresas asociadas', '0', '1130', '1133', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5955', 'EUR', '2016', '', '5955000000', '0', 'Deterioro de valor de cr?ditos a corto plazo a otras partes vinculadas', '0', '1131', '1134', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('597', 'EUR', '2016', '', '5970000000', '0', 'Deterioro de valor de valores representativos de deuda a corto plazo', '0', '1132', '1135', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('598', 'EUR', '2016', '', '5980000000', '0', 'Deterioro de valor de cr?ditos a corto plazo', '0', '1133', '1136', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5990', 'EUR', '2016', '', '5990000000', '0', 'Deterioro de valor de inmovilizado no corriente mantenido para la venta', '0', '1134', '1137', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5991', 'EUR', '2016', '', '5991000000', '0', 'Deterioro de valor de inversiones con personas y entidades vinculadas no corrientes mantenidas para la venta', '0', '1135', '1138', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5992', 'EUR', '2016', '', '5992000000', '0', 'Deterioro de valor de inversiones financieras no corrientes mantenidas para la venta', '0', '1136', '1139', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5993', 'EUR', '2016', '', '5993000000', '0', 'Deterioro de valor de existencias, deudores comerciales y otras cuentas a cobrar integrados en un grupo enajenable mantenido para la venta', '0', '1137', '1140', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('5994', 'EUR', '2016', '', '5994000000', '0', 'Deterioro de valor de otros activos mantenidos para la venta', '0', '1138', '1141', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('600', 'EUR', '2016', '', '6000000000', '2', 'Compras de mercader?as', '0', '1139', '1142', '0', '0', '2');
INSERT INTO co_subcuentas VALUES ('601', 'EUR', '2016', '', '6010000000', '0', 'Compras de materias primas', '0', '1140', '1143', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('602', 'EUR', '2016', '', '6020000000', '0', 'Compras de otros aprovisionamientos', '0', '1141', '1144', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6060', 'EUR', '2016', '', '6060000000', '0', 'Descuentos sobre compras por pronto pago de mercader?as', '0', '1142', '1145', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6061', 'EUR', '2016', '', '6061000000', '0', 'Descuentos sobre compras por pronto pago de materias primas', '0', '1143', '1146', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6062', 'EUR', '2016', '', '6062000000', '0', 'Descuentos sobre compras por pronto pago de otros aprovisionamientos', '0', '1144', '1147', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('607', 'EUR', '2016', '', '6070000000', '0', 'Trabajos realizados por otras empresas', '0', '1145', '1148', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6080', 'EUR', '2016', '', '6080000000', '0', 'Devoluciones de compras de mercader?as', '0', '1146', '1149', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6081', 'EUR', '2016', '', '6081000000', '0', 'Devoluciones de compras de materias primas', '0', '1147', '1150', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6082', 'EUR', '2016', '', '6082000000', '0', 'Devoluciones de compras de otros aprovisionamientos', '0', '1148', '1151', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6090', 'EUR', '2016', '', '6090000000', '0', 'Rappels por compras de mercader?as', '0', '1149', '1152', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6091', 'EUR', '2016', '', '6091000000', '0', 'Rappels por compras de materias primas', '0', '1150', '1153', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6092', 'EUR', '2016', '', '6092000000', '0', 'Rappels por compras de otros aprovisionamientos', '0', '1151', '1154', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('610', 'EUR', '2016', '', '6100000000', '0', 'Variaci?n de existencias de mercader?as', '0', '1152', '1155', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('611', 'EUR', '2016', '', '6110000000', '0', 'Variaci?n de existencias de materias primas', '0', '1153', '1156', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('612', 'EUR', '2016', '', '6120000000', '0', 'Variaci?n de existencias de otros aprovisionamientos', '0', '1154', '1157', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('620', 'EUR', '2016', '', '6200000000', '0', 'Gastos en investigaci?n y desarrollo del ejercicio', '0', '1155', '1158', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('621', 'EUR', '2016', '', '6210000000', '0', 'Arrendamientos y c?nones', '0', '1156', '1159', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('622', 'EUR', '2016', '', '6220000000', '0', 'Reparaciones y conservaci', '0', '1157', '1160', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('623', 'EUR', '2016', '', '6230000000', '0', 'Servicios de profesionales independientes', '0', '1158', '1161', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('624', 'EUR', '2016', '', '6240000000', '0', 'Transportes', '0', '1159', '1162', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('625', 'EUR', '2016', '', '6250000000', '0', 'Primas de seguros', '0', '1160', '1163', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('626', 'EUR', '2016', '', '6260000000', '0', 'Servicios bancarios y similares', '0', '1161', '1164', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('627', 'EUR', '2016', '', '6270000000', '0', 'Publicidad, propaganda y relaciones p?blicas', '0', '1162', '1165', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('628', 'EUR', '2016', '', '6280000000', '0', 'Suministros', '0', '1163', '1166', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('629', 'EUR', '2016', '', '6290000000', '0', 'Otros servicios', '0', '1164', '1167', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6300', 'EUR', '2016', '', '6300000000', '0', 'Impuesto corriente', '0', '1165', '1168', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6301', 'EUR', '2016', '', '6301000000', '0', 'Impuesto diferido', '0', '1166', '1169', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('631', 'EUR', '2016', '', '6310000000', '0', 'Otros tributos', '0', '1167', '1170', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('633', 'EUR', '2016', '', '6330000000', '0', 'Ajustes negativos en la imposici?n sobre beneficios', '0', '1168', '1171', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6341', 'EUR', '2016', '', '6341000000', '0', 'Ajustes negativos en iva de activo corriente', '0', '1169', '1172', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6342', 'EUR', '2016', '', '6342000000', '0', 'Ajustes negativos en iva de inversiones', '0', '1170', '1173', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('636', 'EUR', '2016', '', '6360000000', '0', 'Devoluci?n de impuestos', '0', '1171', '1174', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('638', 'EUR', '2016', '', '6380000000', '0', 'Ajustes positivos en la imposici?n sobre beneficios', '0', '1172', '1175', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6391', 'EUR', '2016', '', '6391000000', '0', 'Ajustes positivos en iva de activo corriente', '0', '1173', '1176', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6392', 'EUR', '2016', '', '6392000000', '0', 'Ajustes positivos en iva de inversiones', '0', '1174', '1177', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('640', 'EUR', '2016', '', '6400000000', '0', 'Sueldos y salarios', '0', '1175', '1178', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('641', 'EUR', '2016', '', '6410000000', '0', 'Indemnizaciones', '0', '1176', '1179', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('642', 'EUR', '2016', '', '6420000000', '0', 'Seguridad social a cargo de la empresa', '0', '1177', '1180', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('643', 'EUR', '2016', '', '6430000000', '0', 'Retribuciones a largo plazo mediante sistemas de aportaci?n definida', '0', '1178', '1181', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6440', 'EUR', '2016', '', '6440000000', '0', 'Contribuciones anuales', '0', '1179', '1182', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6442', 'EUR', '2016', '', '6442000000', '0', 'Otros costes', '0', '1180', '1183', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6450', 'EUR', '2016', '', '6450000000', '0', 'Retribuciones al personal liquidados con instrumentos de patrimonio', '0', '1181', '1184', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6457', 'EUR', '2016', '', '6457000000', '0', 'Retribuciones al personal liquidados en efectivo basado en instrumentos de patrimonio', '0', '1182', '1185', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('649', 'EUR', '2016', '', '6490000000', '0', 'Otros gastos sociales', '0', '1183', '1186', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('650', 'EUR', '2016', '', '6500000000', '0', 'P?rdidas de cr?ditos comerciales incobrables', '0', '1184', '1187', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6510', 'EUR', '2016', '', '6510000000', '0', 'Beneficio transferido (gestor)', '0', '1185', '1188', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6511', 'EUR', '2016', '', '6511000000', '0', 'P?rdida soportada (part?cipe o asociado no gestor)', '0', '1186', '1189', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('659', 'EUR', '2016', '', '6590000000', '0', 'Otras p?rdidas en gesti?n corriente', '0', '1187', '1190', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('660', 'EUR', '2016', '', '6600000000', '0', 'Gastos financieros por actualizaci?n de provisiones', '0', '1188', '1191', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6610', 'EUR', '2016', '', '6610000000', '0', 'Intereses de obligaciones y bonos a largo plazo, empresas del grupo', '0', '1189', '1192', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6611', 'EUR', '2016', '', '6611000000', '0', 'Intereses de obligaciones y bonos a largo plazo, empresas asociadas', '0', '1190', '1193', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6612', 'EUR', '2016', '', '6612000000', '0', 'Intereses de obligaciones y bonos a largo plazo, otras partes vinculadas', '0', '1191', '1194', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6613', 'EUR', '2016', '', '6613000000', '0', 'Intereses de obligaciones y bonos a largo plazo, otras empresas', '0', '1192', '1195', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6615', 'EUR', '2016', '', '6615000000', '0', 'Intereses de obligaciones y bonos a corto plazo, empresas del grupo', '0', '1193', '1196', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6616', 'EUR', '2016', '', '6616000000', '0', 'Intereses de obligaciones y bonos a corto plazo, empresas asociadas', '0', '1194', '1197', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6617', 'EUR', '2016', '', '6617000000', '0', 'Intereses de obligaciones y bonos a corto plazo, otras partes vinculadas', '0', '1195', '1198', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6618', 'EUR', '2016', '', '6618000000', '0', 'Intereses de obligaciones y bonos a corto plazo, otras empresas', '0', '1196', '1199', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6620', 'EUR', '2016', '', '6620000000', '0', 'Intereses de deudas, empresas del grupo', '0', '1197', '1200', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6621', 'EUR', '2016', '', '6621000000', '0', 'Intereses de deudas, empresas asociadas', '0', '1198', '1201', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6622', 'EUR', '2016', '', '6622000000', '0', 'Intereses de deudas, otras partes vinculadas', '0', '1199', '1202', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6623', 'EUR', '2016', '', '6623000000', '0', 'Intereses de deudas con entidades de cr?dito', '0', '1200', '1203', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6624', 'EUR', '2016', '', '6624000000', '0', 'Intereses de deudas, otras empresas', '0', '1201', '1204', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6630', 'EUR', '2016', '', '6630000000', '0', 'P?rdidas de cartera de negociaci', '0', '1202', '1205', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6631', 'EUR', '2016', '', '6631000000', '0', 'P?rdidas de designados por la empresa', '0', '1203', '1206', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6632', 'EUR', '2016', '', '6632000000', '0', 'P?rdidas de disponibles para la venta', '0', '1204', '1207', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6633', 'EUR', '2016', '', '6633000000', '0', 'P?rdidas de instrumentos de cobertura', '0', '1205', '1208', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6640', 'EUR', '2016', '', '6640000000', '0', 'Dividendos de pasivos, empresas del grupo', '0', '1206', '1209', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6641', 'EUR', '2016', '', '6641000000', '0', 'Dividendos de pasivos, empresas asociadas', '0', '1207', '1210', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6642', 'EUR', '2016', '', '6642000000', '0', 'Dividendos de pasivos, otras partes vinculadas', '0', '1208', '1211', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6643', 'EUR', '2016', '', '6643000000', '0', 'Dividendos de pasivos, otras empresas', '0', '1209', '1212', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6650', 'EUR', '2016', '', '6650000000', '0', 'Intereses por descuento de efectos en entidades de cr?dito del grupo', '0', '1210', '1213', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6651', 'EUR', '2016', '', '6651000000', '0', 'Intereses por descuento de efectos en entidades de cr?dito asociadas', '0', '1211', '1214', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6652', 'EUR', '2016', '', '6652000000', '0', 'Intereses por descuento de efectos en otras entidades de cr?dito vinculadas', '0', '1212', '1215', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6653', 'EUR', '2016', '', '6653000000', '0', 'Intereses por descuento de efectos en otras entidades de cr?dito', '0', '1213', '1216', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6654', 'EUR', '2016', '', '6654000000', '0', 'Intereses por operaciones de factoring con entidades de cr?dito del grupo', '0', '1214', '1217', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6655', 'EUR', '2016', '', '6655000000', '0', 'Intereses por operaciones de factoring con entidades de cr?dito asociadas', '0', '1215', '1218', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6656', 'EUR', '2016', '', '6656000000', '0', 'Intereses por operaciones de factoring con otras entidades de cr?dito vinculadas', '0', '1216', '1219', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6657', 'EUR', '2016', '', '6657000000', '0', 'Intereses por operaciones de factoring con otras entidades de cr?dito', '0', '1217', '1220', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6660', 'EUR', '2016', '', '6660000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, empresas del grupo', '0', '1218', '1221', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6661', 'EUR', '2016', '', '6661000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, empresas asociadas', '0', '1219', '1222', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6662', 'EUR', '2016', '', '6662000000', '0', 'P?rdidas en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '1220', '1223', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6663', 'EUR', '2016', '', '6663000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a largo plazo, otras empresas', '0', '1221', '1224', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6665', 'EUR', '2016', '', '6665000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '0', '1222', '1225', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6666', 'EUR', '2016', '', '6666000000', '0', 'P?rdidas en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '0', '1223', '1226', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6667', 'EUR', '2016', '', '6667000000', '0', 'P?rdidas en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '1224', '1227', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6668', 'EUR', '2016', '', '6668000000', '0', 'P?rdidas en valores representativos de deuda a corto plazo, otras empresas', '0', '1225', '1228', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6670', 'EUR', '2016', '', '6670000000', '0', 'P?rdidas de cr?ditos a largo plazo, empresas del grupo', '0', '1226', '1229', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6671', 'EUR', '2016', '', '6671000000', '0', 'P?rdidas de cr?ditos a largo plazo, empresas asociadas', '0', '1227', '1230', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6672', 'EUR', '2016', '', '6672000000', '0', 'P?rdidas de cr?ditos a largo plazo, otras partes vinculadas', '0', '1228', '1231', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6673', 'EUR', '2016', '', '6673000000', '0', 'P?rdidas de cr?ditos a largo plazo, otras empresas', '0', '1229', '1232', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6675', 'EUR', '2016', '', '6675000000', '0', 'P?rdidas de cr?ditos a corto plazo, empresas del grupo', '0', '1230', '1233', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6676', 'EUR', '2016', '', '6676000000', '0', 'P?rdidas de cr?ditos a corto plazo, empresas asociadas', '0', '1231', '1234', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6677', 'EUR', '2016', '', '6677000000', '0', 'P?rdidas de cr?ditos a corto plazo, otras partes vinculadas', '0', '1232', '1235', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6678', 'EUR', '2016', '', '6678000000', '0', 'P?rdidas de cr?ditos a corto plazo, otras empresas', '0', '1233', '1236', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('668', 'EUR', '2016', '', '6680000000', '0', 'Diferencias negativas de cambio', '0', '1234', '1237', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('669', 'EUR', '2016', '', '6690000000', '0', 'Otros gastos financieros', '0', '1235', '1238', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('670', 'EUR', '2016', '', '6700000000', '0', 'P?rdidas procedentes del inmovilizado intangible', '0', '1236', '1239', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('671', 'EUR', '2016', '', '6710000000', '0', 'P?rdidas procedentes del inmovilizado material', '0', '1237', '1240', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('672', 'EUR', '2016', '', '6720000000', '0', 'P?rdidas procedentes de las inversiones inmobiliarias', '0', '1238', '1241', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6733', 'EUR', '2016', '', '6733000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, empresas del grupo', '0', '1239', '1242', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6734', 'EUR', '2016', '', '6734000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, empresas asociadas', '0', '1240', '1243', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6735', 'EUR', '2016', '', '6735000000', '0', 'P?rdidas procedentes de participaciones a largo plazo, otras partes vinculadas', '0', '1241', '1244', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('675', 'EUR', '2016', '', '6750000000', '0', 'P?rdidas por operaciones con obligaciones propias', '0', '1242', '1245', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('678', 'EUR', '2016', '', '6780000000', '0', 'Gastos excepcionales', '0', '1243', '1246', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('680', 'EUR', '2016', '', '6800000000', '0', 'Amortizaci?n del inmovilizado intangible', '0', '1244', '1247', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('681', 'EUR', '2016', '', '6810000000', '0', 'Amortizaci?n del inmovilizado material', '0', '1245', '1248', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('682', 'EUR', '2016', '', '6820000000', '0', 'Amortizaci?n de las inversiones inmobiliarias', '0', '1246', '1249', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('690', 'EUR', '2016', '', '6900000000', '0', 'P?rdidas por deterioro del inmovilizado intangible', '0', '1247', '1250', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('691', 'EUR', '2016', '', '6910000000', '0', 'P?rdidas por deterioro del inmovilizado material', '0', '1248', '1251', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('692', 'EUR', '2016', '', '6920000000', '0', 'P?rdidas por deterioro de las inversiones inmobiliarias', '0', '1249', '1252', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6930', 'EUR', '2016', '', '6930000000', '0', 'P?rdidas por deterioro de productos terminados y en curso de fabricaci', '0', '1250', '1253', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6931', 'EUR', '2016', '', '6931000000', '0', 'P?rdidas por deterioro de mercader?as', '0', '1251', '1254', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6932', 'EUR', '2016', '', '6932000000', '0', 'P?rdidas por deterioro de materias primas', '0', '1252', '1255', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6933', 'EUR', '2016', '', '6933000000', '0', 'P?rdidas por deterioro de otros aprovisionamientos', '0', '1253', '1256', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('694', 'EUR', '2016', '', '6940000000', '0', 'P?rdidas por deterioro de cr?ditos por operaciones comerciales', '0', '1254', '1257', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6954', 'EUR', '2016', '', '6954000000', '0', 'Dotaci?n a la provisi?n por contratos onerosos', '0', '1255', '1258', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6959', 'EUR', '2016', '', '6959000000', '0', 'Dotaci?n a la provisi?n para otras operaciones comerciales', '0', '1256', '1259', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6960', 'EUR', '2016', '', '6960000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '0', '1257', '1260', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6961', 'EUR', '2016', '', '6961000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '0', '1258', '1261', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6962', 'EUR', '2016', '', '6962000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras partes vinculadas', '0', '1259', '1262', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6963', 'EUR', '2016', '', '6963000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, otras empresas', '0', '1260', '1263', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6965', 'EUR', '2016', '', '6965000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas del grupo', '0', '1261', '1264', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6966', 'EUR', '2016', '', '6966000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, empresas asociadas', '0', '1262', '1265', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6967', 'EUR', '2016', '', '6967000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '1263', '1266', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6968', 'EUR', '2016', '', '6968000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a largo plazo, de otras empresas', '0', '1264', '1267', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6970', 'EUR', '2016', '', '6970000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas del grupo', '0', '1265', '1268', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6971', 'EUR', '2016', '', '6971000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, empresas asociadas', '0', '1266', '1269', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6972', 'EUR', '2016', '', '6972000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras partes vinculadas', '0', '1267', '1270', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6973', 'EUR', '2016', '', '6973000000', '0', 'P?rdidas por deterioro de cr?ditos a largo plazo, otras empresas', '0', '1268', '1271', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6980', 'EUR', '2016', '', '6980000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '0', '1269', '1272', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6981', 'EUR', '2016', '', '6981000000', '0', 'P?rdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '0', '1270', '1273', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6985', 'EUR', '2016', '', '6985000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '0', '1271', '1274', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6986', 'EUR', '2016', '', '6986000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '0', '1272', '1275', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6987', 'EUR', '2016', '', '6987000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '1273', '1276', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6988', 'EUR', '2016', '', '6988000000', '0', 'P?rdidas por deterioro en valores representativos de deuda a corto plazo, de otras empresas', '0', '1274', '1277', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6990', 'EUR', '2016', '', '6990000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas del grupo', '0', '1275', '1278', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6991', 'EUR', '2016', '', '6991000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, empresas asociadas', '0', '1276', '1279', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6992', 'EUR', '2016', '', '6992000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras partes vinculadas', '0', '1277', '1280', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('6993', 'EUR', '2016', '', '6993000000', '0', 'P?rdidas por deterioro de cr?ditos a corto plazo, otras empresas', '0', '1278', '1281', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('700', 'EUR', '2016', '', '7000000000', '0', 'Ventas de mercader?as', '0', '1279', '1282', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('701', 'EUR', '2016', '', '7010000000', '0', 'Ventas de productos terminados', '0', '1280', '1283', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('702', 'EUR', '2016', '', '7020000000', '0', 'Ventas de productos semiterminados', '0', '1281', '1284', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('703', 'EUR', '2016', '', '7030000000', '0', 'Ventas de subproductos y residuos', '0', '1282', '1285', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('704', 'EUR', '2016', '', '7040000000', '0', 'Ventas de envases y embalajes', '0', '1283', '1286', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('705', 'EUR', '2016', '', '7050000000', '0', 'Prestaciones de servicios', '0', '1284', '1287', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7060', 'EUR', '2016', '', '7060000000', '0', 'Descuentos sobre ventas por pronto pago de mercader?as', '0', '1285', '1288', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7061', 'EUR', '2016', '', '7061000000', '0', 'Descuentos sobre ventas por pronto pago de productos terminados', '0', '1286', '1289', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7062', 'EUR', '2016', '', '7062000000', '0', 'Descuentos sobre ventas por pronto pago de productos semiterminados', '0', '1287', '1290', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7063', 'EUR', '2016', '', '7063000000', '0', 'Descuentos sobre ventas por pronto pago de subproductos y residuos', '0', '1288', '1291', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7080', 'EUR', '2016', '', '7080000000', '0', 'Devoluciones de ventas de mercader?as', '0', '1289', '1292', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7081', 'EUR', '2016', '', '7081000000', '0', 'Devoluciones de ventas de productos terminados', '0', '1290', '1293', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7082', 'EUR', '2016', '', '7082000000', '0', 'Devoluciones de ventas de productos semiterminados', '0', '1291', '1294', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7083', 'EUR', '2016', '', '7083000000', '0', 'Devoluciones de ventas de subproductos y residuos', '0', '1292', '1295', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7084', 'EUR', '2016', '', '7084000000', '0', 'Devoluciones de ventas de envases y embalajes', '0', '1293', '1296', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7090', 'EUR', '2016', '', '7090000000', '0', 'Rappels sobre ventas de mercader?as', '0', '1294', '1297', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7091', 'EUR', '2016', '', '7091000000', '0', 'Rappels sobre ventas de productos terminados', '0', '1295', '1298', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7092', 'EUR', '2016', '', '7092000000', '0', 'Rappels sobre ventas de productos semiterminados', '0', '1296', '1299', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7093', 'EUR', '2016', '', '7093000000', '0', 'Rappels sobre ventas de subproductos y residuos', '0', '1297', '1300', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7094', 'EUR', '2016', '', '7094000000', '0', 'Rappels sobre ventas de envases y embalajes', '0', '1298', '1301', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('710', 'EUR', '2016', '', '7100000000', '0', 'Variaci?n de existencias de productos en curso', '0', '1299', '1302', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('711', 'EUR', '2016', '', '7110000000', '0', 'Variaci?n de existencias de productos semiterminados', '0', '1300', '1303', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('712', 'EUR', '2016', '', '7120000000', '0', 'Variaci?n de existencias de productos terminados', '0', '1301', '1304', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('713', 'EUR', '2016', '', '7130000000', '0', 'Variaci?n de existencias de subproductos,residuos y materiales recuperados', '0', '1302', '1305', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('730', 'EUR', '2016', '', '7300000000', '0', 'Trabajos realizados para el inmovilizado intangible', '0', '1303', '1306', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('731', 'EUR', '2016', '', '7310000000', '0', 'Trabajos realizados para el inmovilizado material', '0', '1304', '1307', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('732', 'EUR', '2016', '', '7320000000', '0', 'Trabajos realizados en inversiones inmobiliarias', '0', '1305', '1308', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('733', 'EUR', '2016', '', '7330000000', '0', 'Trabajos realizados para el inmovilizado material en curso', '0', '1306', '1309', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('740', 'EUR', '2016', '', '7400000000', '0', 'Subvenciones, donaciones y legados a la explotaci', '0', '1307', '1310', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('746', 'EUR', '2016', '', '7460000000', '0', 'Subvenciones, donaciones y legados de capital transferidos al resultado del ejercicio', '0', '1308', '1311', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('747', 'EUR', '2016', '', '7470000000', '0', 'Otras subvenciones, donaciones y legados transferidos al resultado del ejercicio', '0', '1309', '1312', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7510', 'EUR', '2016', '', '7510000000', '0', 'P?rdida transferida (gestor)', '0', '1310', '1313', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7511', 'EUR', '2016', '', '7511000000', '0', 'Beneficio atribuido (part?cipe o asociado no gestor)', '0', '1311', '1314', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('752', 'EUR', '2016', '', '7520000000', '0', 'Ingresos por arrendamientos', '0', '1312', '1315', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('753', 'EUR', '2016', '', '7530000000', '0', 'Ingresos de propiedad industrial cedida en explotaci', '0', '1313', '1316', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('754', 'EUR', '2016', '', '7540000000', '0', 'Ingresos por comisiones', '0', '1314', '1317', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('755', 'EUR', '2016', '', '7550000000', '0', 'Ingresos por servicios al personal', '0', '1315', '1318', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('759', 'EUR', '2016', '', '7590000000', '0', 'Ingresos por servicios diversos', '0', '1316', '1319', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7600', 'EUR', '2016', '', '7600000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, empresas del grupo', '0', '1317', '1320', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7601', 'EUR', '2016', '', '7601000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, empresas asociadas', '0', '1318', '1321', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7602', 'EUR', '2016', '', '7602000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, otras partes vinculadas', '0', '1319', '1322', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7603', 'EUR', '2016', '', '7603000000', '0', 'Ingresos de participaciones en instrumentos de patrimonio, otras empresas', '0', '1320', '1323', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7610', 'EUR', '2016', '', '7610000000', '0', 'Ingresos de valores representativos de deuda, empresas del grupo', '0', '1321', '1324', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7611', 'EUR', '2016', '', '7611000000', '0', 'Ingresos de valores representativos de deuda, empresas asociadas', '0', '1322', '1325', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7612', 'EUR', '2016', '', '7612000000', '0', 'Ingresos de valores representativos de deuda, otras partes vinculadas', '0', '1323', '1326', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7613', 'EUR', '2016', '', '7613000000', '0', 'Ingresos de valores representativos de deuda, otras empresas', '0', '1324', '1327', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76200', 'EUR', '2016', '', '7620000000', '0', 'Ingresos de cr?ditos a largo plazo, empresas del grupo', '0', '1325', '1328', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76201', 'EUR', '2016', '', '7620100000', '0', 'Ingresos de cr?ditos a largo plazo, empresas asociadas', '0', '1326', '1329', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76202', 'EUR', '2016', '', '7620200000', '0', 'Ingresos de cr?ditos a largo plazo, otras partes vinculadas', '0', '1327', '1330', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76203', 'EUR', '2016', '', '7620300000', '0', 'Ingresos de cr?ditos a largo plazo, otras empresas', '0', '1328', '1331', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76210', 'EUR', '2016', '', '7621000000', '0', 'Ingresos de cr?ditos a corto plazo, empresas del grupo', '0', '1329', '1332', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76211', 'EUR', '2016', '', '7621100000', '0', 'Ingresos de cr?ditos a corto plazo, empresas asociadas', '0', '1330', '1333', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76212', 'EUR', '2016', '', '7621200000', '0', 'Ingresos de cr?ditos a corto plazo, otras partes vinculadas', '0', '1331', '1334', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('76213', 'EUR', '2016', '', '7621300000', '0', 'Ingresos de cr?ditos a corto plazo, otras empresas', '0', '1332', '1335', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7630', 'EUR', '2016', '', '7630000000', '0', 'Beneficios de cartera de negociaci', '0', '1333', '1336', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7631', 'EUR', '2016', '', '7631000000', '0', 'Beneficios de designados por la empresa', '0', '1334', '1337', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7632', 'EUR', '2016', '', '7632000000', '0', 'Beneficios de disponibles para la venta', '0', '1335', '1338', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7633', 'EUR', '2016', '', '7633000000', '0', 'Beneficios de instrumentos de cobertura', '0', '1336', '1339', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7660', 'EUR', '2016', '', '7660000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, empresas del grupo', '0', '1337', '1340', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7661', 'EUR', '2016', '', '7661000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, empresas asociadas', '0', '1338', '1341', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7662', 'EUR', '2016', '', '7662000000', '0', 'Beneficios en valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '1339', '1342', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7663', 'EUR', '2016', '', '7663000000', '0', 'Beneficios en participaciones y valores representativos de deuda a largo plazo, otras empresas', '0', '1340', '1343', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7665', 'EUR', '2016', '', '7665000000', '0', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas del grupo', '0', '1341', '1344', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7666', 'EUR', '2016', '', '7666000000', '0', 'Beneficios en participaciones y valores representativos de deuda a corto plazo, empresas asociadas', '0', '1342', '1345', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7667', 'EUR', '2016', '', '7667000000', '0', 'Beneficios en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '1343', '1346', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7668', 'EUR', '2016', '', '7668000000', '0', 'Beneficios en valores representativos de deuda a corto plazo, otras empresas', '0', '1344', '1347', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('767', 'EUR', '2016', '', '7670000000', '0', 'Ingresos de activos afectos y de derechos de reembolso relativos a retribuciones a largo plazo', '0', '1345', '1348', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('768', 'EUR', '2016', '', '7680000000', '0', 'Diferencias positivas de cambio', '0', '1346', '1349', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('769', 'EUR', '2016', '', '7690000000', '0', 'Otros ingresos financieros', '0', '1347', '1350', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('770', 'EUR', '2016', '', '7700000000', '0', 'Beneficios procedentes del inmovilizado intangible', '0', '1348', '1351', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('771', 'EUR', '2016', '', '7710000000', '0', 'Beneficios procedentes del inmovilizado material', '0', '1349', '1352', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('772', 'EUR', '2016', '', '7720000000', '0', 'Beneficios procedentes de las inversiones inmobiliarias', '0', '1350', '1353', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7733', 'EUR', '2016', '', '7733000000', '0', 'Beneficios procedentes de participaciones a largo plazo, empresas del grupo', '0', '1351', '1354', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7734', 'EUR', '2016', '', '7734000000', '0', 'Beneficios procedentes de participaciones a largo plazo, empresas asociadas', '0', '1352', '1355', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7735', 'EUR', '2016', '', '7735000000', '0', 'Beneficios procedentes de participaciones a largo plazo, otras partes vinculadas', '0', '1353', '1356', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('774', 'EUR', '2016', '', '7740000000', '0', 'Diferencia negativa en combinaciones de negocios', '0', '1354', '1357', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('775', 'EUR', '2016', '', '7750000000', '0', 'Beneficios por operaciones con obligaciones propias', '0', '1355', '1358', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('778', 'EUR', '2016', '', '7780000000', '0', 'Ingresos excepcionales', '0', '1356', '1359', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('790', 'EUR', '2016', '', '7900000000', '0', 'Reversi?n del deterioro del inmovilizado intangible', '0', '1357', '1360', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('791', 'EUR', '2016', '', '7910000000', '0', 'Reversi?n del deterioro del inmovilizado material', '0', '1358', '1361', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('792', 'EUR', '2016', '', '7920000000', '0', 'Reversi?n del deterioro de las inversiones inmobiliarias', '0', '1359', '1362', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7930', 'EUR', '2016', '', '7930000000', '0', 'Reversi?n del deterioro de productos terminados y en curso de fabricaci', '0', '1360', '1363', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7931', 'EUR', '2016', '', '7931000000', '0', 'Reversi?n del deterioro de mercader?as', '0', '1361', '1364', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7932', 'EUR', '2016', '', '7932000000', '0', 'Reversi?n del deterioro de materias primas', '0', '1362', '1365', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7933', 'EUR', '2016', '', '7933000000', '0', 'Reversi?n del deterioro de otros aprovisionamientos', '0', '1363', '1366', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('794', 'EUR', '2016', '', '7940000000', '0', 'Reversi?n del deterioro de cr?ditos por operaciones comerciales', '0', '1364', '1367', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7950', 'EUR', '2016', '', '7950000000', '0', 'Exceso de provisi?n por retribuciones al personal', '0', '1365', '1368', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7951', 'EUR', '2016', '', '7951000000', '0', 'Exceso de provisi?n para impuestos', '0', '1366', '1369', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7952', 'EUR', '2016', '', '7952000000', '0', 'Exceso de provisi?n para otras responsabilidades', '0', '1367', '1370', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('79544', 'EUR', '2016', '', '7954400000', '0', 'Exceso de provisi?n por contratos onerosos', '0', '1368', '1371', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('79549', 'EUR', '2016', '', '7954900000', '0', 'Exceso de provisi?n para otras operaciones comerciales', '0', '1369', '1372', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7955', 'EUR', '2016', '', '7955000000', '0', 'Exceso de provisi?n para actuaciones medioambientales', '0', '1370', '1373', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7956', 'EUR', '2016', '', '7956000000', '0', 'Exceso de provisi?n para reestructuraciones', '0', '1371', '1374', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7957', 'EUR', '2016', '', '7957000000', '0', 'Exceso de provisi?n por transacciones con pagos basados en instrumentos de patrimonio', '0', '1372', '1375', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7960', 'EUR', '2016', '', '7960000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas del grupo', '0', '1373', '1376', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7961', 'EUR', '2016', '', '7961000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo, empresas asociadas', '0', '1374', '1377', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7965', 'EUR', '2016', '', '7965000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas del grupo', '0', '1375', '1378', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7966', 'EUR', '2016', '', '7966000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, empresas asociadas', '0', '1376', '1379', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7967', 'EUR', '2016', '', '7967000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras partes vinculadas', '0', '1377', '1380', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7968', 'EUR', '2016', '', '7968000000', '0', 'Reversi?n del deterioro de valores representativos de deuda a largo plazo, otras empresas', '0', '1378', '1381', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7970', 'EUR', '2016', '', '7970000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas del grupo', '0', '1379', '1382', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7971', 'EUR', '2016', '', '7971000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, empresas asociadas', '0', '1380', '1383', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7972', 'EUR', '2016', '', '7972000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras partes vinculadas', '0', '1381', '1384', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7973', 'EUR', '2016', '', '7973000000', '0', 'Reversi?n del deterioro de cr?ditos a largo plazo, otras empresas', '0', '1382', '1385', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7980', 'EUR', '2016', '', '7980000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas del grupo', '0', '1383', '1386', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7981', 'EUR', '2016', '', '7981000000', '0', 'Reversi?n del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo, empresas asociadas', '0', '1384', '1387', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7985', 'EUR', '2016', '', '7985000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas del grupo', '0', '1385', '1388', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7986', 'EUR', '2016', '', '7986000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, empresas asociadas', '0', '1386', '1389', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7987', 'EUR', '2016', '', '7987000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras partes vinculadas', '0', '1387', '1390', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7988', 'EUR', '2016', '', '7988000000', '0', 'Reversi?n del deterioro en valores representativos de deuda a corto plazo, otras empresas', '0', '1388', '1391', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7990', 'EUR', '2016', '', '7990000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas del grupo', '0', '1389', '1392', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7991', 'EUR', '2016', '', '7991000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, empresas asociadas', '0', '1390', '1393', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7992', 'EUR', '2016', '', '7992000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras partes vinculadas', '0', '1391', '1394', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('7993', 'EUR', '2016', '', '7993000000', '0', 'Reversi?n del deterioro de cr?ditos a corto plazo, otras empresas', '0', '1392', '1395', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('800', 'EUR', '2016', '', '8000000000', '0', 'P?rdidas en activos financieros disponibles para la venta', '0', '1393', '1396', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('802', 'EUR', '2016', '', '8020000000', '0', 'Transferencia de beneficios en activos financieros disponibles para la venta', '0', '1394', '1397', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('810', 'EUR', '2016', '', '8100000000', '0', 'P?rdidas por coberturas de flujos de efectivo', '0', '1395', '1398', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('811', 'EUR', '2016', '', '8110000000', '0', 'P?rdidas por coberturas de inversiones netas en un negocio en el extranjero', '0', '1396', '1399', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('812', 'EUR', '2016', '', '8120000000', '0', 'Transferencia de beneficios por coberturas de flujos de efectivo', '0', '1397', '1400', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('813', 'EUR', '2016', '', '8130000000', '0', 'Transferencia de beneficios por coberturas de inversiones netas en un negocio en el extranjero', '0', '1398', '1401', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('820', 'EUR', '2016', '', '8200000000', '0', 'Diferencias de conversi?n negativas', '0', '1399', '1402', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('821', 'EUR', '2016', '', '8210000000', '0', 'Transferencia de diferencias de conversi?n positivas', '0', '1400', '1403', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('8300', 'EUR', '2016', '', '8300000000', '0', 'Impuesto corriente', '0', '1401', '1404', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('8301', 'EUR', '2016', '', '8301000000', '0', 'Impuesto diferido', '0', '1402', '1405', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('833', 'EUR', '2016', '', '8330000000', '0', 'Ajustes negativos en la imposici?n sobre beneficios', '0', '1403', '1406', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('834', 'EUR', '2016', '', '8340000000', '0', 'Ingresos fiscales por diferencias permanentes', '0', '1404', '1407', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('835', 'EUR', '2016', '', '8350000000', '0', 'Ingresos fiscales por deducciones y bonificaciones', '0', '1405', '1408', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('836', 'EUR', '2016', '', '8360000000', '0', 'Transferencia de diferencias permanentes', '0', '1406', '1409', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('837', 'EUR', '2016', '', '8370000000', '0', 'Transferencia de deducciones y bonificaciones', '0', '1407', '1410', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('838', 'EUR', '2016', '', '8380000000', '0', 'Ajustes positivos en la imposici?n sobre beneficios', '0', '1408', '1411', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('840', 'EUR', '2016', '', '8400000000', '0', 'Transferencia de subvenciones oficiales de capital', '0', '1409', '1412', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('841', 'EUR', '2016', '', '8410000000', '0', 'Transferencia de donaciones y legados de capital', '0', '1410', '1413', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('842', 'EUR', '2016', '', '8420000000', '0', 'Transferencia de otras subvenciones, donaciones y legados', '0', '1411', '1414', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('850', 'EUR', '2016', '', '8500000000', '0', 'P?rdidas actuariales', '0', '1412', '1415', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('851', 'EUR', '2016', '', '8510000000', '0', 'Ajustes negativos en activos por retribuciones a largo plazo de prestaci?n definida', '0', '1413', '1416', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('860', 'EUR', '2016', '', '8600000000', '0', 'P?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '1414', '1417', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('862', 'EUR', '2016', '', '8620000000', '0', 'Transferencia de beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '1415', '1418', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('891', 'EUR', '2016', '', '8910000000', '0', 'Deterioro de participaciones en el patrimonio, empresas del grupo', '0', '1416', '1419', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('892', 'EUR', '2016', '', '8920000000', '0', 'Deterioro de participaciones en el patrimonio, empresas asociadas', '0', '1417', '1420', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('900', 'EUR', '2016', '', '9000000000', '0', 'Beneficios en activos financieros disponibles para la venta', '0', '1418', '1421', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('902', 'EUR', '2016', '', '9020000000', '0', 'Transferencia de p?rdidas de activos financieros disponibles para la venta', '0', '1419', '1422', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('910', 'EUR', '2016', '', '9100000000', '0', 'Beneficios por coberturas de flujos de efectivo', '0', '1420', '1423', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('911', 'EUR', '2016', '', '9110000000', '0', 'Beneficios por coberturas de una inversi?n neta en un negocio en el extranjero', '0', '1421', '1424', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('912', 'EUR', '2016', '', '9120000000', '0', 'Transferencia de p?rdidas por coberturas de flujos de efectivo', '0', '1422', '1425', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('913', 'EUR', '2016', '', '9130000000', '0', 'Transferencia de p?rdidas por coberturas de una inversi?n neta en un negocio en el extranjero', '0', '1423', '1426', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('920', 'EUR', '2016', '', '9200000000', '0', 'Diferencias de conversi?n positivas', '0', '1424', '1427', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('921', 'EUR', '2016', '', '9210000000', '0', 'Transferencia de diferencias de conversi?n negativas', '0', '1425', '1428', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('940', 'EUR', '2016', '', '9400000000', '0', 'Ingresos de subvenciones oficiales de capital', '0', '1426', '1429', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('941', 'EUR', '2016', '', '9410000000', '0', 'Ingresos de donaciones y legados de capital', '0', '1427', '1430', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('942', 'EUR', '2016', '', '9420000000', '0', 'Ingresos de otras subvenciones, donaciones y legados', '0', '1428', '1431', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('950', 'EUR', '2016', '', '9500000000', '0', 'Ganancias actuariales', '0', '1429', '1432', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('951', 'EUR', '2016', '', '9510000000', '0', 'Ajustes positivos en activos por retribuciones a largo plazo de prestaci?n definida', '0', '1430', '1433', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('960', 'EUR', '2016', '', '9600000000', '0', 'Beneficios en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '1431', '1434', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('962', 'EUR', '2016', '', '9620000000', '0', 'Transferencia de p?rdidas en activos no corrientes y grupos enajenables de elementos mantenidos para la venta', '0', '1432', '1435', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('991', 'EUR', '2016', '', '9910000000', '0', 'Recuperaci?n de ajustes valorativos negativos previos, empresas del grupo', '0', '1433', '1436', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('992', 'EUR', '2016', '', '9920000000', '0', 'Recuperaci?n de ajustes valorativos negativos previos, empresas asociadas', '0', '1434', '1437', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('993', 'EUR', '2016', '', '9930000000', '0', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas del grupo', '0', '1435', '1438', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('994', 'EUR', '2016', '', '9940000000', '0', 'Transferencia por deterioro de ajustes valorativos negativos previos, empresas asociadas', '0', '1436', '1439', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2016', '', '4300000003', '0', 'Camila siares', '0', '947', '1440', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2016', '', '4300000004', '0', 'Miguel san martin', '0', '947', '1441', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2016', '', '4300000002', '0', 'MIGUEL SAN MARTIN', '0', '947', '1442', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('410', 'ARS', '2016', '', '4100000002', '0', 'INTERNET', '0', '941', '1443', '0', '0', '0');
INSERT INTO co_subcuentas VALUES ('430', 'ARS', '2016', '', '4300000005', '0', 'asd', '0', '947', '1444', '0', '0', '0');


#
# Estructura de la tabla `co_subcuentascli`
#

DROP TABLE IF EXISTS `co_subcuentascli`;
CREATE TABLE `co_subcuentascli` (
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_co_subcuentascli_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentascli_clientes` (`codcliente`),
  CONSTRAINT `ca_co_subcuentascli_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentascli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_subcuentascli`
#

INSERT INTO co_subcuentascli VALUES ('000001', '2016', '4300000001', '11', '951');
INSERT INTO co_subcuentascli VALUES ('000002', '2016', '4300000002', '12', '1442');


#
# Estructura de la tabla `co_subcuentasprov`
#

DROP TABLE IF EXISTS `co_subcuentasprov`;
CREATE TABLE `co_subcuentasprov` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_co_subcuentasprov_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentasprov_proveedores` (`codproveedor`),
  CONSTRAINT `ca_co_subcuentasprov_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentasprov_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `co_subcuentasprov`
#

INSERT INTO co_subcuentasprov VALUES ('2016', '000001', '4000000001', '5', '931');


#
# Estructura de la tabla `contratoservicioscli`
#

DROP TABLE IF EXISTS `contratoservicioscli`;
CREATE TABLE `contratoservicioscli` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_renovacion` date NOT NULL,
  `observaciones` text COLLATE utf8_bin,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `importe_anual` double DEFAULT NULL,
  `periodo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fsiguiente_servicio` date DEFAULT NULL,
  PRIMARY KEY (`idcontrato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `contratoservicioscli`
#

INSERT INTO contratoservicioscli VALUES ('1', '000001', '2', '2016-02-25', '2017-02-25', '', 'CONT', '0', '', '');


#
# Estructura de la tabla `cuentasbanco`
#

DROP TABLE IF EXISTS `cuentasbanco`;
CREATE TABLE `cuentasbanco` (
  `sufijo` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `ctaagencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuentaecgc` int(11) DEFAULT NULL,
  `ctaentidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `agencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `cuenta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaecgc` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `cuentasbanco`
#



#
# Estructura de la tabla `cuentasbcocli`
#

DROP TABLE IF EXISTS `cuentasbcocli`;
CREATE TABLE `cuentasbcocli` (
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `ctaentidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `agencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `ctaagencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `cuenta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codcuenta`),
  KEY `ca_cuentasbcocli_clientes` (`codcliente`),
  CONSTRAINT `ca_cuentasbcocli_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `cuentasbcocli`
#



#
# Estructura de la tabla `cuentasbcopro`
#

DROP TABLE IF EXISTS `cuentasbcopro`;
CREATE TABLE `cuentasbcopro` (
  `agencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `ctaagencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `ctaentidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `cuenta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codcuenta`),
  KEY `ca_cuentasbcopro_proveedores` (`codproveedor`),
  CONSTRAINT `ca_cuentasbcopro_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `cuentasbcopro`
#



#
# Estructura de la tabla `detalles_servicios`
#

DROP TABLE IF EXISTS `detalles_servicios`;
CREATE TABLE `detalles_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_bin NOT NULL,
  `idservicio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `nick` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_detalle_servicio` (`idservicio`),
  CONSTRAINT `ca_detalle_servicio` FOREIGN KEY (`idservicio`) REFERENCES `servicioscli` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `detalles_servicios`
#

INSERT INTO detalles_servicios VALUES ('6', 'el cliente volvio para otra consulta', '27', '2016-03-08', '11:51:53', 'admin');
INSERT INTO detalles_servicios VALUES ('7', 'Se ha cambiado el estado a: Terminado', '27', '2016-03-08', '11:53:29', 'admin');
INSERT INTO detalles_servicios VALUES ('8', 'Se ha cambiado el estado a: Terminado', '34', '2016-03-10', '18:51:56', 'admin');


#
# Estructura de la tabla `dirclientes`
#

DROP TABLE IF EXISTS `dirclientes`;
CREATE TABLE `dirclientes` (
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `domenvio` tinyint(1) DEFAULT NULL,
  `domfacturacion` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ca_dirclientes_clientes` (`codcliente`),
  CONSTRAINT `ca_dirclientes_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `dirclientes`
#

INSERT INTO dirclientes VALUES ('000001', 'ARG', '', '', 'Santa Cruz', 'Caleta Olivia', '', '', '1', '1', 'Principal', '31');
INSERT INTO dirclientes VALUES ('000002', 'ARG', '', '', 'Santa Cruz', 'Caleta Olivia', '', '', '1', '1', 'Principal', '32');


#
# Estructura de la tabla `dirproveedores`
#

DROP TABLE IF EXISTS `dirproveedores`;
CREATE TABLE `dirproveedores` (
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `direccionppal` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ca_dirproveedores_proveedores` (`codproveedor`),
  CONSTRAINT `ca_dirproveedores_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `dirproveedores`
#

INSERT INTO dirproveedores VALUES ('000001', 'ARG', '', '', 'Santa Cruz', 'Caleta Olivia', '9011', 'Hipolito Yrigoyen 163', '1', 'Principal', '2');


#
# Estructura de la tabla `divisas`
#

DROP TABLE IF EXISTS `divisas`;
CREATE TABLE `divisas` (
  `bandera` text COLLATE utf8_bin,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codiso` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `simbolo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `tasaconv_compra` double DEFAULT NULL,
  PRIMARY KEY (`coddivisa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `divisas`
#

INSERT INTO divisas VALUES ('', 'ARS', '32', 'PESOS (ARG)', '0000-00-00', '$', '15.64', '15.09');


#
# Estructura de la tabla `dominios`
#

DROP TABLE IF EXISTS `dominios`;
CREATE TABLE `dominios` (
  `Cliente` varchar(50) NOT NULL,
  `Contacto` varchar(60) NOT NULL,
  `Telefono_contacto` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  PRIMARY KEY (`Cliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Volcado de datos de la tabla `dominios`
#



#
# Estructura de la tabla `ejercicios`
#

DROP TABLE IF EXISTS `ejercicios`;
CREATE TABLE `ejercicios` (
  `idasientocierre` int(11) DEFAULT NULL,
  `idasientopyg` int(11) DEFAULT NULL,
  `idasientoapertura` int(11) DEFAULT NULL,
  `plancontable` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `longsubcuenta` int(11) DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8_bin NOT NULL,
  `fechafin` date NOT NULL,
  `fechainicio` date NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `ejercicios`
#

INSERT INTO ejercicios VALUES ('0', '0', '0', '08', '10', 'ABIERTO', '2015-12-31', '2015-01-01', '2015', '2015');
INSERT INTO ejercicios VALUES ('0', '0', '0', '08', '10', 'ABIERTO', '2016-12-31', '2016-01-01', '2016', '2016');


#
# Estructura de la tabla `empresa`
#

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `administrador` varchar(100) COLLATE utf8_bin NOT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuentarem` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codedi` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `contintegrada` tinyint(1) DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email_firma` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email_password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `horario` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprovincia` int(11) DEFAULT NULL,
  `lema` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `logo` text COLLATE utf8_bin,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombrecorto` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pie_factura` text COLLATE utf8_bin,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recequivalencia` tinyint(1) DEFAULT NULL,
  `stockpedidos` tinyint(1) DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `empresa`
#

INSERT INTO empresa VALUES ('Administrador', '', '123456789', 'Caleta Olivia', 'ALG', '', 'ARS', '', '2016', 'CONT', 'ARG', '', 'A', '1', '', 'root', '', 'root', '', '', '1', '0', '', '', 'Centro MÈdico San Lucas', 'Centro MÈdico San Lucas', '', 'Santa Cruz', '0', '0', '2974769711', '');


#
# Estructura de la tabla `estados_servicios`
#

DROP TABLE IF EXISTS `estados_servicios`;
CREATE TABLE `estados_servicios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(6) COLLATE utf8_bin NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `albaran` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `estados_servicios`
#

INSERT INTO estados_servicios VALUES ('1', 'Pendiente', 'D9EDF7', '1', '0');
INSERT INTO estados_servicios VALUES ('2', 'Resuelta', 'DFF0D8', '1', '0');
INSERT INTO estados_servicios VALUES ('3', 'Cancelada', 'FF0808', '0', '0');
INSERT INTO estados_servicios VALUES ('100', 'Terminado', 'F0F0F0', '0', '1');


#
# Estructura de la tabla `fabricantes`
#

DROP TABLE IF EXISTS `fabricantes`;
CREATE TABLE `fabricantes` (
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codfabricante` varchar(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codfabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fabricantes`
#

INSERT INTO fabricantes VALUES ('OEM', 'oem');


#
# Estructura de la tabla `facturascli`
#

DROP TABLE IF EXISTS `facturascli`;
CREATE TABLE `facturascli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `automatica` tinyint(1) DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codigorect` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `deabono` tinyint(1) DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `editable` tinyint(1) DEFAULT '0',
  `fecha` date NOT NULL,
  `vencimiento` date DEFAULT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idasiento` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idfacturarect` int(11) DEFAULT NULL,
  `idpagodevol` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL,
  `neto` double NOT NULL,
  `nogenerarasiento` tinyint(1) DEFAULT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `totaleuros` double NOT NULL,
  `totalirpf` double NOT NULL,
  `totaliva` double NOT NULL,
  `totalrecargo` double DEFAULT NULL,
  `tpv` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE KEY `uniq_codigo_facturascli` (`codigo`),
  KEY `ca_facturascli_series2` (`codserie`),
  KEY `ca_facturascli_ejercicios2` (`codejercicio`),
  KEY `ca_facturascli_asiento2` (`idasiento`),
  CONSTRAINT `ca_facturascli_asiento2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturascli_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_facturascli_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `facturascli`
#

INSERT INTO facturascli VALUES ('', '', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000002', '', 'OSDIPP', 'ARG', '', 'A', '', '', '0', '2016-03-10', '2016-04-10', '03:40:03', '105', '13', '', '', '', '0', '0', '', 'MIGUEL SAN MARTIN', '2', '', '', '0', '0', 'Santa Cruz', '', '15.64', '0', '0', '0', '0', '0', '');


#
# Estructura de la tabla `facturasprov`
#

DROP TABLE IF EXISTS `facturasprov`;
CREATE TABLE `facturasprov` (
  `automatica` tinyint(1) DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codigorect` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `deabono` tinyint(1) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT '0',
  `fecha` date NOT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idasiento` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idfacturarect` int(11) DEFAULT NULL,
  `idpagodevol` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `neto` double DEFAULT NULL,
  `nogenerarasiento` tinyint(1) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double DEFAULT NULL,
  `totaleuros` double DEFAULT NULL,
  `totalirpf` double DEFAULT NULL,
  `totaliva` double DEFAULT NULL,
  `totalrecargo` double DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE KEY `uniq_codigo_facturasprov` (`codigo`),
  KEY `ca_facturasprov_series2` (`codserie`),
  KEY `ca_facturasprov_ejercicios2` (`codejercicio`),
  KEY `ca_facturasprov_asiento2` (`idasiento`),
  CONSTRAINT `ca_facturasprov_asiento2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturasprov_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_facturasprov_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `facturasprov`
#

INSERT INTO facturasprov VALUES ('', '17856275', '2', 'ALG', 'ARS', '2016', '20160A000001', '', 'CONT', '000001', 'A', '', '0', '2016-02-27', '03:10:30', '101', '3', '', '', '0', '2', '', 'TecnopolÌs', '1', '', '', '1', '', '15.09', '2', '30.18', '0', '0', '0');


#
# Estructura de la tabla `familias`
#

DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `descripcion` varchar(100) COLLATE utf8_bin NOT NULL,
  `codfamilia` varchar(8) COLLATE utf8_bin NOT NULL,
  `madre` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codfamilia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `familias`
#

INSERT INTO familias VALUES ('acrilicos', '1', '');
INSERT INTO familias VALUES ('VARIOS', 'VARI', '');
INSERT INTO familias VALUES ('varias', 'varias', '');
INSERT INTO familias VALUES ('varios', 'varios', '');


#
# Estructura de la tabla `formaspago`
#

DROP TABLE IF EXISTS `formaspago`;
CREATE TABLE `formaspago` (
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `genrecibos` varchar(10) COLLATE utf8_bin NOT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `domiciliado` tinyint(1) DEFAULT NULL,
  `vencimiento` varchar(20) COLLATE utf8_bin DEFAULT '+1month',
  PRIMARY KEY (`codpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `formaspago`
#

INSERT INTO formaspago VALUES ('CONT', 'OSDE', 'Pagados', '', '0', '+1month');
INSERT INTO formaspago VALUES ('OSDIPP', 'OSDIPP', 'Pagados', '', '0', '+1month');


#
# Estructura de la tabla `fs_access`
#

DROP TABLE IF EXISTS `fs_access`;
CREATE TABLE `fs_access` (
  `fs_user` varchar(12) COLLATE utf8_bin NOT NULL,
  `fs_page` varchar(30) COLLATE utf8_bin NOT NULL,
  `allow_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fs_user`,`fs_page`),
  KEY `fs_access_page2` (`fs_page`),
  CONSTRAINT `fs_access_page2` FOREIGN KEY (`fs_page`) REFERENCES `fs_pages` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fs_access_user2` FOREIGN KEY (`fs_user`) REFERENCES `fs_users` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_access`
#



#
# Estructura de la tabla `fs_extensions2`
#

DROP TABLE IF EXISTS `fs_extensions2`;
CREATE TABLE `fs_extensions2` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `page_from` varchar(30) COLLATE utf8_bin NOT NULL,
  `page_to` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `text` text COLLATE utf8_bin,
  `params` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`name`,`page_from`),
  KEY `ca_fs_extensions2_fs_pages` (`page_from`),
  CONSTRAINT `ca_fs_extensions2_fs_pages` FOREIGN KEY (`page_from`) REFERENCES `fs_pages` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_extensions2`
#

INSERT INTO fs_extensions2 VALUES ('agrupar_albaranes', 'ventas_agrupar_albaranes', 'ventas_albaranes', 'button', '<span class=\"glyphicon glyphicon-duplicate\"></span><span class=\"hidden-xs\">&nbsp; Agrupar</span>', '');
INSERT INTO fs_extensions2 VALUES ('albaranes_agente', 'ventas_albaranes', 'admin_agente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Remitos de paciente', '');
INSERT INTO fs_extensions2 VALUES ('albaranes_articulo', 'ventas_albaranes', 'ventas_articulo', 'tab_button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Remitos de paciente', '');
INSERT INTO fs_extensions2 VALUES ('albaranes_cliente', 'ventas_albaranes', 'ventas_cliente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Remitos', '');
INSERT INTO fs_extensions2 VALUES ('bootstrap', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap.min.css', '');
INSERT INTO fs_extensions2 VALUES ('bootstrap-table', 'admin_info', 'admin_info', 'head', '<link rel=\"stylesheet\" href=\"//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/bootstrap-table.min.css\"/>
   <!-- Latest compiled and minified JavaScript -->
   <script src=\"//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/bootstrap-table.min.js\"></script>
   <!-- Latest compiled and minified Locales -->
   <script src=\"//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/locale/bootstrap-table-es-SP.min.js\"></script>', '');
INSERT INTO fs_extensions2 VALUES ('bootstrap-theme_dark', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-theme_dark_navbar.css', '');
INSERT INTO fs_extensions2 VALUES ('carousel.css', 'dashboard', 'dashboard', 'head', '<link href=\"plugins/dashboard/view/css/carousel.css\" rel=\"stylesheet\" type=\"text/css\" />', '');
INSERT INTO fs_extensions2 VALUES ('cosmo', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-cosmo.min.css', '');
INSERT INTO fs_extensions2 VALUES ('darkly', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-darkly.min.css', '');
INSERT INTO fs_extensions2 VALUES ('docs.min.css', 'dashboard', 'dashboard', 'head', '<link href=\"plugins/dashboard/view/css/docs.min.css\" rel=\"stylesheet\" type=\"text/css\" />', '');
INSERT INTO fs_extensions2 VALUES ('documentos_cli', 'documentos_procli', 'ventas_cliente', 'tab', '<span class=\"glyphicon glyphicon-file\" title=\"Documentos\"></span> &nbsp; Documentos', '&folder=cliente');
INSERT INTO fs_extensions2 VALUES ('documentos_prov', 'documentos_procli', 'compras_proveedor', 'tab', '<span class=\"glyphicon glyphicon-file\" title=\"Documentos\"></span> &nbsp; Documentos', '&folder=proveedor');
INSERT INTO fs_extensions2 VALUES ('email_albaran', 'ventas_imprimir', 'ventas_albaran', 'email', 'Remito simple', '&albaran=TRUE');
INSERT INTO fs_extensions2 VALUES ('email_factura', 'ventas_imprimir', 'ventas_factura', 'email', 'Factura simple', '&factura=TRUE&tipo=simple');
INSERT INTO fs_extensions2 VALUES ('facturas_agente', 'ventas_facturas', 'admin_agente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de pacientes', '');
INSERT INTO fs_extensions2 VALUES ('facturas_articulo', 'ventas_facturas', 'ventas_articulo', 'tab_button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de pacientes', '');
INSERT INTO fs_extensions2 VALUES ('facturas_cliente', 'ventas_facturas', 'ventas_cliente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas', '');
INSERT INTO fs_extensions2 VALUES ('flatly', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-flatly.min.css', '');
INSERT INTO fs_extensions2 VALUES ('im_chat', 'im_chat', '', 'head', '<link href=\"plugins/simple_jquery_im/view/css/chat.css\" type=\"text/css\" rel=\"stylesheet\" media=\"all\" />
         <link href=\"plugins/simple_jquery_im/view/css/screen.css\" type=\"text/css\" rel=\"stylesheet\" media=\"all\" />
         <link href=\"plugins/simple_jquery_im/view/css/font-awesome.min.css\" type=\"text/css\" rel=\"stylesheet\" media=\"all\" />
         <link href=\"plugins/simple_jquery_im/view/css/hoe.css\" type=\"text/css\" rel=\"stylesheet\" media=\"all\" />

         <!--[if lte IE 7]>
         <link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"plugins/simple_jquery_im/view/css/screen_ie.css\" />
         <![endif]-->
         <script type=\"text/javascript\" src=\"plugins/simple_jquery_im/view/js/chat.js\"></script>
         <script type=\"text/javascript\" src=\"plugins/simple_jquery_im/view/js/hoe.js\"></script>
         <script type=\"text/javascript\" src=\"plugins/simple_jquery_im/view/js/chat_autoloader.js\"></script>
         ', '');
INSERT INTO fs_extensions2 VALUES ('imprimir_albaran', 'ventas_imprimir', 'ventas_albaran', 'pdf', 'Remito simple', '&albaran=TRUE');
INSERT INTO fs_extensions2 VALUES ('imprimir_factura', 'ventas_imprimir', 'ventas_factura', 'pdf', 'Factura simple', '&factura=TRUE&tipo=simple');
INSERT INTO fs_extensions2 VALUES ('imprimir_factura_carta', 'ventas_imprimir', 'ventas_factura', 'pdf', 'Modelo carta', '&factura=TRUE&tipo=carta');
INSERT INTO fs_extensions2 VALUES ('imprimir_factura_firma', 'ventas_imprimir', 'ventas_factura', 'pdf', 'Factura con firma', '&factura=TRUE&tipo=firma');
INSERT INTO fs_extensions2 VALUES ('imprimir_servicio_sin_detalles_horizontal', 'imprimir_rapido_horizontal', 'ventas_servicio', 'pdf', 'Imprimir recetarios', '');
INSERT INTO fs_extensions2 VALUES ('opciones_servicios', 'opciones_servicios', 'ventas_servicios', 'button', '<span class=\"glyphicon glyphicon-cog\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Opciones</span>', '');
INSERT INTO fs_extensions2 VALUES ('sandstone', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-sandstone.min.css', '');
INSERT INTO fs_extensions2 VALUES ('servicios_agente', 'ventas_servicios', 'admin_agente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Turnos de paciente', '');
INSERT INTO fs_extensions2 VALUES ('servicios_articulo', 'ventas_servicios', 'ventas_articulo', 'tab_button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Turnos de paciente', '');
INSERT INTO fs_extensions2 VALUES ('servicios_cliente', 'ventas_servicios', 'ventas_cliente', 'button', '<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Turno', '');
INSERT INTO fs_extensions2 VALUES ('united', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-united.min.css', '');
INSERT INTO fs_extensions2 VALUES ('ventas_servicios_calendario', 'ventas_servicios_calendario', 'ventas_servicios', 'button', '<span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Calendario</span>', '');
INSERT INTO fs_extensions2 VALUES ('yeti', 'admin_user', 'admin_user', 'css', 'view/css/bootstrap-yeti.min.css', '');


#
# Estructura de la tabla `fs_logs`
#

DROP TABLE IF EXISTS `fs_logs`;
CREATE TABLE `fs_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8_bin NOT NULL,
  `detalle` text COLLATE utf8_bin NOT NULL,
  `fecha` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `alerta` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_logs`
#

INSERT INTO fs_logs VALUES ('1', 'login', 'Login correcto.', '2015-10-21 05:13:17', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('2', 'error', 'Usuario no encontrado.', '2015-10-21 05:14:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('3', 'error', 'Empleado no encontrado.', '2015-10-21 05:18:19', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('4', 'error', 'Faltan datos.', '2015-10-21 05:18:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('5', 'error', '?albar?n de proveedor no encontrado!', '2015-10-21 05:18:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('6', 'error', '?Factura de proveedor no encontrada!', '2015-10-21 05:18:27', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('7', 'error', '?Proveedor no encontrado!', '2015-10-21 05:18:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('8', 'error', 'Asiento no encontrado.', '2015-10-21 05:18:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('9', 'error', 'Cuenta no encontrada.', '2015-10-21 05:18:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('10', 'error', 'Ejercicio no encontrado.', '2015-10-21 05:18:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('11', 'error', 'Subcuenta no encontrada.', '2015-10-21 05:18:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('12', 'error', '?albar?n de cliente no encontrado!', '2015-10-21 05:18:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('13', 'error', 'Art?culo no encontrado.', '2015-10-21 05:18:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('14', 'error', '?Cliente no encontrado!', '2015-10-21 05:18:40', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('15', 'error', 'Fabricante no encontrado.', '2015-10-21 05:18:40', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('16', 'error', '?Factura de cliente no encontrada!', '2015-10-21 05:18:40', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('17', 'error', 'Familia no encontrada.', '2015-10-21 05:18:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('18', 'error', 'Grupo no encontrado.', '2015-10-21 05:18:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('19', 'error', '?Pedido de proveedor no encontrado!', '2015-10-21 05:23:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('20', 'error', '?Pedido de cliente no encontrado!', '2015-10-21 05:23:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('21', 'error', '?Presupuesto de cliente no encontrado!', '2015-10-21 05:23:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('22', 'error', 'Divisa no encontrada.', '2015-10-21 01:07:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('23', 'error', 'Cuenta bancaria no encontrada.', '2015-10-21 01:15:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('24', 'error', 'Cuenta bancaria no encontrada.', '2015-10-21 01:16:08', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('25', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:47:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('26', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:47:53', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('27', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:48:02', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('28', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:54:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('29', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:54:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('30', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 15:56:00', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('31', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 16:10:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('32', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 16:10:44', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('33', 'error', 'Error al descargar la lista de plugins.', '2015-10-21 16:11:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('34', 'login', 'Login correcto.', '2015-10-21 16:22:51', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('35', 'login', 'El usuario ha cerrado la sesi', '2015-10-21 21:51:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('36', 'login', 'Login correcto.', '2015-10-21 21:51:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('37', 'login', 'El usuario ha cerrado la sesi', '2015-10-21 21:54:15', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('38', 'error', '?Contrase?a incorrecta!', '2015-10-21 21:54:18', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('39', 'login', 'Login correcto.', '2015-10-21 21:54:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('40', 'login', 'El usuario ha cerrado la sesi', '2015-10-21 21:55:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('41', 'login', 'Login correcto.', '2015-10-21 21:55:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('42', 'login', 'Login correcto.', '2015-10-21 22:12:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('43', 'login', 'El usuario ha cerrado la sesi', '2015-10-21 22:38:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('44', 'login', 'Login correcto.', '2015-10-21 22:38:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('45', 'login', 'El usuario ha cerrado la sesi', '2015-10-21 22:43:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('46', 'login', 'Login correcto.', '2015-10-22 13:52:18', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('47', 'error', 'Ya existe el art?culo <a href=\"index.php?page=ventas_articulo&ref=acrilicos\">acrilicos</a>', '2015-10-22 14:14:14', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('48', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:52:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('49', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:52:58', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('50', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:53:07', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('51', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:54:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('52', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:57:06', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('53', 'error', 'Error al descargar la lista de plugins.', '2015-10-27 23:58:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('54', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:00:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('55', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:06:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('56', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:23:13', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('57', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:27:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('58', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:27:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('59', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:28:29', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('60', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:28:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('61', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:29:47', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('62', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:29:53', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('63', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 00:56:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('64', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 01:12:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('65', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 01:13:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('66', 'login', 'El usuario ha cerrado la sesi', '2015-10-28 13:45:05', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('67', 'error', '?Contrase?a incorrecta!', '2015-10-28 13:45:09', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('68', 'error', '?Contrase?a incorrecta!', '2015-10-28 13:45:12', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('69', 'login', 'Login correcto.', '2015-10-28 13:45:17', 'Agustin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('70', 'login', 'El usuario ha cerrado la sesi', '2015-10-28 13:46:14', 'Agustin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('71', 'login', 'Login correcto.', '2015-10-28 13:46:19', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('72', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 14:26:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('73', 'error', 'Ya existe el art?culo <a href=\"index.php?page=ventas_articulo&ref=+123\"> 123</a>', '2015-10-28 14:39:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('74', 'error', 'Ya existe el art?culo <a href=\"index.php?page=ventas_articulo&ref=+\"> </a>', '2015-10-28 15:41:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('75', 'error', 'Ya existe el art?culo <a href=\"index.php?page=ventas_articulo&ref=+\"> </a>', '2015-10-28 15:41:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('76', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:13:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('77', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:13:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('78', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:45:15', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('79', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:50:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('80', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:56:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('81', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:58:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('82', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 21:58:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('83', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 22:00:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('84', 'error', 'Error al descargar la lista de plugins.', '2015-10-28 22:00:53', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('85', 'error', '?Factura de cliente no encontrada!', '2015-10-28 22:10:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('86', 'error', 'Cuenta no encontrada.', '2015-10-29 01:24:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('87', 'error', 'Subcuenta no encontrada.', '2015-10-29 01:24:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('88', 'error', '?Imposible guardar la tarifa!', '2015-10-29 02:00:01', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('89', 'error', '?Imposible guardar la tarifa!', '2015-10-29 02:01:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('90', 'login', 'El usuario ha cerrado la sesi', '2015-10-29 13:47:51', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('91', 'login', 'Login correcto.', '2015-10-29 13:48:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('92', 'login', 'El usuario ha cerrado la sesi', '2015-10-29 15:22:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('93', 'login', 'El usuario ha cerrado la sesi', '2015-10-29 15:22:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('94', 'login', 'El usuario ha cerrado la sesi', '2015-10-29 15:22:45', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('95', 'login', 'El usuario ha cerrado la sesi', '2015-10-29 15:22:46', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('96', 'login', 'Login correcto.', '2015-10-29 15:31:53', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('97', 'login', 'Login correcto.', '2015-10-29 21:25:15', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('98', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:25:30', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('99', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:25:43', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('100', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:25:48', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('101', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:25:52', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('102', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:26:14', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('103', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:26:46', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('104', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:27:20', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('105', 'login', 'Login correcto.', '2015-10-29 21:27:47', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('106', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:27:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('107', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:31:13', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('108', 'error', 'Error al descargar la lista de plugins.', '2015-10-29 21:46:50', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('109', 'error', 'Noticia no encontrada.', '2015-10-30 00:40:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('110', 'error', 'Tema no encontrado.', '2015-10-30 00:40:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('111', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 00:41:55', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('112', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 01:27:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('113', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 01:27:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('114', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 01:27:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('115', 'login', 'El usuario ha cerrado la sesi', '2015-10-30 14:53:05', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('116', 'login', 'Login correcto.', '2015-10-30 14:53:35', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('117', 'login', 'El usuario ha cerrado la sesi', '2015-10-30 21:22:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('118', 'login', 'Login correcto.', '2015-10-30 21:22:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('119', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 21:22:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('120', 'error', 'Error al descargar la lista de plugins.', '2015-10-30 21:52:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('121', 'error', '?Cliente no encontrado!', '2015-10-30 23:58:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('122', 'error', '?Imposible modificar los datos del cliente!', '2015-10-31 00:28:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('123', 'error', '?Imposible modificar los datos del cliente!', '2015-10-31 00:28:42', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('124', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 01:16:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('125', 'login', 'Login correcto.', '2015-12-02 01:17:01', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('126', 'error', 'La familia <a href=\"index.php?page=ventas_familia&cod=1\">1</a> ya existe.', '2015-12-02 01:17:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('127', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 08:48:12', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('128', 'login', 'Login correcto.', '2015-12-02 08:48:17', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('129', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 08:49:09', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('130', 'login', 'Login correcto.', '2015-12-02 08:49:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('131', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 08:49:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('132', 'login', 'Login correcto.', '2015-12-02 08:49:37', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('133', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 08:50:19', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('134', 'login', 'Login correcto.', '2015-12-02 08:50:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('135', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 08:51:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('136', 'error', '?Contrase?a incorrecta!', '2015-12-02 08:51:23', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('137', 'login', 'Login correcto.', '2015-12-02 08:51:27', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('138', 'login', 'Login correcto.', '2015-12-02 13:20:19', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('139', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 13:22:12', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('140', 'login', 'Login correcto.', '2015-12-02 13:22:17', 'prueba', '::1', '0');
INSERT INTO fs_logs VALUES ('141', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 13:23:48', 'prueba', '::1', '0');
INSERT INTO fs_logs VALUES ('142', 'login', 'Login correcto.', '2015-12-02 13:23:52', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('143', 'error', 'Cuenta no encontrada.', '2015-12-02 13:38:13', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('144', 'error', 'Cuenta no encontrada.', '2015-12-02 13:38:15', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('145', 'error', 'Cuenta no encontrada.', '2015-12-02 13:38:33', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('146', 'error', 'Cuenta no encontrada.', '2015-12-02 13:38:38', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('147', 'error', 'Error al descargar la lista de plugins.', '2015-12-02 13:39:52', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('148', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 14:40:55', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('149', 'error', '?Contrase?a incorrecta!', '2015-12-02 14:40:58', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('150', 'login', 'Login correcto.', '2015-12-02 14:41:02', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('151', 'error', 'Art?culo no encontrado.', '2015-12-02 14:49:17', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('152', 'error', '?Factura de proveedor no encontrada!', '2015-12-02 15:07:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('153', 'login', 'Login correcto.', '2015-12-02 15:19:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('154', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 15:20:53', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('155', 'login', 'Login correcto.', '2015-12-02 15:20:57', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('156', 'error', 'Error al descargar la lista de plugins.', '2015-12-02 15:21:06', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('157', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 15:34:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('158', 'login', 'Login correcto.', '2015-12-02 15:34:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('159', 'login', 'El usuario ha cerrado la sesi', '2015-12-02 23:52:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('160', 'login', 'Login correcto.', '2015-12-02 23:52:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('161', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:02:44', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('162', 'login', 'Login correcto.', '2015-12-03 00:02:48', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('163', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:03:02', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('164', 'login', 'Login correcto.', '2015-12-03 00:03:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('165', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:03:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('166', 'login', 'Login correcto.', '2015-12-03 00:03:36', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('167', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:03:47', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('168', 'login', 'Login correcto.', '2015-12-03 00:03:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('169', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:04:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('170', 'login', 'Login correcto.', '2015-12-03 00:04:41', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('171', 'login', 'El usuario ha cerrado la sesi', '2015-12-03 00:05:49', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('172', 'error', '?Contrase?a incorrecta!', '2015-12-05 22:30:22', '', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('173', 'login', 'Login correcto.', '2015-12-05 22:30:39', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('174', 'login', 'Login correcto.', '2015-12-09 02:56:10', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('175', 'error', '?Contrase?a incorrecta!', '2015-12-09 03:06:43', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('176', 'login', 'Login correcto.', '2015-12-09 03:06:46', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('177', 'login', 'El usuario ha cerrado la sesi', '2015-12-09 03:09:48', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('178', 'login', 'Login correcto.', '2015-12-09 03:09:52', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('179', 'login', 'El usuario ha cerrado la sesi', '2015-12-09 03:10:12', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('180', 'login', 'Login correcto.', '2015-12-09 03:10:15', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('181', 'login', 'El usuario ha cerrado la sesi', '2015-12-09 03:12:17', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('182', 'login', 'Login correcto.', '2015-12-09 03:12:21', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('183', 'login', 'El usuario ha cerrado la sesi', '2015-12-09 03:12:52', 'prueba', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('184', 'login', 'Login correcto.', '2015-12-09 03:12:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('185', 'login', 'El usuario ha cerrado la sesi', '2015-12-09 13:18:02', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('186', 'login', 'Login correcto.', '2015-12-09 13:18:31', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('187', 'login', 'Login correcto.', '2015-12-09 13:21:18', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('188', 'login', 'El usuario ha cerrado la sesi', '2015-12-10 13:57:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('189', 'login', 'Login correcto.', '2015-12-10 13:57:33', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('190', 'error', 'Error al descargar la lista de plugins.', '2015-12-10 15:11:29', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('191', 'login', 'El usuario ha cerrado la sesi', '2015-12-10 16:07:00', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('192', 'login', 'Login correcto.', '2015-12-10 16:07:14', 'admin', '192.168.2.107', '0');
INSERT INTO fs_logs VALUES ('193', 'login', 'El usuario ha cerrado la sesi', '2015-12-10 21:51:55', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('194', 'login', 'Login correcto.', '2015-12-10 21:51:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('195', 'error', 'Error al descargar la lista de plugins.', '2015-12-10 23:46:07', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('196', 'error', 'Error al descargar la lista de plugins.', '2015-12-14 21:30:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('197', 'error', 'Error al descargar la lista de plugins.', '2015-12-14 21:30:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('198', 'error', 'Error al descargar la lista de plugins.', '2015-12-14 21:31:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('199', 'login', 'El usuario ha cerrado la sesi', '2016-01-22 17:39:40', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('200', 'login', 'Login correcto.', '2016-01-22 17:49:17', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('201', 'error', 'Error al descargar la lista de plugins.', '2016-01-22 17:49:22', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('202', 'login', 'El usuario ha cerrado la sesi', '2016-01-22 17:50:38', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('203', 'login', 'Login correcto.', '2016-01-25 04:01:25', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('204', 'error', 'Las contrase?as no coinciden.', '2016-01-25 04:02:58', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('205', 'login', 'El usuario ha cerrado la sesi', '2016-01-25 04:04:35', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('206', 'login', 'Login correcto.', '2016-01-25 04:04:42', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('207', 'error', 'S?lo un administrador puede hacer cambios en esta p?gina.', '2016-01-25 04:04:44', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('208', 'error', 'S?lo un administrador puede hacer cambios en esta p?gina.', '2016-01-25 04:04:46', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('209', 'error', 'S?lo un administrador puede hacer cambios en esta p?gina.', '2016-01-25 04:05:15', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('210', 'login', 'El usuario ha cerrado la sesi', '2016-01-25 04:05:19', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('211', 'error', '?Contrase?a incorrecta!', '2016-01-25 04:05:23', '', '::1', '0');
INSERT INTO fs_logs VALUES ('212', 'login', 'Login correcto.', '2016-01-25 04:05:31', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('213', 'login', 'El usuario ha cerrado la sesi', '2016-01-25 04:06:01', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('214', 'login', 'Login correcto.', '2016-01-25 04:06:08', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('215', 'error', 'ERROR: No se ha seleccionado ninguna tabla para realizar el Respaldo Selectivo de la Bases de Datos MySQL (sartin).', '2016-01-25 04:24:45', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('216', 'error', 'Error al descargar la lista de plugins.', '2016-01-29 20:59:12', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('217', 'error', 'Error al descargar la lista de plugins.', '2016-01-29 20:59:20', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('218', 'error', 'Error al descargar la lista de plugins.', '2016-01-29 21:00:46', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('219', 'error', 'Contrato no encontrado.', '2016-01-29 21:01:24', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('220', 'error', '?Servicio de cliente no encontrado!', '2016-01-29 21:01:31', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('221', 'error', '?Imposible guardar el empleado!', '2016-01-29 21:13:38', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('222', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:15:09', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('223', 'login', 'Login correcto.', '2016-01-29 21:15:13', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('224', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:15:29', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('225', 'error', '?Contrase?a incorrecta!', '2016-01-29 21:15:33', '', '::1', '0');
INSERT INTO fs_logs VALUES ('226', 'error', '?Contrase?a incorrecta!', '2016-01-29 21:15:36', '', '::1', '0');
INSERT INTO fs_logs VALUES ('227', 'error', '?Contrase?a incorrecta!', '2016-01-29 21:15:41', '', '::1', '0');
INSERT INTO fs_logs VALUES ('228', 'login', 'Login correcto.', '2016-01-29 21:15:45', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('229', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:18:49', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('230', 'login', 'Login correcto.', '2016-01-29 21:18:53', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('231', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:19:06', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('232', 'error', '?Contrase?a incorrecta!', '2016-01-29 21:19:09', '', '::1', '0');
INSERT INTO fs_logs VALUES ('233', 'login', 'Login correcto.', '2016-01-29 21:19:15', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('234', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:19:36', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('235', 'login', 'Login correcto.', '2016-01-29 21:19:41', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('236', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:20:20', 'pruebas', '::1', '0');
INSERT INTO fs_logs VALUES ('237', 'login', 'Login correcto.', '2016-01-29 21:20:23', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('238', 'error', 'No tienes un <a href=\"index.php?page=admin_user&snick=admin\">agente asociado</a>
               a tu usuario, y por tanto no puedes hacer tickets.', '2016-01-29 21:22:39', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('239', 'error', 'No tienes un <a href=\"index.php?page=admin_user&snick=admin\">agente asociado</a>
               a tu usuario, y por tanto no puedes hacer tickets.', '2016-01-29 21:22:46', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('240', 'error', 'Error al descargar la lista de plugins.', '2016-01-29 21:49:48', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('241', 'login', 'El usuario ha cerrado la sesi', '2016-01-29 21:52:21', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('242', 'login', 'Login correcto.', '2016-01-29 21:52:50', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('243', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-06 04:45:13', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('244', 'error', '°ContraseÒa incorrecta!', '2016-02-06 04:45:20', '', '::1', '0');
INSERT INTO fs_logs VALUES ('245', 'error', '°ContraseÒa incorrecta!', '2016-02-06 04:45:24', '', '::1', '0');
INSERT INTO fs_logs VALUES ('246', 'login', 'Login correcto.', '2016-02-06 04:45:43', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('247', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=ACCESS+POINT+TP-LI\">ACCESS POINT TP-LI</a>', '2016-02-06 05:13:04', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('248', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=TP-LINK+WA901ND\">TP-LINK WA901ND</a>', '2016-02-06 06:52:56', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('249', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=AGENDA+P%2FTABLET+10\">AGENDA P/TABLET 10</a>', '2016-02-06 06:54:11', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('250', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=ANTENA+5DBI+TP-LIN\">ANTENA 5DBI TP-LIN</a>', '2016-02-06 06:55:45', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('251', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=GENIUS+HS-M225MOBI\">GENIUS HS-M225MOBI</a>', '2016-02-06 07:02:09', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('252', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=THONET+LUFT+BLUETO\">THONET LUFT BLUETO</a>', '2016-02-06 07:08:03', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('253', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=CAMARA+SPORTSPRO+1\">CAMARA SPORTSPRO 1</a>', '2016-02-06 07:25:57', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('254', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=CARGADOR+PORTATIL+\">CARGADOR PORTATIL </a>', '2016-02-06 07:26:43', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('255', 'error', '°Error al crear el articulo!', '2016-02-06 07:29:35', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('256', 'error', '°Error al crear el articulo!', '2016-02-06 07:29:54', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('257', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=CELULAR+MOTOROLA+M\">CELULAR MOTOROLA M</a>', '2016-02-06 07:33:38', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('258', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=CLEAN+TECH+SPRAY+L\">CLEAN TECH SPRAY L</a>', '2016-02-06 07:46:58', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('259', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=ESTABILIZADOR+CMOS\">ESTABILIZADOR CMOS</a>', '2016-02-06 07:58:16', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('260', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=FAN+COOLER+CX+P%2F+S\">FAN COOLER CX P/ S</a>', '2016-02-06 08:02:37', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('261', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=FUNDA+P%2FNB+15%2C6%60TR\">FUNDA P/NB 15,6`TR</a>', '2016-02-06 08:05:39', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('262', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=FUNDA+P%2FNET+10TRI\">FUNDA P/NET 10TRI</a>', '2016-02-06 08:07:27', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('263', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=GAB+GAMER+THERMALT\">GAB GAMER THERMALT</a>', '2016-02-06 08:09:25', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('264', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=HD+1+TB+WD+S-ATA+I\">HD 1 TB WD S-ATA I</a>', '2016-02-06 08:12:27', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('265', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=JOYSTICK+NEO+ANALO\">JOYSTICK NEO ANALO</a>', '2016-02-06 08:20:18', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('266', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=JUEGO+XBOX+360+MIC\">JUEGO XBOX 360 MIC</a>', '2016-02-06 08:22:26', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('267', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=JUEGO+XBOX+360+KIN\">JUEGO XBOX 360 KIN</a>', '2016-02-06 08:25:30', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('268', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=LECTOR+NEWLAND+IMA\">LECTOR NEWLAND IMA</a>', '2016-02-06 08:31:28', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('269', 'error', '°ContraseÒa incorrecta!', '2016-02-08 07:33:29', '', '::1', '0');
INSERT INTO fs_logs VALUES ('270', 'login', 'Login correcto.', '2016-02-08 07:33:35', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('271', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=MB+ASROCK+S1155+H6\">MB ASROCK S1155 H6</a>', '2016-02-08 07:40:53', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('272', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=MONITOR+22+LED+CX+\">MONITOR 22 LED CX </a>', '2016-02-08 08:00:01', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('273', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=MOUSE+CX+LK-612AG+\">MOUSE CX LK-612AG </a>', '2016-02-08 08:01:22', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('274', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=MICROTRAVELER+USB+\">MICROTRAVELER USB </a>', '2016-02-08 08:02:27', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('275', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=MOUSE+MICROSOFT+OP\">MOUSE MICROSOFT OP</a>', '2016-02-08 08:03:32', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('276', 'error', '°Error al crear el articulo!', '2016-02-08 14:06:13', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('277', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=NB+CX+15%2C6%60+INTEL+\">NB CX 15,6` INTEL </a>', '2016-02-08 14:08:13', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('278', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=NB+CX+SLIM+14+CORE\">NB CX SLIM 14 CORE</a>', '2016-02-08 14:09:37', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('279', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=NB+LENOVO+15%2C6+B50\">NB LENOVO 15,6 B50</a>', '2016-02-08 14:12:43', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('280', 'error', '°Error al crear el articulo!', '2016-02-08 14:17:10', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('281', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=PHILIPS+RECARGABLE\">PHILIPS RECARGABLE</a>', '2016-02-08 14:19:24', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('282', 'error', 'Ya existe el artÌculo <a href=\"index.php?page=ventas_articulo&ref=TENSION+TRV+SMART+\">TENSION TRV SMART </a>', '2016-02-08 14:49:10', 'admin', '::1', '0');
INSERT INTO fs_logs VALUES ('283', 'login', 'Login correcto.', '2016-02-10 08:51:41', 'admin', '192.168.2.1', '0');
INSERT INTO fs_logs VALUES ('284', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-10 09:27:09', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('285', 'error', '°ContraseÒa incorrecta!', '2016-02-10 09:27:17', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('286', 'error', '°ContraseÒa incorrecta!', '2016-02-10 09:27:22', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('287', 'login', 'Login correcto.', '2016-02-10 09:27:29', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('288', 'login', 'Login correcto.', '2016-02-11 17:16:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('289', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-11 17:28:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('290', 'login', 'Login correcto.', '2016-02-14 14:08:10', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('291', 'error', 'Contrato no encontrado.', '2016-02-14 14:43:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('292', 'error', '°Servicio de cliente no encontrado!', '2016-02-14 14:43:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('293', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-15 01:47:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('294', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-15 01:47:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('295', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-15 01:48:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('296', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-15 01:48:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('297', 'error', '°Cliente no encontrado!', '2016-02-15 13:41:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('298', 'error', '°Cliente no encontrado!', '2016-02-15 13:42:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('299', 'error', '°ContraseÒa incorrecta!', '2016-02-19 18:50:01', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('300', 'login', 'Login correcto.', '2016-02-19 18:50:06', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('301', 'login', 'Login correcto.', '2016-02-19 19:01:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('302', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-20 19:36:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('303', 'login', 'Login correcto.', '2016-02-20 19:53:49', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('304', 'error', 'Contrato no encontrado.', '2016-02-22 05:25:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('305', 'error', '°Servicio de cliente no encontrado!', '2016-02-22 05:25:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('306', 'error', '°Cliente no encontrado!', '2016-02-22 05:33:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('307', 'error', 'Error al enviar el email: SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '2016-02-22 05:37:19', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('308', 'error', 'Error al enviar el email: SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '2016-02-22 05:37:42', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('309', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-22 05:38:05', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('310', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-22 05:38:05', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('311', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-22 05:38:18', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('312', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-22 05:38:18', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('313', 'error', 'Error al enviar el email: SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '2016-02-22 05:38:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('314', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-22 05:39:10', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('315', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-22 05:39:10', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('316', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-22 05:42:27', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('317', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-22 05:42:27', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('318', 'error', 'Error al enviar el email: SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '2016-02-22 05:42:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('319', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-22 21:29:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('320', 'error', '°ContraseÒa incorrecta!', '2016-02-22 21:29:29', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('321', 'login', 'Login correcto.', '2016-02-22 21:29:33', 'pruebas', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('322', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-22 21:29:54', 'pruebas', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('323', 'login', 'Login correcto.', '2016-02-22 21:29:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('324', 'error', '°Cliente no encontrado!', '2016-02-25 02:10:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('325', 'error', 'Factura no encontrada.', '2016-02-25 03:49:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('326', 'error', 'Divisa no encontrada.', '2016-02-25 03:59:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('327', 'error', '°Empleado no encontrado!', '2016-02-25 04:01:02', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('328', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-02-25 04:53:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('329', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-02-25 04:53:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('330', 'error', '°Imposible guardar el empleado!', '2016-02-25 05:56:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('331', 'error', 'Contrato no encontrado.', '2016-02-25 06:20:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('332', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-25 06:28:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('333', 'login', 'Login correcto.', '2016-02-25 06:28:33', 'miguel', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('334', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-25 06:29:15', 'miguel', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('335', 'login', 'Login correcto.', '2016-02-25 06:29:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('336', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-25 06:29:53', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('337', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-25 06:31:38', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('338', 'login', 'Login correcto.', '2016-02-25 06:31:42', 'miguel', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('339', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-25 06:32:58', 'miguel', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('340', 'login', 'Login correcto.', '2016-02-25 06:33:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('341', 'error', '°ContraseÒa incorrecta!', '2016-02-27 02:40:22', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('342', 'login', 'Login correcto.', '2016-02-27 02:40:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('343', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-27 02:47:42', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('344', 'login', 'Login correcto.', '2016-02-27 02:47:47', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('345', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-02-27 02:49:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('346', 'login', 'Login correcto.', '2016-02-27 12:09:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('347', 'error', 'Dependencias incumplidas: <b>facturacion_base</b>', '2016-03-05 06:32:06', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('348', 'error', 'Dependencias incumplidas: <b>facturacion_base</b>', '2016-03-05 06:32:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('349', 'error', 'Empleado no encontrado.', '2016-03-05 06:37:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('350', 'error', 'Faltan datos.', '2016-03-05 06:37:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('351', 'error', '°remito de proveedor no encontrado!', '2016-03-05 06:37:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('352', 'error', '°Factura de proveedor no encontrada!', '2016-03-05 06:37:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('353', 'error', '°Proveedor no encontrado!', '2016-03-05 06:37:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('354', 'error', 'Ejercicio no encontrado.', '2016-03-05 06:37:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('355', 'error', '°remito de cliente no encontrado!', '2016-03-05 06:37:31', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('356', 'error', 'ArtÌculo no encontrado.', '2016-03-05 06:37:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('357', 'error', '°Cliente no encontrado!', '2016-03-05 06:37:33', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('358', 'error', 'Fabricante no encontrado.', '2016-03-05 06:37:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('359', 'error', '°Factura de cliente no encontrada!', '2016-03-05 06:37:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('360', 'error', 'Familia no encontrada.', '2016-03-05 06:37:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('361', 'error', 'Grupo no encontrado.', '2016-03-05 06:37:36', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('362', 'error', 'Contrato no encontrado.', '2016-03-05 06:41:51', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('363', 'error', '°Servicio de cliente no encontrado!', '2016-03-05 06:41:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('364', 'error', 'Error al guardar los datos.', '2016-03-05 07:08:58', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('365', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:09:01', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('366', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:09:01', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('367', 'error', 'Error al guardar los datos.', '2016-03-05 07:10:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('368', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:10:06', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('369', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:10:06', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('370', 'error', 'Error al guardar los datos.', '2016-03-05 07:11:19', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('371', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:11:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('372', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:11:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('373', 'error', 'Error al guardar los datos.', '2016-03-05 07:11:42', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('374', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:11:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('375', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:11:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('376', 'error', 'Error al guardar los datos.', '2016-03-05 07:12:48', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('377', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:12:49', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('378', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:12:49', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('379', 'error', 'Error al guardar los datos.', '2016-03-05 07:14:55', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('380', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:14:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('381', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:14:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('382', 'error', 'Error al guardar los datos.', '2016-03-05 07:15:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('383', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:15:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('384', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:15:56', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('385', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-05 07:16:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('386', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-05 07:16:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('387', 'error', 'Paciente no encontrado.', '2016-03-05 10:31:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('388', 'error', 'Paciente no encontrado.', '2016-03-05 10:31:49', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('389', 'error', 'Paciente no encontrado.', '2016-03-05 10:32:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('390', 'error', '°Factura de proveedor no encontrada!', '2016-03-05 10:35:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('391', 'error', 'Contrato no encontrado.', '2016-03-06 06:18:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('392', 'error', 'No puedes desactivar esta p·gina (admin_home).', '2016-03-06 06:19:00', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('393', 'error', 'Empleado no encontrado.', '2016-03-06 06:19:07', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('394', 'error', 'Usuario no encontrado.', '2016-03-06 06:19:09', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('395', 'error', 'Ejercicio no encontrado.', '2016-03-06 06:19:15', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('396', 'error', 'Contrato no encontrado.', '2016-03-06 06:19:17', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('397', 'error', 'Contrato no encontrado.', '2016-03-06 06:19:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('398', 'error', '°Turno de paciente no encontrado!', '2016-03-06 06:19:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('399', 'error', '°remito de cliente no encontrado!', '2016-03-06 06:19:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('400', 'error', 'ArtÌculo no encontrado.', '2016-03-06 06:19:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('401', 'error', 'Paciente no encontrado!', '2016-03-06 06:19:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('402', 'error', 'Fabricante no encontrado.', '2016-03-06 06:19:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('403', 'error', '°Factura de cliente no encontrada!', '2016-03-06 06:19:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('404', 'error', 'Familia no encontrada.', '2016-03-06 06:19:25', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('405', 'error', 'Grupo no encontrado.', '2016-03-06 06:19:26', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('406', 'error', '°Turno de paciente no encontrado!', '2016-03-06 06:19:27', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('407', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-06 06:50:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('408', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-06 06:50:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('409', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-06 06:53:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('410', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-06 06:53:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('411', 'error', 'Paciente no encontrado!', '2016-03-06 09:46:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('412', 'error', 'Paciente no encontrado.', '2016-03-07 05:30:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('413', 'error', '°Turno no encontrado!', '2016-03-07 05:45:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('414', 'error', '°Turno no encontrado!', '2016-03-07 05:47:46', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('415', 'error', 'Paciente no encontrado.', '2016-03-07 06:14:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('416', 'error', 'Paciente no encontrado.', '2016-03-07 06:16:32', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('417', 'error', 'Paciente no encontrado.', '2016-03-07 06:17:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('418', 'error', 'Paciente no encontrado.', '2016-03-08 09:33:30', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('419', 'error', 'Paciente no encontrado.', '2016-03-08 09:33:33', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('420', 'error', 'Paciente no encontrado.', '2016-03-08 09:33:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('421', 'error', 'Paciente no encontrado.', '2016-03-08 09:33:47', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('422', 'error', 'Paciente no encontrado.', '2016-03-08 09:34:02', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('423', 'error', 'Paciente no encontrado!', '2016-03-08 09:48:05', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('424', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-08 12:10:22', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('425', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-08 12:11:18', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('426', 'error', '°ContraseÒa incorrecta!', '2016-03-08 12:11:21', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('427', 'error', '°ContraseÒa incorrecta!', '2016-03-08 12:11:25', '', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('428', 'login', 'Login correcto.', '2016-03-08 12:11:29', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('429', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-08 12:12:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('430', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-08 12:12:39', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('431', 'login', 'Login correcto.', '2016-03-08 18:20:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('432', 'error', 'Paciente no encontrado.', '2016-03-08 18:43:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('433', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-08 18:47:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('434', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-08 18:47:16', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('435', 'login', 'Login correcto.', '2016-03-08 18:47:19', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('436', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-08 18:48:34', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('437', 'login', 'Login correcto.', '2016-03-08 18:48:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('438', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 15:22:58', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('439', 'login', 'Login correcto.', '2016-03-10 15:23:09', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('440', 'error', 'No se ha podido conectar por email. øLa contraseÒa es correcta?', '2016-03-10 16:32:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('441', 'error', 'Aunque la contraseÒa de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexiÛn. Para superar esta situaciÛn debes crear y usar una <a href=\"https://support.google.com/accounts/answer/185833?hl=es\" target=\"_blank\">contraseÒa de aplicaciÛn</a>', '2016-03-10 16:32:23', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('442', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:06:27', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('443', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:06:50', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('444', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:07:20', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('445', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:07:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('446', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:08:40', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('447', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:09:10', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('448', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:09:40', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('449', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:09:47', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('450', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:09:54', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('451', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:09:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('452', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:10:07', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('453', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:10:17', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('454', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:10:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('455', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:10:41', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('456', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:11:02', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('457', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:11:29', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('458', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:11:42', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('459', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:12:04', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('460', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:12:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('461', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:12:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('462', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:12:43', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('463', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:12:48', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('464', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:13:07', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('465', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:13:35', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('466', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:13:52', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('467', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:14:24', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('468', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:14:37', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('469', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:14:45', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('470', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:15:03', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('471', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:15:08', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('472', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:15:21', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('473', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:17:11', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('474', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:17:59', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('475', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:18:05', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('476', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:18:10', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('477', 'login', 'El usuario ha cerrado la sesiÛn.', '2016-03-10 17:18:18', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('478', 'login', 'Login correcto.', '2016-03-10 17:18:28', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('479', 'error', 'Fabricante no encontrado.', '2016-03-10 18:45:57', 'admin', '127.0.0.1', '0');
INSERT INTO fs_logs VALUES ('480', 'error', 'Familia no encontrada.', '2016-03-10 18:46:37', 'admin', '127.0.0.1', '0');


#
# Estructura de la tabla `fs_pages`
#

DROP TABLE IF EXISTS `fs_pages`;
CREATE TABLE `fs_pages` (
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `title` varchar(40) COLLATE utf8_bin NOT NULL,
  `folder` varchar(15) COLLATE utf8_bin NOT NULL,
  `version` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `show_on_menu` tinyint(1) NOT NULL DEFAULT '1',
  `important` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_pages`
#

INSERT INTO fs_pages VALUES ('', 'home', '', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('admin_agente', 'Empleado', 'admin', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('admin_agentes', 'Doctores', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('admin_empresa', 'Consultorio', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('admin_home', 'P·ginas', 'admin', '2015.041', '1', '1');
INSERT INTO fs_pages VALUES ('admin_info', 'InformaciÛn del sistema', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('admin_paises', 'Paises', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('admin_user', 'Usuario', 'admin', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('admin_users', 'Usuarios', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('backup', 'Backups', 'admin', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('contabilidad_ejercicio', 'Ejercicio', 'configuracion', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('contabilidad_formas_pago', 'Obras Sociales', 'configuracion', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('contabilidad_impuestos', 'Impuestos', 'configuracion', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('contabilidad_nuevo_asiento', 'nuevo asiento', 'configuracion', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('dashboard', 'Ir', 'Escritorio', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('documentos_procli', 'Documentos', 'compras', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('editar_contrato_servicio', 'Editar contrato', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('im_chat', 'Chat', 'IM Chat', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('imprimir_rapido_horizontal', 'Imprimir R·pido Horizontal', 'Servicio', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('informe_albaranes', 'Remitos', 'reportes', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('informe_facturas', 'Facturas', 'reportes', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('nueva_compra', 'nueva compra', 'compras', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('nueva_venta', 'nueva venta', 'Turnos', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('nuevo_servicio', 'Nuevo turno...', 'ventas', '2015.041', '0', '1');
INSERT INTO fs_pages VALUES ('opciones_servicios', 'Opciones', 'Servicios', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('subcuenta_asociada', 'Asignar subcuenta...', 'contabilidad', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_agrupar_albaranes', 'Agrupar remitos', 'Turnos', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_albaran', 'remito de cliente', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_albaranes', 'Remitos de pacientes', 'turnos', '2015.041', '1', '1');
INSERT INTO fs_pages VALUES ('ventas_articulo', 'Articulo', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_articulos', 'Precios predeterminados', 'turnos', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('ventas_cliente', 'Pacientes', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_clienteimprimir', 'Pacientes', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_clientes', 'Pacientes', 'turnos', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('ventas_clientes_opciones', 'Opciones', 'clientes', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_fabricante', 'Familia', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_factura', 'Factura de cliente', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_facturas', 'Facturas de pacientes', 'turnos', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('ventas_familia', 'Categorias', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_grupo', 'Grupo', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_imprimir', 'imprimir', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_servicio', 'Servicio', 'ventas', '2015.041', '0', '0');
INSERT INTO fs_pages VALUES ('ventas_servicios', 'Turnos a pacientes', 'turnos', '2015.041', '1', '0');
INSERT INTO fs_pages VALUES ('ventas_servicios_calendario', 'Calendario', 'Servicios', '2015.041', '0', '0');


#
# Estructura de la tabla `fs_users`
#

DROP TABLE IF EXISTS `fs_users`;
CREATE TABLE `fs_users` (
  `nick` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `log_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `last_login_time` time DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `last_browser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fs_page` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `css` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`nick`),
  KEY `ca_fs_users_pages` (`fs_page`),
  CONSTRAINT `ca_fs_users_pages` FOREIGN KEY (`fs_page`) REFERENCES `fs_pages` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_users`
#

INSERT INTO fs_users VALUES ('admin', 'f26fee654b3e72fc7123857f3348125413ef4556', '28aa82fda6c321f7cc2681899c3189aa03bbe28f', '1', '2', '2016-03-11', '11:58:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 'dashboard', 'view/css/bootstrap.min.css', 'cosouth.battle@gmail.com');


#
# Estructura de la tabla `fs_vars`
#

DROP TABLE IF EXISTS `fs_vars`;
CREATE TABLE `fs_vars` (
  `name` varchar(35) COLLATE utf8_bin NOT NULL,
  `varchar` text COLLATE utf8_bin,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `fs_vars`
#

INSERT INTO fs_vars VALUES ('cal_fin', '22:00');
INSERT INTO fs_vars VALUES ('cal_inicio', '07:00');
INSERT INTO fs_vars VALUES ('cal_intervalo', '30');
INSERT INTO fs_vars VALUES ('install_step', '5');
INSERT INTO fs_vars VALUES ('last_download_check', '2016-03-04');
INSERT INTO fs_vars VALUES ('mail_enc', 'ssl');
INSERT INTO fs_vars VALUES ('mail_host', 'smtp.gmail.com');
INSERT INTO fs_vars VALUES ('mail_port', '465');
INSERT INTO fs_vars VALUES ('mail_user', '');
INSERT INTO fs_vars VALUES ('nuevocli_cifnif_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_ciudad', '1');
INSERT INTO fs_vars VALUES ('nuevocli_ciudad_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_codgrupo', '');
INSERT INTO fs_vars VALUES ('nuevocli_codpostal', '0');
INSERT INTO fs_vars VALUES ('nuevocli_codpostal_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_direccion', '0');
INSERT INTO fs_vars VALUES ('nuevocli_direccion_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_pais', '1');
INSERT INTO fs_vars VALUES ('nuevocli_pais_req', '1');
INSERT INTO fs_vars VALUES ('nuevocli_provincia', '1');
INSERT INTO fs_vars VALUES ('nuevocli_provincia_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_telefono1', '1');
INSERT INTO fs_vars VALUES ('nuevocli_telefono1_req', '0');
INSERT INTO fs_vars VALUES ('nuevocli_telefono2', '1');
INSERT INTO fs_vars VALUES ('nuevocli_telefono2_req', '0');
INSERT INTO fs_vars VALUES ('numeracion_personalizada', '1');
INSERT INTO fs_vars VALUES ('print_alb', '0');
INSERT INTO fs_vars VALUES ('print_dto', '1');
INSERT INTO fs_vars VALUES ('print_ref', '1');
INSERT INTO fs_vars VALUES ('servicios_accesorios', '1');
INSERT INTO fs_vars VALUES ('servicios_condiciones', '');
INSERT INTO fs_vars VALUES ('servicios_descripcion', '0');
INSERT INTO fs_vars VALUES ('servicios_diasfin', '0');
INSERT INTO fs_vars VALUES ('servicios_fechafin', '0');
INSERT INTO fs_vars VALUES ('servicios_fechainicio', '1');
INSERT INTO fs_vars VALUES ('servicios_garantia', '0');
INSERT INTO fs_vars VALUES ('servicios_material', '1');
INSERT INTO fs_vars VALUES ('servicios_material_estado', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_accesorios', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_descripcion', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_fechafin', '0');
INSERT INTO fs_vars VALUES ('servicios_mostrar_fechainicio', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_garantia', '0');
INSERT INTO fs_vars VALUES ('servicios_mostrar_material', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_material_estado', '1');
INSERT INTO fs_vars VALUES ('servicios_mostrar_solucion', '1');
INSERT INTO fs_vars VALUES ('servicios_solucion', '0');
INSERT INTO fs_vars VALUES ('st_accesorios', 'Ex fÌsico');
INSERT INTO fs_vars VALUES ('st_descripcion', 'DiagnÛstico');
INSERT INTO fs_vars VALUES ('st_fechafin', 'FECHA DE FINALIZACION');
INSERT INTO fs_vars VALUES ('st_fechainicio', 'Fecha de consulta');
INSERT INTO fs_vars VALUES ('st_garantia', 'GARANTIA');
INSERT INTO fs_vars VALUES ('st_material', 'Motivo consulta');
INSERT INTO fs_vars VALUES ('st_material_estado', 'Enfermedad actual');
INSERT INTO fs_vars VALUES ('st_servicio', 'Turno');
INSERT INTO fs_vars VALUES ('st_servicios', 'Turnos');
INSERT INTO fs_vars VALUES ('st_solucion', 'Tratamiento');
INSERT INTO fs_vars VALUES ('updates', 'true');


#
# Estructura de la tabla `gruposclientes`
#

DROP TABLE IF EXISTS `gruposclientes`;
CREATE TABLE `gruposclientes` (
  `codgrupo` varchar(6) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codtarifa` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codgrupo`),
  KEY `ca_gruposclientes_tarifas` (`codtarifa`),
  CONSTRAINT `ca_gruposclientes_tarifas` FOREIGN KEY (`codtarifa`) REFERENCES `tarifas` (`codtarifa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `gruposclientes`
#



#
# Estructura de la tabla `impuestos`
#

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `codimpuesto` varchar(10) COLLATE utf8_bin NOT NULL,
  `codsubcuentaacr` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentadeu` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadedadue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadevadue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadeventue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepexe` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepexp` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepre` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopagra` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopexe` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopimp` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentarep` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentasop` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuentaacr` int(11) DEFAULT NULL,
  `idsubcuentadeu` int(11) DEFAULT NULL,
  `idsubcuentaivadedadue` int(11) DEFAULT NULL,
  `idsubcuentaivadevadue` int(11) DEFAULT NULL,
  `idsubcuentaivadeventue` int(11) DEFAULT NULL,
  `idsubcuentaivarepexe` int(11) DEFAULT NULL,
  `idsubcuentaivarepexp` int(11) DEFAULT NULL,
  `idsubcuentaivarepre` int(11) DEFAULT NULL,
  `idsubcuentaivasopagra` int(11) DEFAULT NULL,
  `idsubcuentaivasopexe` int(11) DEFAULT NULL,
  `idsubcuentaivasopimp` int(11) DEFAULT NULL,
  `idsubcuentarep` int(11) DEFAULT NULL,
  `idsubcuentasop` int(11) DEFAULT NULL,
  `iva` double NOT NULL,
  `recargo` double NOT NULL,
  PRIMARY KEY (`codimpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `impuestos`
#

INSERT INTO impuestos VALUES ('IVA0', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Exento', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO impuestos VALUES ('IVA10.5', '', '', '', '', '', '', '', '', '', '', '', '', '', 'IVA 10.5%', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10.5', '0');
INSERT INTO impuestos VALUES ('IVA21', '', '', '', '', '', '', '', '', '', '', '', '', '', 'IVA 21%', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21', '0');
INSERT INTO impuestos VALUES ('IVA27', '', '', '', '', '', '', '', '', '', '', '', '', '', 'IVA 27%', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27', '0');
INSERT INTO impuestos VALUES ('na', '', '', '', '', '', '', '', '', '', '', '', '', '', 'No Alcanzado', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');


#
# Estructura de la tabla `inme_fuentes`
#

DROP TABLE IF EXISTS `inme_fuentes`;
CREATE TABLE `inme_fuentes` (
  `codfuente` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codfuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `inme_fuentes`
#

INSERT INTO inme_fuentes VALUES ('meneame', 'http://www.meneame.net/rss2.php');
INSERT INTO inme_fuentes VALUES ('meneame-cola', 'http://www.meneame.net/rss2.php?status=queued');


#
# Estructura de la tabla `inme_noticias_fuente`
#

DROP TABLE IF EXISTS `inme_noticias_fuente`;
CREATE TABLE `inme_noticias_fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_relacionada` int(11) DEFAULT NULL,
  `url` varchar(300) COLLATE utf8_bin NOT NULL,
  `titulo` varchar(140) COLLATE utf8_bin DEFAULT NULL,
  `texto` text COLLATE utf8_bin,
  `resumen` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publicada` timestamp NULL DEFAULT NULL,
  `codfuente` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `tweets` int(11) DEFAULT NULL,
  `meneos` int(11) DEFAULT NULL,
  `popularidad` int(11) DEFAULT NULL,
  `keywords` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `preview` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `editada` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inme_noticias_fuente` (`codfuente`),
  CONSTRAINT `inme_noticias_fuente` FOREIGN KEY (`codfuente`) REFERENCES `inme_fuentes` (`codfuente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `inme_noticias_fuente`
#



#
# Estructura de la tabla `inme_temas`
#

DROP TABLE IF EXISTS `inme_temas`;
CREATE TABLE `inme_temas` (
  `codtema` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `titulo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `texto` text COLLATE utf8_bin,
  `imagen` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `articulos` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codtema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `inme_temas`
#

INSERT INTO inme_temas VALUES ('alemania', 'Alemania', 'Alemania', 'http://i.imgur.com/I8f9WXM.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('apple', 'Apple', 'Apple', 'http://i.imgur.com/Qttksz6.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('china', 'China', 'China', 'http://i.imgur.com/T5KsW3L.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('corrupcion', 'Corrupci', 'Corrupci', 'http://i.imgur.com/wYe54PC.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('ee-uu', 'EE.UU', 'Estados Unidos de Am?rica', 'http://i.imgur.com/MsZyxdq.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('eeuu', 'EE.UU', 'Estados Unidos de Am?rica', 'http://i.imgur.com/MsZyxdq.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('espanya', 'Espa', 'Espa?a (Reino de Espa', 'http://i.imgur.com/nDoxKF3.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('estados-unidos', 'EE.UU', 'Estados Unidos de Am?rica', 'http://i.imgur.com/MsZyxdq.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('google', 'Google', 'Google', 'http://i.imgur.com/Gh7Ib2o.png', '0', '1');
INSERT INTO inme_temas VALUES ('grafeno', 'Grafeno', 'Grafeno', 'http://i.imgur.com/jjlcWYu.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('grecia', 'Grecia', 'Grecia', 'http://i.imgur.com/FyyQJho.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('isis', 'ISIS', 'ISIS', 'http://i.imgur.com/qXgdYox.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('israel', 'Israel', 'Israel', 'http://i.imgur.com/2uRAhdA.png', '0', '1');
INSERT INTO inme_temas VALUES ('linux', 'Linux', 'Linux', 'http://i.imgur.com/zF5yVoQ.png', '0', '1');
INSERT INTO inme_temas VALUES ('microsoft', 'Microsoft', 'Microsoft', 'http://i.imgur.com/LLX8ddu.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('rusia', 'Rusia', 'Rusia', 'http://i.imgur.com/7WZu7fl.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('usa', 'EE.UU', 'Estados Unidos de Am?rica', 'http://i.imgur.com/MsZyxdq.jpg', '0', '1');
INSERT INTO inme_temas VALUES ('venezuela', 'Venezuela', 'Venezuela', 'http://i.imgur.com/jAB2UDd.jpg', '0', '1');


#
# Estructura de la tabla `lineasalbaranescli`
#

DROP TABLE IF EXISTS `lineasalbaranescli`;
CREATE TABLE `lineasalbaranescli` (
  `cantidad` double NOT NULL DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL DEFAULT '0',
  `idalbaran` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapedido` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL DEFAULT '0',
  `porcomision` double DEFAULT NULL,
  `pvpsindto` double NOT NULL DEFAULT '0',
  `pvptotal` double NOT NULL DEFAULT '0',
  `pvpunitario` double NOT NULL DEFAULT '0',
  `recargo` double DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasalbaranescli_albaranescli2` (`idalbaran`),
  CONSTRAINT `ca_lineasalbaranescli_albaranescli2` FOREIGN KEY (`idalbaran`) REFERENCES `albaranescli` (`idalbaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasalbaranescli`
#

INSERT INTO lineasalbaranescli VALUES ('1', 'IVA27', 'Medicamento', '0', '0', '4', '2', '', '', '0', '27', '', '150', '150', '150', '0', '');
INSERT INTO lineasalbaranescli VALUES ('1', 'IVA0', 'consulta', '0', '0', '4', '3', '', '', '0', '0', '', '150', '150', '150', '0', '');
INSERT INTO lineasalbaranescli VALUES ('1', 'IVA0', 'ASD', '0', '0', '5', '4', '', '', '0', '0', '', '0', '0', '0', '0', 'ASD');


#
# Estructura de la tabla `lineasalbaranesprov`
#

DROP TABLE IF EXISTS `lineasalbaranesprov`;
CREATE TABLE `lineasalbaranesprov` (
  `cantidad` double NOT NULL DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL DEFAULT '0',
  `idalbaran` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapedido` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL DEFAULT '0',
  `pvpsindto` double NOT NULL DEFAULT '0',
  `pvptotal` double NOT NULL DEFAULT '0',
  `pvpunitario` double NOT NULL DEFAULT '0',
  `recargo` double DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasalbaranesprov_albaranesprov2` (`idalbaran`),
  CONSTRAINT `ca_lineasalbaranesprov_albaranesprov2` FOREIGN KEY (`idalbaran`) REFERENCES `albaranesprov` (`idalbaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasalbaranesprov`
#

INSERT INTO lineasalbaranesprov VALUES ('1', 'IVA0', 'Articulo', '0', '0', '2', '2', '', '', '0', '0', '2', '2', '2', '0', 'Articulo');


#
# Estructura de la tabla `lineasfacturascli`
#

DROP TABLE IF EXISTS `lineasfacturascli`;
CREATE TABLE `lineasfacturascli` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idalbaran` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `porcomision` double DEFAULT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_linea_facturascli2` (`idfactura`),
  CONSTRAINT `ca_linea_facturascli2` FOREIGN KEY (`idfactura`) REFERENCES `facturascli` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasfacturascli`
#

INSERT INTO lineasfacturascli VALUES ('1', 'IVA0', 'ASD', '0', '0', '5', '13', '14', '0', '0', '', '0', '0', '0', '0', 'ASD');


#
# Estructura de la tabla `lineasfacturasprov`
#

DROP TABLE IF EXISTS `lineasfacturasprov`;
CREATE TABLE `lineasfacturasprov` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idalbaran` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double DEFAULT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_linea_facturasprov2` (`idfactura`),
  CONSTRAINT `ca_linea_facturasprov2` FOREIGN KEY (`idfactura`) REFERENCES `facturasprov` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasfacturasprov`
#

INSERT INTO lineasfacturasprov VALUES ('1', 'IVA0', '', 'Articulo', '0', '0', '2', '3', '2', '', '0', '0', '2', '2', '2', '0', 'Articulo');


#
# Estructura de la tabla `lineasivafactcli`
#

DROP TABLE IF EXISTS `lineasivafactcli`;
CREATE TABLE `lineasivafactcli` (
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `recargo` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totallinea` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaiva_facturascli2` (`idfactura`),
  CONSTRAINT `ca_lineaiva_facturascli2` FOREIGN KEY (`idfactura`) REFERENCES `facturascli` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasivafactcli`
#

INSERT INTO lineasivafactcli VALUES ('IVA0', '13', '4', '0', '0', '0', '0', '0', '0');


#
# Estructura de la tabla `lineasivafactprov`
#

DROP TABLE IF EXISTS `lineasivafactprov`;
CREATE TABLE `lineasivafactprov` (
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `recargo` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totallinea` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaiva_facturasprov2` (`idfactura`),
  CONSTRAINT `ca_lineaiva_facturasprov2` FOREIGN KEY (`idfactura`) REFERENCES `facturasprov` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasivafactprov`
#

INSERT INTO lineasivafactprov VALUES ('IVA0', '3', '2', '0', '2', '0', '0', '2', '0');


#
# Estructura de la tabla `lineaspedidoscli`
#

DROP TABLE IF EXISTS `lineaspedidoscli`;
CREATE TABLE `lineaspedidoscli` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapresupuesto` int(11) DEFAULT NULL,
  `idpedido` int(11) NOT NULL,
  `idpresupuesto` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `totalenalbaran` double DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaspedidoscli_pedidoscli` (`idpedido`),
  CONSTRAINT `ca_lineaspedidoscli_pedidoscli` FOREIGN KEY (`idpedido`) REFERENCES `pedidoscli` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineaspedidoscli`
#

INSERT INTO lineaspedidoscli VALUES ('1', 'IVA21', 'DIVERSIONES', '0', '0', '11', '0', '12', '0', '0', '21', '10.25', '10.25', '10.25', '0', 'GALLETAS_DIVERSION', '0');
INSERT INTO lineaspedidoscli VALUES ('1', 'IVA21', 'MEDIAS', '0', '50', '12', '16', '13', '16', '0', '21', '12', '6', '12', '0', 'MEDIAS', '0');
INSERT INTO lineaspedidoscli VALUES ('1', 'IVA21', 'DIVERSIONES', '0', '0', '13', '0', '14', '0', '0', '21', '10.25', '10.25', '10.25', '0', 'GALLETAS_DIVERSION', '0');
INSERT INTO lineaspedidoscli VALUES ('1', 'IVA0', 'SISTEMA SARTIN', '0', '0', '14', '0', '15', '0', '0', '0', '2000', '2000', '2000', '0', 'SISTEMA_SARTIN', '0');


#
# Estructura de la tabla `lineaspedidosprov`
#

DROP TABLE IF EXISTS `lineaspedidosprov`;
CREATE TABLE `lineaspedidosprov` (
  `pvptotal` double NOT NULL,
  `cantidad` double NOT NULL,
  `irpf` double DEFAULT NULL,
  `recargo` double DEFAULT NULL,
  `dtolineal` double DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cerrada` tinyint(1) DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `dtopor` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `totalenalbaran` double DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaspedidosprov_pedidosprov` (`idpedido`),
  CONSTRAINT `ca_lineaspedidosprov_pedidosprov` FOREIGN KEY (`idpedido`) REFERENCES `pedidosprov` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineaspedidosprov`
#



#
# Estructura de la tabla `lineaspresupuestoscli`
#

DROP TABLE IF EXISTS `lineaspresupuestoscli`;
CREATE TABLE `lineaspresupuestoscli` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idpresupuesto` int(11) NOT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaspresupuestoscli_presupuestoscli` (`idpresupuesto`),
  CONSTRAINT `ca_lineaspresupuestoscli_presupuestoscli` FOREIGN KEY (`idpresupuesto`) REFERENCES `presupuestoscli` (`idpresupuesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineaspresupuestoscli`
#

INSERT INTO lineaspresupuestoscli VALUES ('1', 'IVA21', 'MEDIAS', '0', '0', '14', '14', '0', '21', '12', '12', '12', '0', 'MEDIAS');
INSERT INTO lineaspresupuestoscli VALUES ('1', 'IVA21', 'DIVERSIONES', '0', '0', '15', '15', '0', '21', '10.25', '10.25', '10.25', '0', 'GALLETAS_DIVERSION');
INSERT INTO lineaspresupuestoscli VALUES ('1', 'IVA21', 'MEDIAS', '0', '50', '16', '16', '0', '21', '12', '6', '12', '0', 'MEDIAS');


#
# Estructura de la tabla `lineasregstocks`
#

DROP TABLE IF EXISTS `lineasregstocks`;
CREATE TABLE `lineasregstocks` (
  `cantidadfin` double NOT NULL DEFAULT '0',
  `cantidadini` double NOT NULL DEFAULT '0',
  `codalmacendest` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idstock` int(11) NOT NULL,
  `motivo` text COLLATE utf8_bin,
  `nick` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_lineasregstocks_stocks` (`idstock`),
  CONSTRAINT `ca_lineasregstocks_stocks` FOREIGN KEY (`idstock`) REFERENCES `stocks` (`idstock`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasregstocks`
#



#
# Estructura de la tabla `lineasservicioscli`
#

DROP TABLE IF EXISTS `lineasservicioscli`;
CREATE TABLE `lineasservicioscli` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapresupuesto` int(11) DEFAULT NULL,
  `idservicio` int(11) NOT NULL,
  `idpresupuesto` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `totalenalbaran` double DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasservicioscli_servicioscli` (`idservicio`),
  CONSTRAINT `ca_lineasservicioscli_servicioscli` FOREIGN KEY (`idservicio`) REFERENCES `servicioscli` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `lineasservicioscli`
#

INSERT INTO lineasservicioscli VALUES ('1', 'IVA27', 'Medicamento', '0', '0', '1', '', '27', '', '0', '27', '150', '150', '150', '0', '', '');
INSERT INTO lineasservicioscli VALUES ('1', 'IVA0', 'consulta', '0', '0', '2', '', '27', '', '0', '0', '150', '150', '150', '0', '', '');
INSERT INTO lineasservicioscli VALUES ('1', 'IVA0', 'D', '0', '0', '3', '', '34', '', '0', '0', '2', '2', '2', '0', 'AS', '');


#
# Estructura de la tabla `paises`
#

DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `validarprov` tinyint(1) DEFAULT NULL,
  `codiso` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `bandera` text COLLATE utf8_bin,
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `paises`
#

INSERT INTO paises VALUES ('0', 'AD', '', 'Andorra', 'AND');
INSERT INTO paises VALUES ('0', 'AR', '', 'Argentina', 'ARG');
INSERT INTO paises VALUES ('0', 'BO', '', 'Bolivia', 'BOL');
INSERT INTO paises VALUES ('0', 'CL', '', 'Chile', 'CHL');
INSERT INTO paises VALUES ('0', 'CO', '', 'Colombia', 'COL');
INSERT INTO paises VALUES ('0', 'CR', '', 'Costa Rica', 'CRI');
INSERT INTO paises VALUES ('0', 'CU', '', 'Cuba', 'CUB');
INSERT INTO paises VALUES ('0', 'DO', '', 'Rep?blica Dominicana', 'DOM');
INSERT INTO paises VALUES ('0', 'EC', '', 'Ecuador', 'ECU');
INSERT INTO paises VALUES ('0', 'ES', '', 'Espa', 'ESP');
INSERT INTO paises VALUES ('0', 'GQ', '', 'Guinea Ecuatorial', 'GNQ');
INSERT INTO paises VALUES ('0', 'GT', '', 'Guatemala', 'GTM');
INSERT INTO paises VALUES ('0', 'HN', '', 'Honduras', 'HND');
INSERT INTO paises VALUES ('0', 'MX', '', 'M?xico', 'MEX');
INSERT INTO paises VALUES ('0', 'NI', '', 'Nicaragua', 'NIC');
INSERT INTO paises VALUES ('0', 'PA', '', 'Panam', 'PAN');
INSERT INTO paises VALUES ('0', 'PE', '', 'Per?', 'PER');
INSERT INTO paises VALUES ('0', 'PR', '', 'Puerto Rico', 'PRI');
INSERT INTO paises VALUES ('0', 'PY', '', 'Paraguay', 'PRY');
INSERT INTO paises VALUES ('0', 'SV', '', 'El Salvador', 'SLV');
INSERT INTO paises VALUES ('0', 'UY', '', 'Uruguay', 'URY');
INSERT INTO paises VALUES ('0', 'VE', '', 'Venezuela', 'VEN');


#
# Estructura de la tabla `pedidoscli`
#

DROP TABLE IF EXISTS `pedidoscli`;
CREATE TABLE `pedidoscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(12) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `fechasalida` date DEFAULT NULL,
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL,
  `neto` double NOT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `servido` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `totaleuros` double NOT NULL,
  `totalirpf` double NOT NULL,
  `totaliva` double NOT NULL,
  `totalrecargo` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `uniq_codigo_pedidoscli` (`codigo`),
  KEY `ca_pedidoscli_series` (`codserie`),
  KEY `ca_pedidoscli_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_pedidoscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_pedidoscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `pedidoscli`
#

INSERT INTO pedidoscli VALUES ('', '', '', '3', 'ALG', '000001', '0', 'ARS', '2015', '20150A000012', 'CONT', 'ARG', '', 'A', '', '0', '2015-12-02', '08:51:43', '0000-00-00', '12', '0', '0', '0', '10.25', 'CONSUMIDOR FINAL', '12', '', '', '0', '', '0', '', '10.83', '12.4', '134.292', '0', '2.15', '0', '2');
INSERT INTO pedidoscli VALUES ('', '123456789', 'Caleta Olivia', '1', 'ALG', '000004', '0', 'ARS', '2015', '20150A000013', 'CONT', 'ARG', '9011', 'A', '', '1', '2015-12-09', '02:59:51', '0000-00-00', '13', '0', '0', '0', '6', 'Miguel san martin', '13', '', '', '0', 'Santa Cruz', '0', '', '10.83', '7.26', '78.6258', '0', '1.26', '0', '0');
INSERT INTO pedidoscli VALUES ('', '123456789', 'Caleta Olivia', '3', 'ALG', '000004', '0', 'ARS', '2015', '20150A000014', 'CONT', 'ARG', '9011', 'A', '', '0', '2015-12-09', '03:10:06', '0000-00-00', '14', '8', '0', '0', '10.25', 'Miguel san martin', '14', '', '', '5', 'Santa Cruz', '0', '', '10.83', '12.4', '134.292', '0', '2.15', '0', '1');
INSERT INTO pedidoscli VALUES ('', '', 'Caleta Olivia', '3', 'ALG', '000003', '0', 'ARS', '2015', '20150A000015', 'CONT', 'ARG', '', 'A', '', '0', '2015-12-09', '03:12:42', '0000-00-00', '15', '9', '0', '0', '2000', 'Camila siares', '15', '', '', '5', 'Santa Cruz', '0', '', '10.83', '2000', '21660', '0', '0', '0', '1');


#
# Estructura de la tabla `pedidosprov`
#

DROP TABLE IF EXISTS `pedidosprov`;
CREATE TABLE `pedidosprov` (
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `totaleuros` double NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `irpf` double DEFAULT NULL,
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `servido` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `fechaentrada` date DEFAULT NULL,
  `totalrecargo` double DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `neto` double NOT NULL,
  `totalirpf` double DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `totaliva` double NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `uniq_codigo_pedidosprov` (`codigo`),
  KEY `ca_pedidosprov_series` (`codserie`),
  KEY `ca_pedidosprov_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_pedidosprov_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_pedidosprov_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `pedidosprov`
#



#
# Estructura de la tabla `presupuestoscli`
#

DROP TABLE IF EXISTS `presupuestoscli`;
CREATE TABLE `presupuestoscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(12) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codoportunidad` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `estado` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `finoferta` date DEFAULT NULL,
  `fechasalida` date DEFAULT NULL,
  `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL,
  `neto` double NOT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `totaleuros` double NOT NULL,
  `totalirpf` double NOT NULL,
  `totaliva` double NOT NULL,
  `totalrecargo` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpresupuesto`),
  UNIQUE KEY `uniq_codigo_presupuestoscli` (`codigo`),
  KEY `ca_presupuestoscli_series` (`codserie`),
  KEY `ca_presupuestoscli_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_presupuestoscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_presupuestoscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `presupuestoscli`
#

INSERT INTO presupuestoscli VALUES ('', '', '', '1', 'ALG', '000001', '0', 'ARS', '2015', '20150A000014', '', 'CONT', 'ARG', '', 'A', '', '1', '', '2015-10-30', '14:58:16', '2015-11-30', '0000-00-00', '14', '0', '0', '0', '12', 'CONSUMIDOR FINAL', '14', '', 'Pago 1', '0', '', '0', '10.83', '14.52', '157.2516', '0', '2.52', '0', '0');
INSERT INTO presupuestoscli VALUES ('', '', '', '1', 'ALG', '000001', '0', 'ARS', '2015', '20150A000015', '', 'CONT', 'ARG', '', 'A', '', '1', '', '2015-12-05', '22:35:41', '2016-01-05', '0000-00-00', '15', '0', '0', '0', '10.25', 'CONSUMIDOR FINAL', '15', '', '', '0', '', '0', '10.83', '12.4', '134.292', '0', '2.15', '0', '2');
INSERT INTO presupuestoscli VALUES ('', '123456789', 'Caleta Olivia', '1', 'ALG', '000004', '0', 'ARS', '2015', '20150A000016', '', 'CONT', 'ARG', '9011', 'A', '', '0', '', '2015-12-09', '02:59:35', '2016-01-09', '0000-00-00', '16', '13', '0', '0', '6', 'Miguel san martin', '16', '', '', '0', 'Santa Cruz', '0', '10.83', '7.26', '78.6258', '0', '1.26', '0', '1');


#
# Estructura de la tabla `proveedores`
#

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `cifnif` varchar(20) COLLATE utf8_bin NOT NULL,
  `codcontacto` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentadom` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentapago` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `ivaportes` double DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `recfinanciero` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `regimeniva` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `telefono1` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `tipoidfiscal` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'NIF',
  `web` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `acreedor` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`codproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `proveedores`
#

INSERT INTO proveedores VALUES ('17856275', '', '', '', 'ARS', 'CONT', '000001', 'A', '', '', '', '', '', '', 'TecnopolÌs', 'TecnopolÌs', '', '', 'General', '', '', 'NIF', '', '0');


#
# Estructura de la tabla `secuencias`
#

DROP TABLE IF EXISTS `secuencias`;
CREATE TABLE `secuencias` (
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idsec` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `valorout` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsec`),
  KEY `ca_secuencias_secuenciasejercicios` (`id`),
  CONSTRAINT `ca_secuencias_secuenciasejercicios` FOREIGN KEY (`id`) REFERENCES `secuenciasejercicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `secuencias`
#

INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '1', 'nfacturaprov', '1', '8');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '2', 'npedidoprov', '1', '2');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '3', 'npresupuestocli', '1', '17');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '4', 'nfacturacli', '1', '69');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '5', 'npedidocli', '1', '16');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '6', 'nalbaranprov', '1', '2');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '7', 'nalbarancli', '1', '10');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2015 y la serie A', '1', '8', 'nserviciocli', '1', '2');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2016 y la serie A', '2', '9', 'nalbarancli', '1', '14');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2016 y la serie A', '2', '10', 'nfacturacli', '1', '4');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2016 y la serie A', '2', '11', 'nserviciocli', '1', '37');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2016 y la serie A', '2', '12', 'nalbaranprov', '1', '3');
INSERT INTO secuencias VALUES ('Secuencia del ejercicio 2016 y la serie A', '2', '13', 'nfacturaprov', '1', '3');


#
# Estructura de la tabla `secuenciasejercicios`
#

DROP TABLE IF EXISTS `secuenciasejercicios`;
CREATE TABLE `secuenciasejercicios` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nalbarancli` int(11) NOT NULL,
  `nalbaranprov` int(11) NOT NULL,
  `nfacturacli` int(11) NOT NULL,
  `nfacturaprov` int(11) NOT NULL,
  `npedidocli` int(11) NOT NULL,
  `npedidoprov` int(11) NOT NULL,
  `npresupuestocli` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_secuenciasejercicios_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_secuenciasejercicios_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `secuenciasejercicios`
#

INSERT INTO secuenciasejercicios VALUES ('2015', 'A', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO secuenciasejercicios VALUES ('2016', 'A', '2', '1', '1', '1', '1', '1', '1', '1');


#
# Estructura de la tabla `series`
#

DROP TABLE IF EXISTS `series`;
CREATE TABLE `series` (
  `irpf` double DEFAULT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `siniva` tinyint(1) DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `numfactura` int(11) DEFAULT '1',
  PRIMARY KEY (`codserie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `series`
#

INSERT INTO series VALUES ('0', '0', 'A', '2016', '0', '', '', '1');


#
# Estructura de la tabla `servicioscli`
#

DROP TABLE IF EXISTS `servicioscli`;
CREATE TABLE `servicioscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `cifnif` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `garantia` tinyint(1) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `fechafin` date DEFAULT NULL,
  `horafin` time DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `horainicio` time DEFAULT NULL,
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `neto` double NOT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `descripcion` text COLLATE utf8_bin,
  `solucion` text COLLATE utf8_bin,
  `material` text COLLATE utf8_bin,
  `material_estado` text COLLATE utf8_bin,
  `accesorios` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `totaleuros` double DEFAULT NULL,
  `totalirpf` double NOT NULL,
  `totaliva` double NOT NULL,
  `totalrecargo` double DEFAULT NULL,
  `idestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idservicio`),
  UNIQUE KEY `uniq_codigo_servicioscli` (`codigo`),
  KEY `ca_servicioscli_series` (`codserie`),
  KEY `ca_servicioscli_ejercicios` (`codejercicio`),
  KEY `ca_servicios_albaranescli` (`idalbaran`),
  CONSTRAINT `ca_servicios_albaranescli` FOREIGN KEY (`idalbaran`) REFERENCES `albaranescli` (`idalbaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_servicioscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_servicioscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `servicioscli`
#

INSERT INTO servicioscli VALUES ('', '3', '15856374', 'Caleta Olivia', '2', 'ALG', '000001', '', 'ARS', '2016', '20160A000026', 'OSDIPP', 'ARG', '', 'A', '', '1', '0', '2016-03-08', '11:51:08', '2016-03-08', '12:20:00', '2016-03-08', '11:50:00', '27', '4', '', '0', '300', 'Julio Rodriguez', '26', '', 'Observacion extra', 'diagnÛstico', 'tratamiento', 'Dolor de estomago', 'Enfermedad actual', 'examen fisico', '0', 'Santa Cruz', '0', '15.64', '340.5', '5325.42', '0', '40.5', '0', '100');
INSERT INTO servicioscli VALUES ('', '3', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000033', 'OSDIPP', 'ARG', '', 'A', '', '1', '0', '2016-03-10', '18:25:24', '2016-03-10', '18:55:00', '2016-03-10', '18:25:00', '34', '', '', '0', '2', 'MIGUEL SAN MARTIN', '33', '', '', '', '', 'd', 'd', 'd', '0', 'Santa Cruz', '0', '15.64', '2', '31.28', '0', '0', '0', '100');
INSERT INTO servicioscli VALUES ('', '3', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000034', 'OSDIPP', 'ARG', '', 'A', '', '1', '0', '2016-03-10', '18:25:57', '2016-03-10', '18:55:00', '2016-03-10', '18:25:00', '35', '', '', '0', '0', 'MIGUEL SAN MARTIN', '34', '', '', '', '', 'd', 'd', 'd', '0', 'Santa Cruz', '0', '15.64', '0', '0', '0', '0', '0', '1');
INSERT INTO servicioscli VALUES ('', '3', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000035', 'OSDIPP', 'ARG', '', 'A', '', '1', '0', '2016-03-10', '18:26:09', '2016-03-10', '18:55:00', '2016-03-10', '18:25:00', '36', '', '', '0', '0', 'MIGUEL SAN MARTIN', '35', '', '', '', '', 'd', 'd', 'd', '0', 'Santa Cruz', '0', '15.64', '0', '0', '0', '0', '0', '1');
INSERT INTO servicioscli VALUES ('', '3', '38905797', 'Caleta Olivia', '2', 'ALG', '000002', '', 'ARS', '2016', '20160A000036', 'OSDIPP', 'ARG', '', 'A', '', '1', '0', '2016-03-10', '18:28:33', '2016-03-10', '18:55:00', '2016-03-10', '18:25:00', '37', '', '', '0', '0', 'MIGUEL SAN MARTIN', '36', '', '', '', '', 'd', 'd', 'd', '0', 'Santa Cruz', '0', '15.64', '0', '0', '0', '0', '0', '1');


#
# Estructura de la tabla `stocks`
#

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `disponible` double NOT NULL,
  `stockmin` double NOT NULL DEFAULT '0',
  `reservada` double NOT NULL,
  `horaultreg` time DEFAULT '00:00:00',
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pterecibir` double NOT NULL,
  `fechaultreg` date DEFAULT '2016-03-10',
  `codalmacen` varchar(4) COLLATE utf8_bin NOT NULL,
  `cantidadultreg` double NOT NULL DEFAULT '0',
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL DEFAULT '0',
  `stockmax` double NOT NULL DEFAULT '0',
  `ubicacion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idstock`),
  UNIQUE KEY `uniq_stocks_almacen_referencia` (`codalmacen`,`referencia`),
  KEY `ca_stocks_articulos2` (`referencia`),
  CONSTRAINT `ca_stocks_almacenes3` FOREIGN KEY (`codalmacen`) REFERENCES `almacenes` (`codalmacen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_stocks_articulos2` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `stocks`
#

INSERT INTO stocks VALUES ('ASD', '0', '0', '0', '00:00:00', '', '0', '2016-03-10', 'ALG', '0', '1', '0', '0', '');


#
# Estructura de la tabla `tarifas`
#

DROP TABLE IF EXISTS `tarifas`;
CREATE TABLE `tarifas` (
  `incporcentual` double NOT NULL,
  `inclineal` double NOT NULL,
  `aplicar_a` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `mincoste` tinyint(1) DEFAULT '0',
  `maxpvp` tinyint(1) DEFAULT '0',
  `codtarifa` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codtarifa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Volcado de datos de la tabla `tarifas`
#



SET FOREIGN_KEY_CHECKS=1;



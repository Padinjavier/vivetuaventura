-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.2.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla agencia.detalle_salida
CREATE TABLE IF NOT EXISTS `detalle_salida` (
  `iddetalle_salida` bigint NOT NULL AUTO_INCREMENT,
  `idsalida` bigint DEFAULT NULL,
  `idservicio` bigint DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`iddetalle_salida`) USING BTREE,
  KEY `idsalida` (`idsalida`),
  KEY `idservicio` (`idservicio`),
  CONSTRAINT `FK_detalle_salida_salida` FOREIGN KEY (`idsalida`) REFERENCES `salida` (`idsalida`),
  CONSTRAINT `FK_detalle_salida_servicio` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_salida: ~3 rows (aproximadamente)
DELETE FROM `detalle_salida`;
INSERT INTO `detalle_salida` (`iddetalle_salida`, `idsalida`, `idservicio`, `cantidad`) VALUES
	(5, 2, 3, 3),
	(6, 2, 4, 4),
	(9, 3, 2, 8);

-- Volcando estructura para tabla agencia.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalleventa` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `idservicio` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`iddetalleventa`) USING BTREE,
  KEY `idservicio` (`idservicio`) USING BTREE,
  KEY `idventa` (`codigo_venta`) USING BTREE,
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`codigo_venta`) REFERENCES `venta` (`codigo_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_venta: ~3 rows (aproximadamente)
DELETE FROM `detalle_venta`;
INSERT INTO `detalle_venta` (`iddetalleventa`, `codigo_venta`, `idservicio`, `cantidad`, `precio`, `descuento`) VALUES
	(3, 'v_1', 3, 1, 5.00, NULL),
	(4, 'v_1', 4, 1, 13.00, NULL),
	(5, 'v_2', 2, 1, 10.00, 2.00);

-- Volcando estructura para tabla agencia.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.modulo: ~11 rows (aproximadamente)
DELETE FROM `modulo`;
INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
	(1, 'Dashboard', 'Dashboard', 1),
	(2, 'Empleado', 'Usuarios del sistema', 1),
	(3, 'Clientes', 'Clientes de tienda', 1),
	(4, 'Productos', 'Todos los productos', 1),
	(5, 'Pedidos', 'Pedidos', 1),
	(6, 'Servicios', 'Caterogías Productos', 1),
	(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
	(8, 'Contactos', 'Mensajes del formulario contacto', 1),
	(9, 'Páginas', 'Páginas del sitio web', 1),
	(10, 'Opciones', 'opciones de pagina', 1),
	(11, 'Usuarios', 'usuario', 1);

-- Volcando estructura para tabla agencia.opciones
CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personaid` bigint DEFAULT NULL,
  `idioma` int DEFAULT NULL,
  `tema` int DEFAULT NULL,
  `formato_moneda` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idpersona` (`personaid`) USING BTREE,
  CONSTRAINT `FK_opciones_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.opciones: ~1 rows (aproximadamente)
DELETE FROM `opciones`;
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(13, 22, 1, 1, 1);

-- Volcando estructura para tabla agencia.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` bigint NOT NULL AUTO_INCREMENT,
  `rolid` bigint NOT NULL,
  `moduloid` bigint NOT NULL,
  `r` int NOT NULL DEFAULT '0',
  `w` int NOT NULL DEFAULT '0',
  `u` int NOT NULL DEFAULT '0',
  `d` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpermiso`),
  KEY `moduloid` (`moduloid`),
  KEY `rolid` (`rolid`) USING BTREE,
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol_usuario` (`idrolusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.permisos: ~39 rows (aproximadamente)
DELETE FROM `permisos`;
INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
	(21, 3, 1, 0, 0, 0, 0),
	(22, 3, 2, 0, 0, 0, 0),
	(23, 3, 3, 0, 0, 0, 0),
	(24, 3, 4, 0, 0, 0, 0),
	(25, 3, 5, 1, 0, 0, 0),
	(26, 3, 6, 0, 0, 0, 0),
	(27, 3, 7, 0, 0, 0, 0),
	(28, 3, 8, 0, 0, 0, 0),
	(29, 3, 9, 0, 0, 0, 0),
	(165, 1, 1, 1, 1, 1, 1),
	(166, 1, 2, 1, 1, 1, 1),
	(167, 1, 3, 1, 1, 1, 1),
	(168, 1, 4, 1, 1, 1, 1),
	(169, 1, 5, 1, 1, 1, 1),
	(170, 1, 6, 1, 1, 1, 1),
	(171, 1, 7, 1, 1, 1, 1),
	(172, 1, 8, 1, 1, 1, 1),
	(173, 1, 9, 1, 1, 1, 1),
	(174, 2, 1, 1, 1, 1, 1),
	(175, 2, 2, 1, 1, 1, 1),
	(176, 2, 3, 1, 1, 1, 1),
	(177, 2, 4, 1, 1, 1, 1),
	(178, 2, 5, 1, 1, 1, 1),
	(179, 2, 6, 1, 1, 1, 1),
	(180, 2, 7, 1, 1, 1, 1),
	(181, 2, 8, 1, 1, 1, 1),
	(182, 2, 9, 1, 1, 1, 1),
	(206, 1, 11, 1, 1, 1, 1),
	(229, 4, 1, 1, 1, 0, 0),
	(230, 4, 2, 0, 0, 0, 0),
	(231, 4, 3, 1, 1, 1, 0),
	(232, 4, 4, 1, 0, 0, 0),
	(233, 4, 5, 1, 1, 1, 0),
	(234, 4, 6, 0, 1, 0, 0),
	(235, 4, 7, 1, 0, 1, 0),
	(236, 4, 8, 1, 0, 0, 0),
	(237, 4, 9, 0, 0, 0, 0),
	(238, 4, 10, 0, 0, 0, 0),
	(239, 4, 11, 0, 0, 0, 0);

-- Volcando estructura para tabla agencia.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `email_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `hotel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  `direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolidempleado` bigint DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`),
  KEY `rolidempleado` (`rolidempleado`),
  CONSTRAINT `FK_persona_rol` FOREIGN KEY (`rolid`) REFERENCES `rol_usuario` (`idrolusuario`),
  CONSTRAINT `FK_persona_rol_empleado` FOREIGN KEY (`rolidempleado`) REFERENCES `rol_empleado` (`idrolempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.persona: ~16 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `hotel`, `token`, `rolid`, `datecreated`, `status`, `direccion`, `ciudad`, `rolidempleado`) VALUES
	(2, '73621360', 'Jeanettis Mariel', 'Luyo Correa', 910089718, 'jluyo@gmail.com', '1a5376ad727d65213a79f3108541cf95012969a0d3064f108b5dd6e7f8c19b89', NULL, NULL, 2, '2023-11-29 10:57:56', 1, NULL, NULL, NULL),
	(22, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'ID tributo javier', '0b29bd63a450601e8de9-46a10d5e89d9c8d8010f-34f01ff7f4adc772e209-2598a10910d6573c55cd', 1, '2023-11-10 03:11:09', 1, '111111', '2222', NULL),
	(24, 'JUAN LLOCYA', 'Juan Manuel', 'Llocya Castro', 918313532, 'jllocya@system32.shop', '', 'sssssss', NULL, NULL, '2023-11-29 11:03:25', 0, NULL, NULL, 1),
	(28, '72014145', 'Alex', 'Huasasquiche', 946454569, 'ahuasasquiche@gmail.com', '', NULL, NULL, NULL, '2023-12-06 17:27:31', 0, NULL, NULL, 1),
	(29, '74199532', 'Javier Padin UNDC', 'Padin Flores', 9171893004, '2002010167@undc.edu.pe', '', NULL, NULL, NULL, '2023-12-16 10:41:03', 0, 'Av Lima', 'Quilmana', 1),
	(30, '4444444444', 'FRANK', 'GALAGER', 99999999, 'FRANK@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'lima', NULL, 3, '2024-05-12 23:57:54', 1, NULL, NULL, NULL),
	(56, '75486524', 'JHON VIGNEY', 'ROMERO MELCHOR', 918313532, 'javierpadin6w61@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:34:47', 1, NULL, NULL, 20),
	(57, '23232323', 'Jeanettis Mariel', 'CHAVEZ SANCHEZ', 910089718, 'javierpad23in661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:39:53', 1, NULL, NULL, 21),
	(58, '2323234', 'Juanggiii', 'Herrera', 111111111111111, 'javiegggrpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:40:10', 1, NULL, NULL, 22),
	(59, '666', 'NANCY YANINA', 'MAZA SUAREZ', 910089718, 'javierpa66din661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 09:25:41', 1, NULL, NULL, 22),
	(60, '72014148', 'AZALIA ABIGAIL', 'CONTRERAS BRAVO', 946454569, 'javiderpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:20:49', 1, NULL, NULL, 1),
	(61, '74199534', 'RICHARD CESAR ALEXANDER', 'SANCHEZ LOPEZ', 946454573, 'javier11paeedin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:28:45', 1, NULL, NULL, 1),
	(62, '72014141', 'JOSE ALEJANDRO', 'LA ROSA HUASASQUICHE', 946454569, 'javi1erpad1in661@gmail.com', NULL, '1111111', NULL, 3, '2024-06-09 21:59:26', 1, NULL, NULL, NULL),
	(63, '74199539', 'BRANDOLEE VANDAMME', 'JARA PRINCIPE', 946454569, 'j666avie55rpadin661@gmail.com', NULL, 'peru', NULL, 3, '2024-06-09 22:03:34', 1, NULL, NULL, NULL),
	(64, '72014144', 'Lunes', 'Huasasquiche', 946454569, 'javierpa44444din661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, 2, '2024-06-10 00:20:37', 1, NULL, NULL, NULL),
	(65, '720144148', 'AZALIA ABIGAIL', 'CONTRERAS BRAVO', 946454569, 'javgggierpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-10 22:19:16', 1, NULL, NULL, 22);

-- Volcando estructura para tabla agencia.rol_empleado
CREATE TABLE IF NOT EXISTS `rol_empleado` (
  `idrolempleado` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolempleado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolempleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.rol_empleado: ~6 rows (aproximadamente)
DELETE FROM `rol_empleado`;
INSERT INTO `rol_empleado` (`idrolempleado`, `nombrerolempleado`, `descripcion`, `datecreated`, `status`) VALUES
	(1, 'Guia', 'GUIAR A LOS TURISTAS', '2024-06-09 20:25:52', 1),
	(20, 'CONDUCTOR', '111', '2024-06-09 20:25:53', 1),
	(21, 'KAYACK', '222', '2024-06-09 20:25:54', 1),
	(22, 'CARGADOR', '333', '2024-06-09 20:25:54', 1),
	(24, 'sww', 'wwwwwrrrwww', '0000-00-00 00:00:00', 0),
	(25, 'see', 'eeee', '0000-00-00 00:00:00', 0);

-- Volcando estructura para tabla agencia.rol_usuario
CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `idrolusuario` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolusuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolusuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.rol_usuario: ~5 rows (aproximadamente)
DELETE FROM `rol_usuario`;
INSERT INTO `rol_usuario` (`idrolusuario`, `nombrerolusuario`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendor', 'Operador de tienda', 1),
	(13, 'secretaria', 'secretaria de la tienda 1', 1);

-- Volcando estructura para tabla agencia.salida
CREATE TABLE IF NOT EXISTS `salida` (
  `idsalida` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `personaid` bigint DEFAULT NULL,
  `persona_externa` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `descripcion` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `pago` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idsalida`),
  KEY `codigo_venta` (`codigo_venta`),
  KEY `personaid` (`personaid`),
  CONSTRAINT `FK_salida_codigo_venta` FOREIGN KEY (`codigo_venta`) REFERENCES `venta` (`codigo_venta`),
  CONSTRAINT `FK_salidas_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.salida: ~2 rows (aproximadamente)
DELETE FROM `salida`;
INSERT INTO `salida` (`idsalida`, `codigo_venta`, `personaid`, `persona_externa`, `descripcion`, `datecreated`, `pago`, `status`) VALUES
	(2, 'v_1', 57, NULL, NULL, '2024-06-20 00:12:54', 2, 1),
	(3, 'v_1', NULL, 'juan', 'lunes', '2024-06-20 00:59:08', 1, 1);

-- Volcando estructura para tabla agencia.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idservicio` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(20,2) DEFAULT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idservicio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.servicio: ~5 rows (aproximadamente)
DELETE FROM `servicio`;
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Rafting y nado con salvavidas en el río', 'Emocionante aventura acuática en aguas bravas con guías expertos y equipo de seguridad.', 11.20, 'portada_servicio.png', '2024-05-13 19:46:32', 'rafting_y_nado_con_salvavidas_en_el_rio', 1),
	(2, 'Práctica de kayak y canotaje', 'Explora ríos y lagos a bordo de kayaks y canoas, ideal para amantes de la naturaleza.', 9.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'practica_de_kayak_y_canotaje', 1),
	(3, 'Tirolesa y parques de aventuras aéreas', 'Desafía la gravedad y disfruta de la adrenalina en recorridos por el aire entre árboles.', 5.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tirolesa_y_parques_de_aventuras_aereas', 1),
	(4, 'Tours extremos y de adrenalina', 'Experimenta emociones fuertes con actividades como rapel, bungee jumping y más.', 10.00, 'img_ee5da223d41a457c75108adb998ca63c.jpg', '2024-05-13 19:46:32', 'tours-extremos-y-de-adrenalina', 1),
	(5, 'Tours de naturaleza y vida silvestre', 'Descubre la diversidad natural y observa animales en su hábitat natural.', 10.00, 'img_bc833529de8d9b1871ec7e7756efda97.jpg', '2024-05-13 19:46:32', 'tours-de-naturaleza-y-vida-silvestre', 1);

-- Volcando estructura para tabla agencia.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.tipopago: ~258 rows (aproximadamente)
DELETE FROM `tipopago`;
INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
	(1, 'PayPal', 1),
	(2, 'Efectivo', 1),
	(3, 'Tarjeta', 1),
	(4, 'Cheque', 1),
	(5, 'Despósito Bancario', 1),
	(6, 'Yape', 1),
	(7, 'Plin', 1),
	(8, 'Transferencia Interbancaria', 1),
	(9, 'Depósito en Cuenta', 1),
	(10, 'Pago en Efectivo', 1),
	(11, 'Tarjeta de Débito', 1),
	(12, 'Tarjeta de Crédito', 1),
	(13, 'Yape', 1),
	(14, 'Plin', 1),
	(15, 'Transferencia CCI', 1),
	(16, 'Pago Móvil', 1),
	(17, 'Cheque', 1),
	(18, 'Letra de Cambio', 1),
	(19, 'Orden de Pago', 1),
	(20, 'Giro Bancario', 1),
	(21, 'Vale Vista', 1),
	(22, 'Pago con Código QR', 1),
	(23, 'Pago con Token', 1),
	(24, 'Pago con NFC', 1),
	(25, 'Domiciliación Bancaria', 1),
	(26, 'Pago por Ventanilla', 1),
	(27, 'Pago por Agente', 1),
	(28, 'Pago por Cajero Automático', 1),
	(29, 'Pago por Internet Banking', 1),
	(30, 'Cargo Automático', 1),
	(31, 'Bono de Vales', 1),
	(32, 'Tarjeta Alimentaria', 1),
	(33, 'Tarjeta Prepago', 1),
	(34, 'Tarjeta Regalo', 1),
	(35, 'Transferencia Interbancaria', 1),
	(36, 'Depósito en Cuenta', 1),
	(37, 'Pago en Efectivo', 1),
	(38, 'Tarjeta de Débito', 1),
	(39, 'Tarjeta de Crédito', 1),
	(40, 'Yape', 1),
	(41, 'Plin', 1),
	(42, 'Transferencia CCI', 1),
	(43, 'Pago Móvil', 1),
	(44, 'Cheque', 1),
	(45, 'Letra de Cambio', 1),
	(46, 'Orden de Pago', 1),
	(47, 'Giro Bancario', 1),
	(48, 'Vale Vista', 1),
	(49, 'Pago con Código QR', 1),
	(50, 'Pago con Token', 1),
	(51, 'Pago con NFC', 1),
	(52, 'Domiciliación Bancaria', 1),
	(53, 'Pago por Ventanilla', 1),
	(54, 'Pago por Agente', 1),
	(55, 'Pago por Cajero Automático', 1),
	(56, 'Pago por Internet Banking', 1),
	(57, 'Cargo Automático', 1),
	(58, 'Bono de Vales', 1),
	(59, 'Tarjeta Alimentaria', 1),
	(60, 'Tarjeta Prepago', 1),
	(61, 'Tarjeta Regalo', 1),
	(62, 'Pago con PayPal', 1),
	(63, 'Pago con Western Union', 1),
	(64, 'Pago con MoneyGram', 1),
	(65, 'Pago con PagoEfectivo', 1),
	(66, 'Pago con SafetyPay', 1),
	(67, 'Pago con Culqi', 1),
	(68, 'Pago con BIM', 1),
	(69, 'Pago con LUKITA', 1),
	(70, 'Pago con BBVA Wallet', 1),
	(71, 'Pago con Interbank APP', 1),
	(72, 'Pago con Scotiabank APP', 1),
	(73, 'Pago con Credinka Móvil', 1),
	(74, 'Pago con Banca por Teléfono', 1),
	(75, 'Pago con Google Pay', 1),
	(76, 'Pago con Apple Pay', 1),
	(77, 'Pago con Visa Checkout', 1),
	(78, 'Pago con Masterpass', 1),
	(79, 'Pago con Diners Club Pay', 1),
	(80, 'Pago con American Express SafeKey', 1),
	(81, 'Pago con PagoLink', 1),
	(82, 'Pago con ACH', 1),
	(83, 'Pago con Paynet', 1),
	(84, 'Pago con OXXO', 1),
	(85, 'Pago con Tarjeta Codensa', 1),
	(86, 'Pago con Efecty', 1),
	(87, 'Pago con Nequi', 1),
	(88, 'Pago con PSE', 1),
	(89, 'Pago con Baloto', 1),
	(90, 'Pago con DaviPlata', 1),
	(91, 'Pago con Redeban', 1),
	(92, 'Pago con Bancolombia App', 1),
	(93, 'Pago con Movii', 1),
	(94, 'Pago con AV Villas', 1),
	(95, 'Pago con Coopcentral', 1),
	(96, 'Pago con Colpatria', 1),
	(97, 'Pago con Grupo Aval', 1),
	(98, 'Pago con Banco Agrario', 1),
	(99, 'Pago con Banco de Bogotá', 1),
	(100, 'Pago con Banco de Occidente', 1),
	(101, 'Pago con Banco Popular', 1),
	(102, 'Pago con Bancoomeva', 1),
	(103, 'Pago con Bancolombia', 1),
	(104, 'Pago con Citibank', 1),
	(105, 'Pago con Itaú', 1),
	(106, 'Pago con Scotiabank Colpatria', 1),
	(107, 'Pago con Caja Social', 1),
	(108, 'Pago con Bancoomeva', 1),
	(109, 'Pago con Banco Santander', 1),
	(110, 'Pago con Banco Pichincha', 1),
	(111, 'Pago con Banco Caja Social', 1),
	(112, 'Pago con Banco Falabella', 1),
	(113, 'Pago con Banco GNB Sudameris', 1),
	(114, 'Pago con Banco CorpBanca', 1),
	(115, 'Pago con Banco Coopcentral', 1),
	(116, 'Pago con Banco Popular', 1),
	(117, 'Pago con Banco Finandina', 1),
	(118, 'Pago con Banco W', 1),
	(119, 'Pago con Banco Falabella', 1),
	(120, 'Pago con Banco Bogotá', 1),
	(121, 'Pago con Banco de Occidente', 1),
	(122, 'Pago con Banco Colpatria', 1),
	(123, 'Pago con Banco Itaú', 1),
	(124, 'Pago con Banco Pichincha', 1),
	(125, 'Pago con Banco Caja Social', 1),
	(126, 'Pago con Banco GNB Sudameris', 1),
	(127, 'Pago con Banco AV Villas', 1),
	(128, 'Pago con Banco Santander', 1),
	(129, 'Pago con Banco CorpBanca', 1),
	(130, 'Pago con Banco de Bogotá', 1),
	(131, 'Pago con Banco Popular', 1),
	(132, 'Pago con Banco Falabella', 1),
	(133, 'Pago con Banco Finandina', 1),
	(134, 'Pago con Banco de Occidente', 1),
	(135, 'Pago con Banco Caja Social', 1),
	(136, 'Pago con Banco Pichincha', 1),
	(137, 'Pago con Banco GNB Sudameris', 1),
	(138, 'Pago con Banco AV Villas', 1),
	(139, 'Pago con Banco Santander', 1),
	(140, 'Pago con Banco CorpBanca', 1),
	(141, 'Pago con Banco de Bogotá', 1),
	(142, 'Transferencia Interbancaria', 1),
	(143, 'Depósito en Cuenta', 1),
	(144, 'Pago en Efectivo', 1),
	(145, 'Tarjeta de Débito', 1),
	(146, 'Tarjeta de Crédito', 1),
	(147, 'Yape', 1),
	(148, 'Plin', 1),
	(149, 'Transferencia CCI', 1),
	(150, 'Pago Móvil', 1),
	(151, 'Cheque', 1),
	(152, 'Letra de Cambio', 1),
	(153, 'Orden de Pago', 1),
	(154, 'Giro Bancario', 1),
	(155, 'Vale Vista', 1),
	(156, 'Pago con Código QR', 1),
	(157, 'Pago con Token', 1),
	(158, 'Pago con NFC', 1),
	(159, 'Domiciliación Bancaria', 1),
	(160, 'Pago por Ventanilla', 1),
	(161, 'Pago por Agente', 1),
	(162, 'Pago por Cajero Automático', 1),
	(163, 'Pago por Internet Banking', 1),
	(164, 'Cargo Automático', 1),
	(165, 'Bono de Vales', 1),
	(166, 'Tarjeta Alimentaria', 1),
	(167, 'Tarjeta Prepago', 1),
	(168, 'Tarjeta Regalo', 1),
	(169, 'Pago con PayPal', 1),
	(170, 'Pago con Western Union', 1),
	(171, 'Pago con MoneyGram', 1),
	(172, 'Pago con PagoEfectivo', 1),
	(173, 'Pago con SafetyPay', 1),
	(174, 'Pago con Culqi', 1),
	(175, 'Pago con BIM', 1),
	(176, 'Pago con LUKITA', 1),
	(177, 'Pago con BBVA Wallet', 1),
	(178, 'Pago con Interbank APP', 1),
	(179, 'Pago con Scotiabank APP', 1),
	(180, 'Pago con Credinka Móvil', 1),
	(181, 'Pago con Banca por Teléfono', 1),
	(182, 'Pago con Google Pay', 1),
	(183, 'Pago con Apple Pay', 1),
	(184, 'Pago con Visa Checkout', 1),
	(185, 'Pago con Masterpass', 1),
	(186, 'Pago con Diners Club Pay', 1),
	(187, 'Pago con American Express SafeKey', 1),
	(188, 'Pago con PagoLink', 1),
	(189, 'Pago con ACH', 1),
	(190, 'Pago con Paynet', 1),
	(191, 'Pago con OXXO', 1),
	(192, 'Pago con Tarjeta Codensa', 1),
	(193, 'Pago con Efecty', 1),
	(194, 'Pago con Nequi', 1),
	(195, 'Pago con PSE', 1),
	(196, 'Pago con Baloto', 1),
	(197, 'Pago con DaviPlata', 1),
	(198, 'Pago con Redeban', 1),
	(199, 'Pago con Bancolombia App', 1),
	(200, 'Pago con Movii', 1),
	(201, 'Pago con AV Villas', 1),
	(202, 'Pago con Coopcentral', 1),
	(203, 'Pago con Colpatria', 1),
	(204, 'Pago con Grupo Aval', 1),
	(205, 'Pago con Banco Agrario', 1),
	(206, 'Pago con Banco de Bogotá', 1),
	(207, 'Pago con Banco de Occidente', 1),
	(208, 'Pago con Banco Popular', 1),
	(209, 'Pago con Bancoomeva', 1),
	(210, 'Pago con Bancolombia', 1),
	(211, 'Pago con Citibank', 1),
	(212, 'Pago con Itaú', 1),
	(213, 'Pago con Scotiabank Colpatria', 1),
	(214, 'Pago con Caja Social', 1),
	(215, 'Pago con Bancoomeva', 1),
	(216, 'Pago con Banco Santander', 1),
	(217, 'Pago con Banco Pichincha', 1),
	(218, 'Pago con Banco Caja Social', 1),
	(219, 'Pago con Banco Falabella', 1),
	(220, 'Pago con Banco GNB Sudameris', 1),
	(221, 'Pago con Banco CorpBanca', 1),
	(222, 'Pago con Banco Coopcentral', 1),
	(223, 'Pago con Banco Popular', 1),
	(224, 'Pago con Banco Finandina', 1),
	(225, 'Pago con Banco W', 1),
	(226, 'Pago con Banco Falabella', 1),
	(227, 'Pago con Banco Bogotá', 1),
	(228, 'Pago con Banco de Occidente', 1),
	(229, 'Pago con Banco Colpatria', 1),
	(230, 'Pago con Banco Itaú', 1),
	(231, 'Pago con Banco Pichincha', 1),
	(232, 'Pago con Banco Caja Social', 1),
	(233, 'Pago con Banco GNB Sudameris', 1),
	(234, 'Pago con Banco AV Villas', 1),
	(235, 'Pago con Banco Santander', 1),
	(236, 'Pago con Banco CorpBanca', 1),
	(237, 'Pago con Banco de Bogotá', 1),
	(238, 'Pago con Banco Popular', 1),
	(239, 'Pago con Banco Falabella', 1),
	(240, 'Pago con Banco Finandina', 1),
	(241, 'Pago con Banco de Occidente', 1),
	(242, 'Pago con Banco Caja Social', 1),
	(243, 'Pago con Banco Pichincha', 1),
	(244, 'Pago con Banco GNB Sudameris', 1),
	(245, 'Pago con Banco AV Villas', 1),
	(246, 'Pago con Banco Santander', 1),
	(247, 'Pago con Banco CorpBanca', 1),
	(248, 'Pago con Banco de Bogotá', 1),
	(249, 'Pago con Alipay', 1),
	(250, 'Pago con WeChat Pay', 1),
	(251, 'Pago con UnionPay', 1),
	(252, 'Pago con JCB', 1),
	(253, 'Pago con Discover Card', 1),
	(254, 'Pago con American Express', 1),
	(255, 'Pago con Diners Club', 1),
	(256, 'Pago con Maestro', 1),
	(257, 'Pago con Visa Electron', 1),
	(258, 'Pago con MasterCard', 1);

-- Volcando estructura para tabla agencia.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime DEFAULT (now()),
  `idvendedor` bigint NOT NULL,
  `dni_cliente` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `idtipopago` bigint NOT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`idventa`) USING BTREE,
  KEY `idvendedor` (`idvendedor`) USING BTREE,
  KEY `idtipopago` (`idtipopago`) USING BTREE,
  KEY `codigo_venta` (`codigo_venta`) USING BTREE,
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idvendedor`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.venta: ~2 rows (aproximadamente)
DELETE FROM `venta`;
INSERT INTO `venta` (`idventa`, `codigo_venta`, `datecreated`, `idvendedor`, `dni_cliente`, `idtipopago`, `total`, `status`) VALUES
	(1, 'v_1', '2024-06-18 00:00:00', 22, '4444444444', 187, 13.00, 1),
	(2, 'v_2', '2024-06-21 22:25:56', 22, '4444444444', 4, 8.00, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

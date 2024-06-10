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


-- Volcando estructura de base de datos para agencia
CREATE DATABASE IF NOT EXISTS `agencia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agencia`;

-- Volcando estructura para tabla agencia.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalleventa` bigint NOT NULL AUTO_INCREMENT,
  `idventa` bigint NOT NULL,
  `idservicio` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  KEY `idventa` (`idventa`),
  KEY `idservicio` (`idservicio`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_venta: ~1 rows (aproximadamente)
DELETE FROM `detalle_venta`;
INSERT INTO `detalle_venta` (`iddetalleventa`, `idventa`, `idservicio`, `cantidad`, `precio`) VALUES
	(1, 1, 1, 2, 50.00);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla agencia.opciones: ~0 rows (aproximadamente)
DELETE FROM `opciones`;
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(13, 22, 1, 1, 1);

-- Volcando estructura para tabla agencia.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` bigint NOT NULL AUTO_INCREMENT,
  `referenciacobro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  `personaid` bigint NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `costo_envio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint NOT NULL,
  `direccion_envio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `reembolso` bigint DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `personaid` (`personaid`),
  KEY `tipopagoid` (`tipopagoid`),
  KEY `FK_pedido_producto` (`producto_id`),
  KEY `FK_pedido_reembolso` (`reembolso`),
  CONSTRAINT `FK_pedido_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `FK_pedido_producto` FOREIGN KEY (`producto_id`) REFERENCES `x_producto` (`idproducto`),
  CONSTRAINT `FK_pedido_reembolso` FOREIGN KEY (`reembolso`) REFERENCES `x_reembolso` (`id`),
  CONSTRAINT `FK_pedido_tipopago` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.pedido: ~10 rows (aproximadamente)
DELETE FROM `pedido`;
INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`, `producto_id`, `reembolso`) VALUES
	(3, '12', NULL, NULL, 22, '2023-11-15 00:50:52', 5.00, 7.50, 2, '123, aaaa', 'Pendiente', NULL, NULL),
	(4, NULL, NULL, NULL, 22, '2023-12-06 13:30:58', 5.00, 17.00, 2, 'AV. Lima 123, Quilmana', 'Pendiente', NULL, NULL),
	(6, NULL, NULL, NULL, 28, '2023-12-06 17:28:13', 5.00, 8.00, 2, 'Jr. Agusto B. Leguía N453, Quilmana - Cañete', 'Pendiente', NULL, NULL),
	(7, 'completa', NULL, NULL, 28, '2023-12-06 17:40:11', 5.00, 6.50, 2, 'Jr. Agusto B. Leguia N 403, Quilmana', 'Completo', NULL, NULL),
	(8, NULL, NULL, NULL, 28, '2023-12-06 18:10:32', 5.00, 12.50, 2, 'Jr. Agusto B. Leguia N 403, quimana', 'Pendiente', NULL, NULL),
	(9, NULL, NULL, NULL, 22, '2023-12-12 23:07:35', 5.00, 6.50, 3, 'ewe, weew', 'Pendiente', NULL, NULL),
	(10, NULL, NULL, NULL, 22, '2023-12-16 10:42:04', 5.00, 20.90, 2, '123, e', 'Pendiente', NULL, NULL),
	(11, NULL, NULL, NULL, 22, '2023-12-19 10:07:54', 5.00, 6.50, 2, 'f, f', 'Pendiente', NULL, NULL),
	(12, NULL, NULL, NULL, 22, '2023-12-22 00:38:17', 5.00, 6.50, 2, '111111f, 2222', 'Pendiente', NULL, NULL),
	(13, '12', NULL, NULL, 22, '2023-12-23 23:18:52', 5.00, 6.50, 2, '111111v, 2222', 'Entregado', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.persona: ~15 rows (aproximadamente)
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
	(59, '666', 'NANCY YANINA', 'MAZA SUAREZ', 910089718, 'javierpa66din661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 09:25:41', 0, NULL, NULL, 22),
	(60, '72014148', 'AZALIA ABIGAIL', 'CONTRERAS BRAVO', 946454569, 'javiderpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:20:49', 0, NULL, NULL, 1),
	(61, '74199534', 'RICHARD CESAR ALEXANDER', 'SANCHEZ LOPEZ', 946454573, 'javier11paeedin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:28:45', 0, NULL, NULL, 1),
	(62, '72014141', 'JOSE ALEJANDRO', 'LA ROSA HUASASQUICHE', 946454569, 'javi1erpad1in661@gmail.com', NULL, '1111111', NULL, 3, '2024-06-09 21:59:26', 0, NULL, NULL, NULL),
	(63, '74199539', 'BRANDOLEE VANDAMME', 'JARA PRINCIPE', 946454569, 'j666avie55rpadin661@gmail.com', NULL, 'peru', NULL, 3, '2024-06-09 22:03:34', 0, NULL, NULL, NULL),
	(64, '72014144', 'Lunes', 'Huasasquiche', 946454569, 'javierpa44444din661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, 2, '2024-06-10 00:20:37', 1, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.rol_usuario: ~4 rows (aproximadamente)
DELETE FROM `rol_usuario`;
INSERT INTO `rol_usuario` (`idrolusuario`, `nombrerolusuario`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendedor', 'Operador de tienda', 1);

-- Volcando estructura para tabla agencia.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idservicio` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idservicio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.servicio: ~6 rows (aproximadamente)
DELETE FROM `servicio`;
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Rafting y nado con salvavidas en el río', 'Emocionante aventura acuática en aguas bravas con guías expertos y equipo de seguridad.', 11.20, 'portada_servicio.png', '2024-05-13 19:46:32', 'rafting_y_nado_con_salvavidas_en_el_rio', 1),
	(2, 'Práctica de kayak y canotaje', 'Explora ríos y lagos a bordo de kayaks y canoas, ideal para amantes de la naturaleza.', 9.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'practica_de_kayak_y_canotaje', 1),
	(3, 'Tirolesa y parques de aventuras aéreas', 'Desafía la gravedad y disfruta de la adrenalina en recorridos por el aire entre árboles.', 5.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tirolesa_y_parques_de_aventuras_aereas', 1),
	(4, 'Tours extremos y de adrenalina', 'Experimenta emociones fuertes con actividades como rapel, bungee jumping y más.', 10.00, 'img_ee5da223d41a457c75108adb998ca63c.jpg', '2024-05-13 19:46:32', 'tours-extremos-y-de-adrenalina', 1),
	(5, 'Tours de naturaleza y vida silvestre', 'Descubre la diversidad natural y observa animales en su hábitat natural.', 10.00, 'img_bc833529de8d9b1871ec7e7756efda97.jpg', '2024-05-13 19:46:32', 'tours-de-naturaleza-y-vida-silvestre', 1),
	(6, 'aaaa', 'kkkkkkkk', 17.30, 'portada_servicio.png', '2024-05-18 12:01:02', 'aaaa', 0),
	(7, 'www', 'wwwwwwsss', 23.00, 'portada_servicio.png', '2024-06-10 01:09:56', 'www', 1);

-- Volcando estructura para tabla agencia.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.tipopago: ~5 rows (aproximadamente)
DELETE FROM `tipopago`;
INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
	(1, 'PayPal', 1),
	(2, 'Efectivo', 1),
	(3, 'Tarjeta', 1),
	(4, 'Cheque', 1),
	(5, 'Despósito Bancario', 1);

-- Volcando estructura para tabla agencia.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `codigo_salida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `idvendedor` bigint NOT NULL,
  `dni_cliente` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre_cliente` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellido_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  `idtipopago` bigint NOT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`idventa`) USING BTREE,
  KEY `idvendedor` (`idvendedor`) USING BTREE,
  KEY `idtipopago` (`idtipopago`) USING BTREE,
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idvendedor`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.venta: ~2 rows (aproximadamente)
DELETE FROM `venta`;
INSERT INTO `venta` (`idventa`, `codigo_venta`, `codigo_salida`, `fecha_hora`, `idvendedor`, `dni_cliente`, `nombre_cliente`, `apellido_cliente`, `descripcion`, `idtipopago`, `status`) VALUES
	(4, '1', '', '2024-06-04 20:00:39', 22, '', '', '', NULL, 2, 1);

-- Volcando estructura para tabla agencia.venta_persona
CREATE TABLE IF NOT EXISTS `venta_persona` (
  `idventapersona` bigint NOT NULL AUTO_INCREMENT,
  `idventa` bigint NOT NULL,
  `idpersona` bigint NOT NULL,
  `idrolempleado` bigint NOT NULL,
  `es_cargador` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idventapersona`) USING BTREE,
  KEY `idventa` (`idventa`) USING BTREE,
  KEY `idpersona` (`idpersona`) USING BTREE,
  KEY `idrolempleado` (`idrolempleado`) USING BTREE,
  CONSTRAINT `venta_persona_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`),
  CONSTRAINT `venta_persona_ibfk_2` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `venta_persona_ibfk_3` FOREIGN KEY (`idrolempleado`) REFERENCES `rol_empleado` (`idrolempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.venta_persona: ~0 rows (aproximadamente)
DELETE FROM `venta_persona`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

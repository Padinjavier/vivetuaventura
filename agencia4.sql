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

-- Volcando estructura para tabla agencia.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.categoria: ~12 rows (aproximadamente)
DELETE FROM `categoria`;
INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Embutidos', 'Productos o derivados cárnicos.', 'img_083c06d74a24b56e649059fd8a3b2416.jpg', '2021-08-20 03:04:04', 'embutidos', 1),
	(2, 'Bebidas', 'Gaseosa, refresco, fresco o soda', 'img_90165900d66f0ad48275beb8fe1f3f14.jpg', '2021-08-21 00:47:10', 'bebidas', 1),
	(3, 'Dulces', 'Productos dulces peruanos', 'img_350eae9b69dd03a7713ebd84b9bcb5f7.jpg', '2023-11-08 22:52:36', 'dulces', 1),
	(4, 'ss', 'fff', 'img_cc7d26084d5893794aafa18573fd6e85.jpg', '2023-11-13 08:35:25', 'ss', 0),
	(5, 'Cuidado personal', 'Productos de higiene personal', 'img_57bfd177ac746208efa98657cec3970b.jpg', '2023-11-23 01:15:09', 'cuidado-personal', 1),
	(6, 'Lácteos', 'Lacteos', 'img_e3490ef3cb0f50ab8a431fcf41384313.jpg', '2023-11-29 08:43:42', 'lacteos', 1),
	(7, 'Bebidas Alcoholicas', 'Tragos', 'img_856b9f33b2e9a7ec1d92444aad6542cf.jpg', '2023-11-29 08:45:44', 'bebidas-alcoholicas', 1),
	(8, 'Limpieza', 'Limpieza', 'portada_categoria.png', '2023-11-29 09:34:39', 'limpieza', 1),
	(9, 'Snack', 'Aperitivos', 'portada_categoria.png', '2023-11-29 09:48:31', 'snack', 1),
	(10, 'Abarrotes', 'Fideos, azucares', 'portada_categoria.png', '2023-11-29 10:19:15', 'abarrotes', 1),
	(11, 'Golosinas', 'Caramelos, Chicles, otros', 'portada_categoria.png', '2023-11-29 11:55:23', 'golosinas', 1),
	(12, 'ddd', 'dd', 'portada_categoria.png', '2024-03-28 09:41:54', 'ddd', 1);

-- Volcando estructura para tabla agencia.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint NOT NULL,
  `productoid` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_pedido: ~1 rows (aproximadamente)
DELETE FROM `detalle_pedido`;
INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
	(1, 30, 22, 12.00, 3);

-- Volcando estructura para tabla agencia.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalleventa` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `idservicio` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalleventa`) USING BTREE,
  KEY `idservicio` (`idservicio`) USING BTREE,
  KEY `idventa` (`codigo_venta`) USING BTREE,
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`codigo_venta`) REFERENCES `venta` (`codigo_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_venta: ~7 rows (aproximadamente)
DELETE FROM `detalle_venta`;
INSERT INTO `detalle_venta` (`iddetalleventa`, `codigo_venta`, `idservicio`, `cantidad`, `precio`) VALUES
	(66, 'v_5', 5, 14, 1.00),
	(69, 'v_2', 4, 1, 222.00),
	(70, 'v_2', 1, 1, 111.00),
	(71, 'v_1', 3, 9, 9.00),
	(72, 'v_3', 1, 1, 333.00),
	(75, 'v_4', 1, 7, 4.00),
	(76, 'v_4', 2, 2, 1.00);

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
  CONSTRAINT `FK_pedido_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `FK_pedido_reembolso` FOREIGN KEY (`reembolso`) REFERENCES `x_reembolso` (`id`),
  CONSTRAINT `FK_pedido_tipopago` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.pedido: ~10 rows (aproximadamente)
DELETE FROM `pedido`;
INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`, `producto_id`, `reembolso`) VALUES
	(3, '12', NULL, NULL, 22, '2023-11-15 00:50:52', 5.00, 7.50, 2, '123, aaaa', 'Pendiente', NULL, NULL),
	(4, NULL, NULL, NULL, 22, '2023-12-06 13:30:58', 5.00, 17.00, 2, 'AV. Lima 123, Quilmana', 'Pendiente', NULL, NULL),
	(6, NULL, NULL, NULL, 28, '2023-12-06 17:28:13', 5.00, 8.00, 2, 'Jr. Agusto B. Leguía N453, Quilmana - Cañete', 'Pendiente', NULL, NULL),
	(8, NULL, NULL, NULL, 28, '2023-12-06 18:10:32', 5.00, 12.50, 2, 'Jr. Agusto B. Leguia N 403, quimana', 'Pendiente', NULL, NULL),
	(9, NULL, NULL, NULL, 22, '2023-12-12 23:07:35', 5.00, 6.50, 3, 'ewe, weew', 'Pendiente', NULL, NULL),
	(10, NULL, NULL, NULL, 22, '2023-12-16 10:42:04', 5.00, 20.90, 2, '123, e', 'Pendiente', NULL, NULL),
	(11, NULL, NULL, NULL, 22, '2023-12-19 10:07:54', 5.00, 6.50, 2, 'f, f', 'Pendiente', NULL, NULL),
	(12, NULL, NULL, NULL, 22, '2023-12-22 00:38:17', 5.00, 6.50, 2, '111111f, 2222', 'Pendiente', NULL, NULL),
	(13, '12', NULL, NULL, 22, '2023-12-23 23:18:52', 5.00, 6.50, 2, '111111v, 2222', 'Entregado', NULL, NULL),
	(30, 'completa', NULL, NULL, 28, '2023-12-06 17:40:11', 5.00, 6.50, 2, 'Jr. Agusto B. Leguia N 403, Quilmana', 'Completo', 1, NULL);

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
	(28, '72014145', 'Alex', 'Huasasquiche', 946454569, 'ahuasasquiche@gmail.com', '', 'kkkkkkk', NULL, NULL, '2023-12-06 17:27:31', 0, NULL, NULL, 1),
	(29, '74199532', 'Javier Padin UNDC', 'Padin Flores', 9171893004, '2002010167@undc.edu.pe', '', NULL, NULL, NULL, '2023-12-16 10:41:03', 0, 'Av Lima', 'Quilmana', 1),
	(30, '4444444444', 'FRANK', 'GALAGER', 99999999, 'FRANK@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'lima', NULL, 3, '2024-05-12 23:57:54', 1, NULL, NULL, NULL),
	(56, '75486524', 'JHON VIGNEY', 'ROMERO MELCHOR', 918313532, 'javierpadin6w61@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:34:47', 1, NULL, NULL, 20),
	(57, '23232323', 'Jeanettis Mariel', 'CHAVEZ SANCHEZ', 910089718, 'javierpad23in661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:39:53', 1, NULL, NULL, 21),
	(58, '2323234', 'Juanggiii', 'Herrera', 111111111111111, 'javiegggrpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 08:40:10', 1, NULL, NULL, 22),
	(59, '666', 'NANCY YANINA', 'MAZA SUAREZ', 910089718, 'javierpa66din661@gmail.com', NULL, NULL, NULL, NULL, '2024-05-25 09:25:41', 0, NULL, NULL, 22),
	(60, '72014148', 'AZALIA ABIGAIL', 'CONTRERAS BRAVO', 946454569, 'javiderpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:20:49', 0, NULL, NULL, 1),
	(61, '74199534', 'RICHARD CESAR ALEXANDER', 'SANCHEZ LOPEZ', 946454573, 'javier11paeedin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-09 19:28:45', 0, NULL, NULL, 1),
	(62, '72014141', 'JOSE ALEJANDRO', 'LA ROSA HUASASQUICHE', 946454569, 'javi1erpad1in661@gmail.com', NULL, '1111111', NULL, 3, '2024-06-09 21:59:26', 1, NULL, NULL, NULL),
	(63, '74199539', 'BRANDOLEE VANDAMME', 'JARA PRINCIPE', 946454569, 'j666avie55rpadin661@gmail.com', NULL, 'peru', NULL, 3, '2024-06-09 22:03:34', 1, NULL, NULL, NULL),
	(64, '72014144', 'Lunes', 'Huasasquiche', 946454569, 'javierpa44444din661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, 2, '2024-06-10 00:20:37', 1, NULL, NULL, NULL),
	(65, '720144148', 'AZALIA ABIGAIL', 'CONTRERAS BRAVO', 946454569, 'javgggierpadin661@gmail.com', NULL, NULL, NULL, NULL, '2024-06-10 22:19:16', 1, NULL, NULL, 22);

-- Volcando estructura para tabla agencia.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` bigint NOT NULL AUTO_INCREMENT,
  `categoriaid` bigint NOT NULL,
  `codigo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int NOT NULL,
  `fecha_v` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT '',
  `imagen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproducto`),
  KEY `categoriaid` (`categoriaid`),
  CONSTRAINT `FK_producto_categoria` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.producto: ~169 rows (aproximadamente)
DELETE FROM `producto`;
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_v`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
	(1, 1, '2417984565', 'Chaqueta Azul', '<p>a</p>', 100.00, 50, '2023-12-30', NULL, '2021-08-20 03:12:14', 'chaqueta-azul', 1),
	(2, 1, '456879878', 'Reloj', '<p>b</p>', 200.00, 100, '2023-10-03', NULL, '2021-08-20 03:14:10', 'reloj', 0),
	(3, 5, '4658798787', 'Pack Shampoo y Acondicionador Dove Reconstrucción Completa Frasco 400ml', '', 28.00, 12, '2023-12-16', NULL, '2021-08-21 00:48:21', 'pack-shampoo-y-acondicionador-dove-reconstruccion-completa-frasco-400ml', 1),
	(4, 1, '113333', 'dd', 'd', 2.50, 5, '2023-11-10', NULL, '2023-11-08 23:22:14', 'dd', 0),
	(5, 2, '77517310047085', '20', '<p>er</p>', 2.50, 5, '2023-11-14', NULL, '2023-11-13 09:34:33', '20', 0),
	(6, 2, '77517310047', '12', '<p>hola</p>', 12.50, 14, '2023-11-25', NULL, '2023-11-13 09:36:04', '12', 0),
	(7, 2, '77517310047083', 'qqq', '<p>qq</p>', 2.50, 5, '2023-12-02', NULL, '2023-11-13 12:49:18', 'qqq', 0),
	(8, 1, '7751731005', 'zz', '<p>zz</p>', 2.50, 14, '2023-11-15', NULL, '2023-11-13 12:57:42', 'zz', 0),
	(9, 1, '7751731007', 'dd', '<p>wwwwwwwwwwwwww</p>', 2.50, 14, '2023-11-24', NULL, '2023-11-13 13:02:05', 'dd', 0),
	(10, 1, '1234567888', '12', '<p>xxx</p>', 12.50, 14, '2023-11-24', NULL, '2023-11-13 13:09:25', '12', 0),
	(11, 1, '7751731047466', 'xxxx', '<p>ass</p>', 92.50, 1, '2024-01-01', NULL, '2023-11-13 14:24:47', 'xxxx', 0),
	(12, 1, '7751731047888', 'qqqqqqqqq', '<p>qqqqqqqqqqqqq</p>', 12.00, 12, '2023-11-06', NULL, '2023-11-19 20:11:44', 'qqqqqqqqq', 0),
	(13, 1, '123232122312', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '<p>aaaaaaaaaaaaaaaaaaaaaaaaaa</p>', 12.00, 12, '2023-11-14', NULL, '2023-11-19 20:16:47', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0),
	(14, 1, '43434343', 'bbbbbbbbbbbbbbbb', '<p>bbbbbbbbbbbbbbbb</p>', 12.00, 12, '2023-10-31', NULL, '2023-11-19 20:25:36', 'bbbbbbbbbbbbbbbb', 0),
	(15, 1, '1221212121', '12211212', '<p>12122121aaaaaa</p>', 2121.00, 211212, '2023-11-20', NULL, '2023-11-19 20:26:35', '12211212', 0),
	(16, 1, '111111111111', 'aaaaaaaaaaaa', '<p>aaaaaaaaaaaaaaa</p>', 1111.00, 11, '2023-11-14', NULL, '2023-11-19 20:29:18', 'aaaaaaaaaaaa', 0),
	(17, 1, '111111', '111111111111111111111111111111', '<p>111111111111111</p>', 1.00, 1, '2023-11-21', NULL, '2023-11-19 20:30:05', '111111111111111111111111111111', 0),
	(18, 1, '222222', '22222222222222222222', '<p>222222222222222</p>', 22.00, 22, '2023-11-21', NULL, '2023-11-19 20:31:19', '22222222222222222222', 0),
	(19, 1, '12345654', 'inka kola', '<p>gaseosa</p>', 2.50, 12, '2023-11-18', NULL, '2023-11-19 20:40:44', 'inka-kola', 0),
	(20, 1, '775173104733', 'nuevo', '<p>aaa</p>', 23.00, 23, '2023-11-02', NULL, '2023-11-19 20:49:42', 'nuevo', 0),
	(21, 1, '12121211', 'qwqwqw', '<p>qwqwq</p>', 78.00, 78, '2023-11-20', NULL, '2023-11-19 20:50:59', 'qwqwqw', 0),
	(22, 1, '111111111111111112', 'seeee', '<p>eeee</p>', 3.00, 3, '2023-11-14', NULL, '2023-11-19 21:19:24', 'seeee', 0),
	(23, 1, '1234567', 'aassa', '<p>12</p>', 12.00, 12, '2023-11-21', NULL, '2023-11-19 21:33:52', 'aassa', 0),
	(24, 1, '1234523676767', '23', '<p>23</p>', 23.00, 23, '2023-11-16', NULL, '2023-11-19 21:44:32', '23', 0),
	(25, 5, '123456', 'Jabón en Barra Dove Leche de Coco Caja 90gr', '', 3.50, 8, '2023-12-22', NULL, '2023-11-23 01:26:58', 'jabon-en-barra-dove-leche-de-coco-caja-90gr', 1),
	(26, 5, '23442424', 'Shampoo Head Shoulders 3 en 1 for Men 700ml', '', 28.90, 12, '2023-12-31', NULL, '2023-11-23 01:28:22', 'shampoo-head-shoulders-3-en-1-for-men-700ml', 1),
	(27, 5, '2323424', 'Cepillo Dental Oral B 1 2 3 x unidad', '', 2.30, 6, '2024-02-24', NULL, '2023-11-23 01:29:32', 'cepillo-dental-oral-b-1-2-3-x-unidad', 1),
	(28, 5, '345677', 'Jabón en Barra Heno de Pravia Antibacteriano Paquete 150gr', '', 3.80, 8, '2024-01-20', NULL, '2023-11-23 01:30:23', 'jabon-en-barra-heno-de-pravia-antibacteriano-paquete-150gr', 1),
	(29, 5, '3567788', 'Jabón en Barra Heno de Pravia Original Paquete 150gr', '', 3.80, 9, '2024-02-04', NULL, '2023-11-23 01:31:02', 'jabon-en-barra-heno-de-pravia-original-paquete-150gr', 1),
	(30, 5, '888644', 'Jabón Liquido Aval Frutos Rojos Antibacterial Frasco 400ml', '', 6.00, 10, '2024-01-28', NULL, '2023-11-23 01:31:37', 'jabon-liquido-aval-frutos-rojos-antibacterial-frasco-400ml', 1),
	(31, 5, '688899', 'Shampoo Head y Shoulders Manzana Fresh 375ml', '', 17.50, 7, '2024-02-25', NULL, '2023-11-23 01:32:15', 'shampoo-head-y-shoulders-manzana-fresh-375ml', 1),
	(32, 5, '64332456', 'Shampoo Head y Shoulders 2 en 1 Suave y Manejable 700ml', '', 28.90, 5, '2024-03-30', NULL, '2023-11-23 01:33:23', 'shampoo-head-y-shoulders-2-en-1-suave-y-manejable-700ml', 1),
	(33, 5, '5535262', 'Shampoo Head y Shoulders for Men Prevención Caída 375ml', '', 17.50, 5, '2024-05-04', NULL, '2023-11-23 01:34:02', 'shampoo-head-y-shoulders-for-men-prevencion-caida-375ml', 1),
	(34, 5, '8876467', 'Acondicionador Sedal Ceramidas Frasco 340 ml', '', 12.90, 8, '2024-03-24', NULL, '2023-11-23 01:35:26', 'acondicionador-sedal-ceramidas-frasco-340-ml', 1),
	(35, 5, '8777767', 'Acondicionador Negros Luminosos 340ml', '', 12.90, 12, '2024-03-30', NULL, '2023-11-23 01:36:06', 'acondicionador-negros-luminosos-340ml', 1),
	(36, 5, '9998899', 'Acondicionador Sedal Restauración instantánea 340 ml', '', 12.90, 6, '2024-11-08', NULL, '2023-11-23 01:37:00', 'acondicionador-sedal-restauracion-instantanea-340-ml', 1),
	(37, 5, '99999998', 'Jabón Neko Extra Protección x 125 g', '', 4.90, 6, '2024-04-20', NULL, '2023-11-23 01:38:21', 'jabon-neko-extra-proteccion-x-125-g', 1),
	(38, 5, '99998773', 'Toallas Higiénicas Always Noches Tranquilas Cubierta Seca Bolsa 8 UN', '', 8.10, 12, '2025-01-04', NULL, '2023-11-23 01:39:11', 'toallas-higienicas-always-noches-tranquilas-cubierta-seca-bolsa-8-un', 1),
	(39, 5, '86533445', 'Toallas Higiénicas Always Protección Total Cubierta Seca Bolsa 8 UN', '', 6.50, 9, '2024-10-16', NULL, '2023-11-23 01:39:57', 'toallas-higienicas-always-proteccion-total-cubierta-seca-bolsa-8-un', 1),
	(40, 5, '5556444', 'Toallas Higiénicas Always Suave Protección Total Ajuste Perfecto Bolsa 8 UN', '', 4.20, 8, '2024-06-12', NULL, '2023-11-23 01:40:49', 'toallas-higienicas-always-suave-proteccion-total-ajuste-perfecto-bolsa-8-un', 1),
	(41, 5, '11111111', 'Nosotras Natural Buenas Noches X10unids.', '', 8.90, 5, '2024-06-12', NULL, '2023-11-23 01:41:26', 'nosotras-natural-buenas-noches-x10unids', 1),
	(42, 6, '13421343214', 'Yogurt Gloria Vainilla x 1KG', '<p>Yogurt Gloria Vainilla x 1KG</p>', 14.90, 10, '2023-12-29', NULL, '2023-11-29 08:46:04', 'yogurt-gloria-vainilla-x-1kg', 1),
	(43, 6, '123123', 'Yogurt Gloria Fresa x 1KG', '<p>Yogurt Gloria Fresa x 1KG</p>', 14.90, 10, '2023-12-29', NULL, '2023-11-29 08:48:05', 'yogurt-gloria-fresa-x-1kg', 1),
	(44, 6, '123123123', 'Yogurt Gloria Lúcuma x 1KG', '<p>Yogurt Gloria l&uacute;cuma x 1KG</p>', 14.90, 10, '2023-12-29', NULL, '2023-11-29 08:49:57', 'yogurt-gloria-lucuma-x-1kg', 0),
	(45, 7, '65478912', 'Ron Cartavio Black 750 ml', '<p><span style="font-weight: 400;">Est&aacute; a&ntilde;ejado en barriles de robles y mezclado con 9 tipos de rones entre 2 y 5 a&ntilde;os. De sabor dulce y ahumado, con toques de frutas secas, 750 ml</span></p>', 28.90, 50, '2027-12-25', NULL, '2023-11-29 08:50:30', 'ron-cartavio-black-750-ml', 1),
	(46, 6, '512471234', 'Yogurt Gloria Durazno x 1KG', '<p>Yogurt Gloria Durazno x 1KG</p>', 14.90, 10, '2023-12-29', NULL, '2023-11-29 08:51:12', 'yogurt-gloria-durazno-x-1kg', 1),
	(47, 7, '34795144', 'Ron Cartavio Blanco 750ml', '<p><span style="font-weight: 400;">Ron a&ntilde;ejo de color ligeramente &aacute;mbar, con aromas afrutados, un ligero toque de vainilla y fino roble, 750 ml.</span></p>', 28.90, 48, '2027-06-25', NULL, '2023-11-29 08:57:27', 'ron-cartavio-blanco-750ml', 1),
	(48, 6, '3464563324', 'Yogurt Gloria Battimix Vainilla 125 Gr', '<p>Yogurt Gloria Battimix Vainilla 125 Gr</p>', 3.00, 10, '2023-12-29', NULL, '2023-11-29 08:58:19', 'yogurt-gloria-battimix-vainilla-125-gr', 1),
	(49, 7, '741257469', 'Four Loko Purple 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na, sabor a uva y contiene 473 ml.</span></p>', 12.50, 45, '2029-09-24', NULL, '2023-11-29 09:01:57', 'four-loko-purple-473ml', 1),
	(50, 7, '65471247', 'Four Loko Green 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na sabor a manzana y contiene 473 ml</span></p>', 12.50, 50, '2028-06-25', NULL, '2023-11-29 09:04:13', 'four-loko-green-473ml', 1),
	(51, 7, '756987412', 'Four Loko Ponche 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na sabor a ponche de frutas y contiene 473 ml</span></p>', 12.50, 50, '2028-06-26', NULL, '2023-11-29 09:06:43', 'four-loko-ponche-473ml', 1),
	(52, 7, '689471235', 'Four Loko Blue 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na y contiene 473 ml</span></p>', 12.50, 50, '2028-06-26', NULL, '2023-11-29 09:08:37', 'four-loko-blue-473ml', 1),
	(53, 7, '147895447', 'Four Loko Sandía 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na, con sabor a sandia y contiene 473 ml</span></p>', 12.50, 50, '2028-06-26', NULL, '2023-11-29 09:09:34', 'four-loko-sandia-473ml', 1),
	(54, 7, '741257954', 'Four Loko Mango 473ml', '<p><span style="font-weight: 400;">Contiene licor de Malta, jarabe de ma&iacute;z, &aacute;cido c&iacute;trico, agua purificada, sabor artificial, citrato de sodio, benzoato de sodio y, anteriormente, cafe&iacute;na, con sabor a mango y contiene 473 ml</span></p>', 12.50, 50, '2028-06-26', NULL, '2023-11-29 09:11:15', 'four-loko-mango-473ml', 1),
	(55, 7, '635149741', 'Smirnoff Ice Green Apple 355ml', '<p><span style="font-weight: 400;">Est&aacute; elaborado con Vodka de triple destilaci&oacute;n. Con una infusi&oacute;n de sabores naturales. Suave y refrescante</span></p>', 8.00, 50, '2029-12-31', NULL, '2023-11-29 09:18:29', 'smirnoff-ice-green-apple-355ml', 1),
	(56, 7, '415578911', 'Tres Cruces Lager 473ml', '<p><span style="font-weight: 400;">Cerveza con ingredientes importados y 100% naturales, agua proveniente de napas originarias de la Cordillera de los Andes y l&uacute;pulo importado de Alemania</span></p>', 3.50, 50, '2030-11-24', NULL, '2023-11-29 09:20:59', 'tres-cruces-lager-473ml', 1),
	(57, 7, '614752664', 'Red Label 750ml', '<p><span style="font-weight: 400;">Johnnie Walker Red Label es nuestra Mezcla Pionera, la que ha presentado nuestro whisky en todo el mundo. Vers&aacute;til y con un atractivo universal, tiene un sabor acentuado y lleno de car&aacute;cter que se mantiene incluso al ser mezclado.</span></p>', 55.00, 25, '2035-11-25', NULL, '2023-11-29 09:23:09', 'red-label-750ml', 1),
	(58, 7, '3547812269', 'Black Label 750ml', '<p><span style="font-weight: 400;">En nariz se presenta con aromas de madera y fruta, con un leve picor dulce. Notas a vainilla. En boca se presenta dulce con un suave acabado amargo. Notas cremosas, de madera y caramelo.</span></p>', 109.90, 25, '2035-10-30', NULL, '2023-11-29 09:24:24', 'black-label-750ml', 1),
	(59, 7, '415774159', 'Russ Kaya Pink 750ml', '<p><span style="font-weight: 400;">VODKA RUSSKAYA PINK, se obtiene por un proceso de triple destilaci&oacute;n y posterior destilaci&oacute;n en alambique de cobre POT STILL. Luego pasa a trav&eacute;s de una columna de carb&oacute;n activado, minuciosamente seleccionado, para finalmente someterse a un proceso de filtraci&oacute;n rigurosa.</span></p>', 22.90, 50, '2040-11-25', NULL, '2023-11-29 09:26:20', 'russ-kaya-pink-750ml', 1),
	(60, 7, '471698741', 'Russ Kaya Black 750ml', '<p><span style="font-weight: 400;">VODKA RUSSKAYA BLACK, se obtiene por un proceso de triple destilaci&oacute;n y posterior destilaci&oacute;n en alambique de cobre POT STILL. Luego pasa a trav&eacute;s de una columna de carb&oacute;n activado, minuciosamente seleccionado, para finalmente someterse a un proceso de filtraci&oacute;n rigurosa.</span></p>', 22.90, 50, '2040-11-25', NULL, '2023-11-29 09:27:40', 'russ-kaya-black-750ml', 1),
	(61, 7, '478995114', 'Vodka Russkaya Green Apple 750ml', '<p>PRESENTACI&Oacute;N DE 750 ML<br />40&deg; DE ALCOHOL<br />INCLUYE AGUA TONICA DE 2 LITROS<br />SELLO DE SEGURIDAD</p>', 22.90, 50, '2040-11-24', NULL, '2023-11-29 09:30:42', 'vodka-russkaya-green-apple-750ml', 1),
	(62, 7, '654771123', 'Vodka Russkaya Botella 750ml', '<p>PRESENTACI&Oacute;N DE 750 ML<br />40&deg; DE ALCOHOL<br />INCLUYE AGUA TONICA DE 2 LITROS<br />SELLO DE SEGURIDAD</p>', 22.90, 50, '2040-10-25', NULL, '2023-11-29 09:32:13', 'vodka-russkaya-botella-750ml', 1),
	(63, 7, '14222144', 'Cerveza Corona Extra Botella 355ml', '<p>Es una cerveza de tipo Lager Pilsner, clara y brillante, de espuma blanca y consistente. Tiene notas afrutadas, de cuerpo medio, fresca, balanceada y muy f&aacute;cil de beber. En boca es dulce y recuerda al sabor del cereal. Su amargor es limpio y ligero.</p>', 5.50, 50, '2029-09-25', NULL, '2023-11-29 09:36:38', 'cerveza-corona-extra-botella-355ml', 1),
	(64, 7, '64775992', 'Cerveza Corona Extra Botella 355ml Six Pack', '<p>Es una cerveza de tipo Lager Pilsner, clara y brillante, de espuma blanca y consistente. Tiene notas afrutadas, de cuerpo medio, fresca, balanceada y muy f&aacute;cil de beber. En boca es dulce y recuerda al sabor del cereal. Su amargor es limpio y ligero.</p>', 27.50, 15, '2040-11-24', NULL, '2023-11-29 09:38:01', 'cerveza-corona-extra-botella-355ml-six-pack', 1),
	(65, 7, '54777122', 'Cerveza Corona Extra Lata 355ml', '<p>Tiene notas afrutadas, de cuerpo medio, fresca, balanceada y muy f&aacute;cil de beber. En boca es dulce y recuerda al sabor del cereal. Su amargor es limpio y ligero.</p>', 5.00, 50, '2040-12-25', NULL, '2023-11-29 09:39:50', 'cerveza-corona-extra-lata-355ml', 1),
	(66, 8, '5432532', 'Lejia Sapolio 1L', '<p>Lejia Sapolio 1L<br />M&aacute;s concentrada - Desinfecta y Blanquea</p>', 3.20, 10, '2024-04-29', NULL, '2023-11-29 09:40:29', 'lejia-sapolio-1l', 1),
	(67, 7, '45111477', 'Cerveza Corona Extra Lata 355ml Six Pack', '<p>Tiene notas afrutadas, de cuerpo medio, fresca, balanceada y muy f&aacute;cil de beber. En boca es dulce y recuerda al sabor del cereal. Su amargor es limpio y ligero.</p>', 30.00, 25, '2040-10-24', NULL, '2023-11-29 09:42:03', 'cerveza-corona-extra-lata-355ml-six-pack', 1),
	(68, 7, '355411178', 'Cerveza Cusqueña Doble Malta Botella 620ml', '<p>La cerveza hecha de la mezcla imposible de dos maltas Premium: Pilsner y Munich, que juntas le dan el equilibrio perfecto de sabor, cuerpo y deliciosas notas dulces. Una variedad que se caracteriza por su color dorado intenso, su incre&iacute;ble frescura y, sobre todo, su calidad superior.</p>', 6.00, 50, '2040-10-21', NULL, '2023-11-29 09:45:02', 'cerveza-cusquena-doble-malta-botella-620ml', 1),
	(69, 7, '344711258', 'Cerveza Cusqueña Doble Malta Botella 620ml Caja x 12 unidades', '<p>La cerveza hecha de la mezcla imposible de dos maltas Premium: Pilsner y Munich, que juntas le dan el equilibrio perfecto de sabor, cuerpo y deliciosas notas dulces. Una variedad que se caracteriza por su color dorado intenso, su incre&iacute;ble frescura y, sobre todo, su calidad superior.</p>', 72.00, 12, '2040-09-06', NULL, '2023-11-29 09:46:09', 'cerveza-cusquena-doble-malta-botella-620ml-caja-x-12-unidades', 1),
	(70, 7, '36644778', 'Cerveza Cusqueña Negra Botella 620ml', '<p>Es un tipo de cerveza lager alemana opaca, de color muy oscuro y sabor fuerte que recuerda al chocolate o al caf&eacute;.</p>', 6.00, 50, '2040-08-25', NULL, '2023-11-29 09:47:33', 'cerveza-cusquena-negra-botella-620ml', 1),
	(71, 7, '1477755884', 'Cerveza Cusqueña Negra Botella 620ml Caja x 12 unidades', '<p>Es un tipo de cerveza lager alemana opaca, de color muy oscuro y sabor fuerte que recuerda al chocolate o al caf&eacute;.</p>', 72.00, 15, '2040-08-25', NULL, '2023-11-29 09:48:23', 'cerveza-cusquena-negra-botella-620ml-caja-x-12-unidades', 1),
	(72, 7, '144422664', 'Cerveza Cusqueña Trigo Botella 620ml', '<p>El principal de sus ingredientes es el&nbsp;<strong>trigo</strong>&nbsp;Andrews, que pasa por un leve filtrado con el que la&nbsp;<strong>cerveza</strong>&nbsp;adquiere el aroma y sabor del&nbsp;<strong>trigo</strong>&nbsp;malteado. Posee un cuerpo m&aacute;s consistente y denso, con un contenido alcoh&oacute;lico de 5%.</p>', 6.00, 50, '2040-05-04', NULL, '2023-11-29 09:49:50', 'cerveza-cusquena-trigo-botella-620ml', 1),
	(73, 7, '1447788891', 'Cerveza Cusqueña Trigo Botella 620ml x 12 unidades', '<p>El principal de sus ingredientes es el&nbsp;<strong>trigo</strong>&nbsp;Andrews, que pasa por un leve filtrado con el que la&nbsp;<strong>cerveza</strong>&nbsp;adquiere el aroma y sabor del&nbsp;<strong>trigo</strong>&nbsp;malteado. Posee un cuerpo m&aacute;s consistente y denso, con un contenido alcoh&oacute;lico de 5%.</p>', 72.00, 15, '2040-04-05', NULL, '2023-11-29 09:50:44', 'cerveza-cusquena-trigo-botella-620ml-x-12-unidades', 1),
	(74, 7, '87346533', 'Cerveza Pilsen Callao Lata 355ml Unidad', '<p>Son cervezas frescas, doradas, ligeras, con buena carbonataci&oacute;n y con un sutil amargor final.</p>', 3.50, 50, '2040-06-15', NULL, '2023-11-29 09:52:15', 'cerveza-pilsen-callao-lata-355ml-unidad', 1),
	(75, 9, '895624562132', 'Doritos Queso Fuego', '<p>Contiene 90 gramos, de tortillas sabor a maiz y queso picante</p>', 3.50, 20, '2024-11-12', NULL, '2023-11-29 10:00:47', 'doritos-queso-fuego', 1),
	(76, 7, '366544777412', 'Cerveza Pilsen Callao Lata 355ml six pack', '<p>Son cervezas frescas, doradas, ligeras, con buena carbonataci&oacute;n y con un sutil amargor final.</p>', 20.00, 20, '2040-09-05', NULL, '2023-11-29 10:03:54', 'cerveza-pilsen-callao-lata-355ml-six-pack', 1),
	(77, 8, '7162537', 'Fibra Verde Scotch Brite', '<p>Fibra Verde Scotch Brite - 14cm x 10cm</p>', 1.50, 10, '2026-01-28', NULL, '2023-11-29 10:10:57', 'fibra-verde-scotch-brite', 1),
	(78, 8, '7712361', 'Detergente Patito Limón 140gr.', '<p>Detergente en polvo Patito Lim&oacute;n 140gr.</p>', 1.20, 10, '2024-08-29', NULL, '2023-11-29 10:12:52', 'detergente-patito-limon-140gr', 1),
	(79, 8, '761253123', 'Jabon Bolivar 210gr', '<p>Jab&oacute;ni de lavar Bolivar Floral 210gr.</p>', 3.20, 10, '2024-02-29', NULL, '2023-11-29 10:15:36', 'jabon-bolivar-210gr', 1),
	(80, 9, '5846921345', 'Cuates Picantes', '<p>Los cuates Pincante 50 gr</p> <p>Peso neto: 50gr&nbsp;</p> <p>Marca:&nbsp;Karinto</p>', 2.00, 26, '2023-12-29', NULL, '2023-11-29 10:16:01', 'cuates-picantes', 1),
	(81, 8, '718716239', 'Limpiatodo Sapolio Aroma Floral 900ml', '<p>Limpiatodo Sapolio Aroma Floral 900ml</p>', 3.50, 10, '2024-04-29', NULL, '2023-11-29 10:17:31', 'limpiatodo-sapolio-aroma-floral-900ml', 1),
	(82, 9, '151508082000', 'Dorito queso atrevido', '', 3.50, 22, '2024-08-15', NULL, '2023-11-29 10:20:01', 'dorito-queso-atrevido', 1),
	(83, 8, '87217863', 'Lavavajilla en Pasta Sapolio Limón Pote 800gr', '<p>Lavavajilla en Pasta Sapolio Lim&oacute;n Pote 800gr con esponja</p> <p>&nbsp;</p>', 5.00, 10, '2024-09-29', NULL, '2023-11-29 10:20:02', 'lavavajilla-en-pasta-sapolio-limon-pote-800gr', 1),
	(84, 10, '4778511266', 'Spaghetti Don Vittorio 500gr', '<p>Elaborado con el mejor trigo Durum. Alto valor nutritivo y proteico. No necesita tostado. Nunca se pega.</p>', 3.20, 50, '2024-10-30', NULL, '2023-11-29 10:20:08', 'spaghetti-don-vittorio-500gr', 1),
	(85, 10, '5147888741', 'Spaghetti Molitalia 500gr', '<p>Pasta amarilla que no se pega y no necesita aceite. S&eacute;mola y Harina de Trigo Fortificada seg&uacute;n DS&deg; 012-2006-S.A con Hierro, Niacina, Tiamina (B1), Riboflavina (B2), y &Aacute;cido F&oacute;lico.</p>', 2.70, 50, '2024-11-25', NULL, '2023-11-29 10:21:45', 'spaghetti-molitalia-500gr', 1),
	(86, 10, '25447587', 'Salsa Roja Completa Don Vittorio Doypack 400gr', '<p>Salsa de Tomate&nbsp;<em>Salsa roja</em>. Aderezo de tomate. Crema de tomate. Salsa para cocina. Contenido Neto.&nbsp;<em>400 gr</em>. Denominaci&oacute;n/Variedad.&nbsp;<em>Salsa Roja</em>.</p>', 6.90, 30, '2024-12-30', NULL, '2023-11-29 10:26:30', 'salsa-roja-completa-don-vittorio-doypack-400gr', 1),
	(87, 10, '641445774', 'Salsa Clásica de Tomate Pomarola Doypack 320gr', '<p>laborado en instalaciones que procesan Gluten y productos de Soja. Calor&iacute;as Por Porci&oacute;n, 8.52Kcal. Carbohidratos Por Porci&oacute;n, 59.9g. Grasas Por Porci&oacute;n, 1.4g</p>', 5.90, 25, '2024-12-25', NULL, '2023-11-29 10:30:26', 'salsa-clasica-de-tomate-pomarola-doypack-320gr', 1),
	(88, 9, '864595489555', 'Piqueo Snax', '<p>Ideal para un momento especial en familia&nbsp;<br />Producto de calidad</p> <p>Contenido Neto: 200 gramos</p>', 7.50, 10, '2024-01-28', NULL, '2023-11-29 10:30:35', 'piqueo-snax', 1),
	(89, 10, '65887444', 'Mayonesa Alacena 95gr', '<p>Salsa emulsionada a base de huevo crudo, aceite, sal y alg&uacute;n l&iacute;quido &aacute;cido (jugo de lim&oacute;n o vinagre)</p>', 4.00, 40, '2024-08-05', NULL, '2023-11-29 10:33:03', 'mayonesa-alacena-95gr', 1),
	(90, 9, '148956325652', 'Lays Ondas 140 g', '<p>Papas Lays Ondas Picantes</p> <p>Peso neto: 140 g</p> <p>&nbsp;</p>', 5.50, 8, '2024-01-20', NULL, '2023-11-29 10:34:27', 'lays-ondas-140-g', 1),
	(91, 10, '6547447111', 'Mayonesa Alacena 190gr', '<p>Salsa emulsionada a base de huevo crudo, aceite, sal y alg&uacute;n l&iacute;quido &aacute;cido (jugo de lim&oacute;n o vinagre)</p>', 5.70, 25, '2024-08-24', NULL, '2023-11-29 10:34:48', 'mayonesa-alacena-190gr', 1),
	(92, 10, '65588774445', 'Mayonesa Alacena 475gr', '<p>salsa emulsionada a base de huevo crudo, aceite, sal y alg&uacute;n l&iacute;quido &aacute;cido&nbsp;(jugo de lim&oacute;n o vinagre)</p>', 9.00, 25, '2024-08-24', NULL, '2023-11-29 10:36:08', 'mayonesa-alacena-475gr', 1),
	(93, 10, '74558744125', 'Mayonesa Light Alacena 100gr', '<p>Alimento emulsificado semis&oacute;lido, de aspecto blanco cremoso, preparado a partir de aceite vegetal, vinagre, jugo de lim&oacute;n, huevos y especias.</p>', 4.00, 25, '2024-06-08', NULL, '2023-11-29 10:37:53', 'mayonesa-light-alacena-100gr', 1),
	(94, 10, '144778885699', 'Crema Huancaína Alacena Doypack 85gr', '<p>Ingredientes:&nbsp;aj&iacute; amarillo, aceite vegetal comestible (soya), agua, maltodextrina, pasta de queso procesado (queso ricota, suero de leche, vinagre, sal, goma xantana), aceite de soya interesterificado, agua, suero de leche, concentrado proteico, foscato de sodio,&nbsp;maltodextrina, queso chedar, conservante (sorbato de potasio), estabilizante (carboximetil celulosa). Contiene productos lacteos.</p>', 4.80, 25, '2024-05-15', NULL, '2023-11-29 10:40:21', 'crema-huancaina-alacena-doypack-85gr', 1),
	(95, 9, '256314526532', 'Maní Crocante Salado 100g', '<p>Descubre la deliciosa combinaci&oacute;n de sabor y textura con Karinto Man&iacute; Crocante Salado. Este snack ofrece una experiencia &uacute;nica para tu paladar con su irresistible capa crocante y su punto justo de sal, perfecto para disfrutar en cualquier momento del d&iacute;a. Cada paquete de 100g est&aacute; dise&ntilde;ado para proporcionar una porci&oacute;n ideal para llevar y compartir. A pesar de su sabor tentador, es importante considerar que es alto en grasas saturadas y sodio, por lo que se recomienda consumirlo en moderaci&oacute;n dentro de una dieta equilibrada. &iexcl;No te pierdas este exquisito aperitivo que te dejar&aacute; queriendo m&aacute;s!</p>', 2.50, 15, '2024-03-20', NULL, '2023-11-29 10:40:54', 'mani-crocante-salado-100g', 1),
	(96, 10, '699877714', 'Crema Huancaína Alacena Doypack 400gr', '<p>Ingredientes:&nbsp;aj&iacute; amarillo, aceite vegetal comestible (soya), agua, maltodextrina, pasta de queso procesado (queso ricota, suero de leche, vinagre, sal, goma xantana), aceite de soya interesterificado, agua, suero de leche, concentrado proteico, foscato de sodio,&nbsp;maltodextrina, queso chedar, conservante (sorbato de potasio), estabilizante (carboximetil celulosa). Contiene productos lacteos.</p>', 10.00, 25, '2024-06-25', NULL, '2023-11-29 10:41:48', 'crema-huancaina-alacena-doypack-400gr', 1),
	(97, 9, '362514523699', 'Karinto Maní Picante 100g', '<p>Para los amantes de los sabores intensos, Karinto presenta su exquisita versi&oacute;n Man&iacute; Crocante Picante. Este snack de 100g combina la textura perfectamente crujiente de nuestro man&iacute; de calidad con una selecci&oacute;n audaz de especias que aportan el nivel justo de picante. Ideal para aquellos momentos en que buscas un aperitivo con car&aacute;cter, cada bocado te llevar&aacute; a una experiencia gastron&oacute;mica vibrante. Presentado en un llamativo paquete rosa fucsia, es el snack perfecto para llevar y disfrutar dondequiera que est&eacute;s. &iexcl;Prep&aacute;rate para desafiar tu paladar con Karinto Man&iacute; Crocante Picante y disfruta de una explosi&oacute;n de sabor en cada man&iacute;</p>', 2.50, 16, '2024-03-20', NULL, '2023-11-29 10:44:45', 'karinto-mani-picante-100g', 1),
	(98, 10, '7411155778', 'Salsa de Rocoto Alacena Doypack 85gr', '<p>La mejor selecci&oacute;n de Rocotos y la autentica receta peruana casera le dan a la Salsa de Rocoto Molido Alacena ese picantito &uacute;nico que hace que disfrutes de tus comidas al m&aacute;ximo. Los Rocotos m&aacute;s rojos son molidos hasta obtener una fina salsa a la cual se le agrega chorritos del m&aacute;s puro aceite vegetal logrando el picor ideal. Del&eacute;itate con la Salsa de Rocoto Molido Alacena, el rico sabor de casa.</p>', 3.50, 25, '2024-06-25', NULL, '2023-11-29 10:45:04', 'salsa-de-rocoto-alacena-doypack-85gr', 1),
	(99, 10, '655814477', 'Crema de Rocoto Uchucuta Alacena Doypack 85gr', '<p>Se inspir&oacute; en la oriunda receta pune&ntilde;a, ha logrado mezclar en las medidas precisas rocoto, con huacatay, cebolla, perejil y hierbas arom&aacute;ticas, homenajeando de este modo la milenaria tradici&oacute;n de la cocina del sur andino del pa&iacute;s.</p>', 4.80, 25, '2024-06-25', NULL, '2023-11-29 10:46:42', 'crema-de-rocoto-uchucuta-alacena-doypack-85gr', 1),
	(100, 10, '658872451', 'Crema de Rocoto Uchucuta Alacena 400gr', '<p>Se inspir&oacute; en la oriunda receta pune&ntilde;a, ha logrado mezclar en las medidas precisas rocoto, con huacatay, cebolla, perejil y hierbas arom&aacute;ticas, homenajeando de este modo la milenaria tradici&oacute;n de la cocina del sur andino del pa&iacute;s.</p>', 9.00, 25, '2024-06-25', NULL, '2023-11-29 10:49:11', 'crema-de-rocoto-uchucuta-alacena-400gr', 1),
	(101, 10, '6588123368', 'Crema de Ají Tarí Alacena Doypack 85gr', '<p>Crema de Aj&iacute; dise&ntilde;ada por el chef Gast&oacute;n Acurio, inspirada en recetas tradicionales. Especial para preparar papas, pollos a la brasa y otras recetas.</p>', 4.80, 25, '2024-06-26', NULL, '2023-11-29 10:51:13', 'crema-de-aji-tari-alacena-doypack-85gr', 1),
	(102, 10, '455771166', 'Crema de Ají Tarí Alacena Doypack 400gr', '<p>Crema de Aj&iacute; dise&ntilde;ada por el chef Gast&oacute;n Acurio, inspirada en recetas tradicionales. Especial para preparar papas, pollos a la brasa y otras recetas.</p>', 10.00, 25, '2024-06-25', NULL, '2023-11-29 10:52:37', 'crema-de-aji-tari-alacena-doypack-400gr', 1),
	(103, 10, '266997741', 'Ketchup Alacena 100gr', '<ul> <li> <div>Contiene 100 gramos</div> </li> <li> <div>Salsa ketchup</div> </li> <li> <div>Elaborado con concentrado de tomate</div> </li> </ul>', 2.00, 25, '2024-06-25', NULL, '2023-11-29 11:00:59', 'ketchup-alacena-100gr', 1),
	(104, 9, '256321326221', 'Papas Lays', '<p>Disfruta del sabor aut&eacute;ntico y la calidad superior con las papas fritas Lay\'s Cl&aacute;sicas. Creadas con orgullo a partir de papas peruanas seleccionadas, cada bolsa de 210g ofrece un crujido satisfactorio y un sabor puro que solo Lay\'s puede proporcionar. Nuestras papas fritas son una elecci&oacute;n cl&aacute;sica para cualquier ocasi&oacute;n, ya sea que est&eacute;s compartiendo con amigos o disfrutando de un momento para ti. Aunque es un placer indulgente, es importante tener en cuenta su contenido alto en grasas saturadas. Elige Lay\'s Cl&aacute;sicas para esos momentos en los que solo las mejores papas fritas satisfar&aacute;n tu antojo de algo salado y crujiente</p>', 6.50, 6, '2024-01-25', NULL, '2023-11-29 11:01:13', 'papas-lays', 1),
	(105, 10, '655588774', 'Ketchup Alacena 380gr', '<ul> <li> <div>Contiene 200 gramos</div> </li> <li> <div>Salsa ketchup</div> </li> <li> <div>Elaborado con concentrado de tomate</div> </li> </ul>', 5.50, 25, '2024-05-26', NULL, '2023-11-29 11:04:46', 'ketchup-alacena-380gr', 1),
	(106, 10, '14441224', 'Aceite Vegetal Primor Clásico Botella 900ml', '<p>Es un poderoso aliado para controlar los niveles de colesterol en la sangre, lo contribuye tambi&eacute;n a la reducci&oacute;n de enfermedades card&iacute;acas y accidentes cerebrovasculares</p>', 11.50, 50, '2025-12-30', NULL, '2023-11-29 11:07:03', 'aceite-vegetal-primor-clasico-botella-900ml', 1),
	(107, 10, '4112557746', 'Aceite Vegetal Primor Premium Botella 900ml', '<p>El aceite vegetal Primor Premium tiene muchos beneficios para la salud. Entre ellos est&aacute; el hecho de que<strong>&nbsp;</strong>es un poderoso aliado para controlar los niveles de colesterol en la sangre, lo contribuye tambi&eacute;n a la reducci&oacute;n de enfermedades card&iacute;acas y accidentes cerebrovasculares.</p>', 12.50, 50, '2025-05-26', NULL, '2023-11-29 11:08:50', 'aceite-vegetal-primor-premium-botella-900ml', 1),
	(108, 9, '245698145001', 'Lays Ondas Clásicas 140 g', '<p>Sum&eacute;rgete en el placer crujiente de Lay\'s Ondas Cl&aacute;sicas, un snack que transforma los momentos cotidianos en algo especial. Con 140g de pura delicia, estas papas fritas onduladas son la perfecta combinaci&oacute;n de sabor y textura, ideales para los que buscan una experiencia sensorial m&aacute;s intensa. Hechas con ingredientes de alta calidad, las Lay\'s Ondas Cl&aacute;sicas son una invitaci&oacute;n a disfrutar de un cl&aacute;sico con un giro &uacute;nico. Mientras te deleitas con cada mordida, recuerda que este producto es alto en grasas saturadas y sodio, por lo que se recomienda disfrutarlo de manera responsable. &iexcl;D&eacute;jate llevar por las ondas de sabor que solo Lay\'s puede ofrecer!</p>', 5.50, 7, '2024-06-06', NULL, '2023-11-29 11:11:14', 'lays-ondas-clasicas-140-g', 1),
	(109, 10, '699332112', 'Arroz Parbolizado Costeño Bolsa 750gr', '<p>El arroz Parbolizado&nbsp;se obtiene despu&eacute;s de realizar un proceso de cocci&oacute;n h&uacute;medo y secado del arroz con c&aacute;scara, este proceso mejora el perfil nutricional y cambia su textura. Este arroz es muy pr&aacute;ctico, ya que no se pasa en la cocci&oacute;n, ni se pega.</p>', 4.50, 40, '2024-10-03', NULL, '2023-11-29 11:17:50', 'arroz-parbolizado-costeno-bolsa-750gr', 1),
	(110, 10, '322114478', 'Arroz Superior Paisana Bolsa 1kg', '<p>El arroz Parbolizado&nbsp;se obtiene despu&eacute;s de realizar un proceso de cocci&oacute;n h&uacute;medo y secado del arroz con c&aacute;scara, este proceso mejora el perfil nutricional y cambia su textura. Este arroz es muy pr&aacute;ctico, ya que no se pasa en la cocci&oacute;n, ni se pega.</p>', 3.90, 40, '2024-10-30', NULL, '2023-11-29 11:19:35', 'arroz-superior-paisana-bolsa-1kg', 1),
	(111, 10, '944711568', 'Arroz Superior Paisana Bolsa 5kg', '<p>El arroz Parbolizado&nbsp;se obtiene despu&eacute;s de realizar un proceso de cocci&oacute;n h&uacute;medo y secado del arroz con c&aacute;scara, este proceso mejora el perfil nutricional y cambia su textura. Este arroz es muy pr&aacute;ctico, ya que no se pasa en la cocci&oacute;n, ni se pega.</p>', 19.80, 40, '2024-06-25', NULL, '2023-11-29 11:21:01', 'arroz-superior-paisana-bolsa-5kg', 1),
	(112, 10, '944711254', 'Arroz Extra Costeño Bolsa 5kg', '<p>El arroz Parbolizado&nbsp;se obtiene despu&eacute;s de realizar un proceso de cocci&oacute;n h&uacute;medo y secado del arroz con c&aacute;scara, este proceso mejora el perfil nutricional y cambia su textura. Este arroz es muy pr&aacute;ctico, ya que no se pasa en la cocci&oacute;n, ni se pega.</p>', 23.50, 40, '2024-10-25', NULL, '2023-11-29 11:21:57', 'arroz-extra-costeno-bolsa-5kg', 1),
	(113, 9, '2415689562', 'Chizitos Queso 190g', '<p>Disfruta de la diversi&oacute;n en cada bocado con Chizitos sabor a Queso. Estos deliciosos snacks horneados est&aacute;n hechos a base de ma&iacute;z y vienen cargados con un delicioso sabor a queso que encantar&aacute; a toda la familia. Presentados en un colorido paquete de 190g, Chizitos ofrece el equilibrio perfecto entre sabor y textura. Aunque son una opci&oacute;n tentadora para cualquier momento del d&iacute;a, es importante considerar su contenido alto en grasas saturadas y sodio. Con Chizitos sabor a Queso, &iexcl;est&aacute;s listo para convertir cualquier momento en una fiesta de sabor!</p>', 1.00, 15, '2024-01-29', NULL, '2023-11-29 11:22:31', 'chizitos-queso-190g', 1),
	(114, 9, '8596412536', 'Cheese tris', '<p>Con Cheese Tris, lleva la alegr&iacute;a y el sabor a tus meriendas con estos crujientes y deliciosos palitos de ma&iacute;z con sabor a queso. En cada paquete de 39g, encontrar&aacute;s una explosi&oacute;n de sabor que te encantar&aacute; desde el primer bocado. Perfectos para disfrutar solo o en compa&ntilde;&iacute;a, los Cheese Tris son el snack ideal para darle un giro divertido a tus momentos de ocio. Aunque no podr&aacute;s resistirte a su delicioso sabor, recuerda que son snacks altos en grasas saturadas y sodio, por lo que se aconseja disfrutarlos con moderaci&oacute;n. &iexcl;Prep&aacute;rate para una experiencia llena de sabor con Cheese Tris, el snack que siempre te deja queriendo m&aacute;s!</p>', 1.30, 23, '2024-10-20', NULL, '2023-11-29 11:26:26', 'cheese-tris', 1),
	(115, 10, '6997441147', 'Filete de Atún Campomar en Aceite Vegetal Lata 170gr', '<p>La conserva de filete de at&uacute;n&nbsp;contiene una mezcla perfecta de at&uacute;n, aceite vegetal, agua y sal. Es un producto de calidad que contribuye con la nutrici&oacute;n debido a los diversos aportes que su consumo genera.</p>', 6.00, 25, '2024-04-30', NULL, '2023-11-29 11:35:21', 'filete-de-atun-campomar-en-aceite-vegetal-lata-170gr', 1),
	(116, 9, '24516895154', 'Piqueo Snax 55', '<p>Disfruta de la variedad y el sabor con cada bolsa de Piqueo Snax Original. Este paquete de 55g est&aacute; lleno de diversi&oacute;n y sabor, ofreciendo una selecci&oacute;n de snacks crujientes y sabrosos para satisfacer todos tus antojos. Ya sea que est&eacute;s en movimiento o relaj&aacute;ndote en casa, Piqueo Snax es el acompa&ntilde;ante perfecto para esos momentos de hambre. Con una mezcla de formas y texturas, hay algo para todos en este paquete. Aunque es una delicia para el paladar, ten en cuenta su alto contenido de grasas saturadas y sodio. Piqueo Snax Original es tu opci&oacute;n ideal para un snack r&aacute;pido y delicioso que siempre ofrece m&aacute;s en cada mordida</p>', 2.00, 16, '2024-10-26', NULL, '2023-11-29 11:52:52', 'piqueo-snax-55', 1),
	(117, 3, '3456789', 'Chocolate Bombón Oreo Bolita 1 unidad', '', 1.00, 20, '2024-05-24', NULL, '2023-11-29 11:54:54', 'chocolate-bombon-oreo-bolita-1-unidad', 1),
	(118, 2, '2114741225', 'Agua Cielo Sin Gas Botella 625ml', '<p><em>Agua</em>&nbsp;de alta calidad que te brinda el bienestar que necesitas en tu d&iacute;a a d&iacute;a&nbsp;</p>', 1.20, 50, '2025-12-30', NULL, '2023-11-29 11:55:15', 'agua-cielo-sin-gas-botella-625ml', 1),
	(119, 2, '364411557', 'Agua Cielo Sin Gas Botella Tapa Sport 1L', '<p><em>Agua</em>&nbsp;de alta calidad que te brinda el bienestar que necesitas en tu d&iacute;a a d&iacute;a&nbsp;</p>', 2.00, 50, '2025-12-25', NULL, '2023-11-29 11:56:36', 'agua-cielo-sin-gas-botella-tapa-sport-1l', 1),
	(120, 3, '9876543', 'Chocolate Lentejas en Grajeas Caja 30gr', '', 1.00, 12, '2024-04-28', NULL, '2023-11-29 11:57:18', 'chocolate-lentejas-en-grajeas-caja-30gr', 1),
	(121, 11, '25659862535', 'Chicles Trident Sabor Yerbabuena', '<p>Contiene 5 pastillas masticables</p>', 1.20, 25, '2024-02-20', NULL, '2023-11-29 11:57:32', 'chicles-trident-sabor-yerbabuena', 1),
	(122, 2, '455774152', 'Agua Cielo Sin Gas Caja 20L', '<p><em>Agua</em>&nbsp;de alta calidad que te brinda el bienestar que necesitas en tu d&iacute;a a d&iacute;a&nbsp;</p>', 24.00, 25, '2025-12-26', NULL, '2023-11-29 11:57:45', 'agua-cielo-sin-gas-caja-20l', 1),
	(123, 3, '87687654567', 'Chocolate Princesa Blanco Barra 30gr', '', 1.60, 12, '2024-03-16', NULL, '2023-11-29 11:58:29', 'chocolate-princesa-blanco-barra-30gr', 1),
	(124, 2, '144771225', 'Agua Loa Sin Gas Botella 625ml', '<p>Agua ligera, con el mejor sabor y ph alcalino , que ayuda al correcto funcionamiento del cuerpo. Cuenta con triple certificaci&oacute;n ISO y certificaci&oacute;n HACCP.</p>', 1.00, 50, '2025-12-25', NULL, '2023-11-29 12:00:36', 'agua-loa-sin-gas-botella-625ml', 1),
	(125, 3, '9876543987', 'Chocolate Sublime Bitter Barra 40gr', '', 2.50, 14, '2024-05-24', NULL, '2023-11-29 12:00:52', 'chocolate-sublime-bitter-barra-40gr', 1),
	(126, 11, '25469854532', 'Chicles Trident Sabor Sandía', '<p>Contiene 5 pastillas sabor sandia</p>', 1.30, 20, '2024-03-25', NULL, '2023-11-29 12:01:21', 'chicles-trident-sabor-sandia', 1),
	(127, 2, '122547789', 'Agua Loa Sin Gas Botella 2.5L', '<p>Agua ligera, con el mejor sabor y ph alcalino , que ayuda al correcto funcionamiento del cuerpo. Cuenta con triple certificaci&oacute;n ISO y certificaci&oacute;n HACCP.</p>', 2.50, 50, '2025-12-25', NULL, '2023-11-29 12:01:51', 'agua-loa-sin-gas-botella-25l', 1),
	(128, 3, '237626789', 'Chocolate Sublime Carnaval Blanco Barra 40gr', '', 2.00, 12, '2024-04-26', NULL, '2023-11-29 12:02:13', 'chocolate-sublime-carnaval-blanco-barra-40gr', 1),
	(129, 2, '6335741447', 'Agua Loa Sin Gas Caja 20L', '<p>Agua ligera, con el mejor sabor y ph alcalino , que ayuda al correcto funcionamiento del cuerpo. Cuenta con triple certificaci&oacute;n ISO y certificaci&oacute;n HACCP.</p>', 23.00, 25, '2025-05-26', NULL, '2023-11-29 12:02:59', 'agua-loa-sin-gas-caja-20l', 1),
	(130, 3, '9876535724', 'Chocolate Triángulo Barra 30gr', '', 1.60, 6, '2024-05-25', NULL, '2023-11-29 12:03:39', 'chocolate-triangulo-barra-30gr', 1),
	(131, 2, '244712697', 'Agua Mineral San Mateo Con Gas Botella 600ml', '<p>Agua Mineral de Manantial envasada en su fuente de origen, que contribuye con la salud y bienestar, ya que no s&oacute;lo refresca sino que repone los minerales vitales que tu cuerpo necesita.</p>', 1.50, 50, '2025-12-30', NULL, '2023-11-29 12:04:06', 'agua-mineral-san-mateo-con-gas-botella-600ml', 1),
	(132, 3, '9876345637', 'Galleta Agua Line Costa Six Pack', '', 4.20, 6, '2024-06-15', NULL, '2023-11-29 12:04:53', 'galleta-agua-line-costa-six-pack', 1),
	(133, 2, '255471458', 'Agua Mineral San Mateo Con Gas Botella 1.5L', '<p>Agua Mineral de Manantial envasada en su fuente de origen, que contribuye con la salud y bienestar, ya que no s&oacute;lo refresca sino que repone los minerales vitales que tu cuerpo necesita.</p>', 2.50, 50, '2025-12-25', NULL, '2023-11-29 12:05:46', 'agua-mineral-san-mateo-con-gas-botella-15l', 1),
	(134, 3, '9745683456765', 'Galleta Charada Field Six Pack', '', 4.30, 6, '2024-03-31', NULL, '2023-11-29 12:06:35', 'galleta-charada-field-six-pack', 1),
	(135, 3, '9832374345', 'Galleta Chips Ahoy Original', '', 1.20, 6, '2024-06-30', NULL, '2023-11-29 12:07:45', 'galleta-chips-ahoy-original', 1),
	(136, 2, '69971455', 'Agua Mineral San Mateo Sin Gas Botella 600ml', '<p>Agua Mineral de Manantial envasada en su fuente de origen, que contribuye con la salud y bienestar, ya que no s&oacute;lo refresca sino que repone los minerales vitales que tu cuerpo necesita.</p>', 1.50, 50, '2025-12-20', NULL, '2023-11-29 12:08:23', 'agua-mineral-san-mateo-sin-gas-botella-600ml', 1),
	(137, 2, '477558812', 'Agua Mineral San Mateo Sin Gas Botella 1.5L', '<p>Agua Mineral de Manantial envasada en su fuente de origen, que contribuye con la salud y bienestar, ya que no s&oacute;lo refresca sino que repone los minerales vitales que tu cuerpo necesita.</p>', 2.50, 50, '2025-12-25', NULL, '2023-11-29 12:09:30', 'agua-mineral-san-mateo-sin-gas-botella-15l', 1),
	(138, 2, '69988714', 'Agua San Luis Sin Gas Botella 625ml', '<p><em>Agua</em>&nbsp;tratada microfiltrada, esterilizada y ozonizada. El producto se llena a temperatura ambiente.&nbsp;<em>Agua</em>&nbsp;mineral de manantial envasada en su fuente de origen</p>', 1.50, 50, '2025-12-30', NULL, '2023-11-29 12:12:20', 'agua-san-luis-sin-gas-botella-625ml', 1),
	(139, 2, '255447712', 'Agua San Luis Sin Gas Botella 2.5L', '<p><em>Agua</em>&nbsp;tratada microfiltrada, esterilizada y ozonizada. El producto se llena a temperatura ambiente.&nbsp;<em>Agua</em>&nbsp;mineral de manantial envasada en su fuente de origen</p>', 2.50, 50, '2025-12-25', NULL, '2023-11-29 12:13:28', 'agua-san-luis-sin-gas-botella-25l', 1),
	(140, 1, '25896562562', 'Jamón de pollo', '<p>&nbsp;Este embutido de 200g, curado y cocido con la mejor carne de cerdo, es rico en prote&iacute;nas y perfecto para un desayuno r&aacute;pido, un almuerzo escolar o una cena ligera. La imagen del s&aacute;ndwich en el empaque es una sugerencia para servir, presentando el jam&oacute;n en un contexto cotidiano y familiar. A pesar de ser una opci&oacute;n conveniente y sabrosa, es importante tener en cuenta su alto contenido de sodio al planificar una dieta balanceada. Elige San Fernando para llevar a tu mesa un producto de calidad que complementar&aacute; cualquier comida con sabor y nutrici&oacute;n.</p>', 2.00, 26, '2024-10-25', NULL, '2023-11-29 12:14:44', 'jamon-de-pollo', 1),
	(141, 2, '69944125', 'Bebida Cifrut Citrus Punch Botella 400ml', '<p>CIFRUT es una&nbsp;bebida refrescante con deliciosas combinaciones de sabores de frutas, perfecta para el p&uacute;blico joven. Ideal para aquellos que buscan sabores nuevos y diferentes. Contiene vitaminas A, B y C.</p>', 1.00, 50, '2025-12-30', NULL, '2023-11-29 12:16:26', 'bebida-cifrut-citrus-punch-botella-400ml', 1),
	(142, 2, '69445225', 'Bebida Cifrut Citrus Punch Botella 1.5L', '<p>CIFRUT es una&nbsp;bebida refrescante con deliciosas combinaciones de sabores de frutas, perfecta para el p&uacute;blico joven. Ideal para aquellos que buscan sabores nuevos y diferentes. Contiene vitaminas A, B y C.</p>', 3.00, 50, '2024-12-25', NULL, '2023-11-29 12:17:43', 'bebida-cifrut-citrus-punch-botella-15l', 1),
	(143, 1, '986532459865', 'Super Salchicha San Fernando 920g', '<p>Las Super Salchicha Rosada de San Fernando son el complemento perfecto para tus comidas en familia o celebraciones con amigos. Este paquete grande de 920g ofrece 24 salchichas jugosas y sabrosas, hechas con carne de cerdo de alta calidad. Con un buen perfil de prote&iacute;nas y energ&iacute;a, estas salchichas pueden ser el ingrediente estrella de tus hot dogs, guisos o acompa&ntilde;amientos. Mant&eacute;n siempre este producto refrigerado para preservar su frescura y sabor</p>', 11.00, 8, '2024-06-20', NULL, '2023-11-29 12:18:48', 'super-salchicha-san-fernando-920g', 1),
	(144, 2, '255471169', 'Bebida Cifrut Citrus Punch Botella 3L', '<p>CIFRUT es una&nbsp;bebida refrescante con deliciosas combinaciones de sabores de frutas, perfecta para el p&uacute;blico joven. Ideal para aquellos que buscan sabores nuevos y diferentes. Contiene vitaminas A, B y C.</p>', 6.00, 50, '2025-12-25', NULL, '2023-11-29 12:18:57', 'bebida-cifrut-citrus-punch-botella-3l', 1),
	(145, 2, '655471125', 'Bebida Cifrut Fruit Punch Botella 400ml', '<p>Bebida refrescante con delicioso sabor a&nbsp;<em>granadilla</em>&nbsp;ideal para quienes buscan sabores nuevos diferente contiene vitamina A B C</p>', 1.00, 50, '2025-12-25', NULL, '2023-11-29 12:20:09', 'bebida-cifrut-fruit-punch-botella-400ml', 1),
	(146, 2, '2554471125', 'Bebida Cifrut Fruit Punch Botella 1.5L', '<p>Bebida refrescante con delicioso sabor a&nbsp;<em>granadilla</em>&nbsp;ideal para quienes buscan sabores nuevos diferente contiene vitamina A B C</p>', 3.00, 50, '2025-12-25', NULL, '2023-11-29 12:21:07', 'bebida-cifrut-fruit-punch-botella-15l', 1),
	(147, 1, '58496658955', 'Salchicha de pollo', '<p>Este paquete de 100g, que incluye tres salchichas, es perfecto para cuando necesitas una opci&oacute;n de prote&iacute;nas sabrosa y f&aacute;cil de preparar. Ya sea que las incorpores en un s&aacute;ndwich, las a&ntilde;adas a tus platos de pasta o simplemente las sirvas como parte de un desayuno nutritivo, estas salchichas de pollo est&aacute;n listas para realzar tus comidas con su sabor suave y textura tierna.&nbsp;</p>', 1.50, 20, '2024-10-28', NULL, '2023-11-29 12:22:02', 'salchicha-de-pollo', 1),
	(148, 2, '366574154', 'Bebida Cifrut Fruit Punch Botella 3L', '<p>Bebida refrescante con delicioso sabor a&nbsp;<em>granadilla</em>&nbsp;ideal para quienes buscan sabores nuevos diferente contiene vitamina A B C</p>', 6.00, 50, '2025-12-25', NULL, '2023-11-29 12:22:07', 'bebida-cifrut-fruit-punch-botella-3l', 1),
	(149, 1, '25986224558', 'Pate San Fernando', '<p>Cada paquete de 100g ofrece una combinaci&oacute;n selecta de h&iacute;gado de pollo y pavo con carne de cerdo, creando un pat&eacute; de sabor equilibrado y perfecto para untar en panes, tostadas o como base para salsas enriquecidas. Ideal para reuniones familiares o como un toque gourmet en tu d&iacute;a a d&iacute;a, este pat&eacute; a&ntilde;ade sofisticaci&oacute;n a tus comidas sin complicaciones.&nbsp;</p>', 3.50, 10, '2024-05-24', NULL, '2023-11-29 12:24:20', 'pate-san-fernando', 1),
	(150, 2, '554471126', 'Bebida Gloria de Durazno Caja 1L', '<p><em>Bebida</em>&nbsp;de fruta obtenida a partir de pulpa concentrada de&nbsp;<em>durazno</em>, enriquecida con vitamina C. No contiene colorantes ni preservantes</p>', 4.00, 30, '2025-12-25', NULL, '2023-11-29 12:25:06', 'bebida-gloria-de-durazno-caja-1l', 1),
	(151, 2, '2241114785', 'Bebida Gloria de Mango Caja 1L', '<p><em>Bebida</em> de fruta obtenida a partir de pulpa concentrada de mango, enriquecida con vitamina C. No contiene colorantes ni preservantes</p>', 4.00, 30, '2025-12-25', NULL, '2023-11-29 12:26:02', 'bebida-gloria-de-mango-caja-1l', 1),
	(152, 1, '95685652929', 'Jamonada de pavita', '<p>Producto de 85g es ideal para s&aacute;ndwiches nutritivos, picnics o como parte de un desayuno equilibrado. La Jamonada de Pavita es una opci&oacute;n saludable y conveniente para aquellos que buscan alternativas de carne m&aacute;s ligeras.&nbsp;</p>', 2.80, 21, '2024-02-15', NULL, '2023-11-29 12:26:55', 'jamonada-de-pavita', 1),
	(153, 2, '666541125', 'Bebida Gloria de Naranja Caja 1L', '<p><em>Bebida</em> de fruta obtenida a partir de pulpa concentrada de naranja, enriquecida con vitamina C. No contiene colorantes ni preservantes</p>', 4.00, 30, '2025-12-25', NULL, '2023-11-29 12:27:12', 'bebida-gloria-de-naranja-caja-1l', 1),
	(154, 2, '554411244', 'Bebida Gloria de Piña Caja 1L', '<p><em>Bebida</em> de fruta obtenida a partir de pulpa concentrada de pi&ntilde;a, enriquecida con vitamina C. No contiene colorantes ni preservantes</p>', 4.00, 30, '2025-12-12', NULL, '2023-11-29 12:28:18', 'bebida-gloria-de-pina-caja-1l', 1),
	(155, 1, '856958456', 'Jamón de pavita', '<p>El Jam&oacute;n de Pavita de San Fernando ofrece una opci&oacute;n saludable y sabrosa para tus comidas diarias. Con un 50% menos grasa, este jam&oacute;n de pavo viene en un pr&aacute;ctico paquete de 100g con 5 tajadas listas para consumir. Ideal para s&aacute;ndwiches ligeros, ensaladas o como parte de una dieta balanceada, este producto garantiza sabor sin comprometer tu salud.</p>', 3.00, 16, '2024-07-21', NULL, '2023-11-29 12:29:53', 'jamon-de-pavita', 1),
	(156, 2, '6332211447', 'Bebida Saborizada Aquarius de Pera Botella 600ml', '<p>El agua saborizada Aquarius con sabor a pera&nbsp;contiene un 10% de jugo de pera con vitaminas B3 y B6. Bajas calor&iacute;as, s&oacute;lo 61 kcal y alto contenido en sodio 55 mg por vaso. Sabor: pera.</p>', 1.80, 50, '2025-11-25', NULL, '2023-11-29 12:31:10', 'bebida-saborizada-aquarius-de-pera-botella-600ml', 1),
	(157, 2, '36644589', 'Bebida Saborizada Aquarius de Pera Botella 1.5L', '<p>El agua saborizada Aquarius con sabor a pera contiene un 10% de jugo de pera con vitaminas B3 y B6. Bajas calor&iacute;as, s&oacute;lo 61 kcal y alto contenido en sodio 55 mg por vaso. Sabor: pera.</p>', 4.00, 50, '2025-11-25', NULL, '2023-11-29 12:32:19', 'bebida-saborizada-aquarius-de-pera-botella-15l', 1),
	(158, 2, '33665471587', 'Bebida Saborizada Aquarius de Manzana Botella 600ml', '<p>El agua saborizada Aquarius con sabor a pera&nbsp;contiene un 10% de jugo de pera con vitaminas B3 y B6. Bajas calor&iacute;as, s&oacute;lo 61 kcal y alto contenido en sodio 55 mg por vaso. Sabor: manzana</p>', 1.80, 50, '2025-11-25', NULL, '2023-11-29 12:34:06', 'bebida-saborizada-aquarius-de-manzana-botella-600ml', 1),
	(159, 2, '6655447712', 'Bebida Saborizada Aquarius de Manzana Botella 1.5L', '<p>El agua saborizada Aquarius con sabor a pera&nbsp;contiene un 10% de jugo de pera con vitaminas B3 y B6. Bajas calor&iacute;as, s&oacute;lo 61 kcal y alto contenido en sodio 55 mg por vaso. Sabor: manzana</p>', 4.00, 50, '2025-11-25', NULL, '2023-11-29 12:35:07', 'bebida-saborizada-aquarius-de-manzana-botella-15l', 1),
	(160, 5, '37654313', 'Shampoo Pantene 2 en 1 Cuidado Clásico 400ml', '', 15.90, 6, '2024-02-16', NULL, '2023-11-29 12:36:07', 'shampoo-pantene-2-en-1-cuidado-clasico-400ml', 1),
	(161, 5, '3543223457', 'Shampoo Pantene Restauración 400ml', '', 15.90, 6, '2025-01-03', NULL, '2023-11-29 12:36:56', 'shampoo-pantene-restauracion-400ml', 1),
	(162, 2, '2255441756', 'Gaseosa Coca Cola Original Botella 600ml', '<p>Agua carbonatada, az&uacute;cares a&ntilde;adidos (az&uacute;car y jarabe de alta fructosa, JMAF), color caramelo clase IV, &aacute;cido fosf&oacute;rico, saborizantes, sucralosa (4.4mg)</p>', 2.50, 50, '2025-11-30', NULL, '2023-11-29 12:37:05', 'gaseosa-coca-cola-original-botella-600ml', 1),
	(163, 2, '336447115', 'Gaseosa Coca Cola Original Botella 1L', '<p>Agua carbonatada, az&uacute;cares a&ntilde;adidos (az&uacute;car y jarabe de alta fructosa, JMAF), color caramelo clase IV, &aacute;cido fosf&oacute;rico, saborizantes, sucralosa (4.4mg)</p>', 4.50, 50, '2025-10-20', NULL, '2023-11-29 12:38:08', 'gaseosa-coca-cola-original-botella-1l', 1),
	(164, 5, '23456543', 'Shampoo Pantene Fuerza y Reconstrucción 400ml', '', 15.90, 6, '2024-09-14', NULL, '2023-11-29 12:38:09', 'shampoo-pantene-fuerza-y-reconstruccion-400ml', 1),
	(165, 2, '144457756', 'Gaseosa Coca Cola Original Botella 1.5L', '<p>Agua carbonatada, az&uacute;cares a&ntilde;adidos (az&uacute;car y jarabe de alta fructosa, JMAF), color caramelo clase IV, &aacute;cido fosf&oacute;rico, saborizantes, sucralosa (4.4mg)</p>', 6.00, 50, '2025-12-20', NULL, '2023-11-29 12:39:05', 'gaseosa-coca-cola-original-botella-15l', 1),
	(166, 2, '5544112547', 'Gaseosa Coca Cola Original Botella 3L', '<p>Agua carbonatada, az&uacute;cares a&ntilde;adidos (az&uacute;car y jarabe de alta fructosa, JMAF), color caramelo clase IV, &aacute;cido fosf&oacute;rico, saborizantes, sucralosa (4.4mg)</p>', 10.50, 30, '2025-12-25', NULL, '2023-11-29 12:41:05', 'gaseosa-coca-cola-original-botella-3l', 1),
	(167, 11, '58964526332', 'Caramelos Halls Cereza', '<p>Cada paquete contiene 9 caramelos que proporcionan un alivio instant&aacute;neo y una explosi&oacute;n de sabor a cereza. Perfectos para llevar en el bolsillo o en el bolso, estos caramelos son ideales para refrescar tu aliento en cualquier momento del d&iacute;a.</p>', 1.50, 35, '2025-08-17', NULL, '2023-11-29 12:43:34', 'caramelos-halls-cereza', 1),
	(168, 11, '89554458855', 'Caramelos Halls Menta', '<p>Cada paquete contiene 9 caramelos que proporcionan un alivio instant&aacute;neo y una explosi&oacute;n de sabor a Menta. Perfectos para llevar en el bolsillo o en el bolso, estos caramelos son ideales para refrescar tu aliento en cualquier momento del d&iacute;a.</p>', 1.50, 38, '2025-02-13', NULL, '2023-11-29 12:44:57', 'caramelos-halls-menta', 1),
	(169, 11, '89544855652', 'Caramelos Halls Azul', '<p>Cada paquete contiene 9 caramelos que proporcionan un alivio instant&aacute;neo y una explosi&oacute;n de sabor a Azul. Perfectos para llevar en el bolsillo o en el bolso, estos caramelos son ideales para refrescar tu aliento en cualquier momento del d&iacute;a.</p>', 1.50, 39, '2023-12-12', NULL, '2023-11-29 12:51:02', 'caramelos-halls-azul', 1);

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
  `precio` decimal(20,2) DEFAULT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idservicio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.servicio: ~7 rows (aproximadamente)
DELETE FROM `servicio`;
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Rafting y nado con salvavidas en el río', 'Emocionante aventura acuática en aguas bravas con guías expertos y equipo de seguridad.', 11.20, 'portada_servicio.png', '2024-05-13 19:46:32', 'rafting_y_nado_con_salvavidas_en_el_rio', 1),
	(2, 'Práctica de kayak y canotaje', 'Explora ríos y lagos a bordo de kayaks y canoas, ideal para amantes de la naturaleza.', 9.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'practica_de_kayak_y_canotaje', 1),
	(3, 'Tirolesa y parques de aventuras aéreas', 'Desafía la gravedad y disfruta de la adrenalina en recorridos por el aire entre árboles.', 5.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tirolesa_y_parques_de_aventuras_aereas', 1),
	(4, 'Tours extremos y de adrenalina', 'Experimenta emociones fuertes con actividades como rapel, bungee jumping y más.', 10.00, 'img_ee5da223d41a457c75108adb998ca63c.jpg', '2024-05-13 19:46:32', 'tours-extremos-y-de-adrenalina', 1),
	(5, 'Tours de naturaleza y vida silvestre', 'Descubre la diversidad natural y observa animales en su hábitat natural.', 10.00, 'img_bc833529de8d9b1871ec7e7756efda97.jpg', '2024-05-13 19:46:32', 'tours-de-naturaleza-y-vida-silvestre', 1),
	(6, 'aaaa', 'kkkkkkkk', 17.30, 'portada_servicio.png', '2024-05-18 12:01:02', 'aaaa', 0),
	(7, 'www', 'wwwwwwsss', 23.00, 'portada_servicio.png', '2024-06-10 01:09:56', 'www', 0);

-- Volcando estructura para tabla agencia.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.tipopago: ~7 rows (aproximadamente)
DELETE FROM `tipopago`;
INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
	(1, 'PayPal', 1),
	(2, 'Efectivo', 1),
	(3, 'Tarjeta', 1),
	(4, 'Cheque', 1),
	(5, 'Despósito Bancario', 1),
	(6, 'Yape', 1),
	(7, 'Plin', 1);

-- Volcando estructura para tabla agencia.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT (now()),
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.venta: ~5 rows (aproximadamente)
DELETE FROM `venta`;
INSERT INTO `venta` (`idventa`, `codigo_venta`, `datecreated`, `idvendedor`, `dni_cliente`, `idtipopago`, `total`, `status`) VALUES
	(25, 'v_1', '2024-06-11 16:41:38', 22, '72014141', 1, 81.00, 1),
	(27, 'v_2', '2024-06-11 17:33:06', 22, '72014141', 3, 333.00, 1),
	(28, 'v_3', '2024-06-10 18:45:06', 22, '4444444444', 1, 333.00, 1),
	(29, 'v_4', '2024-06-11 18:46:52', 22, '72014141', 2, 30.00, 1),
	(30, 'v_5', '2024-06-11 18:49:57', 22, '72014141', 1, 14.00, 1);

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

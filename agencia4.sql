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

-- Volcando estructura para tabla agencia.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.contacto: ~1 rows (aproximadamente)
DELETE FROM `contacto`;
INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
	(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18');

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

-- Volcando datos para la tabla agencia.detalle_pedido: ~0 rows (aproximadamente)
DELETE FROM `detalle_pedido`;

-- Volcando estructura para tabla agencia.detalle_temp
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `personaid` bigint NOT NULL,
  `productoid` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  `transaccionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  KEY `personaid` (`personaid`),
  CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_temp_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.detalle_temp: ~0 rows (aproximadamente)
DELETE FROM `detalle_temp`;

-- Volcando estructura para tabla agencia.imagen
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productoid` bigint NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.imagen: ~0 rows (aproximadamente)
DELETE FROM `imagen`;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla agencia.opciones: ~0 rows (aproximadamente)
DELETE FROM `opciones`;

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
  CONSTRAINT `FK_pedido_reembolso` FOREIGN KEY (`reembolso`) REFERENCES `reembolso` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.permisos: ~37 rows (aproximadamente)
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
	(30, 4, 1, 1, 0, 0, 0),
	(31, 4, 2, 0, 0, 0, 0),
	(32, 4, 3, 1, 1, 1, 0),
	(33, 4, 4, 1, 0, 0, 0),
	(34, 4, 5, 1, 0, 1, 0),
	(35, 4, 6, 0, 0, 0, 0),
	(36, 4, 7, 1, 0, 0, 0),
	(37, 4, 8, 1, 0, 0, 0),
	(38, 4, 9, 0, 0, 0, 0),
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
	(206, 1, 11, 1, 1, 1, 1);

-- Volcando estructura para tabla agencia.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `email_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.persona: ~6 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`, `direccion`, `ciudad`, `rolidempleado`) VALUES
	(2, '73621360', 'Jeanettis Mariel', 'Luyo Correa', 910089718, 'jluyo@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', NULL, NULL, NULL, NULL, 2, '2023-11-29 10:57:56', 1, NULL, NULL, NULL),
	(22, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'ID tributo javier', 'NAME tributo javier', 'ADDRES tributo javier', '0b29bd63a450601e8de9-46a10d5e89d9c8d8010f-34f01ff7f4adc772e209-2598a10910d6573c55cd', 1, '2023-11-10 03:11:09', 1, '111111', '2222', NULL),
	(24, 'JUAN LLOCYA', 'Juan Manuel', 'Llocya Castro', 918313532, 'jllocya@system32.shop', '', 'sssssss', 'sssss', 'sssssssssss', NULL, NULL, '2023-11-29 11:03:25', 1, NULL, NULL, 1),
	(28, '72014145', 'Alex', 'Huasasquiche', 946454569, 'ahuasasquiche@gmail.com', '', NULL, NULL, NULL, NULL, NULL, '2023-12-06 17:27:31', 1, NULL, NULL, 1),
	(29, '74199532', 'Javier Padin UNDC', 'Padin Flores', 9171893004, '2002010167@undc.edu.pe', '', NULL, NULL, '1111', NULL, NULL, '2023-12-16 10:41:03', 1, 'Av Lima', 'Quilmana', 1),
	(30, '4444444444', 'FRANK', 'GALAGER', 99999999, 'FRANK@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, NULL, NULL, 3, '2024-05-12 23:57:54', 1, NULL, NULL, NULL);

-- Volcando estructura para tabla agencia.post
CREATE TABLE IF NOT EXISTS `post` (
  `idpost` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.post: ~9 rows (aproximadamente)
DELETE FROM `post`;
INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
	(1, 'Inicio', '<div class="p-t-80"> <h3 class="ltext-103 cl5">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class="row"> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://grandesmarcas.cl/wp-content/uploads/2016/06/logo-Costa.jpg" alt="" width="161" height="162" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://www.latinspots.com/files/notas/Gnota_37359.jpg" alt="" width="159" height="89" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://image.slidesharecdn.com/u912337-130617160604-phpapp02/85/identidad-de-marca-san-fernando-1-320.jpg?cb=1666230012" alt="" width="160" height="113" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="data:image/png;base64,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" alt="" width="162" height="162" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="data:image/jpeg;base64,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" alt="" width="162" height="162" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://www.businessempresarial.com.pe/wp-content/uploads/2021/02/sedal.png" alt="" width="154" height="154" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Lay%27s_logo_2019.svg/1200px-Lay%27s_logo_2019.svg.png" alt="" width="150" height="141" /></div> <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 isotope-item women"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQNvn25xMPqBhLW_df4IdRlStlbzZJ-7AM2ek8ZMTnfH1zmN17winsZ2dflAvzF2xlI0A&amp;usqp=CAU" alt="" width="152" height="130" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
	(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 0),
	(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
	(4, 'Nosotros', '<section class="bg0 p-t-75 p-b-120"> <div class="container"> <div class="row p-b-148"> <div class="col-md-7 col-lg-8"> <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md"> <h3 class="mtext-111 cl2 p-b-16">Historia</h3> <p>Esta negocio familiar naci&oacute; como un emprendimiento con la finalidad de poder abastecer a la poblaci&oacute;n de Quilman&aacute;. Nos dedicamos a ofrecer productos comestibles de alta calidad a precios accesibles. Trabajamos estrechamente con proveedores locales para garantizar la frescura de nuestros productos, desde frutas y verduras hasta productos b&aacute;sicos y art&iacute;culos de limpieza. Nuestra selecci&oacute;n est&aacute; cuidadosamente elegida para satisfacer las necesidades de nuestros clientes.</p> <p>Contamos con una atenci&oacute;n personalizada, nuestro equipo, encabezado por Ra&uacute;l Ch&aacute;vez, te recibir&aacute; con una sonrisa amigable. Martha Flores, la persona encargada de caja, est&aacute; siempre dispuesta a ayudarte a encontrar lo que necesitas o a ofrecerte recomendaciones basadas en nuestro conocimiento local.</p> <p>Estamos ubicados en Av. Arequipa 600, y esperamos que puedas disfrutar de la calidad, la accesibilidad y el sentido de comunidad que el market ofrece a diario. &iexcl;Bienvenido al Market Chamorro!</p> </div> </div> <div class="col-11 col-md-5 col-lg-4 m-lr-auto"> <div class="how-bor1 "> <div class="hov-img0"><img src="https://www.toppropiedades.cl/imagenes/b_c169u435coeb4457.jpg" alt="IMG" width="500" height="333" /></div> </div> </div> </div> <div class="row"> <div class="order-md-2 col-md-7 col-lg-8 p-b-30"> <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md"> <h2 class="mtext-111 cl2 p-b-16"><span style="color: #236fa1;">Nuestra Misi&oacute;n</span></h2> <div class="bor16 p-l-29 p-b-9 m-t-22">En Market Chamorro, nuestra misi&oacute;n es ser el principal proveedor de productos comestibles de alta calidad a precios accesibles para la comunidad de Quilman&aacute;. Nacimos como un emprendimiento con la firme convicci&oacute;n de abastecer las necesidades esenciales de nuestra poblaci&oacute;n, contribuyendo as&iacute; al bienestar y la prosperidad de cada hogar en nuestro querido pueblo.</div> </div> </div> <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30"> <div class="how-bor2"> <div class="hov-img0"><img src="https://equipment21.com/wp-content/uploads/diferencias-entre-bodega-y-minimarket.jpg" alt="" width="493" height="286" /></div> </div> </div> </div> </div> </section>', 'fototienda.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
	(5, 'Contacto', '<div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>', 'tiendachamorro.jpg', '2021-08-09 03:11:08', 'contacto', 1),
	(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style="color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
	(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
	(8, 'Sucursaless', '<section class="py-5 text-center"> <div class="container"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class="btn btn-info" href="../../tienda">VER PRODUCTOS</a></div> </section> <div class="py-5 bg-light"> <div class="container"> <div class="row"> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s1.jpg" alt="Tienda Uno" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s2.jpg" alt="Sucural dos" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s3.jpg" alt="Sucural tres" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'chamorroproductos.jpg', '2021-08-11 02:26:45', 'sucursales', 2),
	(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

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
  CONSTRAINT `FK_producto_categoria` FOREIGN KEY (`categoriaid`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.producto: ~0 rows (aproximadamente)
DELETE FROM `producto`;

-- Volcando estructura para tabla agencia.reembolso
CREATE TABLE IF NOT EXISTS `reembolso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint NOT NULL,
  `idtransaccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  CONSTRAINT `FK_reembolso_pedido` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.reembolso: ~0 rows (aproximadamente)
DELETE FROM `reembolso`;

-- Volcando estructura para tabla agencia.rol_empleado
CREATE TABLE IF NOT EXISTS `rol_empleado` (
  `idrolempleado` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolempleado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolempleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.rol_empleado: ~1 rows (aproximadamente)
DELETE FROM `rol_empleado`;
INSERT INTO `rol_empleado` (`idrolempleado`, `nombrerolempleado`, `descripcion`, `status`) VALUES
	(1, 'Guia', 'GUIAR A LOS TURISTAS', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.servicio: ~6 rows (aproximadamente)
DELETE FROM `servicio`;
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Rafting y nado con salvavidas en el río', 'Emocionante aventura acuática en aguas bravas con guías expertos y equipo de seguridad.', 11.20, 'portada_servicio.png', '2024-05-13 19:46:32', 'rafting_y_nado_con_salvavidas_en_el_rio', 1),
	(2, 'Práctica de kayak y canotaje', 'Explora ríos y lagos a bordo de kayaks y canoas, ideal para amantes de la naturaleza.', 9.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'practica_de_kayak_y_canotaje', 1),
	(3, 'Tirolesa y parques de aventuras aéreas', 'Desafía la gravedad y disfruta de la adrenalina en recorridos por el aire entre árboles.', 5.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tirolesa_y_parques_de_aventuras_aereas', 1),
	(4, 'Tours extremos y de adrenalina', 'Experimenta emociones fuertes con actividades como rapel, bungee jumping y más.', 50.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tours_extremos_y_de_adrenalina', 1),
	(5, 'Tours de naturaleza y vida silvestre', 'Descubre la diversidad natural y observa animales en su hábitat natural.', 10.00, 'portada_servicio.png', '2024-05-13 19:46:32', 'tours_de_naturaleza_y_vida_silvestre', 1),
	(6, 'aaaa', 'kkkkkkkk', 17.30, 'portada_servicio.png', '2024-05-18 12:01:02', 'aaaa', 0);

-- Volcando estructura para tabla agencia.suscripciones
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `idsuscripcion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsuscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla agencia.suscripciones: ~4 rows (aproximadamente)
DELETE FROM `suscripciones`;
INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
	(2, 'Juan', 'juan@info.com', '2023-10-29 20:42:27'),
	(4, 'Jeanettis', 'jeanettis@gmail.com', '2023-11-29 11:16:18'),
	(5, 'Javier Padin Flores', 'javier@gmail.com', '2023-12-06 17:21:27'),
	(6, 'Javier Padin Flores', 'javierfff@gmail.com', '2023-12-23 23:25:01');

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

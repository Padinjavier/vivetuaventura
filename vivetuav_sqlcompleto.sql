-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.3.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla vivetuav_agencia.carrito
CREATE TABLE IF NOT EXISTS `carrito` (
  `idcarrito` bigint NOT NULL AUTO_INCREMENT,
  `idpersona` bigint NOT NULL,
  `idservicio` bigint NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcarrito`) USING BTREE,
  KEY `fk_carrito_persona` (`idpersona`) USING BTREE,
  KEY `fk_carrito_servicio` (`idservicio`) USING BTREE,
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla vivetuav_agencia.carrito: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vivetuav_agencia.detalle_reserva
CREATE TABLE IF NOT EXISTS `detalle_reserva` (
  `iddetalle` bigint NOT NULL AUTO_INCREMENT,
  `idreserva` bigint NOT NULL,
  `idservicio` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fk_detalle_reserva_reserva` (`idreserva`),
  KEY `fk_detalle_reserva_servicio` (`idservicio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla vivetuav_agencia.detalle_reserva: 0 rows
/*!40000 ALTER TABLE `detalle_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_reserva` ENABLE KEYS */;

-- Volcando estructura para tabla vivetuav_agencia.detalle_salida
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.detalle_salida: ~4 rows (aproximadamente)
INSERT INTO `detalle_salida` (`iddetalle_salida`, `idsalida`, `idservicio`, `cantidad`) VALUES
	(5, 2, 3, 3),
	(6, 2, 4, 4),
	(9, 3, 2, 8),
	(11, 4, 1, 8);

-- Volcando estructura para tabla vivetuav_agencia.detalle_venta
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.detalle_venta: ~5 rows (aproximadamente)
INSERT INTO `detalle_venta` (`iddetalleventa`, `codigo_venta`, `idservicio`, `cantidad`, `precio`, `descuento`) VALUES
	(3, 'v_1', 3, 1, 5.00, NULL),
	(4, 'v_1', 4, 1, 13.00, NULL),
	(5, 'v_2', 2, 1, 10.00, 2.00),
	(6, 'v_3', 1, 1, 10.00, 1.00),
	(7, 'v_4', 3, 1, 6.00, 1.00);

-- Volcando estructura para tabla vivetuav_agencia.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `msg_id` bigint NOT NULL AUTO_INCREMENT,
  `input_msg_id` bigint NOT NULL DEFAULT '0',
  `output_msg_id` bigint NOT NULL DEFAULT (0),
  `msg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view` int DEFAULT '1',
  `datecreated` datetime DEFAULT (now()),
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `output_msg_id` (`output_msg_id`),
  KEY `input _msg_id` (`input_msg_id`) USING BTREE,
  CONSTRAINT `FK_messages_persona` FOREIGN KEY (`input_msg_id`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `FK_messages_persona_2` FOREIGN KEY (`output_msg_id`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla vivetuav_agencia.messages: ~33 rows (aproximadamente)
INSERT INTO `messages` (`msg_id`, `input_msg_id`, `output_msg_id`, `msg`, `view`, `datecreated`) VALUES
	(39, 66, 22, 'eee', 0, '2024-08-20 22:23:27'),
	(48, 68, 22, 'hola', 0, '2024-08-20 22:23:30'),
	(63, 68, 22, 'hola', 0, '2024-08-23 19:47:08'),
	(64, 22, 68, 'hola', 0, '2024-08-23 19:47:25'),
	(65, 22, 68, 'que tal', 0, '2024-08-23 19:48:13'),
	(66, 22, 68, 'como estas', 0, '2024-08-23 19:48:20'),
	(67, 68, 22, 'hola que tal\r\n\r\nestoy bien y tu como estas', 0, '2024-08-23 19:48:55'),
	(68, 22, 68, 'hola', 0, '2024-08-23 21:25:04'),
	(69, 22, 68, 'hola', 0, '2024-08-23 21:27:11'),
	(70, 22, 68, 'g', 0, '2024-08-23 21:49:25'),
	(71, 22, 68, 'gg', 0, '2024-08-23 22:01:24'),
	(72, 22, 68, 'gtttt', 0, '2024-08-23 22:01:32'),
	(73, 22, 68, 'tttttttttt', 0, '2024-08-23 22:01:35'),
	(74, 22, 68, 'hola', 0, '2024-09-13 21:21:03'),
	(75, 22, 68, 'j', 0, '2024-09-13 21:21:17'),
	(76, 22, 66, 'hola', 1, '2024-09-25 09:58:13'),
	(77, 22, 66, 'gogog', 1, '2024-09-25 09:58:21'),
	(78, 22, 66, 'goalall', 1, '2024-09-25 09:58:29'),
	(79, 22, 67, 'fff', 1, '2024-09-25 09:59:10'),
	(80, 22, 68, 'eesdsdd', 0, '2024-09-27 19:58:20'),
	(81, 22, 68, 'skasjsajksakjsajk', 0, '2024-09-27 19:58:27'),
	(82, 22, 68, 'Gestiónate solo', 0, '2024-09-27 21:09:11'),
	(83, 68, 22, 'rápido pues', 0, '2024-09-27 21:10:05'),
	(84, 68, 22, 'xd', 0, '2024-09-27 21:10:15'),
	(85, 22, 68, 'nu', 0, '2024-09-27 21:10:28'),
	(86, 68, 22, 'hazle la competencia a chatgpt', 0, '2024-09-27 21:10:53'),
	(87, 22, 68, 'tienes novia?', 0, '2024-09-27 21:11:09'),
	(88, 68, 22, 'no y tú ????', 0, '2024-09-27 21:11:31'),
	(89, 68, 22, '????', 0, '2024-09-27 21:11:50'),
	(90, 22, 68, '????', 0, '2024-09-27 21:12:09'),
	(91, 22, 68, 'a ok', 0, '2024-09-27 21:12:19'),
	(92, 68, 22, 'no importa', 0, '2024-09-27 21:12:29'),
	(93, 68, 22, 'así me gustas', 0, '2024-09-27 21:12:33');

-- Volcando estructura para tabla vivetuav_agencia.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.modulo: ~14 rows (aproximadamente)
INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
	(1, 'Dashboard', 'Dashboard', 1),
	(2, 'Empleado', 'Usuarios del sistema', 1),
	(3, 'RolEmpleado', 'Roles de empleados', 1),
	(4, 'Clientes', 'Clientes de tienda', 1),
	(5, 'Usuarios', 'usuario', 1),
	(6, 'RolUsuario', 'Roles de Usuario', 1),
	(7, 'Ventas', 'Ventas', 1),
	(8, 'Salidas', 'Salidas de la agencia', 1),
	(9, 'Servicios', 'Caterogías Productos', 1),
	(10, 'Opciones', 'opciones de pagina', 1),
	(11, 'Páginas', 'Páginas del sitio web', 1),
	(12, 'Contactos', 'Mensajes del formulario contacto', 1),
	(13, 'Suscriptores', 'Suscriptores del sitio web', 1),
	(14, 'recuerdos', 'recuerdos de deportes', 1);

-- Volcando estructura para tabla vivetuav_agencia.opciones
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

-- Volcando datos para la tabla vivetuav_agencia.opciones: ~1 rows (aproximadamente)
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(13, 22, 1, 1, 1);

-- Volcando estructura para tabla vivetuav_agencia.permisos
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
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.permisos: ~66 rows (aproximadamente)
INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
	(412, 3, 1, 1, 1, 1, 1),
	(413, 3, 2, 1, 1, 1, 1),
	(414, 3, 3, 1, 1, 1, 1),
	(415, 3, 4, 1, 1, 1, 1),
	(416, 3, 5, 1, 1, 1, 1),
	(417, 3, 6, 1, 1, 1, 1),
	(418, 3, 7, 1, 1, 1, 1),
	(419, 3, 8, 1, 1, 1, 1),
	(420, 3, 9, 1, 1, 1, 1),
	(421, 3, 10, 1, 1, 1, 1),
	(422, 3, 11, 1, 1, 1, 1),
	(423, 3, 12, 1, 1, 1, 1),
	(424, 3, 13, 1, 1, 1, 1),
	(425, 4, 1, 1, 1, 1, 1),
	(426, 4, 2, 1, 1, 1, 1),
	(427, 4, 3, 1, 1, 1, 1),
	(428, 4, 4, 1, 1, 1, 1),
	(429, 4, 5, 1, 1, 1, 1),
	(430, 4, 6, 1, 1, 1, 1),
	(431, 4, 7, 1, 1, 1, 1),
	(432, 4, 8, 1, 1, 1, 1),
	(433, 4, 9, 1, 1, 1, 1),
	(434, 4, 10, 1, 1, 1, 1),
	(435, 4, 11, 1, 1, 1, 1),
	(436, 4, 12, 1, 1, 1, 1),
	(437, 4, 13, 1, 1, 1, 1),
	(438, 13, 1, 0, 0, 0, 0),
	(439, 13, 2, 0, 0, 0, 0),
	(440, 13, 3, 0, 0, 0, 0),
	(441, 13, 4, 0, 0, 0, 0),
	(442, 13, 5, 0, 0, 0, 0),
	(443, 13, 6, 0, 0, 0, 0),
	(444, 13, 7, 0, 0, 0, 0),
	(445, 13, 8, 0, 0, 0, 0),
	(446, 13, 9, 0, 0, 0, 0),
	(447, 13, 10, 0, 0, 0, 0),
	(448, 13, 11, 0, 0, 0, 0),
	(449, 13, 12, 0, 0, 0, 0),
	(450, 13, 13, 0, 0, 0, 0),
	(451, 1, 1, 1, 1, 1, 1),
	(452, 1, 2, 1, 1, 1, 1),
	(453, 1, 3, 1, 1, 1, 1),
	(454, 1, 4, 1, 1, 1, 1),
	(455, 1, 5, 1, 1, 1, 1),
	(456, 1, 6, 1, 1, 1, 1),
	(457, 1, 7, 1, 1, 1, 1),
	(458, 1, 8, 1, 1, 1, 1),
	(459, 1, 9, 1, 1, 1, 1),
	(460, 1, 10, 1, 1, 1, 1),
	(461, 1, 11, 1, 1, 1, 1),
	(462, 1, 12, 1, 1, 1, 1),
	(463, 1, 13, 1, 1, 1, 1),
	(464, 2, 1, 1, 1, 1, 1),
	(465, 2, 2, 1, 1, 1, 1),
	(466, 2, 3, 1, 1, 1, 1),
	(467, 2, 4, 1, 1, 1, 1),
	(468, 2, 5, 1, 1, 1, 1),
	(469, 2, 6, 1, 1, 1, 1),
	(470, 2, 7, 1, 1, 1, 1),
	(471, 2, 8, 1, 1, 1, 1),
	(472, 2, 9, 1, 1, 1, 1),
	(473, 2, 10, 1, 1, 1, 1),
	(474, 2, 11, 1, 1, 1, 1),
	(475, 2, 12, 1, 1, 1, 1),
	(476, 2, 13, 1, 1, 1, 1),
	(480, 1, 14, 1, 1, 1, 1);

-- Volcando estructura para tabla vivetuav_agencia.persona
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
  `datecreated` datetime NOT NULL DEFAULT (now()),
  `direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolidempleado` bigint DEFAULT NULL,
  `conexion` int DEFAULT NULL,
  `time_conexion` datetime DEFAULT (now()),
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`),
  KEY `rolidempleado` (`rolidempleado`),
  CONSTRAINT `FK_persona_rol` FOREIGN KEY (`rolid`) REFERENCES `rol_usuario` (`idrolusuario`),
  CONSTRAINT `FK_persona_rol_empleado` FOREIGN KEY (`rolidempleado`) REFERENCES `rol_empleado` (`idrolempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.persona: ~8 rows (aproximadamente)
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `hotel`, `token`, `rolid`, `datecreated`, `direccion`, `ciudad`, `rolidempleado`, `conexion`, `time_conexion`, `img`, `status`) VALUES
	(22, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'ID tributo javier', '0b29bd63a450601e8de9-46a10d5e89d9c8d8010f-34f01ff7f4adc772e209-2598a10910d6573c55cd', 1, '2023-11-10 03:11:09', '111111', '2222', NULL, 0, '2024-12-06 16:01:10', NULL, 1),
	(66, '15282867', 'Yuriko', 'Vicente Arbizu', 987654321, 'arbizu@gmail.com', '9dd48242682f9b76b335154407472da5a8305bcec32d974b4913e46441e40906', NULL, NULL, 2, '2024-06-28 00:24:44', NULL, NULL, NULL, 1, '2022-07-20 08:43:35', NULL, 1),
	(67, '15383812', 'Nelson', 'Luyo Yactayo', 940246612, 'yactayo@gmail.com', NULL, 'Hotel las brisas Lun', NULL, 2, '2024-06-28 00:26:04', NULL, NULL, NULL, 1, '2024-07-20 08:43:33', NULL, 1),
	(68, '87654321', 'Keyler', 'Correa Vicente', 958764321, 'correa@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, 2, '2024-06-28 00:27:29', NULL, NULL, NULL, 1, '2023-07-20 08:43:34', NULL, 1),
	(69, '74199532', 'YUMICO NICOLE', 'ROJAS CASTRO', 917189300, 'javierpadin6g61@gmail.com', NULL, 'qwer', NULL, 3, '2024-09-29 22:39:16', NULL, NULL, NULL, NULL, '2024-09-29 22:39:16', NULL, 1),
	(70, '74199533', 'JUAN ALEXIS', 'HUAYNALAYA VICENTE', 917189300, 'javierpatdin6g61@gmail.com', NULL, 'qwer', NULL, 3, '2024-09-29 22:40:25', NULL, NULL, NULL, NULL, '2024-09-29 22:40:25', NULL, 1),
	(71, NULL, 'Jon', 'Doe', 6019521325, 'test@example.us', '164ab00ea1663b0181580169818231ed94f091fcadba7968bccab2ba2c049312', NULL, NULL, 3, '2024-12-04 12:06:09', NULL, NULL, NULL, 0, '2024-12-04 12:14:38', NULL, 1),
	(72, NULL, 'Jorr', 'Souza Silva', 3121286800, 'teste@exemplo.us', '4bfd3aaad5e0c1c0bdaee0f0fe22d2aea14d97facb56edd18fbde21be00ae4bf', NULL, NULL, 3, '2024-12-04 12:18:34', NULL, NULL, NULL, 0, '2024-12-04 12:20:34', NULL, 1),
	(73, '74199532', 'Javier', 'Padin Flores', 917189300, '2002010167@undc.edu.pe', '963fd552f8e309aa3619d7203521569c48edea49e39595a364844947b1a552c6', NULL, NULL, 3, '2024-12-04 15:45:11', NULL, NULL, NULL, NULL, '2024-12-04 15:45:11', NULL, 1);

-- Volcando estructura para tabla vivetuav_agencia.post
CREATE TABLE IF NOT EXISTS `post` (
  `idpost` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.post: ~7 rows (aproximadamente)
INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
	(1, 'Inicio', '<div class="p-t-80"> <h2 class="ltext-103 cl5" style="text-align: center; line-height: 1;">Nuestros certificados</h2> <h6 style="text-align: center; line-height: 1;">&nbsp;</h6> <h6 style="text-align: center; line-height: 1;">Trabajamos en tu seguridad y bienestar</h6> <p>&nbsp;</p> <h6 style="text-align: center;"><img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSOBQkO7IsIuxk2V_ImedM6KTR9WZDvjqD_DBlp-yc6VCcv9m-q" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSA6AfdsKru3Wwj7AfVThXLp19zInLb8Me93623eCXp-1Rjlkj0" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7VOFlJi69dYKlurKumxPErC5OHUbHm_eW0p1BQA7spuKh4dWd" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCyIWR6B3dW7lkLeQtWKVdUGZH8SL4smWCatO8akC1GgGORUNX" alt="" width="200" height="200" /></h6> <p style="text-align: center;">&nbsp;</p> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
	(2, 'Nosotros', '<p style="text-align: left;">&nbsp;</p> <table style="border-collapse: collapse; width: 100.686%; height: 860px; float: left;" border="0"> <tbody> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <p>&nbsp;</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr style="height: 88px;"> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 17.8374%; height: 88px; text-align: left;" colspan="2"> <h2 style="text-align: left;"><span style="text-decoration: underline;"><span style="color: #000000; text-decoration: underline;"><strong>&iquest;Qui&eacute;nes somos?</strong></span></span></h2> <br />Somos una agencia que ofrece deportes de aventura, nos encontramos ubicados en el Distrito de Lunahuan&aacute;, Ca&ntilde;ete, Lima, en &ldquo;Vive tu aventura&rdquo; llevamos m&aacute;s de 5 a&ntilde;os dedicados a brindar experiencias inolvidables en deportes de aventura. Nuestra prioridad es garantizar que cada cliente disfrute de actividades seguras y bien organizadas, gracias a nuestro compromiso con la calidad y la seguridad en cada equipo. Nos esforzamos cada d&iacute;a por mejorar y ofrecer un servicio de excelencia, porque sabemos que cada aventura es tambi&eacute;n un recuerdo &uacute;nico para quienes nos eligen. &iexcl;Perm&iacute;tenos ser parte de tu pr&oacute;xima gran experiencia!&nbsp;<br /> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%; height: 88px;"> <p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://xnoccioaventura.com/wp-content/uploads/2022/12/fuam.jpg" alt="" width="300" height="300" /></p> <p>&nbsp;</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong><img src="https://www.deaventura.pe/aplication/webroot/imgs/destinosyrutas/Canopy%20lunahuana.jpeg" alt="" width="448" height="250" /><br /></strong></h2> </td> <td style="text-align: left; width: 34.7667%;" colspan="2"> <h2><strong>&nbsp;</strong></h2> <h2><span style="text-decoration: underline;"><strong>Misi&oacute;n</strong></span></h2> <p><br />Nuestra misi&oacute;n es ofrecer un servicio de calidad a trav&eacute;s de la buena atenci&oacute;n de nuestro personal debidamente capacitado, a precios accesibles, logrando superar las expectativas de nuestros clientes.</p> <h2><br /><span style="text-decoration: underline;"><strong>Visi&oacute;n</strong></span></h2> <p><br />Ser l&iacute;deres del turismo de deportes y de aventura a nivel nacional, ejemplo de profesionalismo en la utilizaci&oacute;n de los mejores equipos de seguridad tur&iacute;stica. Promover el crecimiento sustentable de la organizaci&oacute;n, basado en la innovaci&oacute;n permanente tanto en la prestaci&oacute;n de los servicios, el acercamiento a los clientes, la calidad de la informaci&oacute;n brindada, y el asesoramiento adecuado para cada necesidad.</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> </tbody> </table> <div class="map">&nbsp;</div> <div class="map">.</div> <div class="map">&nbsp;</div> <div class="map">&nbsp;</div> <div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d315.7262408155028!2d-76.14074957083302!3d-12.963971315048607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x910fe7a6d1a68def%3A0x50bddb1dbee9225d!2sLunahuan%C3%A1!5e0!3m2!1ses-419!2spe!4v1732910938858!5m2!1ses-419!2spe" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div> <div class="map">&nbsp;</div> <div class="map">&nbsp;</div>', 'img_d2e21221b823ad2c038612e0c8395ceb.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
	(3, 'servicio', '<p>i</p>', 'img_98a657f7b44f1783a0f842caa49492bc.jpg', '2021-08-11 01:51:06', 'servicio', 1),
	(4, 'Reservas', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style="color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
	(5, 'contactos', '<div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>', 'img_bc4c5ab9e8ab096e87aaa6e87cefadfd.jpg', '2021-08-09 03:11:08', 'contacto', 1),
	(6, 'Sucursales', '<section class="py-5 text-center"> <div class="container"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class="btn btn-info" href="../../tienda_virtual/tienda">VER PRODUCTOS</a></div> </section> <div class="py-5 bg-light"> <div class="container"> <div class="row"> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s1.jpg" alt="Tienda Uno" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s2.jpg" alt="Sucural dos" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s3.jpg" alt="Sucural tres" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'chamorroproductos.jpg', '2021-08-11 02:26:45', 'sucursales', 0),
	(7, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- Volcando estructura para tabla vivetuav_agencia.recuerdos
CREATE TABLE IF NOT EXISTS `recuerdos` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.recuerdos: ~5 rows (aproximadamente)
INSERT INTO `recuerdos` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_2511bcd62f49051305f870c1f1fe2ba1.jpg', '2021-08-20 03:04:04', 'hombre', 1),
	(2, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_65cbe11d3cd4cbc84ab7a8e34c3367d3.jpg', '2021-08-21 00:47:10', 'bebidas', 1),
	(3, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_1a6406f136d357e28c374b50dee7ef90.jpg', '2023-11-08 22:52:36', 'dulces', 1),
	(4, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_153b54f2d49cb4b7938f04bad2983c3d.jpg', '2023-11-13 08:35:25', 'ss', 1),
	(5, 'Deportes de aventura', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_2b1769b3c296dc978827a686bf4037a9.jpg', '2023-11-23 01:15:09', 'cuidado-personal', 1);

-- Volcando estructura para tabla vivetuav_agencia.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `idereserva` bigint NOT NULL AUTO_INCREMENT,
  `idcarrito` bigint NOT NULL,
  `idpersona` bigint NOT NULL,
  `fecha_reservacion` datetime NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `codigo_voucher` varchar(255) DEFAULT NULL,
  `modalidad_pago` varchar(50) DEFAULT NULL,
  `captura_voucher` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`idereserva`),
  KEY `fk_reserva_carrito` (`idcarrito`),
  KEY `fk_reserva_persona` (`idpersona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla vivetuav_agencia.reserva: 0 rows
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;

-- Volcando estructura para tabla vivetuav_agencia.rol_empleado
CREATE TABLE IF NOT EXISTS `rol_empleado` (
  `idrolempleado` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolempleado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolempleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.rol_empleado: ~6 rows (aproximadamente)
INSERT INTO `rol_empleado` (`idrolempleado`, `nombrerolempleado`, `descripcion`, `datecreated`, `status`) VALUES
	(1, 'Guia', 'GUIAR A LOS TURISTAS', '2024-06-09 20:25:52', 1),
	(20, 'CONDUCTOR', '111', '2024-06-09 20:25:53', 1),
	(21, 'KAYACK', '222', '2024-06-09 20:25:54', 1),
	(22, 'CARGADOR', '333', '2024-06-09 20:25:54', 1),
	(24, 'sww', 'wwwwwrrrwww', '0000-00-00 00:00:00', 0),
	(25, 'see', 'eeee', '0000-00-00 00:00:00', 0);

-- Volcando estructura para tabla vivetuav_agencia.rol_usuario
CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `idrolusuario` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolusuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolusuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.rol_usuario: ~5 rows (aproximadamente)
INSERT INTO `rol_usuario` (`idrolusuario`, `nombrerolusuario`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendor', 'Operador de tienda', 1),
	(13, 'secretaria', 'secretaria de la tienda 1', 1);

-- Volcando estructura para tabla vivetuav_agencia.salida
CREATE TABLE IF NOT EXISTS `salida` (
  `idsalida` bigint NOT NULL AUTO_INCREMENT,
  `codigo_venta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `personaid` bigint DEFAULT NULL,
  `persona_externa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `descripcion` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `pago` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idsalida`),
  KEY `codigo_venta` (`codigo_venta`),
  KEY `personaid` (`personaid`),
  CONSTRAINT `FK_salida_codigo_venta` FOREIGN KEY (`codigo_venta`) REFERENCES `venta` (`codigo_venta`),
  CONSTRAINT `FK_salidas_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.salida: ~3 rows (aproximadamente)
INSERT INTO `salida` (`idsalida`, `codigo_venta`, `personaid`, `persona_externa`, `descripcion`, `datecreated`, `pago`, `status`) VALUES
	(2, 'v_1', 57, NULL, NULL, '2024-06-20 00:12:54', 2, 1),
	(3, 'v_1', NULL, 'juan', 'lunes', '2024-06-20 00:59:08', 1, 1),
	(4, 'v_2', NULL, 'jjjjjjjjjj', 'jjjjjjjjjjjjjjj', '2024-06-22 21:41:52', 2, 1);

-- Volcando estructura para tabla vivetuav_agencia.servicio
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

-- Volcando datos para la tabla vivetuav_agencia.servicio: ~5 rows (aproximadamente)
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Escalera al cielo', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire. ¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 12.00, 'img_3cc9815c0ea37f81ca69cd352b5f984d.jpg', '2024-05-13 19:46:32', 'escalera-al-cielo', 1),
	(2, 'Rápel', 'Descenso controlado con cuerdas por paredes rocosas o estructuras verticales, ideal para quienes buscan superar desafíos de altura.', 9.00, 'img_181b5a2ea6b569a114e954277e428d75.jpg', '2024-05-13 19:46:32', 'rapel', 1),
	(3, 'Canopy', 'Una experiencia emocionante que consiste en deslizarse por cables tensados a gran altura, disfrutando vistas panorámicas del valle y la naturaleza.', 5.00, 'img_8c94e5767cd3c73d4e9195bb7918763c.jpg', '2024-05-13 19:46:32', 'canopy', 1),
	(4, 'Cuatrimoto', 'Aventuras en vehículos todoterreno que permiten recorrer los paisajes de Lunahuaná, explorando caminos rurales, campos y montañas.', 10.00, 'img_55aaabf0c1575ac5535cfd0927b637b2.jpg', '2024-05-13 19:46:32', 'cuatrimoto', 1),
	(5, 'Canotaje', 'Consiste en descender el río Cañete en botes inflables, desafiando rápidos de diversos niveles de dificultad. Ideal para quienes buscan adrenalina y contacto con la naturaleza.', 10.00, 'img_2dd047b329096c32d5e3f5fa888977e5.jpg', '2024-05-13 19:46:32', 'canotaje', 1);

-- Volcando estructura para tabla vivetuav_agencia.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.tipopago: ~258 rows (aproximadamente)
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

-- Volcando estructura para tabla vivetuav_agencia.venta
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.venta: ~4 rows (aproximadamente)
INSERT INTO `venta` (`idventa`, `codigo_venta`, `datecreated`, `idvendedor`, `dni_cliente`, `idtipopago`, `total`, `status`) VALUES
	(1, 'v_1', '2024-06-18 00:00:00', 22, '4444444444', 187, 13.00, 1),
	(2, 'v_2', '2024-06-21 22:25:56', 22, '4444444444', 4, 8.00, 1),
	(3, 'v_3', '2024-06-26 10:33:26', 64, '4444444444', 6, 9.00, 1),
	(4, 'v_4', '2024-09-29 22:40:52', 22, '74199532', 3, 5.00, 1);

-- Volcando estructura para tabla vivetuav_agencia.ximagenx
CREATE TABLE IF NOT EXISTS `ximagenx` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productoid` bigint NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `ximagenx_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `xproductox` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.ximagenx: ~28 rows (aproximadamente)
INSERT INTO `ximagenx` (`id`, `productoid`, `img`) VALUES
	(1, 1, 'pro_1018ac4efefe93878b7468ce72c630a3.jpg'),
	(2, 1, 'pro_f90affec1052d2bf94047cb224d16568.jpg'),
	(3, 1, 'pro_053da6d3ee7d346b6577ccfef6dac02d.jpg'),
	(4, 2, 'pro_04e3bbf847b466de4aed691fca982d9d.jpg'),
	(12, 2, 'pro_bb8108451aa8a21610931110c19fb369.jpg'),
	(17, 10, 'pro_0b4d61139aaa6a28e022f1e615fe0f17.jpg'),
	(18, 19, 'pro_9a1de76f11ddb287263ef48cfd71b0a1.jpg'),
	(19, 20, 'pro_2b81a3a13eae388efa502edb3d6b3273.jpg'),
	(20, 22, 'pro_8fe9ccbe89eb22626cf5cc85ea8edc57.jpg'),
	(25, 24, 'pro_4909de454090d31ce6b648eb4bb74b52.jpg'),
	(28, 3, 'pro_3396200f9dc84d07c971d4054d0f1cbd.jpg'),
	(29, 25, 'pro_411e4d5d1b3098f47f8baaf4c50854d8.jpg'),
	(30, 26, 'pro_7747cdcbeb9974d48505e5d7ed0d09c1.jpg'),
	(31, 27, 'pro_2d2004938ed38a4dea63ea3aa8f43425.jpg'),
	(32, 28, 'pro_3f52edc06e164e16d75bc573f6ba3655.jpg'),
	(33, 29, 'pro_a04b6fa70ca62d63f9ad68c15dbf9fe3.jpg'),
	(34, 30, 'pro_abcd23d4f71f0efa631c28239c3f4429.jpg'),
	(35, 31, 'pro_eb39235c9e44b12fe20c5cea3cf8b8b7.jpg'),
	(36, 32, 'pro_fb6a9d9500a65044baef176994f5be27.jpg'),
	(37, 33, 'pro_efd8de822cc892d87bf8068ac9a5cc3e.jpg'),
	(38, 34, 'pro_a1e9a795af34ef6c7e5e2fc4ffa2b8be.jpg'),
	(39, 35, 'pro_a9de604315a3193bc04c5aaf0abb95b9.jpg'),
	(40, 36, 'pro_cd6dddbc6f5bd01f2e08e0ac31524c52.jpg'),
	(41, 37, 'pro_a874a7b88eb90b36890ab61a07f6270c.jpg'),
	(42, 38, 'pro_5c4c627f86e3cdeed78b66253d7d0d93.jpg'),
	(43, 39, 'pro_6e5ce9bfc83f4713906f2ed02982a5e5.jpg'),
	(44, 40, 'pro_fdce79c74a32ba9bc9b2c76afd9a6e62.jpg'),
	(45, 41, 'pro_e5cfb45f0b1e00ee19bd542c44f99e7a.jpg');

-- Volcando estructura para tabla vivetuav_agencia.xproductox
CREATE TABLE IF NOT EXISTS `xproductox` (
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
  CONSTRAINT `xproductox_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `recuerdos` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla vivetuav_agencia.xproductox: ~41 rows (aproximadamente)
INSERT INTO `xproductox` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_v`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
	(1, 1, '2417984565', 'Chaqueta Azul', '<p>a</p>', 100.00, 50, '2023-12-30', NULL, '2021-08-20 03:12:14', 'chaqueta-azul', 1),
	(2, 1, '456879878', 'Reloj', '<p>b</p>', 200.00, 100, '2023-10-03', NULL, '2021-08-20 03:14:10', 'reloj', 1),
	(3, 5, '4658798787', 'Pack Shampoo + Acondicionador Dove Reconstrucción Completa Frasco 400ml', '', 28.00, 12, '2023-12-16', NULL, '2021-08-21 00:48:21', 'pack-shampoo-+-acondicionador-dove-reconstruccion-completa-frasco-400ml', 1),
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
	(26, 5, '23442424', 'Shampoo Head & Shoulders 3 en 1 for Men 700ml', '', 28.90, 12, '2023-12-31', NULL, '2023-11-23 01:28:22', 'shampoo-head-&-shoulders-3-en-1-for-men-700ml', 1),
	(27, 5, '2323424', 'Cepillo Dental Oral B 1 2 3 x unidad', '', 2.30, 6, '2024-02-24', NULL, '2023-11-23 01:29:32', 'cepillo-dental-oral-b-1-2-3-x-unidad', 1),
	(28, 5, '345677', 'Jabón en Barra Heno de Pravia Antibacteriano Paquete 150gr', '', 3.80, 8, '2024-01-20', NULL, '2023-11-23 01:30:23', 'jabon-en-barra-heno-de-pravia-antibacteriano-paquete-150gr', 1),
	(29, 5, '3567788', 'Jabón en Barra Heno de Pravia Original Paquete 150gr', '', 3.80, 9, '2024-02-04', NULL, '2023-11-23 01:31:02', 'jabon-en-barra-heno-de-pravia-original-paquete-150gr', 1),
	(30, 5, '888644', 'Jabón Liquido Aval Frutos Rojos Antibacterial Frasco 400ml', '', 6.00, 10, '2024-01-28', NULL, '2023-11-23 01:31:37', 'jabon-liquido-aval-frutos-rojos-antibacterial-frasco-400ml', 1),
	(31, 5, '688899', 'Shampoo Head & Shoulders Manzana Fresh 375ml', '', 17.50, 7, '2024-02-25', NULL, '2023-11-23 01:32:15', 'shampoo-head-&-shoulders-manzana-fresh-375ml', 1),
	(32, 5, '64332456', 'Shampoo Head & Shoulders 2 en 1 Suave y Manejable 700ml', '', 28.90, 5, '2024-03-30', NULL, '2023-11-23 01:33:23', 'shampoo-head-&-shoulders-2-en-1-suave-y-manejable-700ml', 1),
	(33, 5, '5535262', 'Shampoo Head & Shoulders for Men Prevención Caída 375ml', '', 17.50, 5, '2024-05-04', NULL, '2023-11-23 01:34:02', 'shampoo-head-&-shoulders-for-men-prevencion-caida-375ml', 1),
	(34, 5, '8876467', 'Acondicionador Sedal Ceramidas Frasco 340 ml', '', 12.90, 8, '2024-03-24', NULL, '2023-11-23 01:35:26', 'acondicionador-sedal-ceramidas-frasco-340-ml', 1),
	(35, 5, '8777767', 'Acondicionador Negros Luminosos 340ml', '', 12.90, 12, '2024-03-30', NULL, '2023-11-23 01:36:06', 'acondicionador-negros-luminosos-340ml', 1),
	(36, 5, '9998899', 'Acondicionador Sedal Restauración instantánea 340 ml', '', 12.90, 6, '2024-11-08', NULL, '2023-11-23 01:37:00', 'acondicionador-sedal-restauracion-instantanea-340-ml', 1),
	(37, 5, '99999998', 'Jabón Neko Extra Protección x 125 g', '', 4.90, 6, '2024-04-20', NULL, '2023-11-23 01:38:21', 'jabon-neko-extra-proteccion-x-125-g', 1),
	(38, 5, '99998773', 'Toallas Higiénicas Always Noches Tranquilas Cubierta Seca - Bolsa 8 UN', '', 8.10, 12, '2025-01-04', NULL, '2023-11-23 01:39:11', 'toallas-higienicas-always-noches-tranquilas-cubierta-seca---bolsa-8-un', 1),
	(39, 5, '86533445', 'Toallas Higiénicas Always Protección Total Cubierta Seca - Bolsa 8 UN', '', 6.50, 9, '2024-10-16', NULL, '2023-11-23 01:39:57', 'toallas-higienicas-always-proteccion-total-cubierta-seca---bolsa-8-un', 1),
	(40, 5, '5556444', 'Toallas Higiénicas Always Suave Protección Total Ajuste Perfecto - Bolsa 8 UN', '', 4.20, 8, '2024-06-12', NULL, '2023-11-23 01:40:49', 'toallas-higienicas-always-suave-proteccion-total-ajuste-perfecto---bolsa-8-un', 1),
	(41, 5, '11111111', 'Nosotras Natural Buenas Noches X10unids.', '', 8.90, 5, '2024-06-12', NULL, '2023-11-23 01:41:26', 'nosotras-natural-buenas-noches-x10unids', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

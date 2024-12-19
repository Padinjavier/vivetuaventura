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

-- Volcando estructura para tabla vivetuav_agencia.detalle_reserva
CREATE TABLE IF NOT EXISTS `detalle_reserva` (
  `iddetalle` bigint NOT NULL AUTO_INCREMENT,
  `cod_reserva` varchar(100) NOT NULL,
  `idservicio` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fk_detalle_reserva_reserva` (`cod_reserva`) USING BTREE,
  KEY `FK_detalle_reserva_servicio` (`idservicio`),
  CONSTRAINT `FK_detalle_reserva_reserva` FOREIGN KEY (`cod_reserva`) REFERENCES `reserva` (`cod_reserva`),
  CONSTRAINT `FK_detalle_reserva_servicio` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla vivetuav_agencia.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla vivetuav_agencia.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `idreserva` bigint NOT NULL AUTO_INCREMENT,
  `cod_reserva` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idpersona` bigint NOT NULL,
  `idtipopago` bigint NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `codigo_voucher` varchar(255) DEFAULT NULL,
  `captura_voucher` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`idreserva`) USING BTREE,
  KEY `cod_reserva` (`cod_reserva`),
  KEY `idtipopago` (`idtipopago`),
  KEY `FK_reserva_persona` (`idpersona`),
  CONSTRAINT `FK_reserva_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `FK_reserva_tipopago` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla vivetuav_agencia.rol_empleado
CREATE TABLE IF NOT EXISTS `rol_empleado` (
  `idrolempleado` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolempleado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolempleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla vivetuav_agencia.rol_usuario
CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `idrolusuario` bigint NOT NULL AUTO_INCREMENT,
  `nombrerolusuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrolusuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla vivetuav_agencia.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

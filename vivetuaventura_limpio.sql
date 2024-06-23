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

-- Volcando datos para la tabla agencia.detalle_salida: ~3 rows (aproximadamente)
DELETE FROM `detalle_salida`;

-- Volcando datos para la tabla agencia.detalle_venta: ~3 rows (aproximadamente)
DELETE FROM `detalle_venta`;

-- Volcando datos para la tabla agencia.modulo: ~8 rows (aproximadamente)
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

-- Volcando datos para la tabla agencia.opciones: ~0 rows (aproximadamente)
DELETE FROM `opciones`;
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(1, 1, 1, 1, 1);

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

-- Volcando datos para la tabla agencia.persona: ~16 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `hotel`, `token`, `rolid`, `datecreated`, `status`, `direccion`, `ciudad`, `rolidempleado`) VALUES
	(1, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'ID tributo javier', 'a92f890e599fd88c1249-70eb44ebf54b976a9b5e-44ba63358e7d0bc8b654-24d9a8ee52e5154f9b47', 1, '2023-11-10 03:11:09', 1, '111111', '2222', NULL);

-- Volcando datos para la tabla agencia.rol_empleado: ~6 rows (aproximadamente)
DELETE FROM `rol_empleado`;
INSERT INTO `rol_empleado` (`idrolempleado`, `nombrerolempleado`, `descripcion`, `datecreated`, `status`) VALUES
	(1, 'Guia', 'GUIAR A LOS TURISTAS', '2024-06-09 20:25:52', 1),
	(2, 'CONDUCTOR', '111', '2024-06-09 20:25:53', 1),
	(3, 'KAYACK', '222', '2024-06-09 20:25:54', 1),
	(4, 'CARGADOR', '333', '2024-06-09 20:25:54', 1);

-- Volcando datos para la tabla agencia.rol_usuario: ~5 rows (aproximadamente)
DELETE FROM `rol_usuario`;
INSERT INTO `rol_usuario` (`idrolusuario`, `nombrerolusuario`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendor', 'Operador de tienda', 1),
	(5, 'secretaria', 'secretaria de la tienda 1', 1);

-- Volcando datos para la tabla agencia.salida: ~2 rows (aproximadamente)
DELETE FROM `salida`;

-- Volcando datos para la tabla agencia.servicio: ~5 rows (aproximadamente)
DELETE FROM `servicio`;

-- Volcando datos para la tabla agencia.tipopago: ~0 rows (aproximadamente)
DELETE FROM `tipopago`;

-- Volcando datos para la tabla agencia.venta: ~2 rows (aproximadamente)
DELETE FROM `venta`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

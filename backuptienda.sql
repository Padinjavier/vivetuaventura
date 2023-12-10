-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.10.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tiendafinal
CREATE DATABASE IF NOT EXISTS `tiendafinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tiendafinal`;

-- Volcando estructura para tabla tiendafinal.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `portada` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.categoria: ~5 rows (aproximadamente)
DELETE FROM `categoria`;
INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Hombre', 'Artículos de moda', 'img_916c36cd2037f29b0456ab85a1f11ceb.jpg', '2021-08-20 03:04:04', 'hombre', 1),
	(2, 'Bebidas', 'Gaseosa, refresco, fresco o soda', 'img_90165900d66f0ad48275beb8fe1f3f14.jpg', '2021-08-21 00:47:10', 'bebidas', 1),
	(3, 'Dulces', 'Productos dulces peruanos', 'img_350eae9b69dd03a7713ebd84b9bcb5f7.jpg', '2023-11-08 22:52:36', 'dulces', 1),
	(4, 'ss', 'fff', 'img_cc7d26084d5893794aafa18573fd6e85.jpg', '2023-11-13 08:35:25', 'ss', 0),
	(5, 'Cuidado personal', 'Productos de higiene personal', 'img_57bfd177ac746208efa98657cec3970b.jpg', '2023-11-23 01:15:09', 'cuidado-personal', 1);

-- Volcando estructura para tabla tiendafinal.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `dispositivo` varchar(25) NOT NULL,
  `useragent` text NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.contacto: ~1 rows (aproximadamente)
DELETE FROM `contacto`;
INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
	(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18');

-- Volcando estructura para tabla tiendafinal.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.detalle_pedido: ~1 rows (aproximadamente)
DELETE FROM `detalle_pedido`;
INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
	(4, 3, 11, 2.50, 1);

-- Volcando estructura para tabla tiendafinal.detalle_temp
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  KEY `personaid` (`personaid`),
  CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.detalle_temp: ~0 rows (aproximadamente)
DELETE FROM `detalle_temp`;

-- Volcando estructura para tabla tiendafinal.imagen
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.imagen: ~28 rows (aproximadamente)
DELETE FROM `imagen`;
INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
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

-- Volcando estructura para tabla tiendafinal.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.modulo: ~9 rows (aproximadamente)
DELETE FROM `modulo`;
INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
	(1, 'Dashboard', 'Dashboard', 1),
	(2, 'Usuarios', 'Usuarios del sistema', 1),
	(3, 'Clientes', 'Clientes de tienda', 1),
	(4, 'Productos', 'Todos los productos', 1),
	(5, 'Pedidos', 'Pedidos', 1),
	(6, 'Caterogías', 'Caterogías Productos', 1),
	(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
	(8, 'Contactos', 'Mensajes del formulario contacto', 1),
	(9, 'Páginas', 'Páginas del sitio web', 1);

-- Volcando estructura para tabla tiendafinal.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `referenciacobro` varchar(255) DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) DEFAULT NULL,
  `datospaypal` text DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `personaid` (`personaid`),
  KEY `tipopagoid` (`tipopagoid`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.pedido: ~1 rows (aproximadamente)
DELETE FROM `pedido`;
INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
	(3, NULL, NULL, NULL, 22, '2023-11-15 00:50:52', 5.00, 7.50, 2, '123, aaaa', 'Pendiente');

-- Volcando estructura para tabla tiendafinal.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idpermiso`),
  KEY `rolid` (`rolid`),
  KEY `moduloid` (`moduloid`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.permisos: ~36 rows (aproximadamente)
DELETE FROM `permisos`;
INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
	(3, 1, 1, 1, 1, 1, 1),
	(4, 1, 2, 1, 1, 1, 1),
	(5, 1, 3, 1, 1, 1, 1),
	(6, 1, 4, 1, 1, 1, 1),
	(7, 1, 5, 1, 1, 1, 1),
	(8, 1, 6, 1, 1, 1, 1),
	(9, 1, 7, 1, 1, 1, 1),
	(10, 1, 8, 1, 1, 1, 1),
	(11, 1, 9, 1, 1, 1, 1),
	(12, 2, 1, 1, 1, 1, 1),
	(13, 2, 2, 0, 0, 0, 0),
	(14, 2, 3, 1, 1, 1, 0),
	(15, 2, 4, 1, 1, 1, 0),
	(16, 2, 5, 1, 1, 1, 0),
	(17, 2, 6, 1, 1, 1, 0),
	(18, 2, 7, 1, 0, 0, 0),
	(19, 2, 8, 1, 0, 0, 0),
	(20, 2, 9, 1, 1, 1, 1),
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
	(38, 4, 9, 0, 0, 0, 0);

-- Volcando estructura para tabla tiendafinal.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) DEFAULT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `password` varchar(75) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `nombrefiscal` varchar(80) DEFAULT NULL,
  `direccionfiscal` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.persona: ~2 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
	(5, '40771775', 'Pedro', 'Coronado', 944416945, 'netpedrocr@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '12', '2023', 'Ica', 'e37dafa9bb38ddb46f80-938c44ec128fb4f26f8d-48e555fbf73419dc25db-f360a4f692317e380044', 1, '2023-10-24 21:52:15', 1),
	(22, '74199531', 'Xavi', 'Padin Flores', 917189300, 'xavi@xavi.com', '6c9efbcfaaec55a45765043f54b1e64d26075503134f61f6aa0c918a798d9376', NULL, NULL, NULL, NULL, 1, '2023-11-10 03:11:09', 1);

-- Volcando estructura para tabla tiendafinal.post
CREATE TABLE IF NOT EXISTS `post` (
  `idpost` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `portada` varchar(100) DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.post: ~9 rows (aproximadamente)
DELETE FROM `post`;
INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
	(1, 'Inicio', '<div class="p-t-80"> <h3 class="ltext-103 cl5">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class="row"> <div class="col-md-3"><img src="Assets/images/m1.png" alt="Marca 1" width="110" height="110" /></div> <div class="col-md-3"><img src="Assets/images/m2.png" alt="Marca 2" /></div> <div class="col-md-3"><img src="Assets/images/m3.png" alt="Marca 3" /></div> <div class="col-md-3"><img src="Assets/images/m4.png" alt="Marca 4" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
	(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
	(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
	(4, 'Nosotros', '\r\n<section class="bg0 p-t-75 p-b-120"> <div class="container"> <div class="row p-b-148"> <div class="col-md-7 col-lg-8"> <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md"> <h3 class="mtext-111 cl2 p-b-16">Historia</h3> <p class="stext-113 cl6 p-b-26">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat consequat enim, non auctor massa ultrices non. Morbi sed odio massa. Quisque at vehicula tellus, sed tincidunt augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas varius egestas diam, eu sodales metus scelerisque congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas gravida justo eu arcu egestas convallis. Nullam eu erat bibendum, tempus ipsum eget, dictum enim. Donec non neque ut enim dapibus tincidunt vitae nec augue. Suspendisse potenti. Proin ut est diam. Donec condimentum euismod tortor, eget facilisis diam faucibus et. Morbi a tempor elit.</p> <p class="stext-113 cl6 p-b-26">Donec gravida lorem elit, quis condimentum ex semper sit amet. Fusce eget ligula magna. Aliquam aliquam imperdiet sodales. Ut fringilla turpis in vehicula vehicula. Pellentesque congue ac orci ut gravida. Aliquam erat volutpat. Donec iaculis lectus a arcu facilisis, eu sodales lectus sagittis. Etiam pellentesque, magna vel dictum rutrum, neque justo eleifend elit, vel tincidunt erat arcu ut sem. Sed rutrum, turpis ut commodo efficitur, quam velit convallis ipsum, et maximus enim ligula ac ligula.</p> <p class="stext-113 cl6 p-b-26">Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879</p> </div> </div> <div class="col-11 col-md-5 col-lg-4 m-lr-auto"> <div class="how-bor1 "> <div class="hov-img0"><img src="https://www.toppropiedades.cl/imagenes/b_c169u435coeb4457.jpg" alt="IMG" width="500" height="333" /></div> </div> </div> </div> <div class="row"> <div class="order-md-2 col-md-7 col-lg-8 p-b-30"> <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md"> <h2 class="mtext-111 cl2 p-b-16"><span style="color: #236fa1;">Nuestra Misi&oacute;n</span></h2> <p class="stext-113 cl6 p-b-26">Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.</p> <div class="bor16 p-l-29 p-b-9 m-t-22"> <p class="stext-114 cl6 p-r-40 p-b-11">Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.</p> <span class="stext-111 cl8"> - Steve Job&rsquo;s </span></div> </div> </div> <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30"> <div class="how-bor2"> <div class="hov-img0"><img src="https://scontent.flim2-2.fna.fbcdn.net/v/t39.30808-6/274532992_104770648813010_956727112577712065_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGWiLdPeq2LfqRJGSk6icr95EsvFCasTJLkSy8UJqxMksYNaegsrOHtjcMTCd4mvvyjNd8zTPcpLTVwn2Hm9Tuq&_nc_ohc=aTi-GHppTC8AX_wH2eT&_nc_zt=23&_nc_ht=scontent.flim2-2.fna&oh=00_AfAETPzNQeKjsTHqbhb0F6TOsYdv5oIswMZtrKsnS_IuyA&oe=6563296D" alt="IMG" width="500" height="333" /></div> </div> </div> </div> </div> </section>', 'fototienda.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
	(5, 'Contacto', '<div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>', 'tiendachamorro.jpg', '2021-08-09 03:11:08', 'contacto', 1),
	(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style="color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
	(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
	(8, 'Sucursales', '<section class="py-5 text-center"> <div class="container"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class="btn btn-info" href="../../tienda_virtual/tienda">VER PRODUCTOS</a></div> </section> <div class="py-5 bg-light"> <div class="container"> <div class="row"> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s1.jpg" alt="Tienda Uno" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s2.jpg" alt="Sucural dos" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s3.jpg" alt="Sucural tres" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'chamorroproductos.jpg', '2021-08-11 02:26:45', 'sucursales', 1),
	(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- Volcando estructura para tabla tiendafinal.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha_v` varchar(50) NOT NULL DEFAULT '',
  `imagen` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idproducto`),
  KEY `categoriaid` (`categoriaid`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.producto: ~41 rows (aproximadamente)
DELETE FROM `producto`;
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_v`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
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

-- Volcando estructura para tabla tiendafinal.reembolso
CREATE TABLE IF NOT EXISTS `reembolso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) NOT NULL,
  `datosreembolso` text NOT NULL,
  `observacion` text NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.reembolso: ~0 rows (aproximadamente)
DELETE FROM `reembolso`;

-- Volcando estructura para tabla tiendafinal.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.rol: ~7 rows (aproximadamente)
DELETE FROM `rol`;
INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendedor', 'Operador de tienda', 1),
	(5, 'Vendedor2', 'Vendedor2', 0),
	(6, 'ss', 'xx', 1),
	(7, '20', 'df', 1);

-- Volcando estructura para tabla tiendafinal.suscripciones
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `idsuscripcion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idsuscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.suscripciones: ~1 rows (aproximadamente)
DELETE FROM `suscripciones`;
INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
	(2, 'Juan', 'juan@info.com', '2023-10-29 20:42:27');

-- Volcando estructura para tabla tiendafinal.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla tiendafinal.tipopago: ~5 rows (aproximadamente)
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

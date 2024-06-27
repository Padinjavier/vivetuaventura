-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.2.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gsm
CREATE DATABASE IF NOT EXISTS `gsm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gsm`;

-- Volcando estructura para tabla gsm.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.categoria: ~11 rows (aproximadamente)
DELETE FROM `categoria`;
INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Embutidos', 'Productos o derivados cárnicos.', 'img_083c06d74a24b56e649059fd8a3b2416.jpg', '2021-08-20 03:04:04', 'embutidos', 1),
	(2, 'Bebidas', 'Gaseosa, refresco, fresco o soda', 'img_90165900d66f0ad48275beb8fe1f3f14.jpg', '2021-08-21 00:47:10', 'bebidas', 1),
	(3, 'Dulces', 'Productos dulces peruanos', 'img_350eae9b69dd03a7713ebd84b9bcb5f7.jpg', '2023-11-08 22:52:36', 'dulces', 1),
	(4, 'Recreo', 'e', '', '2023-11-13 08:35:25', 'recreo', 1),
	(5, 'Cuidado personal', 'Productos de higiene personal', 'img_57bfd177ac746208efa98657cec3970b.jpg', '2023-11-23 01:15:09', 'cuidado-personal', 1),
	(6, 'Lácteos', 'Lacteos', 'img_e3490ef3cb0f50ab8a431fcf41384313.jpg', '2023-11-29 08:43:42', 'lacteos', 1),
	(7, 'Bebidas Alcoholicas', 'Tragos', 'img_856b9f33b2e9a7ec1d92444aad6542cf.jpg', '2023-11-29 08:45:44', 'bebidas-alcoholicas', 1),
	(8, 'Limpieza', 'Limpieza', 'portada_categoria.png', '2023-11-29 09:34:39', 'limpieza', 1),
	(9, 'Snack', 'Aperitivos', 'portada_categoria.png', '2023-11-29 09:48:31', 'snack', 1),
	(10, 'Abarrotes', 'Fideos, azucares', 'portada_categoria.png', '2023-11-29 10:19:15', 'abarrotes', 1),
	(11, 'Golosinas', 'Caramelos, Chicles, otros', 'portada_categoria.png', '2023-11-29 11:55:23', 'golosinas', 1);

-- Volcando estructura para tabla gsm.contacto
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

-- Volcando datos para la tabla gsm.contacto: ~0 rows (aproximadamente)
DELETE FROM `contacto`;
INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
	(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18');

-- Volcando estructura para tabla gsm.detalle_pedido
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.detalle_pedido: ~13 rows (aproximadamente)
DELETE FROM `detalle_pedido`;
INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
	(4, 3, 11, 2.50, 1),
	(5, 4, 167, 1.50, 1),
	(6, 4, 166, 10.50, 1),
	(8, 6, 169, 1.50, 2),
	(9, 7, 169, 1.50, 1),
	(10, 8, 169, 1.50, 1),
	(11, 8, 168, 1.50, 2),
	(12, 8, 167, 1.50, 2),
	(13, 9, 167, 1.50, 1),
	(14, 10, 164, 15.90, 1),
	(15, 11, 167, 1.50, 1),
	(16, 12, 168, 1.50, 1),
	(17, 13, 167, 1.50, 1);

-- Volcando estructura para tabla gsm.detalle_temp
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.detalle_temp: ~0 rows (aproximadamente)
DELETE FROM `detalle_temp`;

-- Volcando estructura para tabla gsm.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` bigint NOT NULL,
  `HORAS` varchar(50) DEFAULT NULL,
  `Lunes` varchar(50) DEFAULT NULL,
  `Martes` varchar(50) DEFAULT NULL,
  `Miercoles` varchar(50) DEFAULT NULL,
  `Jueves` varchar(50) DEFAULT NULL,
  `Viernes` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gsm.horario: 19 rows
DELETE FROM `horario`;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`id`, `id_persona`, `HORAS`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `status`) VALUES
	(1, 22, '08:00 am - 08:45 am', 'eeee', 'dddd', '222', 'bbbb', 'aaaa', '1'),
	(2, 22, '08:45 am - 09:30 am', '111', '222', '333', '444', '5555', '1'),
	(3, 22, '09:30 am - 10:15 am', '1', '2', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(4, 22, '10:15 am - 11:00 am', 'Matemáticas', 'Matemáticas', '333', 'Matemáticas', 'Matemáticas', '1'),
	(5, 22, '11:00 am - 11:45 am', 'Matemáticas', 'Matemáticas', 'Matemáticas', '444', 'Matemáticas', '1'),
	(6, 22, '11:45 am - 12:30 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '555', '1'),
	(7, 22, '12:30 pm - 01:15 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(8, 22, '01:15 pm - 02:00 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(9, 22, '02:00 pm - 02:45 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(10, 22, '02:45 pm - 03:30 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(11, 22, '03:30 pm - 04:15 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(12, 22, '04:15 pm - 05:00 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(13, 22, '05:00 pm - 05:45 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(14, 22, '05:45 pm - 06:30 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(15, 22, '06:30 pm - 07:15 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(16, 22, '07:15 pm - 08:00 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(17, 22, '08:00 pm - 08:45 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(18, 22, '08:45 pm - 09:30 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1'),
	(19, 22, '09:30 pm - 10:15 pm', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', 'Matemáticas', '1');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;

-- Volcando estructura para tabla gsm.imagen
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productoid` bigint NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.imagen: ~155 rows (aproximadamente)
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
	(45, 41, 'pro_e5cfb45f0b1e00ee19bd542c44f99e7a.jpg'),
	(48, 45, 'pro_428d1f88c345aeed06acb354645b85c2.jpg'),
	(50, 47, 'pro_03e39970fbae337d00d90330c7c8949b.jpg'),
	(52, 49, 'pro_2fe34c39a9dd58ec57bcc11aa7f67cba.jpg'),
	(55, 50, 'pro_8ef50b784576f9ce51a05bcc25e0c056.jpg'),
	(59, 51, 'pro_2d8b01f428785348bfb32b8ff2f58f4e.jpg'),
	(60, 52, 'pro_1ae4971f6faf4eb1700da1afe412ea90.jpg'),
	(61, 46, 'pro_95c52f7934ba15fa3581ee6a52aff6a4.jpg'),
	(62, 42, 'pro_65729593bdf9166f50674a393aa2151c.jpg'),
	(63, 53, 'pro_0fc1f330c6f2c2017a1f37774e0e9e08.jpg'),
	(64, 43, 'pro_db05dcf1f7b23dd94e5b91f806178c80.jpg'),
	(68, 48, 'pro_074a15692d8331aac323ebe95901dd39.jpg'),
	(69, 54, 'pro_84194ede5acee5ff8e6f4a9a1b34fc01.jpg'),
	(70, 55, 'pro_9db1f72359e68918c18cc34e4633a72a.jpg'),
	(71, 56, 'pro_3844acca5f96b7bd5bb0fb98fa84ee88.jpg'),
	(72, 57, 'pro_dec8beda2b1a8a9676b62a0d6267743e.jpg'),
	(73, 58, 'pro_978e0c79b34a24390352dc97a1722da9.jpg'),
	(74, 59, 'pro_128c529c2006e6f022b0975d92fea32f.jpg'),
	(75, 60, 'pro_a70f8634b656bfeb523fb7c0bee08a4e.jpg'),
	(76, 61, 'pro_c27809b1f2f9ccad75865bb018b635e9.jpg'),
	(77, 62, 'pro_0df14d726b07ee9ea9eff5e3941f17a4.jpg'),
	(78, 63, 'pro_fad1d18ac8be98f3f45eb120e7f0ee43.jpg'),
	(79, 64, 'pro_930ea3222512de5d532c6c347f7659e4.jpg'),
	(80, 65, 'pro_58b13647a28d2a1d96a9094d406df99b.jpg'),
	(82, 67, 'pro_c12d6a429384be114d350e7e58ea7c78.jpg'),
	(83, 66, 'pro_e5f89e5dd6a710234d842e35a3489831.jpg'),
	(84, 68, 'pro_fc8fd96e708f481b4e2f746bb5c40993.jpg'),
	(85, 69, 'pro_8d4a25bc5a93f04a7737f5274a1680ab.jpg'),
	(86, 70, 'pro_57f741b6dd6679d1f1b66bd350dcf11d.jpg'),
	(87, 71, 'pro_2aada93220984431a0dcb1dbe0c1fc5c.jpg'),
	(88, 72, 'pro_3f12a000848efe9adaab5abffa36e3e9.jpg'),
	(89, 73, 'pro_8dac61355bf571a903362a40fdc5ef48.jpg'),
	(90, 74, 'pro_896fa8f1eb9351ba26ee3f26944195d5.jpg'),
	(91, 75, 'pro_cd4e7a7e64608ec04594252dda6803f6.jpg'),
	(92, 76, 'pro_eac19bb99529d2266a1ff4f5aa9b43a2.jpg'),
	(93, 77, 'pro_6cc37cd8636e76116138678e4eb853b6.jpg'),
	(94, 78, 'pro_15e7bb8c2e32473964062ea645385b54.jpg'),
	(95, 79, 'pro_e2bd05003fb305e3e7c883d3405f5b07.jpg'),
	(96, 80, 'pro_bb60c3bf0172005500fc5a91fe6335f6.jpg'),
	(98, 81, 'pro_8c2c8317092ea6354111a13f3210510e.jpg'),
	(99, 83, 'pro_60dfb7243fb4c1ff80d2ed15719f5553.jpg'),
	(100, 84, 'pro_7c60ca4fefe24822f745c41143de8bd8.jpg'),
	(101, 82, 'pro_47109bd0547c13fa508cb018f1987275.jpg'),
	(102, 85, 'pro_256e2160957bf6fae3a634e1e9e6816d.jpg'),
	(103, 86, 'pro_7c16497f2bf1d525e5fc84c4f24da961.jpg'),
	(104, 87, 'pro_042430eb90a40398cba2d66516b0fc2b.jpg'),
	(105, 88, 'pro_12fc15a1357a61c3c086304589bd67a8.jpg'),
	(106, 89, 'pro_74f8dd47e7f8a29620dfad7f72ad962d.jpg'),
	(107, 90, 'pro_0e1766601767aa7c2859040cd11d46b7.jpg'),
	(108, 91, 'pro_8ab3802987bdc0df9bc529be9278f8fd.jpg'),
	(109, 92, 'pro_79ee6b90ca597244a4aad0382f45cf5c.jpg'),
	(110, 93, 'pro_b308a00e55edefae2d22079c002fe24d.jpg'),
	(111, 94, 'pro_bdb954a35d76f9de2d96be4a4cde27c1.jpg'),
	(112, 95, 'pro_f75f766522ffaaf8cad763e99692d842.jpg'),
	(113, 96, 'pro_ca0417db9fa4c8f7ae77eed6bfbb4324.jpg'),
	(114, 40, 'pro_7e7491d96103040e23e31d72ae394f42.jpg'),
	(115, 97, 'pro_f1cb1e1a2f3735acbfb4f1d41f7a53ec.jpg'),
	(116, 98, 'pro_e2c15436f1095976535e8ffae3ba735a.jpg'),
	(117, 39, 'pro_4bf7b68b54c68a91f035b3551c1907b7.jpg'),
	(118, 99, 'pro_e4c309a88b64982ab41aab4dae6cf82a.jpg'),
	(119, 100, 'pro_410703aa4eb846a6a2a0f4a3147fc7ae.jpg'),
	(120, 101, 'pro_762d4b3fa65600dcf25c86a6c6b3358f.jpg'),
	(121, 102, 'pro_aae019fb2c2ccd2a73ea21681e20d8ca.jpg'),
	(122, 103, 'pro_2c52505287852b5370827239a279bb77.jpg'),
	(123, 104, 'pro_890de3ec47e04f1433399153621dd319.jpg'),
	(124, 105, 'pro_1295a312dd93846bc8ae18cdd7957ba7.jpg'),
	(125, 106, 'pro_35b27cf9de9f01cd70b285855084700d.jpg'),
	(126, 107, 'pro_2e0259bcdcea380f7fd19cb5331e492a.jpg'),
	(127, 108, 'pro_3da1bd7b6e65428abac32b93a41d3108.jpg'),
	(128, 109, 'pro_dc6b8373e34d709eaf4b4a4e5fe2f19b.jpg'),
	(131, 112, 'pro_ef9413b72db3f915365828525194ffb1.jpg'),
	(132, 113, 'pro_a651c19020ef1f8693d018d9f7feeae0.jpg'),
	(134, 110, 'pro_d5e6f23ef10b3f315f036adc89bfd7c2.jpg'),
	(135, 114, 'pro_3590fa7fc8ea80a3e3f9870d22d568d3.jpg'),
	(137, 111, 'pro_7b10d176bca0ed13f7ff563e3b8838f6.jpg'),
	(138, 115, 'pro_fb33c271b6cb68e522d2491ed55bfc1f.jpg'),
	(139, 116, 'pro_273afbf1378d177e33c1b0ac3aa6b92b.jpg'),
	(140, 117, 'pro_60494d8df8b0cc9f4691701b615b48dc.jpg'),
	(141, 118, 'pro_2d33f8296740591e8228d9d880e95999.jpg'),
	(142, 119, 'pro_e4418acacdce367075e2a7b55d13e43d.jpg'),
	(143, 120, 'pro_91384b76e1d9eed619b394cc259d58e0.jpg'),
	(144, 121, 'pro_e52ca5fe4ca85f7694a4f42978700d5c.jpg'),
	(145, 122, 'pro_606ab9c2a19b83a78fc3fba7db341988.jpg'),
	(146, 123, 'pro_d856962f66a193833ddaa8c93c6b79be.jpg'),
	(147, 124, 'pro_f9ab13eab97aa17c875065f141799923.jpg'),
	(148, 125, 'pro_ccf6d97b8141ae08743e2cdcc66471a9.jpg'),
	(149, 126, 'pro_ffa9742396f1d9eaf8b66c52a5164c15.jpg'),
	(150, 127, 'pro_88663908b0940e665fde38dc55c47344.jpg'),
	(151, 128, 'pro_f6e17a852f1447adb934b455902d30b1.jpg'),
	(152, 129, 'pro_0b4c5a5b8332ffa9918b93e50f3adc33.jpg'),
	(153, 130, 'pro_f4e61f41168ef1f6cd6a4b30e31aa9b2.jpg'),
	(154, 131, 'pro_078a606c4b6a0406c84612fcc5fa698a.jpg'),
	(155, 132, 'pro_cb502441416ced7bcb798fca4afb422c.jpg'),
	(156, 133, 'pro_ab14c1ca4357661c385c3007b8f84a5c.jpg'),
	(158, 136, 'pro_bc4f2ec6a046fd17db8b20c315f34ed4.jpg'),
	(159, 134, 'pro_fea347649838e906f2a83c4811cd91da.jpg'),
	(160, 137, 'pro_3dfa2b42322cce18101a78ce1a2b1aef.jpg'),
	(164, 138, 'pro_7db801fe704b2ff843fb84176acaff0d.jpg'),
	(165, 135, 'pro_28eeac690aea54b1f7c6a1fcd6179013.jpg'),
	(166, 139, 'pro_e52369a6faf548c5cb784d8e3d47e902.jpg'),
	(167, 140, 'pro_e8a3116613675d184279e856a8ff4a8f.jpg'),
	(168, 141, 'pro_fc16acfe8ba720e7ec66a5be8068a8a3.jpg'),
	(169, 142, 'pro_c3ac26f42383b5f00bdc36d2329e7dbe.jpg'),
	(170, 144, 'pro_57ee17389dfc0ae9b1706a1f842910fb.jpg'),
	(171, 143, 'pro_3bdff3ba521f43fc86e9e7acfc0beab3.jpg'),
	(172, 145, 'pro_ad59626a98033d7478be4939b68b614f.jpg'),
	(173, 146, 'pro_f843ad60d637952d9e3e9a46962af3fa.jpg'),
	(174, 148, 'pro_599cdd75a831553e397044751e8005a0.jpg'),
	(175, 147, 'pro_80ef30286385b31afb4fd34dadbf99f0.jpg'),
	(176, 149, 'pro_3abcbd95b0a066faa220c6ddaaabdf2f.jpg'),
	(177, 150, 'pro_0c4f7139c7582916a90835a14855ae7e.jpg'),
	(178, 151, 'pro_05ab7a962d1f32957a956a84a09c1b84.jpg'),
	(179, 152, 'pro_46c719a1d06b25f018e496df758a2fcb.jpg'),
	(180, 153, 'pro_5e64099994651de8c91e2836bb6d63f1.jpg'),
	(181, 154, 'pro_3e23fc17bb944e0914f72b39f53d5f7b.jpg'),
	(182, 155, 'pro_8bf3c30c99e0ecd1701a95572187515f.jpg'),
	(183, 156, 'pro_f96deee7c3c2c6c57fdaa0cc6e3a1b98.jpg'),
	(184, 157, 'pro_1ae3be4b5f7bc93b27f91edea598cc17.jpg'),
	(185, 158, 'pro_9f5b61fb6f2265d4e9958a5dd3486782.jpg'),
	(186, 159, 'pro_0a9ffa1e03415ad7f87b59c8ae64fef9.jpg'),
	(187, 160, 'pro_ff9dc21c451d8a94a145ddfd08727600.jpg'),
	(188, 161, 'pro_bea39bf8e4e2e22b5fd61e495eaa05a0.jpg'),
	(189, 162, 'pro_91753be38c7242912416fab5c82e6e3b.jpg'),
	(190, 163, 'pro_9fbf13232c18b06ea46619c3fb7b57a1.jpg'),
	(191, 164, 'pro_cc8c97ed1f941048a3ce50ea9fe8cec1.jpg'),
	(192, 165, 'pro_b2d8d5607f0ee8f27b55dae003189028.jpg'),
	(193, 166, 'pro_9eac0796aa2989775a4d531244e73de5.jpg'),
	(194, 167, 'pro_8ae3858646ac8fae937a8cf00c543635.jpg'),
	(195, 168, 'pro_f3664e92a4c0d7bbcdd9df685b0cbc77.jpg'),
	(196, 169, 'pro_8df83db6fbd144a502a8c22ba64b5264.jpg');

-- Volcando estructura para tabla gsm.mensajes
CREATE TABLE IF NOT EXISTS `mensajes` (
  `idmensaje` bigint NOT NULL AUTO_INCREMENT,
  `id_emisor` bigint NOT NULL,
  `id_receptor` bigint NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `fecha_envio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmensaje`),
  KEY `id_emisor` (`id_emisor`),
  KEY `id_receptor` (`id_receptor`),
  CONSTRAINT `fk_emisor` FOREIGN KEY (`id_emisor`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_receptor` FOREIGN KEY (`id_receptor`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.mensajes: ~0 rows (aproximadamente)
DELETE FROM `mensajes`;
INSERT INTO `mensajes` (`idmensaje`, `id_emisor`, `id_receptor`, `mensaje`, `fecha_envio`, `leido`) VALUES
	(1, 22, 24, 'eeeeeeeeeeeeeeeeee', '2024-03-16 16:40:51', 0);

-- Volcando estructura para tabla gsm.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.modulo: ~10 rows (aproximadamente)
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
	(9, 'Páginas', 'Páginas del sitio web', 1),
	(10, 'Opciones', 'opciones de pagina', 1);

-- Volcando estructura para tabla gsm.opciones
CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personaid` bigint DEFAULT NULL,
  `idioma` int DEFAULT NULL,
  `tema` int DEFAULT NULL,
  `formato_moneda` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idpersona` (`personaid`) USING BTREE,
  CONSTRAINT `FK_opciones_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gsm.opciones: ~2 rows (aproximadamente)
DELETE FROM `opciones`;
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(1, 22, 1, 3, 2),
	(2, 24, 3, 3, 3);

-- Volcando estructura para tabla gsm.pedido
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
  PRIMARY KEY (`idpedido`),
  KEY `personaid` (`personaid`),
  KEY `tipopagoid` (`tipopagoid`),
  CONSTRAINT `FK_pedido_persona` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `FK_pedido_tipopago` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.pedido: ~10 rows (aproximadamente)
DELETE FROM `pedido`;
INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
	(3, NULL, NULL, NULL, 22, '2023-11-15 00:50:52', 5.00, 7.50, 2, '123, aaaa', 'Pendiente'),
	(4, NULL, NULL, NULL, 22, '2023-12-06 13:30:58', 5.00, 17.00, 2, 'AV. Lima 123, Quilmana', 'Pendiente'),
	(6, NULL, NULL, NULL, 28, '2023-12-06 17:28:13', 5.00, 8.00, 2, 'Jr. Agusto B. Leguía N453, Quilmana - Cañete', 'Pendiente'),
	(7, 'completa', NULL, NULL, 28, '2023-12-06 17:40:11', 5.00, 6.50, 2, 'Jr. Agusto B. Leguia N 403, Quilmana', 'Completo'),
	(8, NULL, NULL, NULL, 28, '2023-12-06 18:10:32', 5.00, 12.50, 2, 'Jr. Agusto B. Leguia N 403, quimana', 'Pendiente'),
	(9, NULL, NULL, NULL, 22, '2023-12-12 23:07:35', 5.00, 6.50, 3, 'ewe, weew', 'Pendiente'),
	(10, NULL, NULL, NULL, 22, '2023-12-16 10:42:04', 5.00, 20.90, 2, '123, e', 'Pendiente'),
	(11, NULL, NULL, NULL, 22, '2023-12-19 10:07:54', 5.00, 6.50, 2, 'f, f', 'Pendiente'),
	(12, NULL, NULL, NULL, 22, '2023-12-22 00:38:17', 5.00, 6.50, 2, '111111f, 2222', 'Pendiente'),
	(13, NULL, NULL, NULL, 22, '2023-12-23 23:18:52', 5.00, 6.50, 2, '111111v, 2222', 'Pendiente');

-- Volcando estructura para tabla gsm.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` bigint NOT NULL AUTO_INCREMENT,
  `rolid` bigint NOT NULL,
  `moduloid` bigint NOT NULL,
  `r` int NOT NULL DEFAULT '0',
  `w` int NOT NULL DEFAULT '0',
  `u` int NOT NULL DEFAULT '0',
  `d` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpermiso`),
  KEY `rolid` (`rolid`),
  KEY `moduloid` (`moduloid`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.permisos: ~36 rows (aproximadamente)
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
	(182, 2, 9, 1, 1, 1, 1);

-- Volcando estructura para tabla gsm.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `email_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  `direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`),
  CONSTRAINT `FK_persona_rol` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.persona: ~5 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`, `direccion`, `ciudad`) VALUES
	(22, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', '12345', 'gg', 'kkkkkkkkkkk', '0b29bd63a450601e8de9-46a10d5e89d9c8d8010f-34f01ff7f4adc772e209-2598a10910d6573c55cd', 1, '2023-11-10 03:11:09', 1, '111111', '2222'),
	(23, '73621360', 'Jeanettis Mariel', 'Luyo Correa', 910089718, 'jluyo@system32.shop', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 1, '2023-11-29 10:57:56', 1, NULL, NULL),
	(24, 'JUAN LLOCYA', 'Juan Manuel', 'Llocya Castro', 918313532, 'jllocya@system32.shop', 'ec3cb4904c5e4aea4a1b6f3df400730bd52b4983324e8efc0e841df47382e49e', NULL, NULL, NULL, NULL, 2, '2023-11-29 11:03:25', 1, NULL, NULL),
	(28, '72014145', 'Alex', 'Huasasquiche', 946454566, 'alex.huasasquiche@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'www', 'w', 'w3', NULL, 3, '2023-12-06 17:27:31', 1, NULL, NULL),
	(29, '74199532', 'Javier Padin UNDC', 'Padin Flores', 917189300, '2002010167@undc.edu.pe', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, '1111', NULL, 1, '2023-12-16 10:41:03', 1, 'Av Lima', 'Quilmana');

-- Volcando estructura para tabla gsm.post
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

-- Volcando datos para la tabla gsm.post: ~9 rows (aproximadamente)
DELETE FROM `post`;
INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
	(1, 'Inicio', '<div class="p-t-80"> <h3 class="ltext-103 cl5">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class="row"> <div class="col-md-3"><img src="https://grandesmarcas.cl/wp-content/uploads/2016/06/logo-Costa.jpg" alt="" width="155" height="155" /></div> <div class="col-md-3"><img src="https://www.latinspots.com/files/notas/Gnota_37359.jpg" alt="" width="159" height="89" /></div> <div class="col-md-3"><img src="https://image.slidesharecdn.com/u912337-130617160604-phpapp02/85/identidad-de-marca-san-fernando-1-320.jpg?cb=1666230012" alt="" width="160" height="113" /></div> <div class="col-md-3"><img src="data:image/png;base64,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" alt="" width="162" height="162" /></div> <div class="col-md-3"><img src="data:image/jpeg;base64,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" alt="" width="162" height="162" /></div> <div class="col-md-3"><img src="https://www.businessempresarial.com.pe/wp-content/uploads/2021/02/sedal.png" alt="" width="149" height="149" /></div> <div class="col-md-3"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Lay%27s_logo_2019.svg/1200px-Lay%27s_logo_2019.svg.png" alt="" width="150" height="141" /></div> <div class="col-md-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQNvn25xMPqBhLW_df4IdRlStlbzZJ-7AM2ek8ZMTnfH1zmN17winsZ2dflAvzF2xlI0A&amp;usqp=CAU" alt="" width="183" height="157" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
	(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
	(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
	(4, 'Nosotros', '<section class="bg0 p-t-75 p-b-120"> <div class="container"> <div class="row p-b-148"> <div class="col-md-7 col-lg-8"> <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md"> <h3 class="mtext-111 cl2 p-b-16">Historia</h3> <p>Esta negocio familiar naci&oacute; como un emprendimiento con la finalidad de poder abastecer a la poblaci&oacute;n de Quilman&aacute;. Nos dedicamos a ofrecer productos comestibles de alta calidad a precios accesibles. Trabajamos estrechamente con proveedores locales para garantizar la frescura de nuestros productos, desde frutas y verduras hasta productos b&aacute;sicos y art&iacute;culos de limpieza. Nuestra selecci&oacute;n est&aacute; cuidadosamente elegida para satisfacer las necesidades de nuestros clientes.</p> <p>Contamos con una atenci&oacute;n personalizada, nuestro equipo, encabezado por Ra&uacute;l Ch&aacute;vez, te recibir&aacute; con una sonrisa amigable. Martha Flores, la persona encargada de caja, est&aacute; siempre dispuesta a ayudarte a encontrar lo que necesitas o a ofrecerte recomendaciones basadas en nuestro conocimiento local.</p> <p>Estamos ubicados en Av. Arequipa 600, y esperamos que puedas disfrutar de la calidad, la accesibilidad y el sentido de comunidad que el market ofrece a diario. &iexcl;Bienvenido al Market Chamorro!</p> </div> </div> <div class="col-11 col-md-5 col-lg-4 m-lr-auto"> <div class="how-bor1 "> <div class="hov-img0"><img src="https://www.toppropiedades.cl/imagenes/b_c169u435coeb4457.jpg" alt="IMG" width="500" height="333" /></div> </div> </div> </div> <div class="row"> <div class="order-md-2 col-md-7 col-lg-8 p-b-30"> <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md"> <h2 class="mtext-111 cl2 p-b-16"><span style="color: #236fa1;">Nuestra Misi&oacute;n</span></h2> <div class="bor16 p-l-29 p-b-9 m-t-22">En Market Chamorro, nuestra misi&oacute;n es ser el principal proveedor de productos comestibles de alta calidad a precios accesibles para la comunidad de Quilman&aacute;. Nacimos como un emprendimiento con la firme convicci&oacute;n de abastecer las necesidades esenciales de nuestra poblaci&oacute;n, contribuyendo as&iacute; al bienestar y la prosperidad de cada hogar en nuestro querido pueblo.</div> </div> </div> <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30"> <div class="how-bor2"> <div class="hov-img0"><img src="https://equipment21.com/wp-content/uploads/diferencias-entre-bodega-y-minimarket.jpg" alt="" width="493" height="286" /></div> </div> </div> </div> </div> </section>', 'fototienda.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
	(5, 'Contacto', '<div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>', 'tiendachamorro.jpg', '2021-08-09 03:11:08', 'contacto', 1),
	(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style="color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
	(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
	(8, 'Sucursaless', '<section class="py-5 text-center"> <div class="container"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class="btn btn-info" href="../../tienda">VER PRODUCTOS</a></div> </section> <div class="py-5 bg-light"> <div class="container"> <div class="row"> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s1.jpg" alt="Tienda Uno" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s2.jpg" alt="Sucural dos" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s3.jpg" alt="Sucural tres" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'chamorroproductos.jpg', '2021-08-11 02:26:45', 'sucursales', 2),
	(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1),
	(10, 'xavi', '<p>qye guapo es xavi</p>', '', '2024-03-09 14:36:14', 'xavi', 0);

-- Volcando estructura para tabla gsm.producto
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

-- Volcando datos para la tabla gsm.producto: ~169 rows (aproximadamente)
DELETE FROM `producto`;
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_v`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
	(1, 1, '2417984565', 'Chaqueta Azul', '<p>a</p>', 100.00, 50, '2023-12-30', NULL, '2021-08-20 03:12:14', 'chaqueta-azul', 0),
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

-- Volcando estructura para tabla gsm.reembolso
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

-- Volcando datos para la tabla gsm.reembolso: ~0 rows (aproximadamente)
DELETE FROM `reembolso`;

-- Volcando estructura para tabla gsm.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` bigint NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.rol: ~4 rows (aproximadamente)
DELETE FROM `rol`;
INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendedor', 'Operador de tienda', 1);

-- Volcando estructura para tabla gsm.suscripciones
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `idsuscripcion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsuscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.suscripciones: ~4 rows (aproximadamente)
DELETE FROM `suscripciones`;
INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
	(2, 'Juan', 'juan@info.com', '2023-10-29 20:42:27'),
	(4, 'Jeanettis', 'jeanettis@gmail.com', '2023-11-29 11:16:18'),
	(5, 'Javier Padin Flores', 'javier@gmail.com', '2023-12-06 17:21:27'),
	(6, 'Javier Padin Flores', 'javierfff@gmail.com', '2023-12-23 23:25:01');

-- Volcando estructura para tabla gsm.tipopago
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Volcando datos para la tabla gsm.tipopago: ~5 rows (aproximadamente)
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

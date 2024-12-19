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

-- Volcando datos para la tabla vivetuav_agencia.detalle_reserva: ~2 rows (aproximadamente)
INSERT INTO `detalle_reserva` (`iddetalle`, `cod_reserva`, `idservicio`, `precio`, `cantidad`) VALUES
	(66, 'R_5575', 4, 10.00, 1),
	(67, 'R_5575', 5, 24.00, 2);

-- Volcando datos para la tabla vivetuav_agencia.detalle_salida: ~0 rows (aproximadamente)

-- Volcando datos para la tabla vivetuav_agencia.detalle_venta: ~2 rows (aproximadamente)
INSERT INTO `detalle_venta` (`iddetalleventa`, `codigo_venta`, `idservicio`, `cantidad`, `precio`, `descuento`) VALUES
	(1, 'v_1', 4, 1, 1.00, 0.00),
	(2, 'v_1', 4, 2, 2.00, 0.00);

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

-- Volcando datos para la tabla vivetuav_agencia.opciones: ~1 rows (aproximadamente)
INSERT INTO `opciones` (`id`, `personaid`, `idioma`, `tema`, `formato_moneda`) VALUES
	(13, 22, 1, 1, 1);

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

-- Volcando datos para la tabla vivetuav_agencia.persona: ~8 rows (aproximadamente)
INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `hotel`, `token`, `rolid`, `datecreated`, `direccion`, `ciudad`, `rolidempleado`, `conexion`, `time_conexion`, `img`, `status`) VALUES
	(22, '74199531', 'Javier Antonio', 'Padin Flores', 917189300, 'javierpadin661@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', 'ID tributo javier', '0b29bd63a450601e8de9-46a10d5e89d9c8d8010f-34f01ff7f4adc772e209-2598a10910d6573c55cd', 1, '2023-11-10 03:11:09', '111111', '2222', NULL, 1, '2024-12-15 18:26:35', NULL, 1),
	(66, '15282867', 'Yuriko', 'Vicente Arbizu', 987654321, 'arbizu@gmail.com', '9dd48242682f9b76b335154407472da5a8305bcec32d974b4913e46441e40906', NULL, NULL, 2, '2024-06-28 00:24:44', NULL, NULL, NULL, 1, '2022-07-20 08:43:35', NULL, 1),
	(67, '15383812', 'Nelson', 'Luyo Yactayo', 940246612, 'yactayo@gmail.com', NULL, 'Hotel las brisas Lun', NULL, 2, '2024-06-28 00:26:04', NULL, NULL, NULL, 1, '2024-07-20 08:43:33', NULL, 1),
	(68, '87654321', 'Keyler', 'Correa Vicente', 958764321, 'correa@gmail.com', 'afad7b36d11a0e2c7b30ec3a16c9077d8e2c4117f282f257790bd9f70641d840', NULL, NULL, 2, '2024-06-28 00:27:29', NULL, NULL, NULL, 1, '2023-07-20 08:43:34', NULL, 1),
	(69, '74199532', 'YUMICO NICOLE', 'ROJAS CASTRO', 917189300, 'javierpadin6g61@gmail.com', NULL, 'qwer', NULL, 3, '2024-09-29 22:39:16', NULL, NULL, NULL, NULL, '2024-09-29 22:39:16', NULL, 1),
	(70, '74199533', 'JUAN ALEXIS', 'HUAYNALAYA VICENTE', 917189300, 'javierpatdin6g61@gmail.com', NULL, 'qwer', NULL, 3, '2024-09-29 22:40:25', NULL, NULL, NULL, NULL, '2024-09-29 22:40:25', NULL, 1),
	(71, NULL, 'Jon', 'Doe', 6019521325, 'test@example.us', '164ab00ea1663b0181580169818231ed94f091fcadba7968bccab2ba2c049312', NULL, NULL, 3, '2024-12-04 12:06:09', NULL, NULL, NULL, 0, '2024-12-04 12:14:38', NULL, 1),
	(72, NULL, 'Jorr', 'Souza Silva', 3121286800, 'teste@exemplo.us', '4bfd3aaad5e0c1c0bdaee0f0fe22d2aea14d97facb56edd18fbde21be00ae4bf', NULL, NULL, 3, '2024-12-04 12:18:34', NULL, NULL, NULL, 0, '2024-12-04 12:20:34', NULL, 1),
	(73, '74199532', 'Javier', 'Padin Flores', 917189300, '2002010167@undc.edu.pe', '963fd552f8e309aa3619d7203521569c48edea49e39595a364844947b1a552c6', NULL, NULL, 3, '2024-12-04 15:45:11', NULL, NULL, NULL, NULL, '2024-12-04 15:45:11', NULL, 1);

-- Volcando datos para la tabla vivetuav_agencia.post: ~7 rows (aproximadamente)
INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
	(1, 'Inicio', '<div class="p-t-80"> <h2 class="ltext-103 cl5" style="text-align: center; line-height: 1;">Nuestros certificados</h2> <h6 style="text-align: center; line-height: 1;">&nbsp;</h6> <h6 style="text-align: center; line-height: 1;">Trabajamos en tu seguridad y bienestar</h6> <p>&nbsp;</p> <h6 style="text-align: center;"><img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSOBQkO7IsIuxk2V_ImedM6KTR9WZDvjqD_DBlp-yc6VCcv9m-q" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSA6AfdsKru3Wwj7AfVThXLp19zInLb8Me93623eCXp-1Rjlkj0" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7VOFlJi69dYKlurKumxPErC5OHUbHm_eW0p1BQA7spuKh4dWd" alt="" width="200" height="200" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCyIWR6B3dW7lkLeQtWKVdUGZH8SL4smWCatO8akC1GgGORUNX" alt="" width="200" height="200" /></h6> <p style="text-align: center;">&nbsp;</p> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
	(2, 'Nosotros', '<p style="text-align: left;">&nbsp;</p> <table style="border-collapse: collapse; width: 100.686%; height: 860px; float: left;" border="0"> <tbody> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <p>&nbsp;</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr style="height: 88px;"> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 17.8374%; height: 88px; text-align: left;" colspan="2"> <h2 style="text-align: left;"><span style="text-decoration: underline;"><span style="color: #000000; text-decoration: underline;"><strong>&iquest;Qui&eacute;nes somos?</strong></span></span></h2> <br />Somos una agencia que ofrece deportes de aventura, nos encontramos ubicados en el Distrito de Lunahuan&aacute;, Ca&ntilde;ete, Lima, en &ldquo;Vive tu aventura&rdquo; llevamos m&aacute;s de 5 a&ntilde;os dedicados a brindar experiencias inolvidables en deportes de aventura. Nuestra prioridad es garantizar que cada cliente disfrute de actividades seguras y bien organizadas, gracias a nuestro compromiso con la calidad y la seguridad en cada equipo. Nos esforzamos cada d&iacute;a por mejorar y ofrecer un servicio de excelencia, porque sabemos que cada aventura es tambi&eacute;n un recuerdo &uacute;nico para quienes nos eligen. &iexcl;Perm&iacute;tenos ser parte de tu pr&oacute;xima gran experiencia!&nbsp;<br /> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%; height: 88px;"> <p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://xnoccioaventura.com/wp-content/uploads/2022/12/fuam.jpg" alt="" width="300" height="300" /></p> <p>&nbsp;</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong><img src="https://www.deaventura.pe/aplication/webroot/imgs/destinosyrutas/Canopy%20lunahuana.jpeg" alt="" width="448" height="250" /><br /></strong></h2> </td> <td style="text-align: left; width: 34.7667%;" colspan="2"> <h2><strong>&nbsp;</strong></h2> <h2><span style="text-decoration: underline;"><strong>Misi&oacute;n</strong></span></h2> <p><br />Nuestra misi&oacute;n es ofrecer un servicio de calidad a trav&eacute;s de la buena atenci&oacute;n de nuestro personal debidamente capacitado, a precios accesibles, logrando superar las expectativas de nuestros clientes.</p> <h2><br /><span style="text-decoration: underline;"><strong>Visi&oacute;n</strong></span></h2> <p><br />Ser l&iacute;deres del turismo de deportes y de aventura a nivel nacional, ejemplo de profesionalismo en la utilizaci&oacute;n de los mejores equipos de seguridad tur&iacute;stica. Promover el crecimiento sustentable de la organizaci&oacute;n, basado en la innovaci&oacute;n permanente tanto en la prestaci&oacute;n de los servicios, el acercamiento a los clientes, la calidad de la informaci&oacute;n brindada, y el asesoramiento adecuado para cada necesidad.</p> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> <tr> <td style="width: 4.8064%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 11.6745%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 6.16286%; text-align: left;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 28.6038%;"> <h2><strong>&nbsp;</strong></h2> </td> <td style="width: 9.25633%;"> <p>&nbsp;</p> </td> </tr> </tbody> </table> <div class="map">&nbsp;</div> <div class="map">.</div> <div class="map">&nbsp;</div> <div class="map">&nbsp;</div> <div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d315.7262408155028!2d-76.14074957083302!3d-12.963971315048607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x910fe7a6d1a68def%3A0x50bddb1dbee9225d!2sLunahuan%C3%A1!5e0!3m2!1ses-419!2spe!4v1732910938858!5m2!1ses-419!2spe" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div> <div class="map">&nbsp;</div> <div class="map">&nbsp;</div>', 'img_d2e21221b823ad2c038612e0c8395ceb.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
	(3, 'servicio', '<p>i</p>', 'img_98a657f7b44f1783a0f842caa49492bc.jpg', '2021-08-11 01:51:06', 'servicio', 1),
	(4, 'Reservas', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style="color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
	(5, 'contactos', '<div class="map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt" width="100%" height="600" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>', 'img_bc4c5ab9e8ab096e87aaa6e87cefadfd.jpg', '2021-08-09 03:11:08', 'contacto', 1),
	(6, 'Sucursales', '<section class="py-5 text-center"> <div class="container"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class="btn btn-info" href="../../tienda_virtual/tienda">VER PRODUCTOS</a></div> </section> <div class="py-5 bg-light"> <div class="container"> <div class="row"> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s1.jpg" alt="Tienda Uno" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s2.jpg" alt="Sucural dos" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class="col-md-4"> <div class="card mb-4 box-shadow hov-img0"><img src="https://abelosh.com/tienda_virtual/Assets/images/s3.jpg" alt="Sucural tres" width="100%" height="100%" /> <div class="card-body"> <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'chamorroproductos.jpg', '2021-08-11 02:26:45', 'sucursales', 0),
	(7, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- Volcando datos para la tabla vivetuav_agencia.recuerdos: ~5 rows (aproximadamente)
INSERT INTO `recuerdos` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_2511bcd62f49051305f870c1f1fe2ba1.jpg', '2021-08-20 03:04:04', 'hombre', 1),
	(2, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_65cbe11d3cd4cbc84ab7a8e34c3367d3.jpg', '2021-08-21 00:47:10', 'bebidas', 1),
	(3, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_1a6406f136d357e28c374b50dee7ef90.jpg', '2023-11-08 22:52:36', 'dulces', 1),
	(4, 'Turismo en Lunahuaná', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_153b54f2d49cb4b7938f04bad2983c3d.jpg', '2023-11-13 08:35:25', 'ss', 1),
	(5, 'Deportes de aventura', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire.\n \n¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 'img_2b1769b3c296dc978827a686bf4037a9.jpg', '2023-11-23 01:15:09', 'cuidado-personal', 1);

-- Volcando datos para la tabla vivetuav_agencia.reserva: ~1 rows (aproximadamente)
INSERT INTO `reserva` (`idreserva`, `cod_reserva`, `idpersona`, `idtipopago`, `fecha_pago`, `total`, `codigo_voucher`, `captura_voucher`, `status`) VALUES
	(20, 'R_5575', 22, 6, '2024-12-15 00:00:00', 58.00, 'qwerf', '917189300_qwerf_2024-12-10 08_27_15-Window.png', 1);

-- Volcando datos para la tabla vivetuav_agencia.rol_empleado: ~6 rows (aproximadamente)
INSERT INTO `rol_empleado` (`idrolempleado`, `nombrerolempleado`, `descripcion`, `datecreated`, `status`) VALUES
	(1, 'Guia', 'GUIAR A LOS TURISTAS', '2024-06-09 20:25:52', 1),
	(20, 'CONDUCTOR', '111', '2024-06-09 20:25:53', 1),
	(21, 'KAYACK', '222', '2024-06-09 20:25:54', 1),
	(22, 'CARGADOR', '333', '2024-06-09 20:25:54', 1),
	(24, 'sww', 'wwwwwrrrwww', '0000-00-00 00:00:00', 0),
	(25, 'see', 'eeee', '0000-00-00 00:00:00', 0);

-- Volcando datos para la tabla vivetuav_agencia.rol_usuario: ~5 rows (aproximadamente)
INSERT INTO `rol_usuario` (`idrolusuario`, `nombrerolusuario`, `descripcion`, `status`) VALUES
	(1, 'Administrador', 'Acceso a todo el sistema', 1),
	(2, 'Supervisor', 'Supervisor de tiendas', 1),
	(3, 'Cliente', 'Clientes en general', 1),
	(4, 'Vendor', 'Operador de tienda', 1),
	(13, 'secretaria', 'secretaria de la tienda 1', 1);

-- Volcando datos para la tabla vivetuav_agencia.salida: ~1 rows (aproximadamente)

-- Volcando datos para la tabla vivetuav_agencia.servicio: ~5 rows (aproximadamente)
INSERT INTO `servicio` (`idservicio`, `nombre`, `descripcion`, `precio`, `portada`, `datecreated`, `ruta`, `status`) VALUES
	(1, 'Escalera al cielo', 'Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos, canopy, juegos en el aire. ¡En Vive tu aventura Lunahuaná, la diversión está asegurada!', 12.00, 'img_3cc9815c0ea37f81ca69cd352b5f984d.jpg', '2024-05-13 19:46:32', 'escalera-al-cielo', 1),
	(2, 'Rápel', 'Descenso controlado con cuerdas por paredes rocosas o estructuras verticales, ideal para quienes buscan superar desafíos de altura.', 9.00, 'img_181b5a2ea6b569a114e954277e428d75.jpg', '2024-05-13 19:46:32', 'rapel', 1),
	(3, 'Canopy', 'Una experiencia emocionante que consiste en deslizarse por cables tensados a gran altura, disfrutando vistas panorámicas del valle y la naturaleza.', 5.00, 'img_8c94e5767cd3c73d4e9195bb7918763c.jpg', '2024-05-13 19:46:32', 'canopy', 1),
	(4, 'Cuatrimoto', 'Aventuras en vehículos todoterreno que permiten recorrer los paisajes de Lunahuaná, explorando caminos rurales, campos y montañas.', 10.00, 'img_55aaabf0c1575ac5535cfd0927b637b2.jpg', '2024-05-13 19:46:32', 'cuatrimoto', 1),
	(5, 'Canotaje', 'Consiste en descender el río Cañete en botes inflables, desafiando rápidos de diversos niveles de dificultad. Ideal para quienes buscan adrenalina y contacto con la naturaleza.', 10.00, 'img_2dd047b329096c32d5e3f5fa888977e5.jpg', '2024-05-13 19:46:32', 'canotaje', 1);

-- Volcando datos para la tabla vivetuav_agencia.tipopago: ~8 rows (aproximadamente)
INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
	(1, 'PayPal', 1),
	(2, 'Efectivo', 1),
	(3, 'Tarjeta', 1),
	(4, 'Cheque', 1),
	(5, 'Despósito Bancario', 1),
	(6, 'Yape', 1),
	(7, 'Plin', 1),
	(8, 'Transferencia BCP', 1);

-- Volcando datos para la tabla vivetuav_agencia.venta: ~0 rows (aproximadamente)
INSERT INTO `venta` (`idventa`, `codigo_venta`, `datecreated`, `idvendedor`, `dni_cliente`, `idtipopago`, `total`, `status`) VALUES
	(5, 'v_1', '2024-12-15 15:12:02', 22, '74199533', 1, 5.00, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;


CREATE DATABASE IF NOT EXISTS ingenieria;
USE ingenieria;

CREATE TABLE IF NOT EXISTS modulo (
  idmodulo bigint NOT NULL AUTO_INCREMENT,
  titulo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  descripcion text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status int NOT NULL DEFAULT '1',
  PRIMARY KEY (idmodulo)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS opciones (
  id int NOT NULL AUTO_INCREMENT,
  personaid bigint DEFAULT NULL,
  idioma int DEFAULT NULL,
  tema int DEFAULT NULL,
  formato_moneda int DEFAULT NULL,
  PRIMARY KEY (id) USING BTREE,
  KEY idpersona (personaid) USING BTREE,
  CONSTRAINT FK_opciones_persona FOREIGN KEY (personaid) REFERENCES persona (idpersona)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS pedido (
  idpedido bigint NOT NULL AUTO_INCREMENT,
  referenciacobro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  idtransaccionpaypal varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  datospaypal text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  personaid bigint NOT NULL,
  fecha datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  costo_envio decimal(10,2) NOT NULL DEFAULT '0.00',
  monto decimal(11,2) NOT NULL,
  tipopagoid bigint NOT NULL,
  direccion_envio text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (idpedido),
  KEY personaid (personaid),
  KEY tipopagoid (tipopagoid),
  CONSTRAINT FK_pedido_persona FOREIGN KEY (personaid) REFERENCES persona (idpersona),
  CONSTRAINT FK_pedido_tipopago FOREIGN KEY (tipopagoid) REFERENCES tipopago (idtipopago)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS permisos (
  idpermiso bigint NOT NULL AUTO_INCREMENT,
  rolid bigint NOT NULL,
  moduloid bigint NOT NULL,
  r int NOT NULL DEFAULT '0',
  w int NOT NULL DEFAULT '0',
  u int NOT NULL DEFAULT '0',
  d int NOT NULL DEFAULT '0',
  PRIMARY KEY (idpermiso),
  KEY rolid (rolid),
  KEY moduloid (moduloid),
  CONSTRAINT permisos_ibfk_1 FOREIGN KEY (rolid) REFERENCES rol_usuario (idrol) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT permisos_ibfk_2 FOREIGN KEY (moduloid) REFERENCES modulo (idmodulo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS persona (
  idpersona bigint NOT NULL AUTO_INCREMENT,
  identificacion varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  nombres varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  apellidos varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  telefono bigint NOT NULL,
  email_user varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  password varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  nit varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  nombrefiscal varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  direccionfiscal varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  token varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  rolid bigint NOT NULL,
  datecreated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status int NOT NULL DEFAULT '1',
  direccion varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  ciudad varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (idpersona),
  KEY rolid (rolid),
  CONSTRAINT FK_persona_rol FOREIGN KEY (rolid) REFERENCES rol_usuario (idrol)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS producto (
  idproducto bigint NOT NULL AUTO_INCREMENT,
  codigo varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  nombre varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  descripcion text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  precio decimal(11,2) NOT NULL,
  stock int NOT NULL,
  fecha_v varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT '',
  imagen varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  datecreated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ruta varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status int NOT NULL DEFAULT '1',
  PRIMARY KEY (idproducto)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS reembolso (
  id bigint NOT NULL AUTO_INCREMENT,
  pedidoid bigint NOT NULL,
  idtransaccion varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  datosreembolso text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  observacion text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (id),
  KEY pedidoid (pedidoid),
  CONSTRAINT FK_reembolso_pedido FOREIGN KEY (pedidoid) REFERENCES pedido (idpedido)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS rol_empleado (
  idrol bigint NOT NULL AUTO_INCREMENT,
  nombrerol varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  descripcion text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status int NOT NULL DEFAULT '1',
  PRIMARY KEY (idrol) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS rol_usuario (
  idrol bigint NOT NULL AUTO_INCREMENT,
  nombrerol varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  descripcion text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status int NOT NULL DEFAULT '1',
  PRIMARY KEY (idrol)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

CREATE TABLE IF NOT EXISTS tipopago (
  idtipopago bigint NOT NULL AUTO_INCREMENT,
  tipopago varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  status int NOT NULL DEFAULT '1',
  PRIMARY KEY (idtipopago)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;


<?php 
	$server_info = php_uname();
	$parts = explode(" ", $server_info);
	$computer_name = $parts[1];
	$computer_name = gethostname();
// hola
	$nameserver ="charlie.icaserver.net";//server
	$expected_namexavi = "DESKTOP-XAVI661";//xavi
	$expected_namexavit = "DESKTOP-Q9HP1U1";//xavi
	$expected_namenetis = "DESKTOP-";//netis
	$expected_namealex = "DESKTOP-Q3PK5AH";//ahuasasquiche

	if ($computer_name == $nameserver) {
		define('BASE_URL', 'https://system32.shop');
		define('DB_NAME', 'system32_ecommerce');
		define('DB_USER', 'system32_xavi');
		define('DB_PASSWORD', 'xavi661xavi');
	}

	if ($computer_name == $expected_namexavi || $computer_name == $expected_namexavit) {
		define('BASE_URL', 'http://localhost/ecommercecompleto');
		define('DB_NAME', 'tiendafinal');
		define('DB_PASSWORD', 'javier20');
	}
	if ($computer_name == $expected_namenetis) {
		define('BASE_URL', 'http://localhost/chamorro/ecommercecompleto');
		define('DB_NAME', 'tiendafinal');
		define('DB_PASSWORD', '');
	}
	if ($computer_name == $expected_namealex) {
		define('BASE_URL', 'http://localhost/Proyecto/ecommercecompleto');
		define('DB_NAME', 'tiendafinal');
		define('DB_PASSWORD', '');
	}

	//Zona horaria
	date_default_timezone_set('America/Lima');
	const DB_HOST = "localhost";
	// nombre base de datos
	const DB_USER = "root";
	// contraseña
	const DB_CHARSET = "utf8";




	// const BASE_URL = "https://system32.shop";
	// //const BASE_URL = "https://tecomsis.com";
	// //Zona horaria
	// date_default_timezone_set('America/Lima');
	// //Datos de conexión a Base de Datos
	// const DB_HOST = "localhost";
	// const DB_NAME = "system32_ecommerce";
	// const DB_USER = "system32_xavi";
	// const DB_PASSWORD = "xavi661xavi";
	// const DB_CHARSET = "utf8";

	//Para envío de correo
	const ENVIRONMENT = 1; // Local: 0, Produccón: 1;

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "S/";
	const CURRENCY = "PEN";

	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "";
	const SECRET = "";
	//LIVE PAYPAL
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const IDCLIENTE = "";
	//const SECRET = "";

	//Datos envio de correo
	const NOMBRE_REMITENTE = "Market Chamorro";
	const EMAIL_REMITENTE = "no-reply@tecomsis.com";
	const NOMBRE_EMPESA = "Market Chamorro";
	const WEB_EMPRESA = "www.system32.com";

	const DESCRIPCION = "Un negocio familiar que ofrece variedad de productos, calidad y a buen precio.";
	const SHAREDHASH = "TiendaVirtual";

	//Datos Empresa
	const DIRECCION = "Av. Arequipa 600, Quilmaná 15712";
	const TELEMPRESA = "+(51)928378072";
	const WHATSAPP = "954149814";
	const EMAIL_EMPRESA = "chamorrochavezjorge@gmail.com";
	const EMAIL_PEDIDOS = "chamorrochavezjorge@gmail.com"; 
	const EMAIL_SUSCRIPCION = "chamorrochavezjorge@gmail.com";
	const EMAIL_CONTACTO = "chamorrochavezjorge@gmail.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'tecomsis';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 5;

	//Módulos
	const MDASHBOARD = 1;
	const MUSUARIOS = 2;
	const MCLIENTES = 3;
	const MPRODUCTOS = 4;
	const MPEDIDOS = 5;
	const MCATEGORIAS = 6;
	const MSUSCRIPTORES = 7;
	const MDCONTACTOS = 8;
	const MDPAGINAS = 9;

	//Páginas
	const PINICIO = 1;
	const PTIENDA = 2;
	const PCARRITO = 3;
	const PNOSOTROS = 4;
	const PCONTACTO = 5;
	const PPREGUNTAS = 6;
	const PTERMINOS = 7;
	const PSUCURSALES = 8;
	const PERROR = 9;

	//Roles
	const RADMINISTRADOR = 1;
	const RSUPERVISOR = 2;
	const RCLIENTES = 3;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');

	//Productos por página
	const CANTPORDHOME = 8;
	const PROPORPAGINA = 4;
	const PROCATEGORIA = 4;
	const PROBUSCAR = 4;

	//REDES SOCIALES
	const FACEBOOK = "https://m.facebook.com/Bodega-Chamorro-104727252150683/";
	const INSTAGRAM = "https://www.instagram.com/tecomsis/";
	

 ?>
<?php
headerAdmin($data);
getModal('modalPerfil', $data);
?>
<main class="app-content">
    <div class="row user">
        <div class="col-md-12">
            <div class="profile">
                <div class="info"><img class="user-img" src="<?= media(); ?>/images/avatar.png">
                    <h4>
                        <?= $_SESSION['userData']['nombres'] . ' ' . $_SESSION['userData']['apellidos']; ?>
                    </h4>
                    <p>
                        <?= $_SESSION['userData']['nombrerol']; ?>
                    </p>
                </div>
                <div class="cover-image"></div>
            </div>
            <div class="container mt-5">
                <h1>Panel de opciones</h1>
                <hr>
                <div class="row">
                    <div class="col-md-6">
                        <h3>Preferencias de visualización</h3>
                        <ul class="list-group">
                            <li class="list-group-item">Idioma: <select class="form-select form-select-sm">
                                    <option value="1">Español</option>
                                    <option value="2">Inglés</option>
                                    <option value="3">Francés</option>
                                </select></li>
                                <li class="list-group-item">TEMA: <select class="form-select form-select-sm">
                                    <option value="1">DIA</option>
                                    <option value="2">NOCHE</option>
                                    <option value="3">TARDE XD</option>
                                </select></li>
                            <li class="list-group-item">Formato de moneda: <select class="form-select form-select-sm">
                                    <option value="1">USD</option>
                                    <option value="2">PEN</option>
                                </select></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3>Otras configuraciones</h3>
                        <ul class="list-group">
                            <li class="list-group-item">Preferencias de envío: <a href="#">Configurar</a></li>
                            <li class="list-group-item">Preferencias de pago: <a href="#">Configurar</a></li>
                            <li class="list-group-item">Configuración de cuenta: <a href="#">Editar</a></li>
                            <li class="list-group-item">Configuración de seguridad: <a href="#">Editar</a></li>
                            <li class="list-group-item">Historial de compras: <a href="#">Ver historial</a></li>
                            <li class="list-group-item">Soporte y ayuda: <a href="#">Contactar</a></li>
                            <li class="list-group-item">Cerrar sesión: <a href="#">Cerrar sesión</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</main>
<style>
/* Ajustar el espacio entre el texto y el checkbox */
.list-group-item label {
    margin-bottom: 15px; /* Ajusta el espacio entre el texto y el checkbox */
}

/* Estilo para el título de sección */
h3 {
    color: #333; /* Color del texto */
    font-size: 1.5rem; /* Tamaño del texto */
    margin-bottom: 30px; /* Espacio inferior */
}

/* Estilo para los selectores */
.form-select {
    width: 100%; /* Ancho completo del selector */
    margin-bottom: 15px; /* Espacio entre los selectores */
    border-radius: 5px; /* Bordes redondeados */
    border: 1px solid #ccc; /* Borde del selector */
    padding: 8px; /* Relleno interno */
}

/* Estilos adicionales según sea necesario */


/* Estilos adicionales según sea necesario */

    </style>
<?php footerAdmin($data); ?>
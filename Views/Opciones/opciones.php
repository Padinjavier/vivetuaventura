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
                        <?= $_SESSION['userData']['nombres'] . ' ' . $_SESSION['userData']['apellidos'];?>
                    </h4>
                    <p>
                        <?= $_SESSION['userData']['nombrerol']; ?>
                    </p>
                </div>
                <div class="cover-image"></div>
            </div>
            <form id="formDataOpciones" name="formDataOpciones">
                <div class="container mt-5">
                    <h1>Panel de opciones</h1>
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Preferencias de visualización</h3>
                            <ul class="list-group">
                                <li class="list-group-item">Idioma:
                                    <select id="selectIdioma" name="idioma" class="form-selecttty form-select-sm">
                                        <option value="1">Español</option>
                                        <option value="2">Inglés</option>
                                        <option value="3">Francés</option>
                                    </select>
                                </li>
                                <li class="list-group-item">TEMA:
                                    <select id="selectTema" name="tema" class="form-selecttty form-select-sm">
                                        <option value="1">DIA</option>
                                        <option value="2">NOCHE</option>
                                        <option value="3">TARDE XD</option>
                                    </select>
                                </li>
                                <li class="list-group-item">Formato de moneda:
                                    <select id="selectMoneda" name="moneda" class="form-selecttty form-select-sm">
                                        <option value="1">USD</option>
                                        <option value="2">PEN</option>
                                    </select>
                                </li>

                                <button class="btn btn-primary" type="submit">
                                    <i class="fa fa-fw fa-lg fa-check-circle"></i> Guardar
                                </button>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h3>Otras configuraciones</h3>
                            <ul class="list-group">
                                <li class="list-group-item">Preferencias de envío: <a href="#">Configurar</a></li>
                                <!-- Resto de las opciones -->
                            </ul>
                        </div>
                    </div>
                </div>
            </form>


        </div>
</main>
<?php footerAdmin($data); ?>
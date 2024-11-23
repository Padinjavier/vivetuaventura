<?php 
    headerAdmin($data); 
?>
<main class="app-content">    
    <div class="app-title">
        <div>
            <h1><i class="fa fa-file-text-o"></i> <?= $data['page_title'] ?></h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<?= base_url(); ?>/paginas">Páginas</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form id="formPaginas" name="formPaginas" class="form-horizontal">
                    <div class="row">
                        <!-- Columna 1: Titulo y Contenido -->
                        <div class="col-md-7">
                            <div class="form-group">
                                <label class="control-label">Titulo</label>
                                <input class="form-control" id="txtTitulo" name="txtTitulo" type="text" value="" required="">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Contenido</label>
                                <textarea class="form-control" id="txtContenido" name="txtContenido"></textarea>
                            </div>
                            <div class="form-group d-flex">
                                <button id="btnActionForm" class="btn btn-primary btn-lg" type="submit" style="margin-right: 10px;">
                                    <i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span>
                                </button>
                                <button id="btnCancelForm" class="btn btn-secondary btn-lg" type="button">Cancelar</button>
                            </div>
                        </div>
                        <!-- Columna 2: Fotos -->
                        <div class="col-md-3">
                            <div id="containerGallery">
                                <h4>Portada</h4>
                                <span>Tamaño sugerido (1920px X 239px)</span>
                            </div>
                            <hr>
                            <div id="containerImages">
                                <div class="photo">
                                    <div class="prevPhoto prevPortada">
                                        <span class="delPhoto notBlock">X</span>
                                        <label for="foto"></label>
                                        <div></div>
                                    </div>
                                    <div class="upimg">
                                        <input type="file" name="foto" id="foto">
                                    </div>
                                    <div id="form_alert"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Columna 3: Estado -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="listStatus">Estado</label>
                                <select class="form-control selectpicker" id="listStatus" name="listStatus" required="">
                                    <option value="1">Activo</option>
                                    <option value="2">Inactivo</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<?php footerAdmin($data); ?>
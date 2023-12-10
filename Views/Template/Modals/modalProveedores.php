<!-- Modal -->
<div class="modal fade" id="modalFormProveedores" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nuevo Proveedor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formProveedores" name="formProveedores" class="form-horizontal">
                    <input type="hidden" id="idProveedor" name="idProveedor" value="">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.</p>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label">Nombre Proveedor <span class="required">*</span></label>
                                <input class="form-control" id="txtNombre" name="txtNombre" type="text" required="">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Dirección <span class="required">*</span></label>
                                <textarea class="form-control" id="txtDireccion" name="txtDireccion"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Teléfono <span class="required">*</span></label>
                                <input class="form-control" id="txtTelefono" name="txtTelefono" type="text" required="">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">RUC <span class="required">*</span></label>
                                <input class="form-control" id="txtRuc" name="txtRuc" type="text" required="">
                            </div>
                            <!-- Agrega aquí más campos específicos de proveedores si es necesario -->
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <button id="btnActionForm" class="btn btn-primary btn-lg btn-block" type="submit">
                                        <i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span>
                                    </button>
                                </div>
                                <div class="form-group col-md-6">
                                    <button class="btn btn-danger btn-lg btn-block" type="button" data-dismiss="modal">
                                        <i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewProveedor" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title" id="titleModal">Datos del Proveedor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td>Nombre:</td>
                            <td id="celNombre"></td>
                        </tr>
                        <tr>
                            <td>Dirección:</td>
                            <td id="celDireccion"></td>
                        </tr>
                        <tr>
                            <td>Teléfono:</td>
                            <td id="celTelefono"></td>
                        </tr>
                        <tr>
                            <td>RUC:</td>
                            <td id="celRuc"></td>
                        </tr>
                        <!-- Agrega aquí más campos específicos de proveedores si es necesario -->
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

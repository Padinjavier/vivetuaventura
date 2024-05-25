<div class="modal fade" id="modalFormPedido" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal">Nuevo Pedido</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formUpdatePedido" name="formUpdatePedido" class="form-horizontal">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.
                    </p>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Codigo Venta<span class="required">*</span></label>
                                <input class="form-control" id="idProducto" name="txtCodigoSalida" type="text"
                                    required disabled>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Fecha y hora<span class="required">*</span></label>
                                <input type="datetime-local" id="fecha-hora" name="fecha-hora" class="form-control"
                                    required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Codigo Salida<span class="required">*</span></label>
                                <input class="form-control" id="txtCodigoVenta" name="txtCodigoVenta" type="text"
                                    required disabled>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="listRolNombreEmpleado">
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group" >
                                <label class="control-label" id="listRolEmpleado">Guia<span class="required">*</span></label>
                                <select class="form-control" id="listNombreEmpleados" name="selectGuia" required>
                                </select>
                            </div>
                        </div>
                      
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Cargador<span class="required">*</span>
                                    <button type="button" class="btn btn-primary">+</button>
                                </label>
                                <select class="form-control" id="selectCargador" name="selectCargador" required>
                                    <option value="1">null</option>
                                    <option value="2">pedro</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">DNI <span class="required">*</span></label>
                                <input class="form-control" id="txtDNI" name="txtDNI" type="text" required>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Nombre <span class="required">*</span></label>
                                <input class="form-control" id="txtNombre" name="txtNombre" type="text" required>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Apellido <span class="required">*</span></label>
                                <input class="form-control" id="txtApellido" name="txtApellido" type="text" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Descripcion </label>
                                <textarea class="form-control" id="textareaDescripcion" name="textareaDescripcion"
                                    rows="5" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row  d-flex align-items-end">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Servicio <span class="required">*</span>
                                    <button type="button" class="btn btn-primary">+</button>
                                </label>
                                <select class="form-control" id="selectCargador" name="selectCargador" required>
                                    <option value="1">cuatrimoto</option>
                                    <option value="2">canopi</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label class="control-label">Cantidad<span class="required">*</span></label>
                                <input class="form-control" id="txtCantidad" name="txtCantidad" type="text" required>
                            </div>
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button id="btnActionForm" class="btn btn-info" type="submit"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
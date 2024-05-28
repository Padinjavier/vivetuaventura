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
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Codigo Venta<span class="required">*</span></label>
                                <input class="form-control" id="idProducto" name="txtCodigoSalida" type="text" required
                                    disabled>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Codigo Salida<span class="required">*</span></label>
                                <input class="form-control" id="txtCodigoVenta" name="txtCodigoVenta" type="text"
                                    required disabled>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label">Fecha y hora<span class="required">*</span></label>
                                <input type="datetime-local" id="fecha-hora" name="fecha-hora" class="form-control"
                                    required>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="listRolNombreEmpleado">
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label class="control-label" id="listRolEmpleado">Guia<span
                                        class="required">*</span></label>
                                <select class="form-control" id="listNombreEmpleados" name="selectGuia" required>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group cargador">
                                <label class="control-label">Cargador<span class="required">*</span>
                                    <button class="btn btn-primary btn-sm" type="button" id="btnAgregarCargador"><i
                                            class="fas fa-plus-circle" aria-hidden="true"></i> Agregar</button>
                                </label>
                                <div id="cargadorContainer">
                                    <!-- se crean en automatico con el JS  -->

                                </div>
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

                    <section>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-6">
                                    <h4>Detalle de venta</h4>
                                </div>
                                <div class="col-6 d-flex justify-content-end">
                                    <button class="btn btn-primary btn-sm" type="button" id="btnAgregarProducto"><i
                                            class="fas fa-plus-circle" aria-hidden="true"></i> Agregar</button>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                        <tr>
                                            <th style="width:30%">Producto</th>
                                            <th style="width:10%">Cantidad</th>
                                            <th style="width:10%">Precio</th>
                                            <th style="width:10%">Descuento</th>
                                            <th style="width:10%">Precio Total</th>
                                            <th style="width:5%"></th>
                                            <th style="width:0%"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tblDetalleVenta">
                                        <tr class="detalle-venta-row" id="masservicios">
                                            <!-- se crean en automatico con el JS  -->

                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <p>Sub Total:</p>
                                            </td>
                                            <td>
                                                <p class="iconomoneda"> S/0.00</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <p>IGV (18 %) :</p>
                                            </td>
                                            <td>
                                                <p class="iconomoneda"> S/0.00</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <p>TOTAL :</p>
                                            </td>
                                            <td>
                                                <p class="iconomoneda"> S/0.00</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </section>


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
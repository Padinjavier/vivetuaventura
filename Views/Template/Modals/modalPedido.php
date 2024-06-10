<!-- modal  -->
<div class="modal fade" id="modalFormPedido" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal">Nueva venta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formUpdatePedido" name="formUpdatePedido" class="form-horizontal">
                    <p class="text-primary">Recuerda: Todos los campos son obligatorios.</p>
                    
                    
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <label for="listClienteid">Cliente</label>
                            <select class="form-control" data-live-search="true" id="listClienteid" name="listClienteid" required >
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-">
                            <label for="listMetodoPagoid">Metodo de Pago</label>
                            <select class="form-control" data-live-search="true" id="listMetodoPagoid" name="listMetodoPagoid" required >
                            </select>
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
                                            <th style="width:5%">#</th>
                                            <th style="width:20%">Producto</th>
                                            <th style="width:10%">Cantidad</th>
                                            <th style="width:10%">Precio</th>
                                            <th style="width:10%">Descuento</th>
                                            <th style="width:10%">Precio Total</th>
                                            <th style="width:5%"></th>
                                            <th style="width:10%"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tblDetalleVenta">
                                        <script>
                                            // se crean en automatico con el JS 
                                        </script>    

                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <span>TOTAL:</span><br>
                                                <span>Descuento Total:</span><br>
                                                <span>Sub Total:</span><br>
                                            </td>
                                            <td>
                                                <span id="total">S/00.00</span><br>
                                                <span id="decuento">S/00.00</span><br>
                                                <span id="sub_total">S/00.00</span><br>
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
                        <button class="btn btn-success" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Salida-->
<div class="modal fade" id="modalFormProductos" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nueva Salida</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form id="formProductos" name="formProductos" class="form-horizontal">
              <input type="hidden" id="idProducto" name="idProducto" value="">
              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="control-label">Código de venta</label>
                        <select class="form-control" data-live-search="true" id="listCodVenta" name="listCodVenta" required="">
                          <!-- se agregar los cod venta automatico -->
                        </select>                       
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label">Nombres</label>
                        <select class="form-control" data-live-search="true" id="listNombres" name="listNombres" required="">
                        </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Estado de pago</label>
                            <select class="form-control selectpicker" id="listEstPago" name="listEstPago" required="">
                              <option value="1">Inactivo</option>
                              <option value="2">Activo</option>
                            </select>
                            
                        
                        </div>
                        <!-- //agregamos externo -->
                        <div class="form-group col-md-6">
                          <div class="switch-container">
                              <span>Externo a la agencia</span>
                              <label class="switch">
                                  <input type="checkbox" id="externo" name="externo">
                                  <span class="slider"></span>
                              </label>
                          </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="listNombre">Nombres</label>
                            <input class="form-control" id="txtNombre" name="txtNombre" type="text" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="descripcion">Descripción (Opcional)</label>
                            <input class="form-control" id="txtdescripcion" name="txtdescripcion" type="text" placeholder="Ingrese una descripción">
                        </div>
                    </div>
                    <div class="lotessalida">
                      <div class="row">
                          <div class="form-group col-md-6">
                          </div>
                          <div class="form-group col-md-6" style="display: flex; justify-content: flex-end;">
                              <button class="btn btn-primary" type="button" id="btnAgregar"><i class="fas fa-plus-circle"></i> Agregar</button>
                          </div>
                      </div>
                      <div class="row" id="dynamicFields">
                          <!-- Este es el modelo de cada conjunto dinámico -->
                          <div class="form-group col-md-6">
                              <label for="listServicio">Tipo de servicio</label>
                              <select class="form-control selectpicker servicio-select" name="listServicio[]" required="">
                                  <!-- Opciones de servicio se generarán dinámicamente -->
                              </select>
                          </div>
                          <div class="form-group col-md-6">
                              <label for="cantidad">Cantidad</label>
                              <input class="form-control cantidad" name="cantidad[]" type="number" placeholder="0">
                          </div>
                      </div>
                    </div>
 



                    <div class="tile-footer">
                      <button id="btnActionForm" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle" aria-hidden="true"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;
                      <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle" aria-hidden="true"></i>Cerrar</button>
                    </div>
                </div>
              </div>
            </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewProducto" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl" >
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del Producto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>Codigo:</td>
              <td id="celCodigo"></td>
            </tr>
            <tr>
              <td>Nombres:</td>
              <td id="celNombre"></td>
            </tr>
            <tr>
              <td>Precio:</td>
              <td id="celPrecio"></td>
            </tr>
            <tr>
              <td>Stock:</td>
              <td id="celStock"></td>
            </tr>
            <tr>
              <td>Fecha vencimiento:</td>
              <td id="celFecha_v"></td>
            </tr>
            <tr>
              <td>Categoría:</td>
              <td id="celCategoria"></td>
            </tr>
            <tr>
              <td>Status:</td>
              <td id="celStatus"></td>
            </tr>
            <tr>
              <td>Descripción:</td>
              <td id="celDescripcion"></td>
            </tr>
            <tr>
              <td>Fotos de referencia:</td>
              <td id="celFotos">
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


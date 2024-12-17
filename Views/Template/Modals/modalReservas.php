<!-- Modal -->
<div class="modal fade" id="modalFormCliente" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nuevo Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body p-lg-5">
        <form id="formReserva" name="formReserva" class="form-horizontal">
          <input type="" id="idVenta" name="idVenta" value="">
          <input type="" id="fechaPago" name="fechaPago" value="">

          <div class="form-row">
            <div class="form-group col-md-12">
              <label for="txtcodigoreserva">Código de reserva</label>
              <input type="text" disabled class="form-control  " id="txtcodigoreserva" name="txtcodigoreserva" required="" style="width: 100%;">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="txtNombre">Nombres</label>
              <input type="text" disabled class="form-control valid validText" id="txtNombre" name="txtNombre" required="">
            </div>
            <div class="form-group col-md-4">
              <label for="txtApellido">Apellidos</label>
              <input type="text" disabled class="form-control valid validText" id="txtApellido" name="txtApellido" required="">
            </div>
            <div class="form-group col-md-4">
              <label for="txtTelefono">N° de celular:</label>
              <input type="number" disabled  class="form-control valid validPhoneNumber" id="txtTelefono" name="txtTelefono" required="" onkeypress="return controlTag(event);">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="txtModalidadPago">Modalidad de pago:</label>
              <input type="text" disabled class="form-control" id="txtModalidadPago" name="txtModalidadPago" style="width: 100%;">
            </div>
            <div class="form-group col-md-4">
              <label for="txtCodigoVoucher">Código de voucher:</label>
              <input type="text" disabled class="form-control" id="txtCodigoVoucher" name="txtCodigoVoucher" style="width: 100%;">
            </div>
            <div class="form-group col-md-4">
                <label for="txtEstadoPago">Estado de pago:</label>
                <select class="form-control" id="txtEstadoPago" name="txtEstadoPago" style="width: 100%;">
                  <option value="0">No definido</option>
                  <option value="1">Pago / Por Aprobar</option>
                  <option value="2">Pago / Aprobado</option>
                  <option value="3">Pago / Erróneo</option>
                </select>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-12">
              <p>Archivo adjuntado:</p>
              <input type="text" disabled class="form-control valid" id="imagenvoucher" name="imagenvoucher" required="" style="width: 100%;">
            </div>
          </div>
          <section>
              <div class="card-body p-0">
                  <div class="row mb-3">
                      <div class="col-6">
                          <h4>Detalle de venta</h4>
                      </div>
                      <div class="col-6 d-flex justify-content-end ">
                          <button class="btn btn-primary btn-sm" type="button" id="btnAgregarProducto"><i
                                  class="fas fa-plus-circle" aria-hidden="true"></i> Agregar</button>
                      </div>
                  </div>
                  <!-- <div class="table-responsive"> -->
                  <div class="table-responsive">
                      <table class="table table-sm table-hover  w-100 dataTable no-footer">
                          <thead>
                              <tr style="text-align: center;">
                                  <th style="width:5%">#</th>
                                  <th style="width:40%">Tipo‎de‎servicio</th>
                                  <th style="width:10%">Cantidad</th>
                                  <th style="width:20%" class="">Precio</th>
                                  <th style="width:20%">Total</th>
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
                                  <td style="text-align: start;">
                                      <span>Total:</span><br>
                                  </td>
                                  <td>
                                      <span>S/ <span id="gran_total">00.00</span></span><br>
                                  </td>
                              </tr>
                          </tbody>
                      </table>

                  </div>
              </div>
          </section>
          <div class="tile-footer">
            <button id="btnActionForm" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal view -->
<div class="modal fade" id="modalViewReserva" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>Código de reserva:</td>
              <td id="codreserva">654654654</td>
            </tr>
            <tr>
              <td>Nombres:</td>
              <td id="clienNombre">Jacob</td>
            </tr>
            <tr>
              <td>Apellidos:</td>
              <td id="clienApellido">Jacob</td>
            </tr>
            <tr>
              <td>N° de celular:</td>
              <td id="clienApellido">Larry</td>
            </tr>
            <tr>
              <td>Modalidad de pago:</td>
              <td id="modopago">Larry</td>
            </tr>
            <tr>
              <td>Código de voucher:</td>
              <td id="cod_voucher">Larry</td>
            </tr>
            <tr>
              <td>Estado de pago:</td>
              <td id="stadopago">Larry</td>
            </tr>
            <tr>
              <td>Fecha registro:</td>
              <td id="FechaRegistro">Larry</td>
            </tr>
            <tr>
              <td>Archivo adjuntado:</td>
              <td id="archivopago">
                <div class="img-thumbnail" style="position: relative; display: inline-block;">
                    <img src="" id="imgVoucher" style="width: 100px;" alt="Voucher">
                    <span class="eye-icon" 
                      style="position: absolute; top: 0; right: 0; font-size: 20px; cursor: pointer;
                       border-radius: 100px; background:rgb(243, 113, 1); width: 30px; height: 30px;
                       display: flex; justify-content: center; align-items: center; color:#ffff" 
                      onclick="expandImage()">
                        <i class='far fa-eye'></i>
                        <i class='bi bi-x-lg d-none'></i>
                    </span>
                </div>
              </td>
            </tr>
            <tr>
              <td>Detalle de pago:</td>
              <td id="datalleservicios">Larry</td>
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


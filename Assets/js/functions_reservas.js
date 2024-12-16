let tableClientes; 
let rowTable = "";
let divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function(){

    tableClientes = $('#tableClientes').dataTable( {
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Reservas/getReservas",
            "dataSrc":""
        },
        "columns":[
            {"data":"idreserva"},
            {"data":"cod_reserva"},
            {"data":"persona"},
            {"data":"fecha_pago"},
            {"data":"status"},
            {"data":"options"}
        ],
        'dom': 'lBfrtip',
        'buttons': [
            {
                "extend": "copyHtml5",
                "text": "<i class='far fa-copy'></i> Copiar",
                "titleAttr":"Copiar",
                "className": "btn btn-secondary",
                "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4] 
            }
            },{
                "extend": "excelHtml5",
                "text": "<i class='bi bi-file-earmark-excel'></i> Excel",
                "titleAttr":"Exportar a Excel",
                "className": "btn btn-success",
                "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4] 
            }
            },{
                "extend": "pdfHtml5",
                "text": "<i class='bi bi-filetype-pdf'></i> Pdf",
                "titleAttr":"Exportar a PDF",
                "className": "btn btn-danger",
                "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4] 
            }
            },{
                "extend": "csvHtml5",
                "text": "<i class='fas fa-file-csv'></i> CSV",
                "titleAttr":"Exportar a CSV",
                "className": "btn btn-info d-none",
                "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4] 
            }
            }
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order":[[0,"desc"]]  
    });

	


}, false);


function fntViewReserva(idreserva) {
    // Restablecer la imagen a su estado inicial
    expandImage(true);
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + '/Reservas/getReserva/' + idreserva;
    request.open("GET", ajaxUrl, true);
    request.send();
    request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
            console.log(request.responseText);
            let objData = JSON.parse(request.responseText);
            if (objData.status) {
                // Formatear fecha
                let fechaISO = objData.data.reserva.fecha_pago;
                let fechaFormateada = moment(fechaISO).format('YYYY/MM/DD | hh:mm:ss A');

                // Generar texto con los servicios reservados
                let textoServicios = "<table class='table' style='padding: 0; font-size: 11px;'><thead><tr style='padding: 0;'><th style='padding: 0; text-align: center;'>Deporte</th><th style='padding: 0; text-align: center;'>Cantidad</th><th style='padding: 0; text-align: center;'>Precio Unitario</th><th style='padding: 0; text-align: center;'>Subtotal</th></tr></thead><tbody>";
                objData.data.detalle_reserva.forEach(servicio => {
                    let subtotal = parseFloat(servicio.precio) * parseInt(servicio.cantidad);
                    textoServicios += `<tr style='padding: 0;'>
                        <td style='padding: 0; text-align: center;'>${String(servicio.servicio)}</td>
                        <td style='padding: 0; text-align: center;'>${String(servicio.cantidad)}</td>
                        <td style='padding: 0; text-align: center;'>S/. ${parseFloat(servicio.precio).toFixed(2)}</td>
                        <td style='padding: 0; text-align: center;'>S/. ${subtotal.toFixed(2)}</td>
                    </tr>`;
                });
                let total = objData.data.reserva.total;
                textoServicios += `</tbody><tfoot><tr style='padding: 0;'><td colspan="3" style='padding: 0; text-align: center;'><strong>TOTAL</strong></td><td style='padding: 0; text-align: center;'><strong>S/. ${total}</strong></td></tr></tfoot></table>`;

                // Generar estado de pago con estilos dinámicos
                let estadoPago = "";
                switch (parseInt(objData.data.reserva.status)) {
                    case 2:
                        estadoPago = '<span style="background-color: green; color: white; border-radius: 5px; padding: 5px;">Pago / Aprobado</span>';
                        break;
                    case 1:
                        estadoPago = '<span style="background-color: yellow; color: black; border-radius: 5px; padding: 5px;">Pago / Por Aprobar</span>';
                        break;
                    case 3:
                        estadoPago = '<span style="background-color: red; color: white; border-radius: 5px; padding: 5px;">Pago / Erróneo</span>';
                        break;
                    default:
                        estadoPago = '<span>No definido</span>';
                }
                // Asignar valores a los elementos del modal
                document.querySelector("#codreserva").innerHTML = objData.data.reserva.cod_reserva;
                document.querySelector("#clienNombre").innerHTML = objData.data.reserva.nombres;
                document.querySelector("#clienApellido").innerHTML = objData.data.reserva.apellidos;
                document.querySelector("#clienApellido").innerHTML = objData.data.reserva.telefono;
                document.querySelector("#modopago").innerHTML = objData.data.reserva.tipopago;
                document.querySelector("#cod_voucher").innerHTML = objData.data.reserva.codigo_voucher;
                document.querySelector("#stadopago").innerHTML = estadoPago;
                document.querySelector("#FechaRegistro").innerHTML = fechaFormateada ;
                document.querySelector("#imgVoucher").src = objData.data.reserva.captura_voucher;
                document.querySelector("#datalleservicios").innerHTML = textoServicios;
                // Mostrar el modal
                $('#modalViewReserva').modal('show');
            } else {
                swal("Error", objData.msg, "error");
            }
        }
    };
}

function expandImage(reset = false) {
    var divimagen = document.querySelector(".img-thumbnail");
    var imagen = document.querySelector("#imgVoucher");
    var ver = document.querySelector(".far.fa-eye");
    var cerrar = document.querySelector(".bi.bi-x-lg");
    if (reset) {
        divimagen.style.cssText = "position: relative;  width: 110px;";
        imagen.style.cssText = "width: 100px;";
        ver.classList.remove("d-none");
        cerrar.classList.add("d-none");
        console.log("Imagen restablecida");
        return;
    }

    if (cerrar.classList.contains("d-none")) {
        divimagen.style.cssText = "position: absolute; display: inline-block; width: 100%; height: 100%; top: 0; bottom: 0; right: 0; left: 0;";
        imagen.style.cssText = "width: 100%;";
        console.log("Imagen expandida");
        ver.classList.toggle("d-none");
        cerrar.classList.toggle("d-none");
    } else {
        divimagen.style.cssText = "position: relative; width: 110px;";
        imagen.style.cssText = "width: 100px;";
        console.log("Imagen contraída");
        ver.classList.toggle("d-none");
        cerrar.classList.toggle("d-none");
    }
}


function fntDelInfo(idpersona){
    swal({
        title: "Eliminar Cliente",
        text: "¿Realmente quiere eliminar al cliente?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function(isConfirm) {
        
        if (isConfirm) 
        {
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url+'/Clientes/delCliente';
            let strData = "idUsuario="+idpersona;
            request.open("POST",ajaxUrl,true);
            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            request.send(strData);
            request.onreadystatechange = function(){
                if(request.readyState == 4 && request.status == 200){
                    let objData = JSON.parse(request.responseText);
                    if(objData.status)
                    {
                        swal("Eliminado", objData.msg , "success");
                        tableClientes.api().ajax.reload();
                    }else{
                        swal("Atención!", objData.msg , "error");
                    }
                }
            }
        }

    });

}

function openModal()
{
    rowTable = "";
    document.querySelector('#idUsuario').value ="";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Cliente";
    document.querySelector("#formCliente").reset();
    $('#modalFormCliente').modal('show');
}



// ------------Servicios--------------
document.addEventListener("DOMContentLoaded", function () {
    const tblDetalleVenta = document.getElementById("tblDetalleVenta");
    const btnAgregarProducto = document.getElementById("btnAgregarProducto");
  
    // Cargar datos iniciales de la reserva
    function loadReservaData(idReserva) {
      let ajaxUrl = base_url + "/Servicios/getReserva/" + idReserva;
      let request = new XMLHttpRequest();
      request.open("GET", ajaxUrl, true);
      request.send();
      request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
          let response = JSON.parse(request.responseText);
          if (response.status) {
            fillFormInputs(response.data.reserva);
            fillTableDetails(response.data.detalle);
          } else {
            alert(response.msg);
          }
        }
      };
    }
  
    // Completar los datos de los inputs
    function fillFormInputs(reserva) {
      document.getElementById("txtIdentificacion").value = reserva.codigo_reserva;
      document.getElementById("txtNombre").value = reserva.nombres;
      document.getElementById("txtApellido").value = reserva.apellidos;
      document.getElementById("txtTelefono").value = reserva.telefono;
      document.getElementById("txtModalidadPago").value = reserva.modalidad_pago;
      document.getElementById("txtCodigoVoucher").value = reserva.codigo_voucher;
      document.getElementById("txtEstadoPago").value = reserva.estado_pago;
      document.getElementById("imagenvoucher").value = reserva.captura_voucher;
    }
  
    // Completar los detalles en la tabla
    function fillTableDetails(detalle) {
      detalle.forEach((item, index) => {
        let newRow = document.createElement("tr");
        newRow.classList.add("detalle-venta-row");
        newRow.innerHTML = `
          <td style="text-align: center;">
            <span class="row-number">${index + 1}</span>
          </td>
          <td>
            <select class="form-control selectpicker servicio-select" name="selectServicio" required data-live-search="true">
              <option value="${item.id_servicio}" selected>${item.nombre_servicio}</option>
            </select>
          </td>
          <td>
            <input type="number" class="form-control cantidad" value="${item.cantidad}" min="0">
          </td>
          <td>
            <input type="number" class="form-control precio_total" value="${item.total}" min="0" readonly>
          </td>
          <td>
            <button type="button" class="btn btn-danger btn-remove-select btn-sm">X</button>
          </td>
          <td>
            <input type="hidden" class="form-control precio_db" value="${item.precio_unitario}" readonly>
          </td>
        `;
        tblDetalleVenta.insertBefore(newRow, tblDetalleVenta.lastElementChild);
  
        $(newRow).find(".selectpicker").selectpicker("render");
        addEventListenersToRow(newRow);
  
        newRow.querySelector(".btn-remove-select").addEventListener("click", function () {
          newRow.remove();
          updateRowNumbers();
          sumarPreciosTotales();
        });
      });
      sumarPreciosTotales();
    }
  
    function addEventListenersToRow(row) {
      const cantidadInput = row.querySelector(".cantidad");
  
      cantidadInput.addEventListener("input", function () {
        calculateRow(row);
        sumarPreciosTotales();
      });
  
      calculateRow(row);
    }
  
    function updateRowNumbers() {
      let rows = tblDetalleVenta.getElementsByClassName("detalle-venta-row");
      for (let i = 0; i < rows.length; i++) {
        let rowNumberElement = rows[i].querySelector(".row-number");
        rowNumberElement.innerText = i + 1;
      }
    }
  
    function calculateRow(row) {
      const cantidad = parseFloat(row.querySelector(".cantidad").value) || 0;
      const precioDb = parseFloat(row.querySelector(".precio_db").value) || 0;
      const total = cantidad * precioDb;
  
      row.querySelector(".precio_total").value = total.toFixed(2);
    }
  
    function sumarPreciosTotales() {
      let subtotal = 0;
      let filas = tblDetalleVenta.getElementsByClassName("detalle-venta-row");
  
      for (let i = 0; i < filas.length; i++) {
        let fila = filas[i];
        let precioTotalElement = fila.querySelector(".precio_total");
        let precioTotal = parseFloat(precioTotalElement.value) || 0;
        subtotal += precioTotal;
      }
  
      document.getElementById("gran_total").innerText = subtotal.toFixed(2);
    }
  
    // Cargar datos al abrir la página
    const idReserva = 1; // Reemplazar con el ID dinámico de la reserva
    loadReservaData(idReserva);
  
    btnAgregarProducto.addEventListener("click", function () {
      loadReservaData(idReserva); // Agregar productos basados en los datos iniciales
    });
  
    
  
  });
  // Fin servicios

  // ------editar venta-----------
  function fntEditInfo(element, idreserva) {
  
    // Eliminar elementos del grupo de servicio pero debe dejar al menos uno
    let detalleVentaRows = document.querySelectorAll('.detalle-venta-row');
    for (let i = 0; i < detalleVentaRows.length; i++) {
        detalleVentaRows[i].remove();
    }

    rowTable = element.parentNode.parentNode.parentNode; 
    // document.querySelector('.viewcodigoventa').classList.remove("d-none");
    document.querySelector('#titleModal').innerHTML = "Gestionar Reserva";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#btnText').innerHTML = "Guardar";
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + '/Reservas/getReserva/'+idreserva;
    request.open("GET", ajaxUrl, true);
    request.send();
    request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
            let objData = JSON.parse(request.responseText);
            let estadoPago = "";
            switch (parseInt(objData.data.reserva.status)) {
              case 2:
                estadoPago = '2'; // Pago / Aprobado
                break;
              case 1:
                estadoPago = '1'; // Pago / Por Aprobar
                break;
              case 3:
                estadoPago = '3'; // Pago / Erróneo
                break;
              default:
                estadoPago = '0'; // No definido
            }
            if (objData.status) {


        
                document.querySelector("#idVenta").value = objData.data.reserva.idreserva;
                document.querySelector("#txtcodigoreserva").value = objData.data.reserva.cod_reserva;
                document.querySelector("#txtNombre").value = objData.data.reserva.nombres;
                document.querySelector("#txtApellido").value = objData.data.reserva.apellidos;
                document.querySelector("#txtTelefono").value = objData.data.reserva.telefono;
                document.querySelector("#txtModalidadPago").value = objData.data.reserva.tipopago;
                document.querySelector("#txtCodigoVoucher").value = objData.data.reserva.codigo_voucher;
                document.querySelector("#txtEstadoPago").value = estadoPago;
                $('#txtEstadoPago').selectpicker('refresh');
                document.querySelector("#imagenvoucher").value = objData.data.reserva.captura_voucher;

                // document.querySelector("#listClienteid").value = objData.data.reserva.dni_cliente;
                // $('#listClienteid').selectpicker('refresh');
        
                // let cantidadDatos = objData.data.detalle_venta.length;
                // // Hacer clic en el botón para agregar nuevos grupos
                // for (let i = 0; i < cantidadDatos; i++) {
                //     btnAgregarProducto.click();
                // }
                $('#modalFormCliente').modal('show');
                // Ejecutar la asignación de datos después de un retraso
                // setTimeout(function() {
                //     asignarDatos(objData.data.detalle_venta);
                // }, 2000); // Esperar 0.15 segundos 1 segundo = 1000 (ajustar si es necesario)
            }
        }
    }
  }

  function asignarDatos(detalleVenta) {
    let cantidadDatos = detalleVenta.length;
    // Asignar los datos a los grupos respectivos
    let grupos = document.querySelectorAll(".detalle-venta-row");

    for (let i = 0; i < cantidadDatos; i++) {
        let datosLote = detalleVenta[i];
        let grupoActual = grupos[i];
        if (grupoActual) {
            let servicioSelect = grupoActual.querySelector("#listservicios");
            if (servicioSelect) {
                servicioSelect.value = datosLote.idservicio;
                $(servicioSelect).selectpicker('refresh');
            }

            let cantidadInput = grupoActual.querySelector(".cantidad");
            if (cantidadInput) {
                cantidadInput.value = datosLote.cantidad;
            }

            let precioInput = grupoActual.querySelector(".precio");
            if (precioInput) {
                precioInput.value = datosLote.precio;
              }
            let descuentoInput = grupoActual.querySelector(".descuento");
            if (descuentoInput) {
              descuentoInput.value = datosLote.descuento;
              }

              // Llamar a las funciones necesarias para calcular y sumar precios
              cal_precio_db(grupoActual);
              calculateRow(grupoActual);
          }
      }
      // Sumar precios totales después de asignar todos los datos
      sumarPreciosTotales();
  }
  // ------fin editar venta-----------
  // ------fin editar venta-----------
  
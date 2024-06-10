let tablePedidos;
let rowTable;
// tablePedidos = $('#tablePedidos').dataTable({
//   "aProcessing": true,
//   "aServerSide": true,
//   "language": {
//     "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
//   },
//   "ajax": {
//     "url": " " + base_url + "/Pedidos/getPedidos",
//     "dataSrc": ""
//   },
//   "columns": [
//     { "data": "idpedido" },
//     { "data": "transaccion" },
//     { "data": "fecha" },
//     { "data": "monto" },
//     { "data": "tipopago" },
//     { "data": "status" },
//     { "data": "options" }
//   ],
//   "columnDefs": [
//     { 'className': "textcenter", "targets": [3] },
//     { 'className': "textright", "targets": [4] },
//     { 'className': "textcenter", "targets": [5] }
//   ],
//   'dom': 'lBfrtip',
//   'buttons': [
//     {
//       "extend": "copyHtml5",
//       "text": "<i class='far fa-copy'></i> Copiar",
//       "titleAttr": "Copiar",
//       "className": "btn btn-secondary",
//       "exportOptions": {
//         "columns": [0, 1, 2, 3, 4, 5]
//       }
//     }, {
//       "extend": "excelHtml5",
//       "text": "<i class='fas fa-file-excel'></i> Excel",
//       "titleAttr": "Esportar a Excel",
//       "className": "btn btn-success",
//       "exportOptions": {
//         "columns": [0, 1, 2, 3, 4, 5]
//       }
//     }, {
//       "extend": "pdfHtml5",
//       "text": "<i class='fas fa-file-pdf'></i> PDF",
//       "titleAttr": "Esportar a PDF",
//       "className": "btn btn-danger",
//       "exportOptions": {
//         "columns": [0, 1, 2, 3, 4, 5]
//       }
//     }, {
//       "extend": "csvHtml5",
//       "text": "<i class='fas fa-file-csv'></i> CSV",
//       "titleAttr": "Esportar a CSV",
//       "className": "btn btn-info",
//       "exportOptions": {
//         "columns": [0, 1, 2, 3, 4, 5]
//       }
//     }
//   ],
//   "resonsieve": "true",
//   "bDestroy": true,
//   "iDisplayLength": 10,
//   "order": [[0, "desc"]]
// });
tablePedidos = $('#tablePedidos').DataTable({
  "processing": true,
  "serverSide": true,
  "language": {
    "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
  },
  "ajax": {
    "url": base_url + "/Pedidos/getVentas",
    "dataSrc": ""
  },
  "columns": [
    { "data": "idventa" },
    { "data": "idtipopago" },
    { "data": "fecha_hora" },
    { "data": "dni_cliente" },
    { "data": "nombre_cliente" },
    { "data": "status" },
    { "data": "options" }
  ],
  "columnDefs": [
    { 'className': "text-center", "targets": [3, 4, 5] }, // Corregido "textcenter" a "text-center"
    { 'className': "text-right", "targets": [3] }
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
  "responsive": true, // Corregido "resonsieve" a "responsive"
  "destroy": true, // Corregido "bDestroy" a "destroy"
  "pageLength": 10, // Corregido "iDisplayLength" a "pageLength"
  "order": [[0, "desc"]]
});


// ------------------------------------
// ------------------------------------
// ------------------------------------
// NUEVO Pedido
let formPedido = document.querySelector("#formUpdatePedido");
formPedido.onsubmit = function (e) {
    e.preventDefault();
    
    let strCodigoVenta = document.querySelector('#txtCodigoVenta').value;
    let strCodigoSalida = document.querySelector('#txtCodigoSalida').value;
    let dtFechaHora = document.querySelector('#fecha-hora').value;
    let strDNI = document.querySelector('#txtDNI').value;
    let strNombre = document.querySelector('#txtNombre').value;
    let strApellido = document.querySelector('#txtApellido').value;
    let strDescripcion = document.querySelector('#textareaDescripcion').value;

    // Obtener valores de los selectores de roles dinámicos
    let dynamicRoles = {};
    document.querySelectorAll("select[id^='listRolEmpleado_']").forEach(select => {
        let roleName = select.id.replace('listRolEmpleado_', '');
        if (select.value !== '') { // Ignorar si no hay selección
            dynamicRoles[roleName] = select.value;
        }
    });

    // Obtener valores de los selectores de cargadores
    let cargadores = [];
    document.querySelectorAll("select[name='selectCargador']").forEach(select => {
        if (select.value !== '') { // Ignorar si no hay selección
            cargadores.push(select.value);
        }
    });

    // Obtener datos de los servicios
    let servicios = [];
    document.querySelectorAll("tr.detalle-venta-row").forEach(row => {
        let selectServicio = row.querySelector("select.servicio-select");
        let cantidad = row.querySelector("input.cantidad").value;
        let precio = row.querySelector("input.precio").value;
        let precioTotal = row.querySelector("input.precio_total").value;

        if (selectServicio && selectServicio.value !== '' && cantidad !== '' && precio !== '') {
            let nombreServicio = selectServicio.options[selectServicio.selectedIndex].text;
            let idServicio = selectServicio.value;
            servicios.push({
                id: idServicio,
                servicio: nombreServicio,
                cantidad: parseFloat(cantidad),
                precio: parseFloat(precio),
                precioTotal: parseFloat(precioTotal)
            });
        }
    });

    // Imprimir valores en la consola
    console.log("Codigo Venta:", strCodigoVenta);
    console.log("Codigo Salida:", strCodigoSalida);
    console.log("Fecha y Hora:", dtFechaHora);
    
    // Imprimir roles dinámicos uno por uno
    for (let role in dynamicRoles) {
        console.log(`${role}: ${dynamicRoles[role]}`);
    }
    
    // Imprimir cargadores solo si hay selecciones
    if (cargadores.length > 0) {
        console.log("Cargadores:", cargadores);
    }
    
    console.log("DNI:", strDNI);
    console.log("Nombre:", strNombre);
    console.log("Apellido:", strApellido);
    console.log("Descripcion:", strDescripcion);

    // Imprimir servicios
    if (servicios.length > 0) {
        console.log("Servicios:", servicios);
    }

    // Verificar campos obligatorios
    if (strCodigoVenta == '' || strCodigoSalida == '' || dtFechaHora == '' || strDNI == '' || strNombre == '' || strApellido == '') {
        swal("Atención", "Todos los campos obligatorios deben ser llenados.", "error");
        return false;
    }

    divLoading.style.display = "flex";
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + '/Pedidos/setPedido';
    let formData = new FormData();
    
    // Agregar datos al formData
    formData.append('codigoVenta', strCodigoVenta);
    formData.append('codigoSalida', strCodigoSalida);
    formData.append('fechaHora', dtFechaHora);
    formData.append('dni', strDNI);
    formData.append('nombre', strNombre);
    formData.append('apellido', strApellido);
    formData.append('descripcion', strDescripcion);
    formData.append('dynamicRoles', JSON.stringify(dynamicRoles));
    formData.append('cargadores', JSON.stringify(cargadores));
    formData.append('servicios', JSON.stringify(servicios));

    request.open("POST", ajaxUrl, true);
    request.send(formData);
    request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
          console.log(request)
          console.log(request.responseText)
            let objData = JSON.parse(request.responseText);
            if (objData.status) {
                $('#modalFormPedido').modal("hide");
                formPedido.reset();
                swal("Pedido", objData.msg, "success");
            } else {
                swal("Error", objData.msg, "error");
            }
        }
        divLoading.style.display = "none";
        return false;
    }
}


// ------------------------------------
// ------------------------------------
// ------------------------------------


// ---------------------los roles gia conductor-----------------------------
// ---------------------los roles gia conductor-----------------------------
// window.addEventListener(
//   "load",
//   function () {
//     fntRolesEmpleado();
//   },
//   false
// );

// function fntRolesEmpleado() {
//   if (document.querySelector("#listRolNombreEmpleado")) {
//     let ajaxUrl = base_url + "/RolesEmpleados/getSelectRolesEmpleadosventa";
//     let request = window.XMLHttpRequest
//       ? new XMLHttpRequest()
//       : new ActiveXObject("Microsoft.XMLHTTP");
//     request.open("GET", ajaxUrl, true);
//     request.send();
//     request.onreadystatechange = function () {
//       if (request.readyState == 4 && request.status == 200) {
//         let response = request.responseText;
//         document.querySelector("#listRolNombreEmpleado").innerHTML = response;
//         $("#listRolNombreEmpleado select").selectpicker("render");
//       }
//     };
//   }
// }
// ------------------------------------------------------------------
// ------------------------------------------------------------------

// -------------------CARGADORES--------------------
// -------------------CARGADORES--------------------
// let selectedCargadores = [];

// document.addEventListener("DOMContentLoaded", function () {
//   loadInitialCargadorSelect();
//   document
//     .getElementById("btnAgregarCargador")
//     .addEventListener("click", function () {
//       addNewCargadorSelect();
//     });
//   document.querySelectorAll(".btn-remove-select").forEach((btn) => {
//     btn.addEventListener("click", function () {
//       removeCargadorSelect(btn);
//     });
//   });
//   document.querySelectorAll(".selectpicker").forEach((select) => {
//     select.addEventListener("change", function () {
//       updateSelectedCargadores(select);
//     });
//   });
// });

// function loadInitialCargadorSelect() {
//   let ajaxUrl = base_url + "/RolesEmpleados/getSelectRolesCargadores";
//   let request = new XMLHttpRequest();
//   request.open("GET", ajaxUrl, true);
//   request.send();
//   request.onreadystatechange = function () {
//     if (request.readyState == 4 && request.status == 200) {
//       let response = request.responseText;
//       createCargadorSelect(response);
//     }
//   };
// }

// function addNewCargadorSelect() {
//   let ajaxUrl = base_url + "/RolesEmpleados/getNewCargadorSelect";
//   let request = new XMLHttpRequest();
//   request.open("GET", ajaxUrl, true);
//   request.send();
//   request.onreadystatechange = function () {
//     if (request.readyState == 4 && request.status == 200) {
//       let response = request.responseText;
//       createCargadorSelect(response);
//     }
//   };
// }

// function createCargadorSelect(optionsHTML) {
//   let selectContainer = document.createElement("div");
//   selectContainer.className = "form-row align-items-center mb-2";
//   selectContainer.innerHTML = `
//         <div class="col">
//             <select class="form-control selectpicker" name="selectCargador" data-live-search="true">${optionsHTML}</select>
//         </div>
//         <div class="col-auto">
//             <button type="button" class="btn btn-danger btn-remove-select btn-sm">X</button>
//         </div>
//     `;

//   document.getElementById("cargadorContainer").appendChild(selectContainer);
//   $(".selectpicker").selectpicker("render");

//   let btnRemove = selectContainer.querySelector(".btn-remove-select");
//   btnRemove.addEventListener("click", function () {
//     removeCargadorSelect(btnRemove);
//   });

//   let newSelect = selectContainer.querySelector("select");
//   newSelect.addEventListener("change", function () {
//     updateSelectedCargadores(newSelect);
//   });
// }

// function removeCargadorSelect(btnRemove) {
//   let selectContainer = btnRemove.closest(".form-row");
//   let removedSelect = selectContainer.querySelector("select");
//   let removedOption = removedSelect.options[removedSelect.selectedIndex].value;
//   let index = selectedCargadores.indexOf(removedOption);
//   if (index !== -1) {
//     selectedCargadores.splice(index, 1);
//   }

//   let selects = document.querySelectorAll(".selectpicker");
//   selects.forEach((select) => {
//     let option = select.querySelector(`option[value="${removedOption}"]`);
//     if (option) {
//       option.disabled = false;
//     }
//   });

//   selectContainer.remove();
// }

// function updateSelectedCargadores(select) {
//   let selectedOption = select.options[select.selectedIndex].value;
//   if (selectedCargadores.includes(selectedOption)) {
//     select.value = "";

//     let event = new Event("change");
//     select.dispatchEvent(event);
//   } else {
//     selectedCargadores.push(selectedOption);
//     disableSelectedOption(selectedOption);
//   }
// }

// function disableSelectedOption(selectedOption) {
//   let selects = document.querySelectorAll(".selectpicker");
//   selects.forEach((select) => {
//     let option = select.querySelector(`option[value="${selectedOption}"]`);
//     if (option) {
//       option.disabled = true;
//     }
//   });
// }
// ---------------------------------------
// ---------------------------------------
//  clientes------------
window.addEventListener("load", function () {
  fntClientes();
}, false);

function fntClientes() {
  if (document.querySelector("#listClienteid")) {
      let ajaxUrl = base_url + "/Clientes/getlistclientes";
      let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
      request.open("GET", ajaxUrl, true);
      request.send();
      request.onreadystatechange = function () {
          if (request.readyState == 4 && request.status == 200) {
              let response = request.responseText;
              document.querySelector("#listClienteid").innerHTML = response;
              $("#listClienteid").selectpicker("render");
          }
      };
  }
}


// // // ---------------Servicios----------

document.addEventListener("DOMContentLoaded", function () {
  const tblDetalleVenta = document.getElementById("tblDetalleVenta");
  const btnAgregarProducto = document.getElementById("btnAgregarProducto");

  function loadInitialSelectOptions() {
      let ajaxUrl = base_url + "/Servicios/getSelectServicios";
      let request = new XMLHttpRequest();
      request.open("GET", ajaxUrl, true);
      request.send();
      request.onreadystatechange = function () {
          if (request.readyState == 4 && request.status == 200) {
              let response = JSON.parse(request.responseText);
              addNewProductoRow(response);
          }
      };
  }

  function addNewProductoRow(response) {
      let newRow = document.createElement("tr");
      newRow.classList.add("detalle-venta-row");
      newRow.innerHTML = `
          <td>
              <p class="row-number"></p>
          </td>
          <td>
              <select class="form-control selectpicker servicio-select" name="selectGuia" required data-live-search="true">
                  ${response[0]}
              </select>
          </td>
          <td>
              <input type="number" class="form-control cantidad" value="0.00">
          </td>
          <td>
              <input type="number" class="form-control precio" value="0.00">
          </td>
          <td>
              <input type="number" class="form-control descuento" value="0.00" readonly>
          </td>
          <td>
              <input type="number" class="form-control precio_total" value="0.00" readonly>
          </td>
          <td>
              <div class="col-auto">
                  <button type="button" class="btn btn-danger btn-remove-select btn-sm">X</button>
              </div>
          </td>
          <td>
              <input type="number" class="form-control precio_db" value="0" readonly>
          </td>
      `;
      tblDetalleVenta.insertBefore(newRow, tblDetalleVenta.lastElementChild); // Insertar antes de la última fila

      $(newRow).find('.selectpicker').selectpicker('render');

      addEventListenersToRow(newRow);

      newRow.querySelector(".btn-remove-select").addEventListener("click", function () {
          newRow.remove();
          updateRowNumbers();
          sumarPreciosTotales();
      });

      updateRowNumbers();
  }

  function addEventListenersToRow(row) {
      const cantidadInput = row.querySelector(".cantidad");
      const precioInput = row.querySelector(".precio");

      cantidadInput.addEventListener("input", function () {
          calculateRow(row);
          sumarPreciosTotales();
      });

      precioInput.addEventListener("input", function () {
          calculateRow(row);
          sumarPreciosTotales();
      });

      calculateRow(row);
  }

  function calculateRow(row) {
      const cantidad = parseFloat(row.querySelector(".cantidad").value) || 0;
      const precio = parseFloat(row.querySelector(".precio").value) || 0;
      const precioDb = parseFloat(row.querySelector(".precio_db").value) || 0;

      const precioTotal = cantidad * precio;
      const precioDbTotal = cantidad * precioDb;

      let descuento = precioDbTotal - precioTotal;
      if (descuento < 0) {
          descuento = 0;
      }

      row.querySelector(".precio_total").value = precioTotal.toFixed(2);
      row.querySelector(".descuento").value = descuento.toFixed(2);
  }

  function sumarPreciosTotales() {
      let subtotal = 0;
      let filas = tblDetalleVenta.getElementsByClassName("detalle-venta-row");

      for (let i = 0; i < filas.length; i++) {
          let fila = filas[i];
          let precioTotalElement = fila.querySelector(".precio_total");
          let precioTotal = 0;

          if (precioTotalElement) {
              precioTotal = parseFloat(precioTotalElement.value) || 0;
          }

          subtotal += precioTotal;
      }

      document.getElementById("total").innerText = "S/" + subtotal.toFixed(2);
  }

  function updateRowNumbers() {
      let rows = tblDetalleVenta.getElementsByClassName("detalle-venta-row");
      for (let i = 0; i < rows.length; i++) {
          let rowNumberElement = rows[i].querySelector(".row-number");
          rowNumberElement.innerText = i + 1;
      }
  }

  btnAgregarProducto.addEventListener("click", function () {
      loadInitialSelectOptions();
  });

  loadInitialSelectOptions(); // Cargar opciones iniciales al abrir el modal
});



function aaa() {

  // Obtener el elemento del botón dentro del div con ID 'tblDetalleVenta'
  var buttonElement = document.querySelector('#tblDetalleVenta .btn.dropdown-toggle.btn-light');

  // Obtener el título del botón
  var buttonTitle = buttonElement.getAttribute('title');

  // Utilizar una expresión regular para encontrar el número decimal en el título
  var decimalNumber = buttonTitle.match(/\d+\.\d+/);

  console.log("Número decimal en el título:", decimalNumber[0]);

}





















function openModal() {
  rowTable = "";
  // document.querySelector('#idProducto').value ="";
  document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
  document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
  document.querySelector('#btnActionForm').innerHTML = "Guardar";
  document.querySelector("#formUpdatePedido").reset();
  $('#modalFormPedido').modal('show');
}






































































function fntTransaccion(idtransaccion) {
  let request = (window.XMLHttpRequest) ?
    new XMLHttpRequest() :
    new ActiveXObject('Microsoft.XMLHTTP');
  let ajaxUrl = base_url + '/Pedidos/getTransaccion/' + idtransaccion;
  divLoading.style.display = "flex";
  request.open("GET", ajaxUrl, true);
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      let objData = JSON.parse(request.responseText);
      if (objData.status) {
        document.querySelector("#divModal").innerHTML = objData.html;
        $('#modalReembolso').modal('show');
      } else {
        swal("Error", objData.msg, "error");
      }
      divLoading.style.display = "none";
      return false;
    }
  }
}

function fntReembolsar() {
  let idtransaccion = document.querySelector("#idtransaccion").value;
  let observacion = document.querySelector("#txtObservacion").value;
  if (idtransaccion == '' || observacion == '') {
    swal("", "Complete los datos para continuar.", "error");
    return false;
  }

  swal({
    title: "Hacer Reembolso",
    text: "¿Realmente quiere realizar el reembolso?",
    type: "warning",
    showCancelButton: true,
    confirmButtonText: "Si, eliminar!",
    cancelButtonText: "No, cancelar!",
    closeOnConfirm: true,
    closeOnCancel: true
  }, function (isConfirm) {

    if (isConfirm) {
      $('#modalReembolso').modal('hide');
      divLoading.style.display = "flex";
      let request = (window.XMLHttpRequest) ?
        new XMLHttpRequest() :
        new ActiveXObject('Microsoft.XMLHTTP');
      let ajaxUrl = base_url + '/Pedidos/setReembolso';
      let formData = new FormData();
      formData.append('idtransaccion', idtransaccion);
      formData.append('observacion', observacion);
      request.open("POST", ajaxUrl, true);
      request.send(formData);
      request.onreadystatechange = function () {
        if (request.readyState != 4) return;
        if (request.status == 200) {
          let objData = JSON.parse(request.responseText);
          if (objData.status) {
            window.location.reload();
          } else {
            swal("Error", objData.msg, "error");
          }
          divLoading.style.display = "none";
          return false;
        }
      }
    }

  });
}

function fntEditInfo(element, idpedido) {
  rowTable = element.parentNode.parentNode.parentNode;
  let request = (window.XMLHttpRequest) ?
    new XMLHttpRequest() :
    new ActiveXObject('Microsoft.XMLHTTP');
  let ajaxUrl = base_url + '/Pedidos/getPedido/' + idpedido;
  divLoading.style.display = "flex";
  request.open("GET", ajaxUrl, true);
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      let objData = JSON.parse(request.responseText);
      if (objData.status) {
        document.querySelector("#divModal").innerHTML = objData.html;
        $('#modalFormPedido').modal('show');
        $('select').selectpicker();
        fntUpdateInfo();
      } else {
        swal("Error", objData.msg, "error");
      }
      divLoading.style.display = "none";
      return false;

    }
  }
}
function newpedidojs() {
  let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
  let ajaxUrl = base_url + '/Pedidos/newPedido/';
  divLoading.style.display = "flex";
  request.open("GET", ajaxUrl, true);
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      try {
        console.log(request)
        console.log(request.responseText)
        let objData = JSON.parse(request.responseText);
        if (objData.status) {
          document.querySelector("#divModal").innerHTML = objData.html;
          $('#modalFormPedido').modal('show');
          $('select').selectpicker();
          fntUpdateInfo();
        } else {
          swal("Error", objData.msg, "error");
        }
      } catch (e) {
        console.error("Parsing error:", e);
        swal("Error", "Error al procesar la respuesta del servidor", "error");
      }
      divLoading.style.display = "none";
    }
  }
}


function fntUpdateInfo() {
  let formUpdatePedido = document.querySelector("#formUpdatePedido");
  formUpdatePedido.onsubmit = function (e) {
    e.preventDefault();
    let transaccion;
    if (document.querySelector("#txtTransaccion")) {
      transaccion = document.querySelector("#txtTransaccion").value;
      if (transaccion == "") {
        swal("", "Complete los datos para continuar.", "error");
        return false;
      }
    }

    let request = (window.XMLHttpRequest) ?
      new XMLHttpRequest() :
      new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + '/Pedidos/setPedido/';
    divLoading.style.display = "flex";
    let formData = new FormData(formUpdatePedido);
    request.open("POST", ajaxUrl, true);
    request.send(formData);
    request.onreadystatechange = function () {
      if (request.readyState != 4) return;
      if (request.status == 200) {
        let objData = JSON.parse(request.responseText);
        if (objData.status) {
          swal("", objData.msg, "success");
          $('#modalFormPedido').modal('hide');
          if (document.querySelector("#txtTransaccion")) {
            rowTable.cells[1].textContent = document.querySelector("#txtTransaccion").value;
            rowTable.cells[4].textContent = document.querySelector("#listTipopago").selectedOptions[0].innerText;
            rowTable.cells[5].textContent = document.querySelector("#listEstado").value;
          } else {
            rowTable.cells[5].textContent = document.querySelector("#listEstado").value;
          }
        } else {
          swal("Error", objData.msg, "error");
        }

        divLoading.style.display = "none";
        return false;
      }
    }

  }
}



// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------












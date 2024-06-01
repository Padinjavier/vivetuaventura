let tablePedidos;
let rowTable;
tablePedidos = $('#tablePedidos').dataTable( {
    "aProcessing":true,
    "aServerSide":true,
    "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
  },
    "ajax":{
        "url": " "+base_url+"/Pedidos/getPedidos",
        "dataSrc":""
  },
    "columns":[
        {"data":"idpedido"},
        {"data":"transaccion"},
        {"data":"fecha"},
        {"data":"monto"},
        {"data":"tipopago"},
        {"data":"status"},
        {"data":"options"}
  ],
    "columnDefs": [
                    { 'className': "textcenter", "targets": [ 3 ] },
                    { 'className': "textright", "targets": [ 4 ] },
                    { 'className': "textcenter", "targets": [ 5 ] }
  ],
    'dom': 'lBfrtip',
    'buttons': [
    {
            "extend": "copyHtml5",
            "text": "<i class='far fa-copy'></i> Copiar",
            "titleAttr":"Copiar",
            "className": "btn btn-secondary",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "excelHtml5",
            "text": "<i class='fas fa-file-excel'></i> Excel",
            "titleAttr":"Esportar a Excel",
            "className": "btn btn-success",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "pdfHtml5",
            "text": "<i class='fas fa-file-pdf'></i> PDF",
            "titleAttr":"Esportar a PDF",
            "className": "btn btn-danger",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "csvHtml5",
            "text": "<i class='fas fa-file-csv'></i> CSV",
            "titleAttr":"Esportar a CSV",
            "className": "btn btn-info",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        }
  ],
    "resonsieve":"true",
    "bDestroy": true,
    "iDisplayLength": 10,
    "order":[[0,"desc"]]  
});

// ------------------------------------
// ------------------------------------
// ------------------------------------
//NUEVO Pedido
let formPedido = document.querySelector("#formUpdatePedido");
formPedido.onsubmit = function(e) {
    e.preventDefault();
    let strNombre = document.querySelector('#txtNombre').value;
    let strDescripcion = document.querySelector('#txtDescripcion').value;
    let strPrecio = document.querySelector('#txtPrecio').value;
    let intStatus = document.querySelector('#listStatus').value;        
    if(strNombre == '' || strDescripcion == '' || intStatus == '' || strPrecio == '' )
    {
        swal("Atención", "Todos los campos son obligatorios." , "error");
        return false;
    }
    divLoading.style.display = "flex";
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Pedidos/setPedido'; 
    let formData = new FormData(formPedido);
    request.open("POST",ajaxUrl,true);
    request.send(formData);
    request.onreadystatechange = function(){
       if(request.readyState == 4 && request.status == 200){
            let objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                // if(rowTable == ""){
                //     tableServicios.api().ajax.reload();
                // }else{
                //     htmlStatus = intStatus == 1 ? 
                //         '<span class="badge badge-success">Activo</span>' : 
                //         '<span class="badge badge-danger">Inactivo</span>';
                //     rowTable.cells[1].textContent = strNombre;
                //     rowTable.cells[2].textContent = strDescripcion;
                //     rowTable.cells[3].textContent = strPrecio;
                //     rowTable.cells[4].innerHTML = htmlStatus;
                //     rowTable = "";
                // }

                $('#modalFormPedido').modal("hide");
                formPedido.reset();
                swal("Pedido", objData.msg ,"success");
                removePhoto();
            }else{
                swal("Error", objData.msg , "error");
            }              
        } 
        divLoading.style.display = "none";
        return false;
    }
  }
// ------------------------------------
// ------------------------------------
// ------------------------------------

















function fntTransaccion(idtransaccion){
    let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Pedidos/getTransaccion/'+idtransaccion;
  divLoading.style.display = "flex";
    request.open("GET",ajaxUrl,true);
  request.send();
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
      let objData = JSON.parse(request.responseText);
            if(objData.status){   
        document.querySelector("#divModal").innerHTML = objData.html;
                $('#modalReembolso').modal('show');
            }else{
                swal("Error", objData.msg , "error");
      }
      divLoading.style.display = "none";
      return false;
    }
    }
}

function fntReembolsar(){
  let idtransaccion = document.querySelector("#idtransaccion").value;
  let observacion = document.querySelector("#txtObservacion").value;
    if(idtransaccion == '' || observacion == ''){
        swal("", "Complete los datos para continuar." , "error");
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
    }, function(isConfirm) { 

        if(isConfirm){ 
            $('#modalReembolso').modal('hide');
        divLoading.style.display = "flex";
            let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url+'/Pedidos/setReembolso';
        let formData = new FormData();
            formData.append('idtransaccion',idtransaccion);
            formData.append('observacion',observacion);
            request.open("POST",ajaxUrl,true);
        request.send(formData);
            request.onreadystatechange = function(){
                if(request.readyState != 4) return;
                if(request.status == 200){
            let objData = JSON.parse(request.responseText);
                    if(objData.status){  
              window.location.reload();
                    }else{
                        swal("Error", objData.msg , "error");
            }
            divLoading.style.display = "none";
            return false;
          }
      }
    }

    });
}

function fntEditInfo(element,idpedido){
  rowTable = element.parentNode.parentNode.parentNode;
    let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Pedidos/getPedido/'+idpedido;
  divLoading.style.display = "flex";
    request.open("GET",ajaxUrl,true);
  request.send();
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
      let objData = JSON.parse(request.responseText);
            if(objData.status)
            {
        document.querySelector("#divModal").innerHTML = objData.html;
                $('#modalFormPedido').modal('show');
                $('select').selectpicker();
        fntUpdateInfo();
            }else{
                swal("Error", objData.msg , "error");
      }
      divLoading.style.display = "none";
      return false;

        }
    }
}
function newpedidojs(){
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Pedidos/newPedido/';
  divLoading.style.display = "flex";
    request.open("GET",ajaxUrl,true);
  request.send();
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
      try {
                console.log(request)
                console.log(request.responseText)
        let objData = JSON.parse(request.responseText);
                if(objData.status) {
          document.querySelector("#divModal").innerHTML = objData.html;
                    $('#modalFormPedido').modal('show');
                    $('select').selectpicker();
          fntUpdateInfo();
        } else {
                    swal("Error", objData.msg , "error");
        }
      } catch (e) {
        console.error("Parsing error:", e);
        swal("Error", "Error al procesar la respuesta del servidor", "error");
      }
      divLoading.style.display = "none";
    }
    }
}


function fntUpdateInfo(){
  let formUpdatePedido = document.querySelector("#formUpdatePedido");
    formUpdatePedido.onsubmit = function(e) {
    e.preventDefault();
    let transaccion;
        if(document.querySelector("#txtTransaccion")){
      transaccion = document.querySelector("#txtTransaccion").value;
            if(transaccion == ""){
                swal("", "Complete los datos para continuar." , "error");
        return false;
      }
    }

        let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url+'/Pedidos/setPedido/';
    divLoading.style.display = "flex";
    let formData = new FormData(formUpdatePedido);
        request.open("POST",ajaxUrl,true);
    request.send(formData);
        request.onreadystatechange = function(){
            if(request.readyState != 4) return;
            if(request.status == 200){
        let objData = JSON.parse(request.responseText);
                if(objData.status){
                     swal("", objData.msg ,"success");
                     $('#modalFormPedido').modal('hide');
                    if(document.querySelector("#txtTransaccion")){
                        rowTable.cells[1].textContent = document.querySelector("#txtTransaccion").value;
                        rowTable.cells[4].textContent = document.querySelector("#listTipopago").selectedOptions[0].innerText;
                        rowTable.cells[5].textContent = document.querySelector("#listEstado").value;
                    }else{
                        rowTable.cells[5].textContent = document.querySelector("#listEstado").value;
          }
                }else{
                    swal("Error", objData.msg , "error");
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


















// ---------------------los roles gia conductor-----------------------------
window.addEventListener(
  "load",
  function () {
    fntRolesEmpleado();
  },
  false
);

function fntRolesEmpleado() {
  if (document.querySelector("#listRolNombreEmpleado")) {
    let ajaxUrl = base_url + "/RolesEmpleados/getSelectRolesEmpleadosventa";
    let request = window.XMLHttpRequest
      ? new XMLHttpRequest()
      : new ActiveXObject("Microsoft.XMLHTTP");
    request.open("GET", ajaxUrl, true);
    request.send();
    request.onreadystatechange = function () {
      if (request.readyState == 4 && request.status == 200) {
        // Obtener la respuesta del servidor
        let response = request.responseText;
        // Insertar la respuesta dentro del div
        document.querySelector("#listRolNombreEmpleado").innerHTML = response;
        // Renderizar el selectpicker
        $("#listRolNombreEmpleado select").selectpicker("render");
      }
    };
  }
}
// ------------------------------------------------------------------

// -------------------CARGADORES--------------------
let selectedCargadores = []; // Array para almacenar los cargadores seleccionados

document.addEventListener("DOMContentLoaded", function () {
  loadInitialCargadorSelect();
  document
    .getElementById("btnAgregarCargador")
    .addEventListener("click", function () {
      addNewCargadorSelect();
    });
  document.querySelectorAll(".btn-remove-select").forEach((btn) => {
    btn.addEventListener("click", function () {
      removeCargadorSelect(btn);
    });
  });
  document.querySelectorAll(".selectpicker").forEach((select) => {
    select.addEventListener("change", function () {
      updateSelectedCargadores(select);
    });
  });
});

function loadInitialCargadorSelect() {
  let ajaxUrl = base_url + "/RolesEmpleados/getSelectRolesCargadores";
  let request = new XMLHttpRequest();
  request.open("GET", ajaxUrl, true);
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      let response = request.responseText;
      createCargadorSelect(response);
    }
  };
}

function addNewCargadorSelect() {
  let ajaxUrl = base_url + "/RolesEmpleados/getNewCargadorSelect";
  let request = new XMLHttpRequest();
  request.open("GET", ajaxUrl, true);
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      let response = request.responseText;
      createCargadorSelect(response);
    }
  };
}

function createCargadorSelect(optionsHTML) {
  // Crear el nuevo select con las opciones
  let selectContainer = document.createElement("div");
  selectContainer.className = "form-row align-items-center mb-2";
  selectContainer.innerHTML = `
        <div class="col">
            <select class="form-control selectpicker" name="selectGuia" data-live-search="true">${optionsHTML}</select>
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-danger btn-remove-select btn-sm">X</button>
        </div>
    `;

  document.getElementById("cargadorContainer").appendChild(selectContainer);
  $(".selectpicker").selectpicker("render");

  // Agregar event listener para remover el select
  let btnRemove = selectContainer.querySelector(".btn-remove-select");
  btnRemove.addEventListener("click", function () {
    removeCargadorSelect(btnRemove);
  });

  // Agregar el event listener para actualizar los cargadores seleccionados
  let newSelect = selectContainer.querySelector("select");
  newSelect.addEventListener("change", function () {
    updateSelectedCargadores(newSelect);
  });
}

function removeCargadorSelect(btnRemove) {
  let selectContainer = btnRemove.closest(".form-row");
  let removedSelect = selectContainer.querySelector("select");
  let removedOption = removedSelect.options[removedSelect.selectedIndex].value;
  // Eliminar el cargador de la lista de seleccionados
  let index = selectedCargadores.indexOf(removedOption);
  if (index !== -1) {
    selectedCargadores.splice(index, 1);
  }
  // Habilitar la opción removida en los otros selects
  let selects = document.querySelectorAll(".selectpicker");
  selects.forEach((select) => {
    let option = select.querySelector(`option[value="${removedOption}"]`);
    if (option) {
      option.disabled = false;
    }
  });
  // Remover el select del DOM
  selectContainer.remove();
}

function updateSelectedCargadores(select) {
  let selectedOption = select.options[select.selectedIndex].value;
  if (selectedCargadores.includes(selectedOption)) {
    select.value = "";
    // No es necesario disparar manualmente el evento de cambio
    let event = new Event("change");
    select.dispatchEvent(event);
  } else {
    selectedCargadores.push(selectedOption);
    disableSelectedOption(selectedOption);
  }
}

function disableSelectedOption(selectedOption) {
  let selects = document.querySelectorAll(".selectpicker");
  selects.forEach((select) => {
    let option = select.querySelector(`option[value="${selectedOption}"]`);
    if (option) {
      option.disabled = true;
    }
  });
}
// ---------------------------------------

// // ---------------Servicios----------
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
              <select class="form-control selectpicker servicio-select" name="selectGuia" required data-live-search="true">
                  ${response[0]}
              </select>
          </td>
          <td>
              <input type="number" class="form-control cantidad" onclick="sumarPreciosTotales()" value="0.00">
          </td>
          <td>
              <input type="number" class="form-control precio" onclick="sumarPreciosTotales()" value="0.00">
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
              <input type="hidden" class="form-control precio_db" value="1" readonly>
          </td>
      `;

      // Agregar la nueva fila al tbody
      tblDetalleVenta.insertBefore(
          newRow,
          document.getElementById("masservicios")
      );

      // Renderizar el selectpicker para el nuevo select
      $(newRow).find('.selectpicker').selectpicker('render');

      // Añadir eventos de cálculo y eliminación a la nueva fila
      addEventListenersToRow(newRow);

      newRow
          .querySelector(".btn-remove-select")
          .addEventListener("click", function () {
              newRow.remove();
          });

      // Añadir event listener para actualizar el precio_db cuando se cambia la selección del servicio
      newRow.querySelector(".servicio-select").addEventListener("change", function () {
          let selectedOption = this.options[this.selectedIndex];
          let nombreServicio = selectedOption.innerText;
          let soloNumeros = nombreServicio.replace(/[^\d.]/g, "");
          newRow.querySelector(".precio_db").value = soloNumeros;
      });
  }

  function addEventListenersToRow(row) {
      const cantidadInput = row.querySelector(".cantidad");
      const precioInput = row.querySelector(".precio");
      const descuentoInput = row.querySelector(".descuento");
      const precioTotalInput = row.querySelector(".precio_total");
      const precioDbInput = row.querySelector(".precio_db");

      function calcular() {
          const cantidad = parseFloat(cantidadInput.value) || 0;
          const precio = parseFloat(precioInput.value) || 0;
          const precioDb = parseFloat(precioDbInput.value) || 0;

          const precioTotal = cantidad * precio;
          const precioDbTotal = cantidad * precioDb;

          let descuento = precioDbTotal - precioTotal;
          if (descuento < 0) {
              descuento = 0;
          }

          precioTotalInput.value = precioTotal.toFixed(2);
          descuentoInput.value = descuento.toFixed(2);
      }

      cantidadInput.addEventListener("input", calcular);
      precioInput.addEventListener("input", calcular);

      calcular(); // Cálculo inicial al cargar la página
  }

  btnAgregarProducto.addEventListener("click", function () {
      loadInitialSelectOptions();
  });

  // Cargar el primer select al cargar la página
  loadInitialSelectOptions();
});

// --------------------




function sumarPreciosTotales() {
  // Obtener todos los elementos con la clase form-control precio_total
  const precioTotalInputs = document.querySelectorAll(
    ".form-control.precio_total"
  );

  let total = 0;

  // Iterar sobre cada elemento y sumar su valor
  precioTotalInputs.forEach(function (input) {
    total += parseFloat(input.value) || 0;
  });

//   console.log(total);
  igv = total*0.18;
  subtotal = total-(igv);


  var subtotalSpan = document.getElementById("subtotal");
  subtotalSpan.textContent = "S/"+subtotal.toFixed(2);

  var igvSpan = document.getElementById("igv");
  igvSpan.textContent = "S/"+igv.toFixed(2);

  var totalSpan = document.getElementById("total");
  totalSpan.textContent = "S/"+total.toFixed(2);
}

































function openModal()
{
    rowTable = "";
    // document.querySelector('#idProducto').value ="";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnActionForm').innerHTML ="Guardar";
    document.querySelector("#formUpdatePedido").reset();
    $('#modalFormPedido').modal('show');
}
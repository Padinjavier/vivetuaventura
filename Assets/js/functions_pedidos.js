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


window.addEventListener('load', function() {
    fntRolesEmpleado();
}, false);

function fntRolesEmpleado() {
    if (document.querySelector('#listRolNombreEmpleado')) {
        let ajaxUrl = base_url + '/RolesEmpleados/getSelectRolesEmpleadosventa';
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET", ajaxUrl, true);
        request.send();
        request.onreadystatechange = function () {
            if (request.readyState == 4 && request.status == 200) {
                // Obtener la respuesta del servidor
                let response = request.responseText;
                // Insertar la respuesta dentro del div
                document.querySelector('#listRolNombreEmpleado').innerHTML = response;
                // Renderizar el selectpicker
                $('#listRolNombreEmpleado select').selectpicker('render');
            }
        }
    }
}


// document.addEventListener('DOMContentLoaded', function() {
//     loadInitialCargadorSelect();
//     document.getElementById('btnAgregarCargador').addEventListener('click', function() {
//         addNewCargadorSelect();
//     });
// });

// function loadInitialCargadorSelect() {
//     let ajaxUrl = base_url + '/RolesEmpleados/getSelectRolesCargadores';
//     let request = new XMLHttpRequest();
//     request.open("GET", ajaxUrl, true);
//     request.send();
//     request.onreadystatechange = function() {
//         if (request.readyState == 4 && request.status == 200) {
//             let response = request.responseText;
//             let selectContainer = document.createElement('div');
//             selectContainer.className = 'form-row align-items-center mb-2';
//             selectContainer.innerHTML = `
//                 <div class="col">
//                     <select class="form-control selectpicker" name="selectGuia" required data-live-search="true">${response}</select>
//                 </div>
//                 <div class="col-auto">
//                     <button type="button" class="btn btn-danger btn-remove-select">X</button>
//                 </div>
//             `;
//             document.getElementById('cargadorContainer').appendChild(selectContainer);
//             $('.selectpicker').selectpicker('render');
//             // Add event listener to remove button
//             selectContainer.querySelector('.btn-remove-select').addEventListener('click', function() {
//                 selectContainer.remove();
//             });
//         }
//     }
// }

// function addNewCargadorSelect() {
//     let ajaxUrl = base_url + '/RolesEmpleados/getNewCargadorSelect';
//     let request = new XMLHttpRequest();
//     request.open("GET", ajaxUrl, true);
//     request.send();
//     request.onreadystatechange = function() {
//         if (request.readyState == 4 && request.status == 200) {
//             let response = request.responseText;
//             let selectContainer = document.createElement('div');
//             selectContainer.className = 'form-row align-items-center mb-2';
//             selectContainer.innerHTML = `
//                 <div class="col">
//                     <select class="form-control selectpicker" name="selectGuia" required data-live-search="true">${response}</select>
//                 </div>
//                 <div class="col-auto">
//                     <button type="button" class="btn btn-danger btn-remove-select">X</button>
//                 </div>
//             `;
//             document.getElementById('cargadorContainer').appendChild(selectContainer);
//             $('.selectpicker').selectpicker('render');

//             // Add event listener to remove button
//             selectContainer.querySelector('.btn-remove-select').addEventListener('click', function() {
//                 selectContainer.remove();
//             });
//         }
//     }
// }

















// let selectedCargadores = []; // Array para almacenar los cargadores seleccionados

// document.addEventListener('DOMContentLoaded', function() {
//     loadInitialCargadorSelect();
//     document.getElementById('btnAgregarCargador').addEventListener('click', function() {
//         addNewCargadorSelect();
//     });
// });

// function loadInitialCargadorSelect() {
//     let ajaxUrl = base_url + '/RolesEmpleados/getSelectRolesCargadores';
//     let request = new XMLHttpRequest();
//     request.open("GET", ajaxUrl, true);
//     request.send();
//     request.onreadystatechange = function() {
//         if (request.readyState == 4 && request.status == 200) {
//             let response = request.responseText;
//             createCargadorSelect(response);
//         }
//     }
// }

// function addNewCargadorSelect() {
//     let ajaxUrl = base_url + '/RolesEmpleados/getNewCargadorSelect';
//     let request = new XMLHttpRequest();
//     request.open("GET", ajaxUrl, true);
//     request.send();
//     request.onreadystatechange = function() {
//         if (request.readyState == 4 && request.status == 200) {
//             let response = request.responseText;
//             createCargadorSelect(response);
//         }
//     }
// }

// function createCargadorSelect(optionsHTML) {
//     // Crear el nuevo select con las opciones
//     let selectContainer = document.createElement('div');
//     selectContainer.className = 'form-row align-items-center mb-2';
//     selectContainer.innerHTML = `
//         <div class="col">
//             <select class="form-control selectpicker" name="selectGuia" required data-live-search="true">${optionsHTML}</select>
//         </div>
//         <div class="col-auto">
//             <button type="button" class="btn btn-danger btn-remove-select">X</button>
//         </div>
//     `;

//     document.getElementById('cargadorContainer').appendChild(selectContainer);
//     $('.selectpicker').selectpicker('render');

//     // Agregar event listener para remover el select
//     selectContainer.querySelector('.btn-remove-select').addEventListener('click', function() {
//         selectContainer.remove();
//     });

//     // Agregar el cargador seleccionado al array y deshabilitar la opción en todos los selects
//     let newSelect = selectContainer.querySelector('select');
//     newSelect.addEventListener('change', function() {
//         let selectedOption = newSelect.options[newSelect.selectedIndex].value;
//         if (selectedCargadores.includes(selectedOption)) {
//             // Si el cargador ya fue seleccionado, deseleccionarlo y mostrar un mensaje o realizar alguna acción
//             alert('Este cargador ya fue seleccionado.');
//             newSelect.value = '';
//         } else {
//             selectedCargadores.push(selectedOption);
//             disableSelectedOption(selectedOption);
//         }
//     });
// }

// function disableSelectedOption(selectedOption) {
//     let selects = document.querySelectorAll('.selectpicker');
//     selects.forEach(select => {
//         let option = select.querySelector(`option[value="${selectedOption}"]`);
//         if (option) {
//             option.disabled = true;
//         }
//     });
// }






























let selectedCargadores = []; // Array para almacenar los cargadores seleccionados

document.addEventListener('DOMContentLoaded', function() {
    loadInitialCargadorSelect();
    document.getElementById('btnAgregarCargador').addEventListener('click', function() {
        addNewCargadorSelect();
    });
    document.querySelectorAll('.btn-remove-select').forEach(btn => {
        btn.addEventListener('click', function() {
            removeCargadorSelect(btn);
        });
    });
    document.querySelectorAll('.selectpicker').forEach(select => {
        select.addEventListener('change', function() {
            updateSelectedCargadores(select);
        });
    });
});

function loadInitialCargadorSelect() {
    let ajaxUrl = base_url + '/RolesEmpleados/getSelectRolesCargadores';
    let request = new XMLHttpRequest();
    request.open("GET", ajaxUrl, true);
    request.send();
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200) {
            let response = request.responseText;
            createCargadorSelect(response);
        }
    }
}

function addNewCargadorSelect() {
    let ajaxUrl = base_url + '/RolesEmpleados/getNewCargadorSelect';
    let request = new XMLHttpRequest();
    request.open("GET", ajaxUrl, true);
    request.send();
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200) {
            let response = request.responseText;
            createCargadorSelect(response);
        }
    }
}

function createCargadorSelect(optionsHTML) {
    // Crear el nuevo select con las opciones
    let selectContainer = document.createElement('div');
    selectContainer.className = 'form-row align-items-center mb-2';
    selectContainer.innerHTML = `
        <div class="col">
            <select class="form-control selectpicker" name="selectGuia" required data-live-search="true">${optionsHTML}</select>
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-danger btn-remove-select">X</button>
        </div>
    `;

    document.getElementById('cargadorContainer').appendChild(selectContainer);
    $('.selectpicker').selectpicker('render');

    // Agregar event listener para remover el select
    let btnRemove = selectContainer.querySelector('.btn-remove-select');
    btnRemove.addEventListener('click', function() {
        removeCargadorSelect(btnRemove);
    });

    // Agregar el event listener para actualizar los cargadores seleccionados
    let newSelect = selectContainer.querySelector('select');
    newSelect.addEventListener('change', function() {
        if (newSelect != null) {
            console.log("1" + newSelect)

            updateSelectedCargadores(newSelect);
        } else {
            console.log("2" + newSelect)
        }
    });
}

function removeCargadorSelect(btnRemove) {
    let selectContainer = btnRemove.closest('.form-row');
    let removedSelect = selectContainer.querySelector('select');
    let removedOption = removedSelect.options[removedSelect.selectedIndex].value;
    // Eliminar el cargador de la lista de seleccionados
    let index = selectedCargadores.indexOf(removedOption);
    if (index !== -1) {
        selectedCargadores.splice(index, 1);
    }
    // Habilitar la opción removida en los otros selects
    let selects = document.querySelectorAll('.selectpicker');
    selects.forEach(select => {
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
        select.value = '';
        // No es necesario disparar manualmente el evento de cambio
        let event = new Event('change');
        console.log("567"+event)
        select.dispatchEvent(event);
    } else {
        selectedCargadores.push(selectedOption);
        disableSelectedOption(selectedOption);
    }
}


function disableSelectedOption(selectedOption) {
    let selects = document.querySelectorAll('.selectpicker');
    selects.forEach(select => {
        let option = select.querySelector(`option[value="${selectedOption}"]`);
        if (option) {
            option.disabled = true;
        }
    });
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
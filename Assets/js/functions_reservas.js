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

	if(document.querySelector("#formCliente")){
        let formCliente = document.querySelector("#formCliente");
        formCliente.onsubmit = function(e) {
            e.preventDefault();
            let strIdentificacion = document.querySelector('#txtIdentificacion').value;
            let strNombre = document.querySelector('#txtNombre').value;
            let strApellido = document.querySelector('#txtApellido').value;
            let strEmail = document.querySelector('#txtEmail').value;
            let intTelefono = document.querySelector('#txtTelefono').value;
            let strhotel = document.querySelector('#txtHotel').value;

            if(strIdentificacion == '' || strApellido == '' || strNombre == '' || strEmail == '' || intTelefono == '' || strhotel == '' )
            {
                swal("Atención", "Todos los campos son obligatorios." , "error");
                return false;
            }

            let elementsValid = document.getElementsByClassName("valid");
            for (let i = 0; i < elementsValid.length; i++) { 
                if(elementsValid[i].classList.contains('is-invalid')) { 
                    swal("Atención", "Por favor verifique los campos en rojo." , "error");
                    return false;
                } 
            } 
            divLoading.style.display = "flex";
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url+'/Clientes/setCliente'; 
            let formData = new FormData(formCliente);
            request.open("POST",ajaxUrl,true);
            request.send(formData);
            request.onreadystatechange = function(){
                if(request.readyState == 4 && request.status == 200){
                    console.log(request)
                    console.log(request.responseText)
                    let objData = JSON.parse(request.responseText);

                    if(objData.status)
                    {
                        if(rowTable == ""){
                            tableClientes.api().ajax.reload();
                        }else{
                           rowTable.cells[1].textContent =  strIdentificacion;
                           rowTable.cells[2].textContent =  strNombre;
                           rowTable.cells[3].textContent =  strApellido;
                           rowTable.cells[4].textContent =  strEmail;
                           rowTable.cells[5].textContent =  intTelefono;
                           rowTable = "";
                        }
                        $('#modalFormCliente').modal("hide");
                        formCliente.reset();
                        if(objData.action=="insert"){
                            swal("Guardado", objData.msg ,"success");
                        }else{
                            swal("Actualizado", objData.msg ,"success");
                        }
                    }else{
                        swal("Error", objData.msg , "error");
                    }
                }
                divLoading.style.display = "none";
                return false;
            }
        }
    }


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


function fntEditInfo(element, idpersona){
    rowTable = element.parentNode.parentNode.parentNode;
    document.querySelector('#titleModal').innerHTML ="Actualizar Cliente";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
    document.querySelector('#btnText').innerHTML ="Actualizar";
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Clientes/getCliente/'+idpersona;
    request.open("GET",ajaxUrl,true);
    request.send();
    request.onreadystatechange = function(){

        if(request.readyState == 4 && request.status == 200){
            let objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                document.querySelector("#idUsuario").value = objData.data.idpersona;
                document.querySelector("#txtIdentificacion").value = objData.data.identificacion;
                document.querySelector("#txtNombre").value = objData.data.nombres;
                document.querySelector("#txtApellido").value = objData.data.apellidos;
                document.querySelector("#txtTelefono").value = objData.data.telefono;
                document.querySelector("#txtEmail").value = objData.data.email_user;
                document.querySelector("#txtHotel").value =objData.data.hotel;
            }
        }
        $('#modalFormCliente').modal('show');
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
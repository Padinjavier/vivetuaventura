let tableClientes;
let rowTable = "";
let divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function () {

    tableClientes = $('#tableClientes').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax": {
            "url": " " + base_url + "/Reservas/getReservas",
            "dataSrc": ""
        },
        "columns": [
            { "data": "idreserva" },
            { "data": "cod_reserva" },
            { "data": "persona" },
            { "data": "fecha_pago" },
            { "data": "status" },
            { "data": "options" }
        ],
        'dom': 'lBfrtip',
        'buttons': [
            {
                "extend": "copyHtml5",
                "text": "<i class='far fa-copy'></i> Copiar",
                "titleAttr": "Copiar",
                "className": "btn btn-secondary",
                "exportOptions": {
                    "columns": [0, 1, 2, 3, 4]
                }
            }, {
                "extend": "excelHtml5",
                "text": "<i class='bi bi-file-earmark-excel'></i> Excel",
                "titleAttr": "Exportar a Excel",
                "className": "btn btn-success",
                "exportOptions": {
                    "columns": [0, 1, 2, 3, 4]
                }
            }, {
                "extend": "pdfHtml5",
                "text": "<i class='bi bi-filetype-pdf'></i> Pdf",
                "titleAttr": "Exportar a PDF",
                "className": "btn btn-danger",
                "exportOptions": {
                    "columns": [0, 1, 2, 3, 4]
                }
            }, {
                "extend": "csvHtml5",
                "text": "<i class='fas fa-file-csv'></i> CSV",
                "titleAttr": "Exportar a CSV",
                "className": "btn btn-info d-none",
                "exportOptions": {
                    "columns": [0, 1, 2, 3, 4]
                }
            }
        ],
        "resonsieve": "true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order": [[0, "desc"]]
    });


    if (document.querySelector("#formReserva")) {
        let formReserva = document.querySelector("#formReserva");
        formReserva.onsubmit = function (e) {
            e.preventDefault();
            let idReserva = document.querySelector('#idVenta').value;
            let fechaPago = document.querySelector('#fechaPago').value;
            let codreserva = document.querySelector('#txtcodigoreserva').value;
            let nombres = document.querySelector('#txtNombre').value;
            let apellidos = document.querySelector('#txtApellido').value;
            let numeroCelular = document.querySelector('#txtTelefono').value;
            let modalidadPago = document.querySelector('#txtModalidadPago').value;
            let codigoVoucher = document.querySelector('#txtCodigoVoucher').value;
            let stadopago = document.querySelector('#txtEstadoPago').value;
            let totalReserva = document.querySelector('#gran_total').value;
            // Obtener datos de los servicios reservados
            let serviciosReservados = [];
            document.querySelectorAll("tr.detalle-venta-row").forEach(row => {
                let selectServicio = row.querySelector("#listservicios");
                let cantidad = row.querySelector("input.cantidad").value;
                let precio = row.querySelector("input.precio").value;
                let sub_total = row.querySelector("input.sub_total").value;

                if (selectServicio && selectServicio.value !== '' && cantidad !== '' && precio !== '') {
                    let nombreServicio = selectServicio.options[selectServicio.selectedIndex].text;
                    let idServicio = selectServicio.value;
                    serviciosReservados.push({
                        id: idServicio,
                        servicio: nombreServicio,
                        cantidad: parseFloat(cantidad),
                        precio: parseFloat(precio),
                        sub_total: parseFloat(sub_total)
                    });
                }
            });

            console.log("id reserva" + idReserva);
            console.log("id pago" + stadopago);
            // Imprimir servicios reservados
            if (serviciosReservados.length > 0) {
                console.log("Servicios Reservados:", serviciosReservados);
            }
            // Verificar campos obligatorios
            if (idReserva === '' || stadopago === '' || serviciosReservados.length === 0 || totalReserva === '') {
                swal("Atención", "Todos los campos obligatorios deben ser llenados.", "error");
                return false;
            }
            divLoading.style.display = "flex";
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url + '/Reservas/guardarReserva';
            let formData = new FormData();
            // Agregar datos al formData
            formData.append('idReserva', idReserva);
            formData.append('fechaPago', fechaPago);
            formData.append('codreserva', codreserva);
            formData.append('nombres', nombres);
            formData.append('apellidos', apellidos);
            formData.append('numeroCelular', numeroCelular);
            formData.append('modalidadPago', modalidadPago);
            formData.append('codigoVoucher', codigoVoucher);
            formData.append('stadopago', stadopago);
            formData.append('serviciosReservados', JSON.stringify(serviciosReservados));
            console.log(serviciosReservados)
            formData.append('totalReserva', totalReserva);
            request.open("POST", ajaxUrl, true);
            request.send(formData);
            request.onreadystatechange = function () {
                if (request.readyState == 4 && request.status == 200) {
                    console.log(request);
                    console.log(request.responseText);
                    let objData = JSON.parse(request.responseText);
                    if (objData.status) {
                        console.log(objData);
                        console.log(objData.data);
                        if (rowTable == "") {
                            tableClientes.api().ajax.reload();
                        } else {
                            tableClientes.api().ajax.reload();
                        }

                        $('#modalFormCliente').modal("hide");
                        formReserva.reset();
                        if (objData.action === "insert") {
                            swal("Guardado", objData.msg, "success");
                        } else {
                            swal("Actualizado", objData.msg, "success");
                        }
                    } else {
                        swal("Error", objData.msg, "error");
                    }
                }
                divLoading.style.display = "none";
                return false;
            };
        };
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

// Generar texto con los servicios reservados
let textoServicioswsp = "Servicios reservados:\n";
objData.data.detalle_reserva.forEach(servicio => {
    let subtotal = parseFloat(servicio.precio) * parseInt(servicio.cantidad);
    textoServicioswsp += `- ${String(servicio.servicio)}: ${String(servicio.cantidad)} x S/. ${parseFloat(servicio.precio).toFixed(2)} = S/. ${subtotal.toFixed(2)}\n`;
});
let totalwsp = objData.data.reserva.total;
textoServicioswsp += `\nTOTAL: S/. ${totalwsp}`;

// Generar mensaje para WhatsApp
let telefono = objData.data.reserva.telefono;
let codReserva = objData.data.reserva.cod_reserva;
let codigoVoucher = objData.data.reserva.codigo_voucher;
let fechaReserva = fechaFormateada;
let tipoPago = objData.data.reserva.tipopago;
let mensaje = `Hola, te escribimos de parte de Vive Tu Aventura. Este es un mensaje automático para confirmar tu reserva.\n\nDetalles de la reserva:\n\nFecha de registro: ${fechaReserva}\nCódigo de reserva: ${codReserva}\nCódigo de voucher: ${codigoVoucher}\n\n${textoServicioswsp}\n\nMétodo de pago: ${tipoPago}\n\nPor favor, confírmanos si realizaste esta reserva respondiendo este mensaje. Esto nos ayudará a coordinar cualquier detalle adicional o resolver dudas sobre tu pago.\n\nGracias por elegirnos. Estamos atentos a tu respuesta.`;

// Generar enlace a WhatsApp
let whatsappLink = `<a href="https://wa.me/51${telefono}?text=${encodeURIComponent(mensaje)}" id="chatwsp" target="_blank">Enviar mensaje por WhatsApp ${telefono}</a>`;


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
            // document.querySelector("#clientelefono").innerHTML = objData.data.reserva.telefono;
            document.querySelector("#clientelefono").innerHTML = whatsappLink;
            document.querySelector("#modopago").innerHTML = objData.data.reserva.tipopago;
            document.querySelector("#cod_voucher").innerHTML = objData.data.reserva.codigo_voucher;
            document.querySelector("#stadopago").innerHTML = estadoPago;
            document.querySelector("#FechaRegistro").innerHTML = fechaFormateada;
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


function fntDelInfo(idpersona) {
    swal({
        title: "Eliminar Cliente",
        text: "¿Realmente quiere eliminar al cliente?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function (isConfirm) {

        if (isConfirm) {
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url + '/Clientes/delCliente';
            let strData = "idUsuario=" + idpersona;
            request.open("POST", ajaxUrl, true);
            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            request.send(strData);
            request.onreadystatechange = function () {
                if (request.readyState == 4 && request.status == 200) {
                    let objData = JSON.parse(request.responseText);
                    if (objData.status) {
                        swal("Eliminado", objData.msg, "success");
                        tableClientes.api().ajax.reload();
                    } else {
                        swal("Atención!", objData.msg, "error");
                    }
                }
            }
        }

    });

}

function openModal() {
    rowTable = "";
    document.querySelector('#idUsuario').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML = "Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Cliente";
    document.querySelector("#formCliente").reset();
    $('#modalFormCliente').modal('show');
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
            <td style="text-align: center;" data="#">
                <span class="row-number"></span>
            </td>
            <td data="tipodedeporte">
                <select class="form-control selectpicker servicio-select" name="selectServicio" id="listservicios" required data-live-search="true">
                    ${response[0]}
                </select>
            </td>
            <td data="cantidad">
                <input type="number" class="form-control cantidad" value="0.00" min="0">
            </td>
            <td data="precio">
                <input type="number" class="form-control precio" value="0.00" min="0">
            </td>
            <td class="" data="TOTAL">
                <input type="number" class="form-control sub_total" value="0.00" min="0" readonly>
            </td>
            <td data="botonx">
                <div class="col-auto">
                    <button type="button" class="btn btn-danger btn-remove-select btn-sm">X</button>
                </div>
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
        const selectElement = row.querySelector(".servicio-select");
        const cantidadInput = row.querySelector(".cantidad");
        const precioInput = row.querySelector(".precio");

        selectElement.addEventListener("change", function () {
            calculateRow(row);
            sumarPreciosTotales();
        });

        cantidadInput.addEventListener("input", function () {
            calculateRow(row);
            sumarPreciosTotales();
        });

        precioInput.addEventListener("input", function () {
            calculateRow(row);
            sumarPreciosTotales();
        });

        calculateRow(row); // Inicializar cálculo de fila
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

// Calcula el precio total por fila
function calculateRow(row) {
    const cantidad = parseFloat(row.querySelector(".cantidad").value) || 0;
    const precio = parseFloat(row.querySelector(".precio").value) || 0;
    const total = cantidad * precio;

    const subTotalInput = row.querySelector(".sub_total");
    if (subTotalInput) {
        subTotalInput.value = total.toFixed(2); // Asignar el total calculado a la celda correspondiente
    }
}

// Calcula los precios totales del subtotal y gran total
function sumarPreciosTotales() {
    let subtotal = 0;
    let filas = tblDetalleVenta.getElementsByClassName("detalle-venta-row");

    for (let i = 0; i < filas.length; i++) {
        let fila = filas[i];
        let precioTotalElement = fila.querySelector(".sub_total");
        let precioTotal = 0;
        if (precioTotalElement) {
            precioTotal = parseFloat(precioTotalElement.value) || 0;
        }
        subtotal += precioTotal;
    }

    // Actualizar el gran total
    document.getElementById("gran_total").innerText = subtotal.toFixed(2);
}


// fin funciones publicas 



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
    let ajaxUrl = base_url + '/Reservas/getReserva/' + idreserva;
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
                document.querySelector("#fechaPago").value = objData.data.reserva.fecha_pago;
                document.querySelector("#txtcodigoreserva").value = objData.data.reserva.cod_reserva;
                document.querySelector("#txtNombre").value = objData.data.reserva.nombres;
                document.querySelector("#txtApellido").value = objData.data.reserva.apellidos;
                document.querySelector("#txtTelefono").value = objData.data.reserva.telefono;
                document.querySelector("#txtModalidadPago").value = objData.data.reserva.tipopago;
                document.querySelector("#txtCodigoVoucher").value = objData.data.reserva.codigo_voucher;
                document.querySelector("#txtEstadoPago").value = estadoPago;
                $('#txtEstadoPago').selectpicker('refresh');
                document.querySelector("#imagenvoucher").href = objData.data.reserva.captura_voucher;

                let cantidadDatos = objData.data.detalle_reserva.length;
                // Hacer clic en el botón para agregar nuevos grupos
                for (let i = 0; i < cantidadDatos; i++) {
                    btnAgregarProducto.click();
                }
                $('#modalFormCliente').modal('show');
                // Ejecutar la asignación de datos después de un retraso
                setTimeout(function () {
                    asignarDatos(objData.data.detalle_reserva);
                }, 2000); // Esperar 0.15 segundos 1 segundo = 1000 (ajustar si es necesario)
            }
        }
    }
}


// Función para asignar los datos cuando se edita una reserva
function asignarDatos(detallereserva) {
    let cantidadDatos = detallereserva.length;
    let grupos = document.querySelectorAll(".detalle-venta-row");

    for (let i = 0; i < cantidadDatos; i++) {
        let datosLote = detallereserva[i];
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

            let subTotal = grupoActual.querySelector(".sub_total");
            if (subTotal) {
                subTotal.value = (datosLote.cantidad * datosLote.precio).toFixed(2);
            }

            // Calcular y actualizar el total por fila
            calculateRow(grupoActual);
        }
    }
    // Sumar precios totales después de asignar todos los datos
    sumarPreciosTotales();
}
// ------fin editar venta-----------
// ------fin editar venta-----------

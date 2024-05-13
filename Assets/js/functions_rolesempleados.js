var tableRolesEmpleados;
var divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function(){

	tableRolesEmpleados = $('#tableRolesEmpleados').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	"url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/RolesEmpleados/getRolesEmpleados",
            "dataSrc":""
        },
        "columns":[
            {"data":"idrolempleado"},
            {"data":"nombrerolempleado"},
            {"data":"descripcion"},
            {"data":"status"},
            {"data":"options"}
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order":[[0,"desc"]]  
    });

    //NUEVO ROL
    var formRolEmpleado = document.querySelector("#formRolEmpleado");
    formRolEmpleado.onsubmit = function(e) {
        e.preventDefault();

        var intIdRolEmpleado = document.querySelector('#idRolEmpleado').value;
        var strNombre = document.querySelector('#txtNombre').value;
        var strDescripcion = document.querySelector('#txtDescripcion').value;
        var intStatus = document.querySelector('#listStatus').value;        
        if(strNombre == '' || strDescripcion == '' || intStatus == '')
        {
            swal("Atención", "Todos los campos son obligatorios." , "error");
            return false;
        }
        divLoading.style.display = "flex";
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        var ajaxUrl = base_url+'/RolesEmpleados/setRolEmpleados'; 
        var formData = new FormData(formRolEmpleado);
        request.open("POST",ajaxUrl,true);
        request.send(formData);
        request.onreadystatechange = function(){
           if(request.readyState == 4 && request.status == 200){
    
                var objData = JSON.parse(request.responseText);
                if(objData.status)
                {
                    $('#modalFormRolEmpleado').modal("hide");
                    formRolEmpleado.reset();
                    swal("Roles de usuario", objData.msg ,"success");
                    tableRolesEmpleados.api().ajax.reload();
                }else{
                    swal("Error", objData.msg , "error");
                }              
            } 
            divLoading.style.display = "none";
            return false;
        }

        
    }

});

$('#tableRolesEmpleados').DataTable();

function openModal(){

    document.querySelector('#idRolEmpleado').value ="";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Rol";
    document.querySelector("#formRolEmpleado").reset();
	$('#modalFormRolEmpleado').modal('show');
    clocemenu();
}

window.addEventListener('load', function() {
    /*fntEditRol();
    fntDelRol();
    fntPermisos();*/
}, false);

function fntEditRol(idRolEmpleado){
    document.querySelector('#titleModal').innerHTML ="Actualizar Rol";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
    document.querySelector('#btnText').innerHTML ="Actualizar";

    var idRolEmpleado = idRolEmpleado;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl  = base_url+'/RolesEmpleados/getRolEmpleado/'+idRolEmpleado;
    request.open("GET",ajaxUrl ,true);
    request.send();

    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                document.querySelector("#idRolEmpleado").value = objData.data.idrolempleado;
                document.querySelector("#txtNombre").value = objData.data.nombrerolempleado;
                document.querySelector("#txtDescripcion").value = objData.data.descripcion;

                if(objData.data.status == 1)
                {
                    var optionSelect = '<option value="1" selected class="notBlock">Activo</option>';
                }else{
                    var optionSelect = '<option value="2" selected class="notBlock">Inactivo</option>';
                }
                var htmlSelect = `${optionSelect}
                                  <option value="1">Activo</option>
                                  <option value="2">Inactivo</option>
                                `;
                document.querySelector("#listStatus").innerHTML = htmlSelect;
                $('#modalFormRolEmpleado').modal('show');
            }else{
                swal("Error", objData.msg , "error");
            }
        }
    }

}

function fntDelRol(idRolEmpleado){
    var idRolEmpleado = idRolEmpleado;
    swal({
        title: "Eliminar Rol",
        text: "¿Realmente quiere eliminar el Rol?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function(isConfirm) {
        
        if (isConfirm) 
        {
            var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            var ajaxUrl = base_url+'/RolesEmpleados/delRolEmpleado/';
            var strData = "idrolempleado="+idRolEmpleado;
            request.open("POST",ajaxUrl,true);
            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            request.send(strData);
            request.onreadystatechange = function(){
                if(request.readyState == 4 && request.status == 200){
                    var objData = JSON.parse(request.responseText);
                    if(objData.status)
                    {
                        swal("Eliminar!", objData.msg , "success");
                        tableRolesEmpleados.api().ajax.reload();
                        // tableRolesEmpleados.api().ajax.reload(function(){
                        //     fntEditRol();
                        //     fntDelRol();
                        //     fntPermisos();
                        // });
                    }else{
                        swal("Atención!", objData.msg , "error");
                    }
                }
            }
        }

    });
}

// function fntPermisos(idRolEmpleado){
//     var idRolEmpleado = idRolEmpleado;
//     var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
//     var ajaxUrl = base_url+'/Permisos/getPermisosRol/'+idRolEmpleado;
//     request.open("GET",ajaxUrl,true);
//     request.send();

//     request.onreadystatechange = function(){
//         if(request.readyState == 4 && request.status == 200){
//             document.querySelector('#contentAjax').innerHTML = request.responseText;
//             $('.modalPermisos').modal('show');
//             // document.querySelector('#formPermisos').addEventListener('submit',fntSavePermisos,false);
//         }
//     }
// }

// function fntSavePermisos(evnet){
//     evnet.preventDefault();
//     var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
//     var ajaxUrl = base_url+'/Permisos/setPermisos'; 
//     var formElement = document.querySelector("#formPermisos");
//     var formData = new FormData(formElement);
//     request.open("POST",ajaxUrl,true);
//     request.send(formData);

//     request.onreadystatechange = function(){
//         if(request.readyState == 4 && request.status == 200){
//             var objData = JSON.parse(request.responseText);
//             if(objData.status)
//             {
//                 swal("Permisos de usuario", objData.msg ,"success");
//             }else{
//                 swal("Error", objData.msg , "error");
//             }
//         }
//     }
    
// }
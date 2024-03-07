let listOpciones;
let rowTable = ""; 
let divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function(){
    listOpciones = $('#listOpciones').dataTable( {
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Opciones/getOpciones",
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
            {"data":"personaid"},
            {"data":"idioma"},
            {"data":"tema"},
            {"data":"formato_moneda"}
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order":[[0,"desc"]]  
    });














    if(document.querySelector("#formDataOpciones")){
    console.log("2222")

        let formDataOpciones = document.querySelector("#formDataOpciones");
        formDataOpciones.onsubmit = function(e) {
            e.preventDefault();
            let selectIdioma = document.querySelector('#selectIdioma').value;
            let selectTema = document.querySelector('#selectTema').value;
            let selectMoneda = document.querySelector('#selectMoneda').value;
           
            divLoading.style.display = "flex";
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url+'/Opciones/putOpciones'; // Ruta del controlador y método para procesar los datos
            let formData = new FormData(formDataOpciones);
            // Agrega los valores de los selectores al FormData
            formData.append('idioma', selectIdioma);
            formData.append('tema', selectTema);
            formData.append('moneda', selectMoneda);

            request.open("POST", ajaxUrl, true);
            request.send(formData);
            request.onreadystatechange = function(){
                if(request.readyState != 4 ) return; 
                if(request.status == 200){
                    let objData = JSON.parse(request.responseText);
                    if(objData.status)
                    {
                        // Aquí puedes realizar acciones adicionales si la respuesta es exitosa
                        swal("Éxito", objData.msg , "success");
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

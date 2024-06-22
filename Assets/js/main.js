(function () {
  "use strict";

  var treeviewMenu = $(".app-menu");

  // Toggle Sidebar
  $('[data-toggle="sidebar"]').click(function (event) {
    event.preventDefault();
    $(".app").toggleClass("sidenav-toggled");
  });

  // Activate sidebar treeview toggle
  $("[data-toggle='treeview']").click(function (event) {
    event.preventDefault();
    if (!$(this).parent().hasClass("is-expanded")) {
      treeviewMenu
        .find("[data-toggle='treeview']")
        .parent()
        .removeClass("is-expanded");
    }
    $(this).parent().toggleClass("is-expanded");
  });

  // Set initial active toggle
  $("[data-toggle='treeview.'].is-expanded")
    .parent()
    .toggleClass("is-expanded");

  //Activate bootstrip tooltips
  $("[data-toggle='tooltip']").tooltip();
})();

//desactivar el menu cuando se dea click a nuevo
function clocemenu() {
  $(".app").addClass("sidenav-toggled");
}
// Expresión regular para verificar si la URL termina con "/agencia/pedidos/orden" seguido opcionalmente por un número
var regex = /\/agencia\/pedidos\/orden\/\d*$/;

// Verificar si la URL actual coincide con el patrón de la expresión regular
if (regex.test(window.location.href)) {
  // Ejecutar console.log("gol")
  console.log("gol");
} else {
  const elements = document.querySelectorAll(".app-content, .app-nav");

  elements.forEach((element) => {
    element.addEventListener("click", function () {
      clocemenu();
    });
  });
}


document.addEventListener('DOMContentLoaded', function () {
  // Obtener la URL actual
  var currentUrl = window.location.href;

  // Verificar si la URL contiene /empleados o /rolesempleados
  if (currentUrl.includes('/empleados') || currentUrl.includes('/rolesempleados')) {
      // Seleccionar el <li> con el id menu-empleados
      var menuItem = document.getElementById('menu-empleados');
      if (menuItem) {
          // Agregar la clase 'active'
          menuItem.classList.add('active');
      }
  }

  if (currentUrl.includes('/clientes')) {
      var menuItem = document.getElementById('menu-clientes');
      if (menuItem) {
          menuItem.classList.add('active');
      }
  }
  
  if (currentUrl.includes('/usuarios') || currentUrl.includes('/rolesusuarios')) {
      var menuItem = document.getElementById('menu-usuario');
      if (menuItem) {
          menuItem.classList.add('active');
      }
  }
  if (currentUrl.includes('/pedidos') || currentUrl.includes('/productos')|| currentUrl.includes('/servicios')) {
      // Seleccionar el <li> con el id menu-empleados
      var menuItem = document.getElementById('menu-puntoventa');
      if (menuItem) {
          // Agregar la clase 'active'
          menuItem.classList.add('active');
      }
  }
});




function validarEntrada(input) {
  // Eliminar caracteres no permitidos (dejar solo números y letras)
  input.value = input.value.replace(/[^a-zA-Z0-9]/g, '').substring(0, 9);

  // Verificar si se supera el límite de 8 caracteres
  if (input.value.length > 9) {
    input.value = input.value.substring(0, 9);
  }
}








































function validarIdentificacion() {
  const inputIdentificacion = document.getElementById('txtIdentificacion');
  const valor = inputIdentificacion.value.trim();

  // Limpiar consola
  console.clear();

  // No hacer nada si el valor está vacío
  if (valor.length === 0) {
    return;
  }

  // Verificar el primer carácter
  const primerCaracter = valor.charAt(0);

  // Permitir solo letras o números en el primer carácter
  if (!/^[A-Za-z0-9]$/.test(primerCaracter)) {
    inputIdentificacion.value = valor.slice(0, -1);
    console.error('El primer carácter debe ser una letra o un número.');
    return;
  }

  // Verificar los caracteres restantes
  const numeros = valor.slice(1);

  // Permitir solo números en los caracteres restantes
  if (!/^\d{0,7}$/.test(numeros)) {
    inputIdentificacion.value = primerCaracter + numeros.replace(/\D/g, '');
    console.error('Los siguientes 7 caracteres deben ser números.');
  }
}



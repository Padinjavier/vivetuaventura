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

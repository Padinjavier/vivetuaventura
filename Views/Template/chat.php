<!-- Icono de mensaje hhhhhhhhhhhhhhhhhhhhhhhhhhhh -->

<!-- Icono de mensaje -->
<div id="chat-icon" class="d-flex justify-content-center align-items-center">
  <i class="fas fa-comment fa-2x"></i>
</div>


<!-- panel chat chat -->
<section id="chat" class="" style="">
  <div class="container py-5">
    <div class="row d-flex justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card" id="chat1" style="border-radius: 15px;">
          <div
            class="bg-primary card-header d-flex justify-content-between align-items-center p-3 text-white border-bottom-0"
            style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
            <i class="fas fa-angle-left"></i>
            <p class="mb-0 fw-bold">Live chat</p>
            <i class="fas fa-times"></i>
          </div>
          <div class="card-body">

            <div class="d-flex flex-row justify-content-start mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="avatar 1"
                style="width: 45px; height: 100%;">
              <div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                <p class="small mb-0">Hello and thank you for visiting MDBootstrap. Please click the
                  video
                  below.</p>
              </div>
            </div>

            <div class="d-flex flex-row justify-content-end mb-4">
              <div class="p-3 me-3 border" style="border-radius: 15px; background-color: #fbfbfb;">
                <p class="small mb-0">Thank you, I really like your product.</p>
              </div>
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp" alt="avatar 1"
                style="width: 45px; height: 100%;">
            </div>

            <div class="d-flex flex-row justify-content-start mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="avatar 1"
                style="width: 45px; height: 100%;">
              <div class="ms-3" style="border-radius: 15px;">
                <div class="bg-image">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/screenshot1.webp"
                    style="border-radius: 15px;" alt="video">
                  <a href="#!">
                    <div class="mask"></div>
                  </a>
                </div>
              </div>
            </div>

            <div class="d-flex flex-row justify-content-start mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="avatar 1"
                style="width: 45px; height: 100%;">
              <div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                <p class="small mb-0">...</p>
              </div>
            </div>

            <div class="form-outline">
              <textarea class="form-control" id="textAreaExample" rows="4"></textarea>
              <label class="form-label" for="textAreaExample">Type your message</label>
            </div>

          </div>
        </div>

      </div>
    </div>

  </div>
</section>









<section id="chat-panel" class="" style=" display: none; width: 100%; max-width:600px;">
  <div class="container py-3">

    <div class="row">
      <div class="col-md-12">

        <div class="card" id="chat3" style="border-radius: 15px;">
          <div class="card-body">

            <div class="row">
              <div class="w-100">


                <div class="input-group rounded mb-3">
                  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                    aria-describedby="search-addon" />
                  <span class="input-group-text border-0" id="search-addon">
                    <i class="fas fa-search"></i>
                  </span>
                </div>

                <div data-mdb-perfect-scrollbar="true" style="position: relative; height: 400px">
                  <ul class="list-unstyled mb-0" style="max-height: -webkit-fill-available; overflow-y: auto;">
                    <?php
                    for ($i = 0; $i < 100; $i++) {
                      ?>
                      <li class="p-2 border-bottom">
                        <a href="#!" class="d-flex justify-content-between">
                          <div class="d-flex flex-row">
                            <div>
                              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                alt="avatar" class="d-flex align-self-center me-3" width="60">
                              <span class="badge bg-success badge-dot"></span>
                            </div>
                            <div class="pt-1">
                              <p class="fw-bold mb-0">Marie Horwitz</p>
                              <p class="small text-muted">Hello, Are you there?</p>
                            </div>
                          </div>
                          <div class="pt-1">
                            <p class="small text-muted mb-1">Just now</p>
                            <span class="badge bg-danger rounded-pill float-end">3</span>
                          </div>
                        </a>
                      </li>
                      <?php
                    }
                    ?>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
















<style>
  /* Estilo del icono de mensaje */
  #chat-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #007bff;
    color: #fff;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    text-align: center;
    cursor: pointer;
    z-index: 101;
  }

  /*chat */
  #chat-panel {
    display: none;
    position: fixed;
    bottom: 0;
    /* left: 0; */
    right: 0;
    background-color: #fff;
    border: 1px solid #ddd;
    overflow-y: scroll;
    /* width: 100%; */
    max-height: calc(100vh - 50px);
    z-index: 100;
    /* Altura máxima */
  }
</style>

<script>
  // Función para mostrar/ocultar el panel de chat y bloquear/desbloquear el scroll
  function toggleChatPanel() {
    var chatPanel = document.getElementById('chat-panel');
    if (chatPanel.style.display === 'none') {
      chatPanel.style.display = 'block';
      // Bloquear scroll
      document.body.style.overflow = 'hidden';
    } else {
      chatPanel.style.display = 'none';
      // Desbloquear scroll
      document.body.style.overflow = '';
    }
  }

  // Llama a la función cuando se hace clic en el icono de mensaje
  document.getElementById('chat-icon').addEventListener('click', toggleChatPanel);

  // Cierra el panel de chat al hacer clic en el icono de "x"
  document.querySelector('#chat-panel .fas.fa-times').addEventListener('click', function () {
    toggleChatPanel();
  });

  // Bloquear scroll en el panel de chat abierto
  document.getElementById('chat-panel').addEventListener('touchmove', function (e) {
    if (document.getElementById('chat-panel').style.display === 'block') {
      e.preventDefault();
    }
  });
  document.getElementById('chat-panel').addEventListener('wheel', function (e) {
    if (document.getElementById('chat-panel').style.display === 'block') {
      e.preventDefault();
    }
  });
</script>
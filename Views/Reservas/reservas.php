<?php 
    headerAdmin($data); 
    getModal('modalReservas',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <div>
            <h1><?= $data['page_title'] ?>
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="app-menu__icon bi bi-house-door-fill"></i></li>
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/reservas" class="text-info"><?= $data['page_title'] ?></a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered w-100" id="tableClientes">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Código de reserva</th>
                          <th>Nombres y apellidos</th>
                          <th>Fecha</th>
                          <th>Estado de pago</th>
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    
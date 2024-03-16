<?php
headerAdmin($data);
// Configurar la zona horaria
date_default_timezone_set('America/Lima');
// Obtener el nombre del día de la semana en español
$dias = DiasSemana();
$nombre_dia = $dias[date('w')];
// Obtener el día del mes
$dia_mes = date('d');
// Obtener el mes en español utilizando la función Meses()
$meses = Meses();
$mes = $meses[date('n') - 1]; // Restamos 1 porque los meses en PHP son indexados desde 0
// Obtener el año
$anio = date('Y');
// Formatear la fecha en el formato deseado
$fecha_formateada = "$nombre_dia, $dia_mes $mes $anio";
?>
<main class="app-content bg-white">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="mb-3">
          <p class="text-right">
            <?= $fecha_formateada ?>
          </p>
        </div>
      </div>
      <div class="col-12">
        <div class="mb-3">
          <p class="font-weight-bold">Bienvenida, <span class="text-primary">
              <?= $_SESSION['userData']['nombres']; ?>
            </span></p>
        </div>
      </div>
      <div class="col-12">
        <div class="mb-3 mr-4">
          <p>Que tengas un bonito día de trabajo, recuerda realizar los registros correctamente y estar al pendiente de
            la bandeja de entrada de solicitudes de reembolso.</p>
        </div>
      </div>
      <div class="col-12 mb-4 mt-4">
        <div class="card shadow">
          <div class="card-body">
            <i class="fas fa-bell mr-2"></i>
            Bandeja de entrada
          </div>
        </div>
      </div>
      <div class="col-12  mb-4">
        <div class="mb-3">
          <p class="font-weight-bold">Mis servicios</p>
        </div>
      </div>
    </div>
  </div>
  <div class="row isotope-grid justify-content-center">
    <?php if (!empty ($_SESSION['permisos'][2]['r'])) { ?>
      <div class="col-md-6 col-lg-3" style="width: fit-content;">
        <a href="<?= base_url() ?>/usuarios" class="linkw">
          <div class="widget-small primary coloured-icon" style="display: flex;
    flex-direction: column;
    align-items: center;
    width: fit-content;"><i class="icon fa fa-users fa-3x"></i>
            <div class="info text-center p-0">
              <h4>Usuarios</h4>
              <p><b>
                  <?= $data['usuarios'] ?>
                </b></p>
            </div>
          </div>
        </a>
      </div>
    <?php } ?>
    <?php if (!empty ($_SESSION['permisos'][3]['r'])) { ?>
      <div class="col-md-6 col-lg-3 " style="width: fit-content;">
        <a href="<?= base_url() ?>/clientes" class="linkw">
          <div class="widget-small info coloured-icon" style="display: flex;
    flex-direction: column;
    align-items: center;
    width: fit-content;"><i class="icon fa fa-user fa-3x"></i>
            <div class="info text-center p-0">
              <h4>Clientes</h4>
              <p><b>
                  <?= $data['clientes'] ?>
                </b></p>
            </div>
          </div>
        </a>
      </div>
    <?php } ?>
    <?php if (!empty ($_SESSION['permisos'][4]['r'])) { ?>
      <div class="col-md-6 col-lg-3" style="width: fit-content;">
        <a href="<?= base_url() ?>/productos" class="linkw">
          <div class="widget-small warning coloured-icon" style="display: flex;
    flex-direction: column;
    align-items: center;
    width: fit-content;"><i class="icon fa fa fa-archive fa-3x"></i>
            <div class="info text-center p-0">
              <h4>Productos</h4>
              <p><b>
                  <?= $data['productos'] ?>
                </b></p>
            </div>
          </div>
        </a>
      </div>
    <?php } ?>
    <?php if (!empty ($_SESSION['permisos'][5]['r'])) { ?>
      <div class="col-md-6 col-lg-3" style="width: fit-content;">
        <a href="<?= base_url() ?>/pedidos" class="linkw">
          <div class="widget-small danger coloured-icon" style="display: flex;
    flex-direction: column;
    align-items: center;
    width: fit-content;"><i class="icon fa fa-shopping-cart fa-3x"></i>
            <div class="info text-center p-0">
              <h4>Pedidos</h4>
              <p><b>
                  <?= $data['pedidos'] ?>
                </b></p>
            </div>
          </div>
        </a>
      </div>
    <?php } ?>
  </div>
  <div class="row">
    <?php if (!empty ($_SESSION['permisos'][5]['r'])) { ?>
      <div class="col-md-6">
        <div class="tile">
          <h3 class="tile-title">Últimos Pedidos</h3>
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th>#</th>
                <th>Cliente</th>
                <th>Estado</th>
                <th class="text-right">Monto</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php
              if (count($data['lastOrders']) > 0) {
                foreach ($data['lastOrders'] as $pedido) {
                  ?>
                  <tr>
                    <td>
                      <?= $pedido['idpedido'] ?>
                    </td>
                    <td>
                      <?= $pedido['nombre'] ?>
                    </td>
                    <td>
                      <?= $pedido['status'] ?>
                    </td>
                    <td class="text-right">
                      <?= SMONEY . " " . formatMoney($pedido['monto']) ?>
                    </td>
                    <td><a href="<?= base_url() ?>/pedidos/orden/<?= $pedido['idpedido'] ?>" target="_blank"><i
                          class="fa fa-eye" aria-hidden="true"></i></a></td>
                  </tr>
                <?php }
              } ?>
            </tbody>
          </table>
        </div>
      </div>
    <?php } ?>
    <div class="col-md-6">
      <div class="tile">
        <div class="container-title">
          <h3 class="tile-title">Tipo de pagos por mes</h3>
          <div class="dflex">
            <input class="date-picker pagoMes" name="pagoMes" placeholder="Mes y Año">
            <button type="button" class="btnTipoVentaMes btn btn-info btn-sm" onclick="fntSearchPagos()"> <i
                class="fas fa-search"></i> </button>
          </div>
        </div>
        <div id="pagosMesAnio"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="container-title">
          <h3 class="tile-title">Ventas por mes</h3>
          <div class="dflex">
            <input class="date-picker ventasMes" name="ventasMes" placeholder="Mes y Año">
            <button type="button" class="btnVentasMes btn btn-info btn-sm" onclick="fntSearchVMes()"> <i
                class="fas fa-search"></i> </button>
          </div>
        </div>
        <div id="graficaMes"></div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="tile">
        <div class="container-title">
          <h3 class="tile-title">Ventas por año</h3>
          <div class="dflex">
            <input class="ventasAnio" name="ventasAnio" placeholder="Año" minlength="4" maxlength="4"
              onkeypress="return controlTag(event);">
            <button type="button" class="btnVentasAnio btn btn-info btn-sm" onclick="fntSearchVAnio()"> <i
                class="fas fa-search"></i> </button>
          </div>
        </div>
        <div id="graficaAnio"></div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>
<script>
  Highcharts.chart('pagosMesAnio', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: 'Ventas por tipo pago, <?= $data['pagosMes']['mes'] . ' ' . $data['pagosMes']['anio'] ?>'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
      point: {
        valueSuffix: '%'
      }
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        }
      }
    },
    series: [{
      name: 'Brands',
      colorByPoint: true,
      data: [
        <?php
        foreach ($data['pagosMes']['tipospago'] as $pagos) {
          echo "{name:'" . $pagos['tipopago'] . "',y:" . $pagos['total'] . "},";
        }
        ?>
      ]
    }]
  });
  Highcharts.chart('graficaMes', {
    chart: {
      type: 'line'
    },
    title: {
      text: 'Ventas de <?= $data['ventasMDia']['mes'] . ' del ' . $data['ventasMDia']['anio'] ?>'
    },
    subtitle: {
      text: 'Total Ventas <?= SMONEY . '. ' . formatMoney($data['ventasMDia']['total']) ?> '
    },
    xAxis: {
      categories: [
        <?php
        foreach ($data['ventasMDia']['ventas'] as $dia) {
          echo $dia['dia'] . ",";
        }
        ?>
      ]
    },
    yAxis: {
      title: {
        text: ''
      }
    },
    plotOptions: {
      line: {
        dataLabels: {
          enabled: true
        },
        enableMouseTracking: false
      }
    },
    series: [{
      name: 'Dato',
      data: [
        <?php
        foreach ($data['ventasMDia']['ventas'] as $dia) {
          echo $dia['total'] . ",";
        }
        ?>
      ]
    }]
  });
  Highcharts.chart('graficaAnio', {
    chart: {
      type: 'column'
    },
    title: {
      text: 'Ventas del año <?= $data['ventasAnio']['anio'] ?> '
    },
    subtitle: {
      text: 'Esdística de ventas por mes'
    },
    xAxis: {
      type: 'category',
      labels: {
        rotation: -45,
        style: {
          fontSize: '13px',
          fontFamily: 'Verdana, sans-serif'
        }
      }
    },
    yAxis: {
      min: 0,
      title: {
        text: ''
      }
    },
    legend: {
      enabled: false
    },
    tooltip: {
      pointFormat: 'Population in 2017: <b>{point.y:.1f} millions</b>'
    },
    series: [{
      name: 'Population',
      data: [
        <?php
        foreach ($data['ventasAnio']['meses'] as $mes) {
          echo "['" . $mes['mes'] . "'," . $mes['venta'] . "],";
        }
        ?>
      ],
      dataLabels: {
        enabled: true,
        rotation: -90,
        color: '#FFFFFF',
        align: 'right',
        format: '{point.y:.1f}', // one decimal
        y: 10, // 10 pixels down from the top
        style: {
          fontSize: '13px',
          fontFamily: 'Verdana, sans-serif'
        }
      }
    }]
  });

</script>
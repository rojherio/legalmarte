<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();

$id = (! isset($_POST['id']) && isset($_GET['id']) ? $_GET['id'] : (isset($_POST['id']) ? $_POST['id'] : 0));
$param = Url::getURL(3);
$param = $param == '' && $id != '' ? $id : $param;

if ($param != 0){
  $_SESSION['acc_fornecedor_id'] = $param;
}

$stmt = $db->prepare("SELECT id, nome_fantasia
                        FROM acc_fornecedor
                        WHERE id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$objFornecedor = $stmt->fetch(PDO::FETCH_ASSOC);

?>
<style>
#map {
	width: 100%;
	height: 333px;
	border: none;
}
</style>
<!-- BEGIN CONTAINER -->
<div class="page-container row">
  <!-- BEGIN SIDEBAR -->
    <?php
    require_once ('acrecompras/template/sidebar.php');
    ?>
    <!-- END SIDEBAR -->
  <!-- BEGIN PAGE CONTAINER-->
  <div class="page-content">
    <div id="portlet-config" class="modal hide">
      <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"></button>
        <h3>Widget Settings</h3>
      </div>
      <div class="modal-body">Widget settings form goes here</div>
    </div>
    <div class="clearfix"></div>
    <div class="content">
      <ul class="breadcrumb">
        <li>
          <a href="#">FORNECEDOR</a>
        </li>
        <li class="active">PERFIL</li>
      </ul>
      <div class="row">
        <div class="col-md-12">
          <ul id="tab-01" class="nav nav-tabs">
            <li class="active">
              <a href="#dadosContato">DADOS CONTATO</a>
            </li>
                        <?php
                        if (is_numeric($_SESSION['acc_fornecedor_id']) && $_SESSION['acc_fornecedor_id'] > 0) {
                          ?>
                            <li>
              <a href="#dadosPublicidade">DADOS PUBLICIDADE</a>
            </li>
            <li>
              <a href="#dadosBancarios">DADOS BANCÁRIOS</a>
            </li>
            <li>
              <a href="#parametrosDesconto">PARÂMETROS DESCONTO</a>
            </li>
            <li>
              <a href="#parametrosAtivacao">ATIVAÇÃO</a>
            </li>
                            <?php
                        }
                        ?>
                    </ul>
          <div class="tools">
            <a class="collapse" href="javascript:;"></a>
            <a class="config" data-toggle="modal" href="#grid-config"></a>
            <a class="reload" href="javascript:;"></a>
            <a class="remove" href="javascript:;"></a>
          </div>
          <div class="tab-content">
            <div id="dadosContato" class="tab-pane active">
              <div class="row column-seperation">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/fornecedor/perfil_frm_contato.php'); ?>
                                </div>
              </div>
            </div>
            <div id="dadosPublicidade" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/fornecedor/perfil_frm_publicidade.php'); ?>
                                </div>
              </div>
            </div>
            <div id="dadosBancarios" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/fornecedor/perfil_frm_bancario.php'); ?>
                                </div>
              </div>
            </div>
            <div id="parametrosDesconto" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/fornecedor/perfil_frm_parametro_desconto.php'); ?>
                                </div>
              </div>
            </div>
            <div id="parametrosAtivacao" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/fornecedor/perfil_frm_ativacao.php'); ?>
                                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- END CHAT -->
    <?php
    require_once ('acrecompras/template/chat.php');
    ?>
    <!-- END CHAT -->
</div>
<!-- END CONTAINER -->
<?php
require_once ('acrecompras/template/footer.php');
?>
<!-- BEGIN CUSTON JS-->
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil_contato.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil_publicidade.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil_bancario.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil_parametro_desconto.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/perfil_ativacao.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
<!--<script src="<?//= ConstantesAcreCompras::$PLUGINS_FOLDER ?>GoogleMaps/js/infobox.js"></script>-->
<!--<script src="<?//= ConstantesAcreCompras::$PLUGINS_FOLDER ?>GoogleMaps/js/markerclusterer.js"></script>-->
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/google_maps.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGH8guJUpbwSzVnqTQxGUTclDamTX5QVc&sensor=false&signed_in=true&callback=initMap"></script>

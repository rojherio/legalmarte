<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
?>
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
        <li class="active">ATIVAÇÃO</li>
      </ul>
      <div class="row">
        <div class="col-md-12">
          <ul id="tab-01" class="nav nav-tabs">
            <li class="active">
              <a href="#novos">NOVOS</a>
            </li>
            <li>
              <a href="#analises">ANÁLISES</a>
            </li>
            <li>
              <a href="#pendentes">PENDENTES</a>
            </li>
            <li>
              <a href="#inativos">INATIVOS</a>
            </li>
            <li>
              <a href="#ativos">ATIVOS</a>
            </li>
            <li>
              <a href="#bloqueados">BLOQUEADOS</a>
            </li>
            <li>
              <a href="#todos">TODOS</a>
            </li>
          </ul>
          <div class="tools">
            <a class="collapse" href="javascript:;"></a>
            <a class="config" data-toggle="modal" href="#grid-config"></a>
            <a class="reload" href="javascript:;"></a>
            <a class="remove" href="javascript:;"></a>
          </div>
          <div class="tab-content">
            <div id="novos" class="tab-pane active">
              <div class="row column-seperation">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_novos.php'); ?>
                </div>
              </div>
            </div>
            <div id="analises" class="tab-pane">
              <div class="row column-seperation">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_analises.php'); ?>
                </div>
              </div>
            </div>
            <div id="pendentes" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_pendentes.php'); ?>
                </div>
              </div>
            </div>
            <div id="inativos" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_inativos.php'); ?>
                </div>
              </div>
            </div>
            <div id="ativos" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_ativos.php'); ?>
                </div>
              </div>
            </div>
            <div id="bloqueados" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_bloqueados.php'); ?>
                </div>
              </div>
            </div>
            <div id="todos" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                  <?php include('acrecompras/view/adm_fornecedor/ativacao_frm_todos.php'); ?>
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
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_analises.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_pendentes.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_inativos.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_ativos.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_bloqueados.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/ativacao_todos.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
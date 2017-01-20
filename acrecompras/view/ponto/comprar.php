<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
$retorno_sucesso = isset($_POST['retorno_sucesso']) ? 1 : 0;
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
          <a href="#">PONTOS</a>
        </li>
        <li class="active">COMPRAR</li>
      </ul>
      <h3>Resumo de Compras</h3>
      <div class="grid simple">
        <div class="grid-body compras">
          <div id="rootwizard" class="col-md-12">
            <div class="form-wizard-steps">
              <ul class="wizard-steps form-wizard">
                <li class="" data-target="#step1">
                  <a href="#tab1" data-toggle="tab">
                    <span class="step">1</span>
                    <span class="title">Seus Dados</span>
                  </a>
                </li>
                <li data-target="#step2" class="">
                  <a href="#tab2" data-toggle="tab">
                    <span class="step">2</span>
                    <span class="title">Pagamento</span>
                  </a>
                </li>
                <li data-target="#step3" class="">
                  <a href="#tab3" data-toggle="tab">
                    <span class="step">3</span>
                    <span class="title">Confirmar Pedido</span>
                  </a>
                </li>
              </ul>
              <div class="clearfix"></div>
            </div>
            <div class="tab-content transparent">
              <div class="tab-pane" id="tab1">
                  <?php include_once ('acrecompras/view/ponto/comprar_frm_dados.php') ;?>
                </div>
              <div class="tab-pane" id="tab2">
                  <?php include_once ('acrecompras/view/ponto/comprar_frm_pagamento.php') ;?>
                </div>
              <div class="tab-pane" id="tab3">
                  <?php include_once ('acrecompras/view/ponto/comprar_frm_resumo.php') ;?>
                </div>
              <ul class=" wizard wizard-actions">
                <!--                   <li class="previous first" style="display: none;"> -->
                <!--                     <a href="javascript:;" class="btn">&nbsp;&nbsp;Primeira&nbsp;&nbsp;</a> -->
                <!--                   </li> -->
                <li class="previous">
                  <a href="javascript:;" class="btn">&nbsp;&nbsp;Anterior&nbsp;&nbsp;</a>
                </li>
                <!--                   <li class="next last" style="display: none;"> -->
                <!--                     <a href="javascript:;" class="btn btn-primary">&nbsp;&nbsp;Última&nbsp;&nbsp;</a> -->
                <!--                   </li> -->
                <li class="next">
                  <a href="javascript:;" class="btn btn-primary">&nbsp;&nbsp;Próximo&nbsp;&nbsp;</a>
                </li>
              </ul>
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
<script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>boostrap-form-wizard/js/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>boostrap-form-wizard/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/ponto/comprar.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
$retorno_sucesso = isset($_POST['retorno_sucesso']) ? 1 : 0;
?>
<style>
.kv-avatar .file-preview-frame, .kv-avatar .file-preview-frame:hover {
	margin: 0;
	padding: 0;
	border: none;
	box-shadow: none;
	text-align: center;
}

.kv-avatar .file-input {
	display: table-cell;
	max-width: 220px;
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
          <a href="#">DASHBOARD</a>
        </li>
        <li class="active">PERFIL</li>
      </ul>
      <input type="hidden" id="retorno_sucesso" name="retorno_sucesso" value="<?= $retorno_sucesso; ?>" />
      <div id="msg_sucesso" class="alert alert-success" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <b>Sucesso:</b>&nbsp;<?= $_POST['retorno_sucesso'];?>
      </div>
      <div id="msg_erro" class="alert alert-error" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <b>Atenção:</b>
        &nbsp;Erro ao tentar atualizar os dados pessoais.
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul id="tab-01" class="nav nav-tabs">
            <li class="active">
              <a href="#dadosPessoais">DADOS PESSOAIS</a>
            </li>
            <li>
              <a href="#dadosContato">DADOS CONTATO</a>
            </li>
            <li>
              <a href="#dadosBancarios">DADOS BANCÁRIOS</a>
            </li>
            <li>
              <a href="#alterarSenha">ALTERAR SENHA</a>
            </li>
            <!--<li class="dropdown">
                              <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                                  Dropdown
                                  <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                  <li>
                                      <a href="#">New Project</a>
                                  </li>
                                  <li>
                                      <a href="#">Edit Details</a>
                                  </li>
                                  <li>
                                      <a href="#">View More</a>
                                  </li>
                                  <li class="divider"></li>
                                  <li>
                                      <a class="text-error" href="#">Delete Project</a>
                                  </li>
                              </ul>
                          </li>-->
          </ul>
          <div class="tools">
            <a class="collapse" href="javascript:;"></a>
            <a class="config" data-toggle="modal" href="#grid-config"></a>
            <a class="reload" href="javascript:;"></a>
            <a class="remove" href="javascript:;"></a>
          </div>
          <div class="tab-content">
            <div id="dadosPessoais" class="tab-pane active">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/usuario/perfil_frm_pessoais.php'); ?>
                                </div>
              </div>
            </div>
            <div id="dadosContato" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/usuario/perfil_frm_contato.php'); ?>
                                </div>
              </div>
            </div>
            <div id="dadosBancarios" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/usuario/perfil_frm_bancario.php'); ?>
                                </div>
              </div>
            </div>
            <div id="alterarSenha" class="tab-pane">
              <div class="row">
                <div class="col-md-12">
                                    <?php include('acrecompras/view/usuario/perfil_frm_redefinicao_senha.php'); ?>
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
<!-- BEGIN CORE JS FRAMEWORK-->
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/usuario/perfil.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/usuario/perfil_pessoais.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/usuario/perfil_contato.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/usuario/perfil_bancario.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/usuario/perfil_redefinicao_senha.js" type="text/javascript"></script>
<!-- BEGIN CORE TEMPLATE JS -->
<!-- JAVASCRIPT UPLOAD DE FOTOS -->
<script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>upload-fotos/cropper.min.js"></script>
<script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>upload-fotos/main.js"></script>
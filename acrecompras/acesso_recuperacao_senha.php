<?php
include_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$id = (! isset($_POST['id']) && isset($_GET['id']) ? $_GET['id'] : (isset($_POST['id']) ? $_POST['id'] : 0));
$param = Url::getURL(2);
$param = $param == '' && $id != '' ? $id : $param;
$codigo = $param;

if (! is_numeric($codigo) || ! is_numeric(pesquisa("id", "seg_usuario", "senha_codigo_recuperacao = ?", $codigo, "", "", "", "", "", "", ""))) {
  echo "<script language='javaScript'>window.location.href='" . ConstantesAcreCompras::$PORTAL_URL . "acesso'</script>";
}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<title><?= ConstantesAcreCompras::$TITULOSISTEMA; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/animate.min.css" rel="stylesheet" type="text/css" />
<!-- END CORE CSS FRAMEWORK -->
<!-- BEGIN CSS TEMPLATE -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/style.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/responsive.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/custom-icon-set.css" rel="stylesheet" type="text/css" />
<!-- END CSS TEMPLATE -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="error-body no-top lazy"  data-original="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg"  style="background-image: url('<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg')">
  <div class="container">
    <div class="row login-container animated fadeInUp">
      <div class="col-md-7 col-md-offset-2 tiles white no-padding">
        <div class="p-t-30 p-l-40 p-b-20 xs-p-t-10 xs-p-l-10 xs-p-b-10">
          <h2 class="normal">Acesso ao ACRE COMPRAS</h2>
          <p>Forneça as informaçoes solicitadas para redefinir sua senha de acesso ao Acre Compras.</p>
        </div>
        <div class="tiles grey p-t-20 p-b-20 text-black">
          <form action="return false;" method="post" id="usuario_recuperacao_senha" class="animated fadeIn">
            <input type="hidden" name="recuperacao_codigo" id="recuperacao_codigo" value="<?= $codigo; ?>">
            <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
              <div id="div_usuario_senha_nova" class="col-md-6 col-sm-6">
                <input name="usuario_senha_nova" id="usuario_senha_nova" type="password" class="form-control" placeholder="Senha nova">
              </div>
              <div id="div_usuario_senha_confere_nova" class="col-md-6 col-sm-6">
                <input name="usuario_senha_confere_nova" id="usuario_senha_confere_nova" type="password" class="form-control" placeholder="Redigite a senha nova">
              </div>
            </div>
            <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
              <div class="col-md-12">
                <button type="button" class="btn btn-info btn-cons" id="usuario_redefinir_senha">Redefinir senha</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- END CONTAINER -->
  <!-- BEGIN CORE JS FRAMEWORK-->
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-1.8.3.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$JS_FOLDER ?>livequery.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>boostrapv3/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>pace/pace.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-lazyload/jquery.lazyload.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/projeto.utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/acesso_recuperacao_senha.js" type="text/javascript"></script>
  <!-- BEGIN CORE TEMPLATE JS -->
  <!-- END CORE TEMPLATE JS -->
</body>
</html>
<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();
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
<link href="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>bootstrap-select2/select2.css" rel="stylesheet" type="text/css" media="screen" />
<!-- END CORE CSS FRAMEWORK -->
<link href="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
<!-- BEGIN CSS TEMPLATE -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/style.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/responsive.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/custom-icon-set.css" rel="stylesheet" type="text/css" />
<!-- END CSS TEMPLATE -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="error-body no-top lazy login"  data-original="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg"  style="background-image: url('<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg')">
  <div class="container">
    <div class="row login-container animated fadeInUp">
      <div class="col-md-6 col-md-offset-3 tiles white no-padding">
        <div class="p-t-30 p-l-20 p-r-20 p-b-20 xs-p-t-10 xs-p-l-10 xs-p-b-10">
          <a href="/" class="logo-acrecompras"></a>
          <div class="p-t-20 text-center">
            <button type="button" class="btn btn-primary btn-cons" id="usuario_login_toggle">Usar sua conta</button>
            ou&nbsp;&nbsp;
            <button type="button" class="btn btn-info btn-cons" id="usuario_novo_toggle">Criar uma conta</button>
          </div>
        </div>
        <div class="tiles grey p-t-20 p-b-20 text-black">
          <?php include_once ('acrecompras/acesso_frm_login.php'); ?>
          <?php include_once ('acrecompras/acesso_frm_novo.php'); ?>
          <?php include_once ('acrecompras/acesso_frm_problema.php'); ?>
        </div>
      </div>
    </div>
  </div>
  <!-- END CONTAINER -->
  <!-- BEGIN CORE JS FRAMEWORK-->
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-1.8.3.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-inputmask/jquery.inputmask.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>boostrapv3/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>bootstrap-select2/select2.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>pace/pace.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>jquery-lazyload/jquery.lazyload.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$JS_FOLDER ?>livequery.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/projeto.utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/acesso.js" type="text/javascript"></script>
  <!-- BEGIN CORE TEMPLATE JS -->
  <!-- END CORE TEMPLATE JS -->
</body>
</html>
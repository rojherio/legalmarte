<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");
  
$db = Conexao::getInstance();

if (isset($_SESSION['acc_nome'])) {
  $_SESSION['acc_nome'] = $_SESSION['acc_nome'] != '' ? $_SESSION['acc_nome'] : $_SESSION['acc_nickname'];
} else {
  $_SESSION['acc_nome'] = $_SESSION['acc_nickname'];
}

if (isset($_SESSION['acc_email'])) {
  $_SESSION['acc_email'] = $_SESSION['acc_email'] != '' ? $_SESSION['acc_email'] : $_SESSION['acc_nickname'];
} else {
  $_SESSION['acc_email'] = $_SESSION['acc_nickname'];
}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<title><?= ConstantesAcreCompras::$TITULOSISTEMA ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN PLUGIN CSS -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/fonts.googleapis-sans-pro.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-metrojs/MetroJs.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/shape-hover/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/shape-hover/css/component.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-slider/css/jquery.sidr.light.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-ricksaw-chart/css/rickshaw.css" rel="stylesheet" type="text/css" media="screen">
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/Mapplic/mapplic/mapplic.css" rel="stylesheet" type="text/css" media="screen">
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-select2/select2.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrap-checkbox/css/bootstrap-checkbox.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/ios-switch/ios7-switch.css" rel="stylesheet" type="text/css" media="screen">
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-tag/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/dropzone/css/dropzone.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrap-clockpicker/bootstrap-clockpicker.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrap-slider/css/slider.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/file-input-krajee/css/fileinput.min.css" rel="stylesheet" type="text/css" />
<!-- END PLUGIN CSS -->
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/animate.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" />
<!-- END CORE CSS FRAMEWORK -->
<!-- BEGIN CSS TEMPLATE -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/style.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/responsive.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/custom-icon-set.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/magic_space.css" rel="stylesheet" type="text/css" />
<!-- END CSS TEMPLATE -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="">
  <!-- BEGIN HEADER -->
  <div class="header navbar navbar-inverse ">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
      <div class="header-seperation">
        <ul class="nav pull-left notifcation-center" id="main-menu-toggle-wrapper" style="display: none">
          <li class="dropdown">
            <a id="main-menu-toggle" href="#main-menu" class="">
              <div class="iconset top-menu-toggle-white"></div>
            </a>
          </li>
        </ul>
        <!-- BEGIN LOGO -->
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL; ?>dasboard.php">
          <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/logo-nova.svg" class="logo" alt="" data-src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/logo-nova.svg" data-src-retina="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/logo-nova.svg" width="135" height="40" />
        </a>
        <!-- END LOGO -->
        <ul class="nav pull-right notifcation-center">
          <li class="dropdown" id="header_task_bar">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL; ?>dasboard.php" class="dropdown-toggle active" data-toggle="">
              <div class="iconset top-home"></div>
            </a>
          </li>
          <li class="dropdown" id="header_inbox_bar">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL; ?>dasboard.php" class="dropdown-toggle">
              <div class="iconset top-messages"></div>
              <span class="badge" id="msgs-badge">2</span>
            </a>
          </li>
          <li class="dropdown" id="portrait-chat-toggler" style="display: none">
            <a href="#sidr" class="chat-menu-toggle">
              <div class="iconset top-chat-white "></div>
            </a>
          </li>
        </ul>
      </div>
      <!-- END RESPONSIVE MENU TOGGLER -->
      <div class="header-quick-nav">
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="pull-left">
          <ul class="nav quick-section">
            <li class="quicklinks">
              <a href="#" class="" id="layout-condensed-toggle">
                <div class="iconset top-menu-toggle-dark"></div>
              </a>
            </li>
          </ul>
          <ul class="nav quick-section">
            <li class="quicklinks">
              <a href="#" class="">
                <div class="iconset top-reload"></div>
              </a>
            </li>
            <li class="quicklinks">
              <span class="h-seperate"></span>
            </li>
            <li class="quicklinks">
              <a href="#" class="">
                <div class="iconset top-tiles"></div>
              </a>
            </li>
            <li class="m-r-10 input-prepend inside search-form no-boarder">
              <span class="add-on">
                <span class="iconset top-search"></span>
              </span>
              <input name="" type="text" class="no-boarder " placeholder="Search Dashboard" style="width: 250px;">
            </li>
          </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
        <!-- BEGIN CHAT TOGGLER -->
        <div class="pull-right">
          <div class="chat-toggler">
            <a href="#" class="dropdown-toggle" id="my-task-list" data-placement="bottom" data-content='' data-toggle="dropdown" data-original-title="Notifications">
              <div class="user-details">
                <div class="username">
                  <span class="badge badge-important">3</span> <?= $_SESSION['acc_email']; ?> </div>
              </div>
              <div class="iconset top-down-arrow"></div>
            </a>
            <div id="notification-list" style="display: none">
              <div style="width: 300px">
                <div class="notification-messages info">
                  <div class="user-profile">
                    <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/d.jpg" alt="" data-src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/d.jpg" data-src-retina="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/d2x.jpg" width="35" height="35">
                  </div>
                  <div class="message-wrapper">
                    <div class="heading">David Nester - Commented on your wall</div>
                    <div class="description">Meeting postponed to tomorrow</div>
                    <div class="date pull-left">A min ago</div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <div class="notification-messages danger">
                  <div class="iconholder">
                    <i class="icon-warning-sign"></i>
                  </div>
                  <div class="message-wrapper">
                    <div class="heading">Server load limited</div>
                    <div class="description">Database server has reached its daily capicity</div>
                    <div class="date pull-left">2 mins ago</div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <div class="notification-messages success">
                  <div class="user-profile">
                    <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/h.jpg" alt="" data-src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/h.jpg" data-src-retina="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/h2x.jpg" width="35" height="35">
                  </div>
                  <div class="message-wrapper">
                    <div class="heading">You haveve got 150 messages</div>
                    <div class="description">150 newly unread messages in your inbox</div>
                    <div class="date pull-left">An hour ago</div>
                  </div>
                  <div class="clearfix"></div>
                </div>
              </div>
            </div>
            <div class="profile-pic">
                                <?php
                                if ($_SESSION['acc_foto_cut'] != "") {
                                  ?>
                                    <img src="<?= $_SESSION['acc_foto_cut'] ?>" alt="" data-src="<?= $_SESSION['acc_foto_cut'] ?>" data-src-retina="<?= $_SESSION['acc_foto_cut'] ?>" width="35" height="35" />
                                    <?php
                                } else {
                                  ?>
                                    <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/avatar_small.jpg" alt="" data-src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/avatar_small.jpg" data-src-retina="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/profiles/avatar_small2x.jpg" width="35" height="35" />
                                    <?php
                                }
                                ?>
                            </div>
          </div>
          <ul class="nav quick-section ">
            <li class="quicklinks">
              <a data-toggle="dropdown" class="dropdown-toggle  pull-right " href="#" id="user-options">
                <div class="iconset top-settings-dark "></div>
              </a>
              <ul class="dropdown-menu  pull-right" role="menu" aria-labelledby="user-options">
                <li>
                  <a href="<?= ConstantesAcreCompras::$PORTAL_URL; ?>usuario/perfil"> Minha Conta</a>
                </li>
                <li>
                  <a href="email.html">
                    Minha Caixa&nbsp;&nbsp;
                    <span class="badge badge-important animated bounceIn">2</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="<?= ConstantesAcreCompras::$PORTAL_URL; ?>logout">
                    <i class="fa fa-power-off"></i>
                    &nbsp;&nbsp;Sair
                  </a>
                </li>
              </ul>
            </li>
            <li class="quicklinks">
              <span class="h-seperate"></span>
            </li>
            <li class="quicklinks">
              <a id="chat-menu-toggle" href="#sidr" class="chat-menu-toggle">
                <div class="iconset top-chat-dark ">
                  <span class="badge badge-important hide" id="chat-message-count">1</span>
                </div>
              </a>
              <div class="simple-chat-popup chat-menu-toggle hide">
                <div class="simple-chat-popup-arrow"></div>
                <div class="simple-chat-popup-inner">
                  <div style="width: 100px">
                    <div class="semi-bold">David Nester</div>
                    <div class="message">Hey you there</div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <!-- END CHAT TOGGLER -->
      </div>
      <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END TOP NAVIGATION BAR -->
  </div>
  <!-- END HEADER -->
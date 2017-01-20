<?php
require_once ('util/Constantes.php');
// include_once ("/conn/Conexao.class.php");
// include_once ("/dao/generico/funcoes.php");

// $db = Conexao::getInstance();
?>
<!DOCTYPE html>
<html lang="pt">
<head>
<!-- BASE -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<!-- SITE TITLE -->
<title>AcreCompras :: LegalMart</title>
<!-- DESCRIPTION -->
<meta name="description" content="AcreCompras">
<!-- AUTHOR -->
<meta name="author" content="Acre Compras - LegalMart">
<!-- KEYWORDS -->
<meta name="keywords" content="acre, compras, legalMart, desconto">
<!-- CSS -->
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/bootstrap.min.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/main.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/responsive.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/owl.carousel.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/owl.transitions.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/nivo-lightbox.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/nivo-theme.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/animate.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/icomoon.css">
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/jquery.bxslider.css">
<!-- Owl Carousel Assets -->
<link href="<?= Constantes::$ASSETS_FOLDER ?>css/owl.theme.css" rel="stylesheet">
<!-- *********************************** IMPORTANT BEGIN ********************************** -->
<!-- CHOOSE LAYOUT: light or dark -->
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/layouts/light.css">
<!-- CHOOSE COLOR: red, purple, blue, aqua, green, yellow or orange -->
<link rel="stylesheet" href="<?= Constantes::$ASSETS_FOLDER ?>css/colors/blue.css">
<!-- *********************************** IMPORTANT END ************************************ -->
<!-- GOOGLE FONT -->
<link href="<?= Constantes::$ASSETS_FOLDER ?>css/fonts.googleapis-sans-pro.css" rel="stylesheet" type="text/css" />
<!-- FAVICON AND TOUCH ICONS -->
<link rel="shortcut icon" href="<?= Constantes::$ASSETS_FOLDER ?>images/ico/favicon.ico">
<link rel="apple-touch-icon" href="<?= Constantes::$ASSETS_FOLDER ?>images/ico/icon.png">
<link rel="icon" sizes="228x228" href="<?= Constantes::$ASSETS_FOLDER ?>images/ico/icon.png">
<!--[if lt IE 9]>
		<script type="text/javascript" src="<?//= Constantes::$ASSETS_FOLDER ?>js/plugins/html5shiv.js"></script>
	<![endif]-->
</head>
<body>
  <!-- GLOBAL WRAP BEGIN -->
  <div class="global-wrap">
    <!-- PREALOADER BEGIN -->
    <div class="preloader">
      <!-- To show the second loader, replace "loader-one" for "loader-two" -->
      <div class="loader-one">Carregando...</div>
    </div>
    <!-- PRELOADER END -->
    <!-- FULLSCREEN MENU BEGIN -->
    <nav class="cd-primary-nav" role="navigation">
      <button type="button" class="overlay-close cd-primary-nav-trigger">Fechar</button>
      <ul class="localScroll">
        <!-- LINKS -->
        <li>
          <a href="#home">Início</a>
        </li>
        <li>
          <a href="#screenshot">Parceiros</a>
        </li>
        <li>
          <a href="#about">Acre Compras</a>
        </li>
        <!-- NOTE: You can hide any link for mobile, just put the class "hidden-xs" like next -->
        <li class="hidden-xs">
          <a href="#benefits">Benefícios</a>
        </li>
        <li>
          <a href="#pricing">Adquirir Pontos</a>
        </li>
        <li>
          <a href="#download">download</a>
        </li>
        <!-- CONTACT BUTTON -->
        <li class="contact-modal-icon contact-modal-icon-devices">
          <span data-toggle="modal" data-target="#contact">
            <i class="icon-envelope-o"></i>
          </span>
        </li>
      </ul>
    </nav>
    <!-- FULLSCREEN END -->
    <!-- NAVBAR BEGIN -->
    <div class="responsive-nav">
      <div class="container">
        <!-- LOGO FOR NAVBAR -->
        <div class="logo-nav localScroll">
          <a href="#home">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/logos/logo-dark.svg" alt="logo">
          </a>
        </div>
        <!-- HEADER MENU AND NAVBAR MENU -->
        <nav role="navigation" id="scroll">
          <ul id="menu">
            <!-- LINKS -->
            <li>
              <a href="#home">Início</a>
            </li>
            <li>
              <a href="#screenshot">Parceiros</a>
            </li>
            <li>
              <a href="#about">Acre Compras</a>
            </li>
            <li>
              <a href="#benefits">Benefícios</a>
            </li>
            <li>
              <a href="#pricing">Adquirir Pontos</a>
            </li>
            <li>
              <a href="#download" class="last-md">download</a>
            </li>
            <!-- CONTACT BUTTON -->
            <li class="contact-modal-icon visible-lg">
              <span data-toggle="modal" data-target="#contact">
                <i class="icon-envelope-o"></i>
              </span>
            </li>
          </ul>
        </nav>
        <!-- BUTTON TO FULLSCREEN MENU -->
        <div class="responsive-button">
          <a class="cd-primary-nav-trigger" href="#0">
            <span class="visible-lg menu">Menu</span>
            <i class="icon-align-justify"></i>
          </a>
        </div>
      </div>
    </div>
    <!-- RESPONSIVE NAVBAR END -->
    <!-- HEADER BEGIN -->
    <header id="home" class="slide-bg">
      <!-- BACKGOUND IMAGES -->
      <div id="maximage">
        <!-- ADD ALL THE IMAGES YOU WANT -->
        <img src="<?= Constantes::$ASSETS_FOLDER ?>images/backgrounds/slide1.jpg" alt="">
        <img src="<?= Constantes::$ASSETS_FOLDER ?>images/backgrounds/slide2.jpg" alt="">
        <img src="<?= Constantes::$ASSETS_FOLDER ?>images/backgrounds/slide3.jpg" alt="">
      </div>
      <!-- HEADER CONTENT -->
      <div class="header-special-version image-overlay">
        <!-- WELCOME MESSAGE AND BUTTONS -->
        <div class="container">
          <div class="col-sm-12 col-md-12 intro">
            <!-- LOGO AND WELCOME MESSAGE -->
            <div class="welcome-message text-center">
              <!-- LOGO -->
              <img src="<?= Constantes::$ASSETS_FOLDER ?>images/logos/logo-dark.svg" alt="" width="400px" class="logo">
              <!-- WELCOME MESSAGE -->
              <h1>O seu clube de descontos</h1>
              <h5>O seu clube de desconto que vai mudar a sua vida.</h5>
            </div>
            <div class="showHere localScroll text-center">
              <!-- BUTTONS -->
              <a class="btn btn-theme btn-opacity pulse-hover" href="#screenshot">SAIBA MAIS</a>
              <a class="btn btn-theme pulse-hover" href="<?= Constantes::$PORTAL_URL ?>escritorio/acesso#novo">CADASTRE-SE</a>
            </div>
          </div>
        </div>
        <!-- BUTTON TO FULLSCREEN MENU -->
        <ul class="responsive-button">
          <li data-toggle="modal" data-target="#contact">
            <span class="visible-lg">Contato</span>
          </li>
          <li>
            <?php
            if (isset($_SESSION['acc_id']) || (isset($_COOKIE['acc_id']) && isset($_COOKIE['acc_cod_logado']))) {
              ?>
            <a href="<?= Constantes::$PORTAL_URL ?>escritorio/dashboard" class="visible-lg">Entrar</a>
            <?php
            } else {
              ?>
            <a href="<?= Constantes::$PORTAL_URL ?>escritorio/acesso" class="visible-lg">Entrar</a>
            <?php
            }
            ?>
          </li>
          <li id="fullscreen-menu-header">
            <a class="cd-primary-nav-trigger" href="#0">
              <span class="visible-lg menu">Menu</span>
              <i class="icon-align-justify"></i>
            </a>
          </li>
        </ul>
      </div>
    </header>
    <!-- HEADER END -->
    <!-- SECTION 4 (SCREENSHOTS) BEGIN -->
    <section id="screenshot" class="color-a">
      <!-- SECTION HEADER  -->
      <div class="intro wow fadeInDown" data-wow-duration="1s" data-wow-offset="200" data-wow-delay="0.3s">
        <h2>Parceiros</h2>
        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
      </div>
      <div id="parceiros" class="intro wow fadeInDown" data-wow-duration="1s" data-wow-offset="200" data-wow-delay="0.3s">
        <div class="item">
          <a href="#" data-lightbox-gallery="screenshots-gallery" title="This is an image title" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/1.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/2.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/3.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/4.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/5.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/6.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/7.png" alt="Owl Image">
          </a>
        </div>
        <div class="item">
          <a href="#" data-toggle="modal" data-target="#company">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/8.png" alt="Owl Image">
          </a>
        </div>
      </div>
    </section>
    <!-- SECTION 4 (SCREENSHOTS) END -->
    <!-- SECTION 2 (ABOUT) BEGIN -->
    <section id="about" class="color-b">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-push-6 vertical-center wow fadeInLeft" data-wow-duration="1s" data-wow-offset="150" data-wow-delay="1s">
            <!-- SECTION HEADER -->
            <div class="intro">
              <h2>Acre Compras</h2>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
              <hr class="hidden-md hidden-lg">
            </div>
            <div id="exTab3">
              <ul class="nav nav-pills">
                <li class="active">
                  <a href="#1b" data-toggle="tab">Sobre</a>
                </li>
                <li>
                  <a href="#2b" data-toggle="tab">Fundadores</a>
                </li>
                <li>
                  <a href="#3b" data-toggle="tab">Como Participar</a>
                </li>
              </ul>
              <div class="tab-content clearfix">
                <div class="tab-pane active" id="1b">
                  <div class="text-icon-left">
                    <span class="iconCircle icon-cloud-upload"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-location"></span>
                    <div class="text">
                      <p>Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-speech-bubble"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="2b">
                  <div class="text-icon-left">
                    <span class="iconCircle icon-bar-graph"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-lock"></span>
                    <div class="text">
                      <p>Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-link"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="3b">
                  <div class="text-icon-left">
                    <span class="iconCircle icon-clock-o"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-comment"></span>
                    <div class="text">
                      <p>Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum</p>
                    </div>
                  </div>
                  <div class="text-icon-left">
                    <span class="iconCircle icon-youtube"></span>
                    <div class="text">
                      <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid?</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- PHONES IMAGES -->
          <div class="col-md-6 col-md-pull-6 vertical-center phones">
            <!-- BACK PHONE -->
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/img/5.jpg" alt="img" class="phone-back wow fadeInRight" data-wow-duration="0.5s" data-wow-offset="150" data-wow-delay="0.3s">
            <a class="btn btn-theme pulse-hover btn-cadastro" href="<?= Constantes::$PORTAL_URL ?>escritorio/acesso#novo">CADASTRE-SE</a>
          </div>
        </div>
      </div>
    </section>
    <!-- SECTION 2 (ABOUT) END -->
    <!-- SECTION 3 (BENEFITS) BEGIN -->
    <section id="benefits" class="color-a">
      <div class="container">
        <div class="row">
          <div class="col-md-6 vertical-center wow fadeInRight" data-wow-duration="1s" data-wow-offset="150" data-wow-delay="1.1s">
            <!-- SECTION HEADER -->
            <div class="intro">
              <!-- Title -->
              <h2>Benefícios</h2>
              <!-- Paragraph with the right border by adding the class p-border-left" -->
              <p class="p-border-left">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</p>
              <br />
              <!-- Paragraph with the right border by adding the class p-border-left" -->
              <p class="p-border-left">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</p>
              <br />
              <!-- Paragraph with the right border by adding the class p-border-left" -->
              <p class="p-border-left">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</p>
            </div>
          </div>
          <!-- PHONES IMAGES -->
          <div class="col-md-6 vertical-center phones">
            <!-- BACK PHONE -->
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/img/3.jpg" alt="img" class="phone-back wow fadeInLeft" data-wow-duration="0.5s" data-wow-offset="150" data-wow-delay="0.3s">
          </div>
        </div>
      </div>
    </section>
    <!-- SECTION 3 (BENEFITS) END -->
    <!-- SECTION 1 (SERVICES) BEGIN -->
    <section id="services" class="color-b">
      <div class="container">
        <div class="row">
          <!-- SECTION HEADER -->
          <div class="intro wow fadeInDown" data-wow-duration="1s" data-wow-offset="200" data-wow-delay="0.3s">
            <h2>Mais Benefícios</h2>
            <p>Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum</p>
          </div>
        </div>
        <div class="row wow fadeInUp" data-wow-duration="1s" data-wow-offset="300" data-wow-delay="0.6s">
          <!-- SINGLE SERVICE -->
          <div class="col-md-4">
            <!-- SERVICES ICON -->
            <span class="icon icon-cloud-download"></span>
            <!-- SERVICE HEADING -->
            <h3>Descontos</h3>
            <!-- SERVICE DESCRIPTION -->
            <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam aliquid</p>
          </div>
          <!-- SINGLE SERVICE -->
          <div class="col-md-4">
            <!-- SERVICES ICON -->
            <span class="icon icon-power"></span>
            <!-- SERVICE HEADING -->
            <h3>Bonificação</h3>
            <!-- SERVICE DESCRIPTION -->
            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
          <div class="col-md-4">
            <!-- SERVICE ICON -->
            <span class="icon icon-signal"></span>
            <!-- SERVICE HEADING -->
            <h3>Troca Produtos</h3>
            <!-- SERVICE DESCRIPTION -->
            <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam aliquid</p>
          </div>
        </div>
      </div>
    </section>
    <!-- SECTION 1 (SERVICES) END -->
    <!-- SECTION 7 (PRICING) BEGIN -->
    <section class="color-a" id="pricing">
      <div class="container">
        <div class="row">
          <!-- SECTION HEADER -->
          <div class="col-xs-12 intro wow fadeInDown" data-wow-duration="1s" data-wow-offset="200" data-wow-delay="0.3s">
            <h2>Adquirir Pontos</h2>
            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
        </div>
        <div class="row wow fadeInUp" data-wow-duration="1s" data-wow-offset="300" data-wow-delay="0.6s">
          <!-- FIRST PACKAGE -->
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">50,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">100,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">250,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">500,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">750,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="price-table popular">
              <!-- PACKAGE PRICE -->
              <div class="price">
                <span class="dollar">R$</span>
                <span class="amount">1000,00</span>
              </div>
              <br />
              <!-- BUTTON -->
              <a href="#" class="btn btn-theme btn-line pulse-hover">Comprar</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- SECTION 7 (PRICES) BEGIN -->
    <!-- SECTION 9 (DOWNLOAD) BEGIN -->
    <section id="download">
      <div class="image-overlay">
        <div class="container">
          <div class="intro wow fadeInDown" data-wow-duration="1s" data-wow-offset="200" data-wow-delay="0.3s">
            <!-- TITTLE -->
            <h2>Faça o download do nosso App</h2>
            <!-- BUTTONS -->
            <a class="btn btn-theme pulse-hover" href="#">
              <i class="icon-apple"></i>
              App store
            </a>
            <a class="btn btn-theme pulse-hover" href="#">
              <i class="icon-android"></i>
              Play store
            </a>
            <a class="btn btn-theme pulse-hover" href="#">
              <i class="icon-windows"></i>
              Windows store
            </a>
          </div>
        </div>
      </div>
    </section>
    <!-- SECTION 9 (DOWNLOAD) END -->
    <!-- FOOTER BEGIN -->
    <footer class="color-b">
      <div class="container">
        <!-- LOGO -->
        <div class="logo localScroll-slow pulse-hover">
          <a href="#home">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/logos/logo-dark.svg" alt="">
          </a>
        </div>
        <!-- SOCIAL ICONS -->
        <ul class="social">
          <li>
            <a href="#">
              <i class="icon-twitter"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="icon-facebook"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="icon-google-plus"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="icon-dribbble"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="icon-github"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="icon-pinterest"></i>
            </a>
          </li>
        </ul>
        <!-- SOCIAL ICONS -->
        <ul class="termos">
          <li>
            <a href="<?= Constantes::$ASSETS_FOLDER ?>documentos/termo-de-uso.pdf" target="_blank">Termo de Uso</a>
          </li>
          <li>
            <a href="<?= Constantes::$ASSETS_FOLDER ?>documentos/termo-de-uso.pdf" target="_blank">Política de Privacidade</a>
          </li>
        </ul>
        <!-- COPYRIGHT -->
        <div class="copyright">
          <span>Copyright &copy; LegalMart</span>
        </div>
      </div>
    </footer>
    <!-- FOOTER END -->
  </div>
  <!-- GLOBAL WRAP END -->
  <!-- MODAL CONTACT BEGIN -->
  <div class="modal fade in" id="contact" tabindex="-1" role="dialog" aria-hidden="false">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- TITLE -->
        <h3 class="modal-title">Contato</h3>
        <!-- FORM -->
        <form role="form" id="contact_form" novalidate="novalidate">
          <!-- NAME -->
          <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="Nome Completo" name="name">
          </div>
          <!-- MAIL -->
          <div class="form-group">
            <input type="email" class="form-control" id="email" placeholder="E-mail" name="email">
          </div>
          <!-- MESSAGE -->
          <div class="form-group">
            <textarea class="form-control" rows="3" placeholder="Sua mensagem ou pergunta" id="message" name="message"></textarea>
          </div>
          <div class="contact-box">
            <!-- BUTTON FORM -->
            <button type="submit" id="submit" name="submit" data-loading-text="•••" class="btn btn-theme btn-line pulse-hover">Enviar</button>
            <!-- IF MAIL SENT SUCCESSFULLY -->
            <p class="success">Sua mensagem foi enviada com sucesso.</p>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- MODAL CONTACT END -->
  <!-- MODAL CONTACT BEGIN -->
  <div class="modal fade in" id="company" tabindex="-1" role="dialog" aria-hidden="false">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <div class="modal-dialog modal-company">
      <div class="modal-content">
        <!-- TITLE -->
        <h3 class="modal-title">Empresa</h3>
        <br />
        <div class="row">
          <div class="col-md-4">
            <img src="<?= Constantes::$ASSETS_FOLDER ?>images/parceiros/2.png" width="250px" alt="img" />
          </div>
          <div class="col-md-8">
            <p class="text-left">
              <strong>NOME DA EMPRESA:</strong>
              Empresa Teste de Legal Mart
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- MODAL CONTACT END -->
  <!-- *********************************** IMPORTANT BEGIN ********************************** -->
  <script type="text/javascript">

		// Your MailChimp URL //
		var MailChimpUrl = 'http://dusbee.us8.list-manage.com/subscribe/post?u=19280557509965cbd03e2ce3e&id=f44ffb1e8e';

	</script>
  <!-- *********************************** IMPORTANT END ************************************ -->
  <!-- Main JS files (necessary for Bootstrap's JavaScript plugins and others)-->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="<?= Constantes::$ASSETS_FOLDER ?>js/vendor/jquery-2.1.3.min.js">\x3C/script>')</script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/vendor/modernizr.custom.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/vendor/bootstrap.min.js"></script>
  <!-- Main JS files END -->
  <!-- SCRIPTS BEGIN -->
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/wow.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.nav.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.ajaxchimp.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.scrollTo.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.localScroll.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/responsive-accordion.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.cycle.all.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/jquery.maximage.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/nivo-lightbox.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/retina.min.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/tweetie.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/main.js"></script>
  <script src="<?= Constantes::$ASSETS_FOLDER ?>js/owl/owl.carousel.js"></script>
  <script>
	    $(document).ready(function() {
	      $("div#parceiros").owlCarousel({
	        autoPlay: 3000,
	        items : 4,
	        itemsDesktop : [1199,3],
	        itemsDesktopSmall : [979,3]
	      });
	    });
    </script>
  <!--[if lt IE 9]>
		<script type="text/javascript" src="<?= Constantes::$ASSETS_FOLDER ?>js/plugins/respond.min.js"></script>
	<![endif]-->
  <!-- SCRIPTS END -->
</body>
</html>
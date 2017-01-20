<?php
ob_start();
session_start();

// ADICIONAR A CONEXAO E URL AMIGAVEL
include_once ('conf/Url.php');
include_once ('conf/config.php');
include_once ('util/Constantes.php');
include_once ('conf/session.php');

// FUNCOES
// include_once 'utils/funcoes.php';
// include_once('utils/permissoes.php');
// INSTANCIA A CONEXAO
// $oConexao = Conexao::getInstance();
$modulo = Url::getURL(0);
$mvc = Url::getURL(1);
$pasta = Url::getURL(2);
$arquivo = Url::getURL(3);
$parametro = Url::getURL(4);
$urlAdress = Url::getURLFull();

if (file_exists($urlAdress . '.php')) {
  include_once ($urlAdress . '.php');
  sessionOn();
  exit();
} else if ($arquivo && $arquivo != '') {
  if (file_exists($modulo . '/' . $mvc . '/' . $pasta . '/' . $arquivo . '.php')) {
    include_once ($modulo . '/' . $mvc . '/' . $pasta . '/' . $arquivo . '.php');
    sessionOn();
    exit();
  } else if (file_exists($modulo . '/' . $mvc . '/' . $pasta . '.php')) {
    include_once ($modulo . '/' . $mvc . '/' . $pasta . '.php');
    sessionOn();
    exit();
  } else {
    include_once ('404.php');
    sessionOn();
    exit();
  }
} else if ($pasta && $pasta != '') {
  if (file_exists($modulo . '/' . $mvc . '/' . $pasta . '.php')) {
    include_once ($modulo . '/' . $mvc . '/' . $pasta . '.php');
    sessionOn();
    exit();
  } else if (file_exists($modulo . '/' . $mvc . '.php')) {
    include_once ($modulo . '/' . $mvc . '.php');
    sessionOn();
    exit();
  } else {
    include_once ('404.php');
    sessionOn();
    exit();
  }
} else if ($mvc && $mvc != '') {
  if (file_exists($modulo . '/' . $mvc . '.php')) {
    include_once ($modulo . '/' . $mvc . '.php');
    sessionOn();
    exit();
  } else if (file_exists($modulo . '.php')) {
    include_once ($modulo . '.php');
    sessionOn();
    exit();
  } else if (in_array($mvc, ['login', 'login.php', 'acesso', 'acesso.php'])){
    include_once ($modulo . '/' . 'acesso.php');
    sessionOn();
    exit();
  } else if (in_array($mvc, ['index', 'index.php', 'home', 'home.php'])){
    include_once ($modulo . '/' . 'dashboard.php');
    sessionOn();
    exit();
  } else {
    include_once ('404.php');
    sessionOn();
    exit();
  }
} else if ($modulo && $modulo != '') {
  if (file_exists($modulo . '.php')) {
    include_once ('dashboard.php');
    sessionOn();
    exit();
  } else if (in_array($modulo, ['login', 'login.php', 'acesso', 'acesso.php'])){
    include_once ('acesso.php');
    sessionOn();
    exit();
  } else if (in_array($modulo, ['index', 'index.php', 'home', 'home.php'])){
    include_once ('dashboard.php');
    sessionOn();
    exit();
  }
} else {
  include_once ('404.php');
  sessionOn();
  exit();
}

// if ($modulo == '') {
// $modulo = 'dashboard';
// include_once ($modulo . '.php');
// sessionOn();
// exit();
// } else {
// // VERIFICA SE O ARQUIVO EXISTE E EXIBI
// if (file_exists($modulo . '.php')) {
// include_once ($modulo . '.php');
// sessionOn();
// exit();
// } else if (in_array($modulo, [
// 'acrecompras',
// 'basico',
// 'seguranca'
// ])) {
// $arquivomodulo = 'dashboard';
// include_once ($modulo . '/' . $arquivomodulo . '.php');
// sessionOn();
// exit();
// }
// }
// if ($modulo == 'index.php' || $modulo == 'index' || $modulo == '' || $modulo == null) {
// $modulo = 'acrecompras/login';
// include_once ($modulo . '.php');
// sessionOn();
// exit();
// } else if ($modulo == 'login.php' || $modulo == 'login') {
// $modulo = 'acrecompras/login';
// include_once ($modulo . '.php');
// sessionOn();
// exit();
// } else {
// // VERIFICAÇÃO DE $moduloS
// // VERIFICA SE O USUÁRIO ESTÁ LOGADO PELA SESSION
// // vf_usuario_login ();
// // VERIFICA AS PERMISSÕES DO USUÁRIO DE ACESSO AO MÓDULO
// // vf_modulo ();
// if ($pastamodulo == 'index.php' || $pastamodulo == 'index' || $pastamodulo == '' || $pastamodulo == null) {
// // VERIFICA SE O ARQUIVO EXISTE E EXIBI
// if (file_exists($pastamodulo . '/' . 'index.php')) {
// include_once ($pastamodulo . '/' . 'index.php');
// sessionOn();
// exit();
// } else {
// include_once '404.php';
// sessionOn();
// exit();
// }
// } else {
// if ($arquivomodulo == '' || $arquivomodulo == null) {
// // VERIFICA SE O ARQUIVO EXISTE E EXIBI
// if (file_exists($modulo . '/' . $mvc . '/' . $pastamodulo . '/' . 'index.php')) {
// include_once ($modulo . '/' . $mvc . '/' . $pastamodulo . '/' . 'index.php');
// sessionOn();
// exit();
// } else {
// include_once ('404.php');
// sessionOn();
// exit();
// }
// } else {
// // VERIFICA SE O ARQUIVO EXISTE E EXIBI
// if (file_exists($modulo . '/' . $mvc . '/' . $pastamodulo . '/' . $arquivomodulo . '.php')) {
// include_once ($modulo . '/' . $mvc . '/' . $pastamodulo . '/' . $arquivomodulo . '.php');
// sessionOn();
// exit();
// } else {
// include_once ('404.php');
// sessionOn();
// exit();
// }
// }
// } // END IF
// } // END IF
?>  
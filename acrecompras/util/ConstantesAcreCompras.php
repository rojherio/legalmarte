<?php
final class ConstantesAcreCompras {
  public static $caminho = '/acreideiaslegalmarte/acrecompras';
  public static $enderecoCompleto = 'http://localhost/acreideiaslegalmarte/acrecompras/';
  
  // DEFININDO OS DADOS DE ACESSO AO BANCO DE DADOS
  public static $DB = 'mysql';
  public static $DB_HOST = 'localhost';
  public static $DB_NAME = 'acreideiaslegalmarte';
  public static $DB_USER = 'root';
  public static $DB_PASS = 'root';
  
  // CONFIGURACOES PADRAO DO SISTEMA
  public static $PORTAL_URL = 'http://localhost/acreideiaslegalmarte/escritorio/';
  public static $PORTAL_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/';
  public static $TITULOSISTEMA = 'ACRE IDEIAS - LEGAL MARTE';
  public static $FAVICONSISTEMA = 'http://localhost/acreideiaslegalmarte/acrecompras/upload/favicon.png';
  public static $LOGO_DASHBOARD = 'http://localhost/acreideiaslegalmarte/acrecompras/tema/img/logo-gestor-de-cargos.svg';
  public static $CSS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/css/';
  public static $IMG_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/img/';
  public static $JS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/js/';
  public static $FONTS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/fontes/';
  public static $PLUGINS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/plugins/';
  public static $UTILS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/utils/';
  public static $ASSETS_FOLDER = 'http://localhost/acreideiaslegalmarte/acrecompras/assets/';
  public static $PORTAL_URL_SERVIDOR = 'http://localhost/acreideiaslegalmarte/acrecompras/Aplicativos/MAMP/htdocs/acreideiaslegalmarte/';
  
  // CONFIGURACAO DE ENVIO DE E-MAIL
  public static $EMAIL_NOME = '';
  public static $EMAIL_ENDERECO = '';
  public static $URL_ENDERECO = '';
  public static $EMAIL_TITULO = '';
  public static $EMAIL_DESENVOLVIMENTO = '';
}

// ADICIONAR CLASSE DE CONEÇÃO
// include_once("acrecompras/conn/Conexao.class.php");
// include_once("acrecompras/dao/generico/funcoes.php");

?>

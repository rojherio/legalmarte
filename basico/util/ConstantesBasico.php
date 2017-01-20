<?php
final class ConstantesBasico {
    
	public static $caminho = '/acreideiaslegalmarte/basico';
	public static $enderecoCompleto = 'http://localhost/acreideiaslegalmarte/basico/';
	
	
	// DEFININDO OS DADOS DE ACESSO AO BANCO DE DADOS
	public static $DB = 'mysql';
	public static $DB_HOST = 'localhost';
	public static $DB_NAME = 'acreideiaslegalmarte';
	public static $DB_USER = 'root';
	public static $DB_PASS = 'root';

	// CONFIGURACOES PADRAO DO SISTEMA
	public static $PORTAL_URL = 'http://localhost/acreideiaslegalmarte/basico/';
	public static $TITULOSISTEMA = 'ACRE IDEIAS - LEGAL MARTE';
	public static $FAVICONSISTEMA = 'http://localhost/acreideiaslegalmarte/basico/upload/favicon.png';
	public static $LOGO_DASHBOARD = 'http://localhost/acreideiaslegalmarte/basico/tema/img/logo-gestor-de-cargos.svg';
	public static $CSS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/css/';
	public static $IMG_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/img/';
	public static $JS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/js/';
	public static $FONTS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/fontes/';
	public static $PLUGINS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/plugins/';
	public static $UTILS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/utils/';
	public static $ASSETS_FOLDER = 'http://localhost/acreideiaslegalmarte/basico/assets/';
	public static $PORTAL_URL_SERVIDOR = 'http://localhost/acreideiaslegalmarte/basico/Aplicativos/MAMP/htdocs/acreideiaslegalmarte/';
	
	//CONFIGURACAO DE ENVIO DE E-MAIL
	public static $EMAIL_NOME = '';
	public static $EMAIL_ENDERECO = '';
	public static $URL_ENDERECO = '';
	public static $EMAIL_TITULO = '';
	public static $EMAIL_DESENVOLVIMENTO = '';

}

// ADICIONAR CLASSE DE CONEÇÃO
// include_once("Conexao.class.php");

?>

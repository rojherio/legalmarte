<?php

class Conexao extends PDO {

    private static $instancia;

    public function Conexao($dsn, $username = "", $password = "") {
        // parent::__construct($dsn, $username, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        parent::__construct($dsn, $username, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    }

    public static function getInstance() {
        if(!isset( self::$instancia )){
            try {
                self::$instancia = new Conexao(ConstantesBasico::$DB.":host=".ConstantesBasico::$DB_HOST.";dbname=".ConstantesBasico::$DB_NAME, ConstantesBasico::$DB_USER, ConstantesBasico::$DB_PASS);
            } catch ( PDOException $e ) {
                $e->getMessage();  
            }
        }
        return self::$instancia;
    }
}
?>
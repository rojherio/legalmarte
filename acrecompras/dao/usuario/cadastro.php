<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_nickname = @$_POST['usuario_nickname'];
$usuario_data_nascimento = @$_POST['usuario_data_nascimento'];
$usuario_email = @$_POST['usuario_email'];
$usuario_senha_digitado = @$_POST['usuario_senha_digitado'];
$acc_pessoa_id_amigo = @$_POST['pessoa_patrocinador'];
$acc_pessoa_admin_id = pesquisa("id", "acc_pessoa_admin", "status = ?", 1, "", "", "", "", "", "", "");

if ($acc_pessoa_id_amigo == "" || $acc_pessoa_id_amigo == 0) { // SE NÃO ESCOLHER PATROCINADOR, ENTÃO SALVO ID DO ADMIN
  $acc_pessoa_id_amigo = pesquisa("acc_pessoa_id", "acc_pessoa_admin", "status = ?", 1, "", "", "", "", "", "", "");
}

if ($acc_pessoa_id_amigo == "vazio") {
  $acc_pessoa_id_amigo = null;
}

if ($acc_pessoa_admin_id == "vazio") {
  $acc_pessoa_admin_id = null;
}

$error = false;

$mensagem = "";

if (is_numeric(pesquisa("id", "seg_usuario", "nickname = ?", $usuario_nickname, "", "", "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>O nick name digitado já existe no sistema.</span>";
  $msg['tipo'] = "nickname";
} else if (is_numeric(pesquisa("id", "seg_usuario", "email = ?", $usuario_email, "", "", "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>O e-mail digitado já existe no sistema.</span>";
  $msg['tipo'] = "email";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $codigo_validacao = rand(1000000000, 9999999999);
    
    $stmt = $db->prepare("INSERT INTO seg_usuario (nickname, email, data_nascimento, senha, seg_usuario_status_id, email_codigo_validacao, data_cadastro) VALUES (?, ?, ?, ?, 1, ?, NOW())");
    
    $stmt->bindValue(1, ($usuario_nickname));
    $stmt->bindValue(2, $usuario_email);
    $stmt->bindValue(3, convertDataBR2ISO($usuario_data_nascimento));
    $stmt->bindValue(4, sha1($usuario_senha_digitado));
    $stmt->bindValue(5, $codigo_validacao);
    
    $stmt->execute();
    
    $usuario_id = $db->lastInsertId();
    
    $stmt = $db->prepare("INSERT INTO acc_pessoa (nickname, status, seg_usuario_id, acc_pessoa_id_amigo, acc_pessoa_admin_id, data_cadastro) VALUES (?, 1, ?, ?, ?, NOW())");
    
    $stmt->bindValue(1, ($usuario_nickname));
    $stmt->bindValue(2, $usuario_id);
    $stmt->bindValue(3, $acc_pessoa_id_amigo);
    $stmt->bindValue(4, $acc_pessoa_admin_id);
    
    $stmt->execute();
    
    $pessoa_id = $db->lastInsertId();
    
    $stmt = $db->prepare("INSERT INTO acc_cliente (acc_pessoa_id, acc_cliente_status_id, status, data_cadastro) VALUES (?, ?, ?, NOW())");
    
    $stmt->bindValue(1, $pessoa_id);
    $stmt->bindValue(2, 1);
    $stmt->bindValue(3, 0);
    
    $stmt->execute();
    
    $cliente_id = $db->lastInsertId();
    
    $db->commit();
    
    if (is_numeric($usuario_id)) { // AUTENTICAR O USUÁRIO NA SESSION
                                   // CRIAR O TIMEOUT DA SESSÃO PARA EXPIRAR
      $_SESSION['acc_timeout'] = time();
      // CRIAR AS SESSÕES DO USUARIO
      $_SESSION['acc_id'] = $usuario_id;
      $_SESSION['acc_nome'] = "";
      $_SESSION['acc_email'] = $usuario_email;
      $_SESSION['acc_login'] = "";
      $_SESSION['acc_nickname'] = $usuario_nickname;
      $_SESSION['acc_data_nascimento'] = $usuario_data_nascimento;
      $_SESSION['acc_tipo_pessoa'] = "";
      $_SESSION['acc_cpf_cnpj'] = "";
      $_SESSION['acc_rg_ie'] = "";
      $_SESSION['acc_rg_orgao_expedidor'] = "";
      $_SESSION['acc_sexo'] = "";
      $_SESSION['acc_estado_civil'] = "";
      $_SESSION['acc_contato_1'] = "";
      $_SESSION['acc_contato_2'] = "";
      $_SESSION['acc_contato_3'] = "";
      $_SESSION['acc_foto_original'] = "";
      $_SESSION['acc_data_cadastro'] = "";
      $_SESSION['acc_foto'] = "";
      $_SESSION['acc_status'] = 1;
      // STATUS ONLINE -> 1 - ONLINE e 2 - OFFLINE
      $_SESSION['acc_online'] = 1;
      $_SESSION['acc_foto_cut'] = "";
      $_SESSION['acc_foto_origin'] = "";
      
      $_SESSION['acc_pessoa_id'] = $pessoa_id;
      
      $_SESSION['acc_cliente_id'] = $cliente_id;
      
      // ATUALIZANDO O STATUS ONLINE DO USUARIO
      $stmt = $db->prepare("UPDATE seg_usuario SET status = '1' WHERE id = ?");
      $stmt->bindValue(1, $usuario_id);
      $stmt->execute();
      
      // ATUALIZANDO DADOS DA SESSÃO DO USUÁRIO
      $useragent = $_SERVER['HTTP_USER_AGENT'];
      if (preg_match('|MSIE ([0-9].[0-9]{1,2})|', $useragent, $matched)) {
        $browser_version = $matched[1];
        $browser = 'IE';
      } elseif (preg_match('|Opera/([0-9].[0-9]{1,2})|', $useragent, $matched)) {
        $browser_version = $matched[1];
        $browser = 'Opera';
      } elseif (preg_match('|Firefox/([0-9\.]+)|', $useragent, $matched)) {
        $browser_version = $matched[1];
        $browser = 'Firefox';
      } elseif (preg_match('|Chrome/([0-9\.]+)|', $useragent, $matched)) {
        $browser_version = $matched[1];
        $browser = 'Chrome';
      } elseif (preg_match('|Safari/([0-9\.]+)|', $useragent, $matched)) {
        $browser_version = $matched[1];
        $browser = 'Safari';
      } else {
        $browser_version = 0;
        $browser = 'Desconhecido';
      }
      $separa = explode(";", $useragent);
      $so = $separa[1];
      
      $stmt2 = $db->prepare("UPDATE seg_sessao SET host = ?, navegador = ?, sistema_operacional = ?, data_login = NOW() WHERE seg_usuario_id = ?");
      $stmt2->bindValue(1, $_SERVER["SERVER_NAME"]);
      $stmt2->bindValue(2, $browser . " " . $browser_version);
      $stmt2->bindValue(3, $so);
      $stmt2->bindValue(4, $usuario_id);
      $stmt2->execute();
      
      // ENVIAR E-MAIL COM CÓDIGO DE VALIDAÇÃO DA CONTA DO USUÁRIO
      $msg_email = "Segue abaixo o link de validação do seu cadastro no Acrecompras:<br/>" . "http://tudotemdesconto.com/acrecompras/acesso_validacao_email/$codigo_validacao";
      
      email($usuario_email, "", $msg_email, utf8_decode("Validação de E-mail"));
    }
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $usuario_id;
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Cadastro realizado com sucesso.';
    echo json_encode($msg);
    exit();
  } else {
    $db->rollback();
    $msg['msg'] = 'error';
    $msg['retorno'] = $mensagem;
    echo json_encode($msg);
    exit();
  }
} catch ( PDOException $e ) {
  $db->rollback();
  $msg['msg'] = 'error';
  $msg['retorno'] = "Erro ao tentar realizar o cadastro:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
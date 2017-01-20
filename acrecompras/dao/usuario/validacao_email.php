<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_email = @$_POST['usuario_email'];

$error = false;

$mensagem = "";

$usuario_id = pesquisa("id", "seg_usuario", "email = ?", $usuario_email, "", "", "", "", "", "", "");

if (! is_numeric($usuario_id)) {
  $error = true;
  $mensagem .= "<span>O e-mail digitado é inválido.</span>";
  $msg['tipo'] = "validacao";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $db->beginTransaction();
    
    $codigo_validacao = rand(1000000000, 9999999999);
    
    $stmt = $db->prepare("UPDATE seg_usuario SET email_codigo_validacao = ? WHERE email = ?");
    $stmt->bindValue(1, $codigo_validacao);
    $stmt->bindValue(2, $usuario_email);
    $stmt->execute();
    $db->commit();
    
    // ENVIAR E-MAIL COM CÓDIGO DE VALIDAÇÃO DA CONTA DO USUÁRIO
    $msg_email = "Segue abaixo o link de validação do seu cadastro no Acrecompras:<br/>" . "http://tudotemdesconto.com/acrecompras/acesso_validacao_email/$codigo_validacao";
    
    email($usuario_email, "", $msg_email, utf8_decode("Validação de E-mail"));
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $usuario_id;
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Validação de e-mail enviada novamente com sucesso.';
    echo json_encode($msg);
    exit();
  } else {
    $msg['msg'] = 'error';
    $msg['retorno'] = $mensagem;
    echo json_encode($msg);
    exit();
  }
} catch ( PDOException $e ) {
  $db->rollback();
  $msg['msg'] = 'error';
  $msg['retorno'] = "Erro ao tentar enviar a validação de e-mail:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
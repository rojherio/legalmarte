<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$email = @$_POST['usuario_redefinir_email'];

$codigo_validacao = rand(1000000000, 9999999999);

$mensagem = "Acesse o link abaixo para redefinir uma nova senha:<br/>" . "http://tudotemdesconto.com/acrecompras/acesso_recuperacao_senha/$codigo_validacao";

if (is_numeric(pesquisa("id", "seg_usuario", "email = ?", $email, "", "", "", "", "", "", ""))) {

  $db->beginTransaction();
  
  try {
    if (email($email, "", $mensagem, utf8_decode("Redefinição de senha"))) {
      $stmt = $db->prepare("UPDATE seg_usuario SET senha_codigo_recuperacao = ? WHERE email = ?");
      $stmt->bindValue(1, $codigo_validacao);
      $stmt->bindValue(2, $email);
      $stmt->execute();
      
      $msg['id'] = $db->lastInsertId();
      
      $db->commit();
      $msg['msg'] = 'success';
      $msg['retorno'] = 'Senha alterada com sucesso.';
      echo json_encode($msg);
      exit();
    } else {
      $msg['msg'] = 'error';
      $msg['retorno'] = "Não foi possível enviar o e-mail.";
      echo json_encode($msg);
      exit();
    }
  } catch ( PDOException $e ) {
    $db->rollback();
    $msg['msg'] = 'error';
    $msg['retorno'] = "Erro ao tentar recuperar a senha:" . $e->getMessage();
    echo json_encode($msg);
    exit();
  }
} else {
  $msg['msg'] = 'error';
  $msg['retorno'] = "<span>O e-mail informado não existe no sistema.</span>";
  $msg['tipo'] = "email";
  echo json_encode($msg);
  exit();
}
?>
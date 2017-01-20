<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$status = @$_POST['status'] == '' ? 0 : 2;

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  $stmt = $db->prepare("UPDATE acc_fornecedor SET status = ? WHERE acc_pessoa_id = ?");
  $stmt->bindValue(1, $status);
  $stmt->bindValue(2, $_SESSION['acc_pessoa_id']);
  $stmt->execute();
  
  // ENVIAR E-MAIL
  $sms = "O usuário " . $_SESSION['acc_id'] . " - " . $_SESSION['acc_nome'] . " solicitou ativação como fornecedor no sistema e aguarda pela confirmação do administrador.";
  
  email($_SESSION['acc_email'], "adm@tudotemdesconto.com", $sms, "Forneceodr Aguardando Confirmação");
  
  // MENSAGEM DE SUCESSO
  $db->commit();
  $msg['id'] = $_SESSION['acc_id'];
  $msg['msg'] = 'success';
  $msg['retorno'] = 'Fornecedor ativado com sucesso.';
  echo json_encode($msg);
  exit();
} catch ( PDOException $e ) {
  $db->rollback();
  $msg['msg'] = 'error';
  $msg['retorno'] = "Erro ao tentar alterar o status do fornecedor:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
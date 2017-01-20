<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$fornecedor_id = @$_POST['fornecedor_id'];

$status = @$_POST['status'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($status != '') {
    $stmt = $db->prepare("UPDATE acc_fornecedor SET acc_fornecedor_status_id = ? WHERE id = ?");
    $stmt->bindValue(1, $status);
    $stmt->bindValue(2, $fornecedor_id);
    $stmt->execute();
  }
  
  if ($status == 2) {
    // ENVIAR E-MAIL
    $sms = "O usuário " . $_SESSION['acc_id'] . " - " . $_SESSION['acc_nome'] . " solicitou ativação como fornecedor no sistema e aguarda pela confirmação do administrador.";
    email($_SESSION['acc_email'], "adm@tudotemdesconto.com", $sms, "Fornecedor Aguardando Ativação");
  } else if ($status == 5) {
    // ENVIAR E-MAIL
    $sms = "O usuário " . $_SESSION['acc_id'] . " - " . $_SESSION['acc_nome'] . " solicitou inativação como fornecedor no sistema.";
    email($_SESSION['acc_email'], "adm@tudotemdesconto.com", $sms, "Fornecedor Solicitou Inativação");
  }
  
  // MENSAGEM DE SUCESSO
  $db->commit();
  $msg['id'] = $fornecedor_id;
  $msg['msg'] = 'success';
  $msg['retorno'] = 'Solicitação efetuada com sucesso.';
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
<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$item = @$_POST['item'];

$error = false;

$mensagem = "";

if ($item == "") {
  $error = true;
  $mensagem = "Dados, do Item, inválidos!";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("DELETE FROM acc_orcamento WHERE acc_cliente_id = ? AND id = ?");
    $stmt->bindValue(1, $_SESSION['acc_cliente_id']);
    $stmt->bindValue(2, $item);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Item removido com Sucesso.';
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
  $msg['retorno'] = "Erro ao tentar remover o Item:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
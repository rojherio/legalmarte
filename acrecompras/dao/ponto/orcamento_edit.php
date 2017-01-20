<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$item = @$_POST['item'];
$qtd = real2float(@$_POST["qtd"]);

$error = false;

$mensagem = "";

if ($item == "" || $qtd == "") {
  $error = true;
  $mensagem = "Dados, do Item, inválidos!";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("UPDATE acc_orcamento SET quantidade = ? WHERE acc_cliente_id = ? AND id = ?");
    $stmt->bindValue(1, $qtd);
    $stmt->bindValue(2, $_SESSION['acc_cliente_id']);
    $stmt->bindValue(3, $item);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Quantidade alterada com Sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar a quantidade do item:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
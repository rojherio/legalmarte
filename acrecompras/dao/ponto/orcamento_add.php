<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$produto = @$_POST['produto'];
$qtd = real2float(@$_POST["qtd"]);

$error = false;

$mensagem = "";

if ($produto == "" || $qtd == "") {
  $error = true;
  $mensagem = "Dados, do Item, inválidos!";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("INSERT INTO acc_orcamento (acc_cliente_id, acc_produto_id, quantidade, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
    $stmt->bindValue(1, $_SESSION['acc_cliente_id']);
    $stmt->bindValue(2, $produto);
    $stmt->bindValue(3, $qtd);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Item adicionado ao Carrinho com Sucesso.';
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
  $msg['retorno'] = "Erro ao tentar adicionar o Item ao Carrinho:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
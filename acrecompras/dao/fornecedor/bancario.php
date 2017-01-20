<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$fornecedor_id = @$_POST['fornecedor_id'];
$fornecedor_bancario_banco = @$_POST['fornecedor_bancario_banco'];
$fornecedor_bancario_agencia = @$_POST['fornecedor_bancario_agencia'];
$fornecedor_bancario_agencia_dv = @$_POST['fornecedor_bancario_agencia_dv'];
$fornecedor_bancario_conta = @$_POST['fornecedor_bancario_conta'];
$fornecedor_bancario_conta_dv = @$_POST['fornecedor_bancario_conta_dv'];
$fornecedor_bancario_tipo_conta = @$_POST['fornecedor_bancario_tipo_conta'];
$fornecedor_bancario_variacao = @$_POST['fornecedor_bancario_variacao'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    if (is_numeric(pesquisa("id", "acc_fornecedor_bancario", "acc_fornecedor_id = ?", $_SESSION['acc_fornecedor_id'], "AND bsc_tipo_bancario_id = 2", "", "", "", "", "", ""))) {
      $stmt = $db->prepare("UPDATE acc_fornecedor_bancario SET bsc_banco_id = ?, agencia = ?, agencia_dv = ?, conta = ?, conta_dv = ?, tipo_conta = ?, variacao = ? WHERE acc_fornecedor_id = ? AND bsc_tipo_bancario_id = 2");
      $stmt->bindValue(1, $fornecedor_bancario_banco);
      $stmt->bindValue(2, $fornecedor_bancario_agencia);
      $stmt->bindValue(3, $fornecedor_bancario_agencia_dv);
      $stmt->bindValue(4, $fornecedor_bancario_conta);
      $stmt->bindValue(5, $fornecedor_bancario_conta_dv);
      $stmt->bindValue(6, $fornecedor_bancario_tipo_conta);
      $stmt->bindValue(7, $fornecedor_bancario_variacao);
      $stmt->bindValue(8, $fornecedor_id);
      $stmt->execute();
    } else {
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_bancario (bsc_banco_id, agencia, agencia_dv, conta, conta_dv, tipo_conta, variacao, acc_fornecedor_id, bsc_tipo_bancario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 2)");
      $stmt->bindValue(1, $fornecedor_bancario_banco);
      $stmt->bindValue(2, $fornecedor_bancario_agencia);
      $stmt->bindValue(3, $fornecedor_bancario_agencia_dv);
      $stmt->bindValue(4, $fornecedor_bancario_conta);
      $stmt->bindValue(5, $fornecedor_bancario_conta_dv);
      $stmt->bindValue(6, $fornecedor_bancario_tipo_conta);
      $stmt->bindValue(7, $fornecedor_bancario_variacao);
      $stmt->bindValue(8, $fornecedor_id);
      $stmt->execute();
    }
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $fornecedor_id;
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Dados bancários alterados com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar os dados bancários:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
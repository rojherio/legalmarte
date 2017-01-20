<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_bancario_banco = @$_POST['usuario_bancario_banco'];
$usuario_bancario_agencia = @$_POST['usuario_bancario_agencia'];
$usuario_bancario_agencia_dv = @$_POST['usuario_bancario_agencia_dv'];
$usuario_bancario_conta = @$_POST['usuario_bancario_conta'];
$usuario_bancario_conta_dv = @$_POST['usuario_bancario_conta_dv'];
$usuario_bancario_tipo_conta = @$_POST['usuario_bancario_tipo_conta'];
$usuario_bancario_variacao = @$_POST['usuario_bancario_variacao'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    if (is_numeric(pesquisa("id", "acc_cliente_bancario", "acc_cliente_id = ?", $_SESSION['acc_cliente_id'], "AND bsc_tipo_bancario_id = 1", "", "", "", "", "", ""))) {
      $stmt = $db->prepare("UPDATE acc_cliente_bancario SET bsc_banco_id = ?, agencia = ?, agencia_dv = ?, conta = ?, conta_dv = ?, tipo_conta = ?, variacao = ? WHERE acc_cliente_id = ? AND bsc_tipo_bancario_id = 1");
      $stmt->bindValue(1, $usuario_bancario_banco);
      $stmt->bindValue(2, $usuario_bancario_agencia);
      $stmt->bindValue(3, $usuario_bancario_agencia_dv);
      $stmt->bindValue(4, $usuario_bancario_conta);
      $stmt->bindValue(5, $usuario_bancario_conta_dv);
      $stmt->bindValue(6, $usuario_bancario_tipo_conta);
      $stmt->bindValue(7, $usuario_bancario_variacao);
      $stmt->bindValue(8, $_SESSION['acc_cliente_id']);
      $stmt->execute();
    } else {
      $stmt = $db->prepare("INSERT INTO acc_cliente_bancario (bsc_banco_id, agencia, agencia_dv, conta, conta_dv, tipo_conta, variacao, acc_cliente_id, bsc_tipo_bancario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)");
      $stmt->bindValue(1, $usuario_bancario_banco);
      $stmt->bindValue(2, $usuario_bancario_agencia);
      $stmt->bindValue(3, $usuario_bancario_agencia_dv);
      $stmt->bindValue(4, $usuario_bancario_conta);
      $stmt->bindValue(5, $usuario_bancario_conta_dv);
      $stmt->bindValue(6, $usuario_bancario_tipo_conta);
      $stmt->bindValue(7, $usuario_bancario_variacao);
      $stmt->bindValue(8, $_SESSION['acc_cliente_id']);
      $stmt->execute();
    }
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $_SESSION['acc_id'];
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
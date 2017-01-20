<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$fornecedor_id = @$_POST['fornecedor_id'];

$fornecedor_param_pct_1 = @$_POST["fornecedor_param_pct_1"];
$fornecedor_param_vlr_min_1 = @$_POST["fornecedor_param_vlr_min_1"];

$fornecedor_param_pct_2 = @$_POST["fornecedor_param_pct_2"];
$fornecedor_param_vlr_min_2 = @$_POST["fornecedor_param_vlr_min_2"];

$fornecedor_param_pct_3 = @$_POST["fornecedor_param_pct_3"];
$fornecedor_param_vlr_min_3 = @$_POST["fornecedor_param_vlr_min_3"];

$fornecedor_param_pct_4 = @$_POST["fornecedor_param_pct_4"];
$fornecedor_param_vlr_min_4 = @$_POST["fornecedor_param_vlr_min_4"];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    // DELETANDO OS DADOS DE DESCONTOS ANTIGOS DO FORNECEDOR
    $stmt = $db->prepare("DELETE FROM acc_fornecedor_desconto WHERE acc_fornecedor_id = ?");
    $stmt->bindValue(1, $fornecedor_id);
    $stmt->execute();
    
    if ($fornecedor_param_pct_1 != "" && $fornecedor_param_vlr_min_1 != "") {
      // INSERINDO OS DADOS DE DESCONTOS ATUALIZADOS DO FORNECEDOR
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_desconto (pct, limite_inicio, acc_fornecedor_id, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
      $stmt->bindValue(1, real2float($fornecedor_param_pct_1));
      $stmt->bindValue(2, real2float($fornecedor_param_vlr_min_1));
      $stmt->bindValue(3, $fornecedor_id);
      $stmt->execute();
    }
    
    if ($fornecedor_param_pct_2 != "" && $fornecedor_param_vlr_min_2 != "") {
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_desconto (pct, limite_inicio, acc_fornecedor_id, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
      $stmt->bindValue(1, real2float($fornecedor_param_pct_2));
      $stmt->bindValue(2, real2float($fornecedor_param_vlr_min_2));
      $stmt->bindValue(3, $fornecedor_id);
      $stmt->execute();
    }
    
    if ($fornecedor_param_pct_3 != "" && $fornecedor_param_vlr_min_3 != "") {
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_desconto (pct, limite_inicio, acc_fornecedor_id, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
      $stmt->bindValue(1, real2float($fornecedor_param_pct_3));
      $stmt->bindValue(2, real2float($fornecedor_param_vlr_min_3));
      $stmt->bindValue(3, $fornecedor_id);
      $stmt->execute();
    }
    
    if ($fornecedor_param_pct_4 != "" && $fornecedor_param_vlr_min_4 != "") {
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_desconto (pct, limite_inicio, acc_fornecedor_id, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
      $stmt->bindValue(1, real2float($fornecedor_param_pct_4));
      $stmt->bindValue(2, real2float($fornecedor_param_vlr_min_4));
      $stmt->bindValue(3, $fornecedor_id);
      $stmt->execute();
    }
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $fornecedor_id;
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Parâmetros de desconto do fornecedor alterados com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar os parâmetros de desconto do fornecedor:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
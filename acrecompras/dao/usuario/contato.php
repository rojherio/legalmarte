<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$endereco_logradouro = @$_POST['endereco_logradouro'];
$endereco_numero = @$_POST['endereco_numero'];
$endereco_complemento = @$_POST['endereco_complemento'];
$endereco_cep = @$_POST['endereco_cep'];
$endereco_bairro = @$_POST['endereco_bairro'];
$endereco_cidade = @$_POST['endereco_cidade'];
$usuario_contato_1 = @$_POST['usuario_contato_1'];
$usuario_contato_2 = @$_POST['usuario_contato_2'];
$usuario_contato_3 = @$_POST['usuario_contato_3'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    if (is_numeric(pesquisa("id", "bsc_usuario_endereco", "seg_usuario_id = ?", $_SESSION['acc_id'], "AND bsc_tipo_endereco_id = 1", "", "", "", "", "", ""))) {
      $stmt = $db->prepare("UPDATE bsc_usuario_endereco SET logradouro = ?, numero = ?, complemento = ?, cep = ?, bairro = ?, bsc_cidade_id = ? WHERE bsc_tipo_endereco_id = 1 AND seg_usuario_id = ?");
      $stmt->bindValue(1, $endereco_logradouro);
      $stmt->bindValue(2, $endereco_numero);
      $stmt->bindValue(3, $endereco_complemento);
      $stmt->bindValue(4, $endereco_cep);
      $stmt->bindValue(5, $endereco_bairro);
      $stmt->bindValue(6, $endereco_cidade);
      $stmt->bindValue(7, $_SESSION['acc_id']);
      $stmt->execute();
    } else {
      $stmt = $db->prepare("INSERT INTO bsc_usuario_endereco (logradouro, numero, complemento, cep, bairro, bsc_cidade_id, bsc_tipo_endereco_id, seg_usuario_id) VALUES (?, ?, ?, ?, ?, ?, 1, ?)");
      $stmt->bindValue(1, $endereco_logradouro);
      $stmt->bindValue(2, $endereco_numero);
      $stmt->bindValue(3, $endereco_complemento);
      $stmt->bindValue(4, $endereco_cep);
      $stmt->bindValue(5, $endereco_bairro);
      $stmt->bindValue(6, $endereco_cidade);
      $stmt->bindValue(7, $_SESSION['acc_id']);
      $stmt->execute();
    }
    
    $stmt = $db->prepare("UPDATE seg_usuario SET contato_1 = ?, contato_2 = ?, contato_3 = ? WHERE id = ?");
    $stmt->bindValue(1, $usuario_contato_1);
    $stmt->bindValue(2, $usuario_contato_2);
    $stmt->bindValue(3, $usuario_contato_3);
    $stmt->bindValue(4, $_SESSION['acc_id']);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $_SESSION['acc_id'];
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Dados de contato alterados com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar os dados de contato:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
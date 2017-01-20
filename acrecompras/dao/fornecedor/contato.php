<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$fornecedor_id = @$_POST['fornecedor_id'];
$fornecedor_nome_fantasia = @$_POST['fornecedor_nome_fantasia'];
$fornecedor_razao_social = @$_POST['fornecedor_razao_social'];
$fornecedor_contato_1 = @$_POST['fornecedor_contato_1'];
$fornecedor_contato_2 = @$_POST['fornecedor_contato_2'];
$fornecedor_contato_3 = @$_POST['fornecedor_contato_3'];
$email = @$_POST['fornecedor_email'];
$site = @$_POST['fornecedor_site'];

// ENDEREÇO
$endereco_id = @$_POST['fornecedor_endereco_id'];
$endereco_cep = @$_POST['endereco_cep'];
$endereco_logradouro = @$_POST['endereco_logradouro'];
$endereco_numero = @$_POST['endereco_numero'];
$endereco_complemento = @$_POST['endereco_complemento'];
$endereco_bairro = @$_POST['endereco_bairro'];
$cidade_id = @$_POST['endereco_cidade'];
$endereco_latitude = @$_POST['endereco_latitude'];
$endereco_longitude = @$_POST['endereco_longitude'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    if (is_numeric($fornecedor_id)) {
      
      $stmt = $db->prepare("UPDATE acc_fornecedor SET nome_fantasia = ?, razao_social = ?, contato_1 = ?, contato_2 = ?, contato_3 = ?, email = ?, site = ?, acc_fornecedor_status_id = 2, data_cadastro = NOW() WHERE id = ?");
      $stmt->bindValue(1, $fornecedor_nome_fantasia);
      $stmt->bindValue(2, $fornecedor_razao_social);
      $stmt->bindValue(3, $fornecedor_contato_1);
      $stmt->bindValue(4, $fornecedor_contato_2);
      $stmt->bindValue(5, $fornecedor_contato_3);
      $stmt->bindValue(6, $email);
      $stmt->bindValue(7, $site);
      $stmt->bindValue(8, $fornecedor_id);
      $stmt->execute();
      
      if (is_numeric($endereco_id)) {
        
        $stmt = $db->prepare("UPDATE acc_fornecedor_endereco SET logradouro = ?, numero = ?, complemento = ?, bairro = ?, latitude = ?, longitude = ?, bsc_cidade_id = ?, cep = ? WHERE id = ?");
        $stmt->bindValue(1, $endereco_logradouro);
        $stmt->bindValue(2, $endereco_numero);
        $stmt->bindValue(3, $endereco_complemento);
        $stmt->bindValue(4, $endereco_bairro);
        $stmt->bindValue(5, $endereco_latitude);
        $stmt->bindValue(6, $endereco_longitude);
        $stmt->bindValue(7, $cidade_id);
        $stmt->bindValue(8, $endereco_cep);
        $stmt->bindValue(9, $endereco_id);
        $stmt->execute();
      } else {
        $stmt = $db->prepare("INSERT INTO acc_endereco (bsc_tipo_endereco_id, bsc_cidade_id, cep, logradouro, numero, complemento, bairro, longitude, latitude, acc_fornecedor_id, data_cadastro) VALUES (2, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())");
        $stmt->bindValue(1, $cidade_id);
        $stmt->bindValue(2, $endereco_cep);
        $stmt->bindValue(3, $endereco_logradouro);
        $stmt->bindValue(4, $endereco_numero);
        $stmt->bindValue(5, $endereco_complemento);
        $stmt->bindValue(6, $endereco_bairro);
        $stmt->bindValue(7, $endereco_longitude);
        $stmt->bindValue(8, $endereco_latitude);
        $stmt->bindValue(9, $fornecedor_id);
        $stmt->execute();
      }
    } else {
      
      $stmt = $db->prepare("INSERT INTO acc_fornecedor (nome_fantasia, razao_social, contato_1, contato_2, contato_3, email, site, acc_pessoa_id, acc_fornecedor_status_id, status, data_cadastro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 6, 0, NOW())");
      $stmt->bindValue(1, $fornecedor_nome_fantasia);
      $stmt->bindValue(2, $fornecedor_razao_social);
      $stmt->bindValue(3, $fornecedor_contato_1);
      $stmt->bindValue(4, $fornecedor_contato_2);
      $stmt->bindValue(5, $fornecedor_contato_3);
      $stmt->bindValue(6, $email);
      $stmt->bindValue(7, $site);
      $stmt->bindValue(8, $_SESSION['acc_pessoa_id']);
      $stmt->execute();
      
      $fornecedor_id = $db->lastInsertId();
      
      $stmt = $db->prepare("INSERT INTO acc_fornecedor_endereco (bsc_tipo_endereco_id, bsc_cidade_id, cep, logradouro, numero, complemento, bairro, longitude, latitude, acc_fornecedor_id, data_cadastro) VALUES (2, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())");
      $stmt->bindValue(1, $cidade_id);
      $stmt->bindValue(2, $endereco_cep);
      $stmt->bindValue(3, $endereco_logradouro);
      $stmt->bindValue(4, $endereco_numero);
      $stmt->bindValue(5, $endereco_complemento);
      $stmt->bindValue(6, $endereco_bairro);
      $stmt->bindValue(7, $endereco_longitude);
      $stmt->bindValue(8, $endereco_latitude);
      $stmt->bindValue(9, $fornecedor_id);
      $stmt->execute();
    }
    
    $_SESSION['acc_fornecedor_id'] = $fornecedor_id;
    
    $db->commit();
    
    // MENSAGEM DE SUCESSO
    $msg['id'] = $fornecedor_id;
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Dados de contato do fornecedor alterados com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar os dados de contato do fornecedor:" . json_encode($e)/*$e->getMessage()*/;
  echo json_encode($msg);
  exit();
}
?>
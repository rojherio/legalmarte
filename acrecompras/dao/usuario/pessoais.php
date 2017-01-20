<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_nickname = @$_POST['usuario_nickname'];
$usuario_nome = @$_POST['usuario_nome'];
$usuario_data_nascimento = @$_POST['usuario_data_nascimento'];
$usuario_sexo = @$_POST['usuario_sexo'];
$usuario_rg = @$_POST['usuario_rg'];
$usuario_rg_orgao_expedidor = @$_POST['usuario_rg_orgao_expedidor'];
$usuario_cpf_cnpj = @$_POST['usuario_cpf_cnpj'];
$usuario_estado_civil = @$_POST['usuario_estado_civil'];

$error = false;

$mensagem = "";

if (is_numeric(pesquisa("id", "seg_usuario", "nickname = ?", $usuario_nickname, "AND id <> ?", $_SESSION['acc_id'], "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>O nome de usuário já existe no sistema.</span>";
  $msg['tipo'] = "nickname";
} else if (is_numeric(pesquisa("id", "seg_usuario", "nome = ?", $usuario_nome, "AND id <> ?", $_SESSION['acc_id'], "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>O nome completo informado já existe no sistema.</span>";
  $msg['tipo'] = "nome";
} else if (is_numeric(pesquisa("id", "seg_usuario", "cpf_cnpj = ?", $usuario_cpf_cnpj, "AND id <> ?", $_SESSION['acc_id'], "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>O cpf ou cnpj informado já existe no sistema.</span>";
  $msg['tipo'] = "cpf_cnpj";
} else if (valida_CPF($usuario_cpf_cnpj) == false || valida_CNPJ($usuario_cpf_cnpj) == false) {
  $error = true;
  $mensagem .= "<span>O cpf ou cnpj informado é inválido.</span>";
  $msg['tipo'] = "cpf_cnpj";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("UPDATE seg_usuario SET nickname = ?, cpf_cnpj = ?, data_nascimento = ?, sexo = ?, rg_ie = ?, rg_orgao_expedidor = ?, estado_civil = ?, nome = ?, foto = ?, foto_original = ? WHERE id = ?");
    $stmt->bindValue(1, $usuario_nickname);
    $stmt->bindValue(2, $usuario_cpf_cnpj);
    $stmt->bindValue(3, convertDataBR2ISO($usuario_data_nascimento));
    $stmt->bindValue(4, $usuario_sexo);
    $stmt->bindValue(5, $usuario_rg);
    $stmt->bindValue(6, $usuario_rg_orgao_expedidor);
    $stmt->bindValue(7, $usuario_estado_civil);
    $stmt->bindValue(8, $usuario_nome);
    $stmt->bindValue(9, isset($_SESSION['foto_cut']) ? $_SESSION['foto_cut'] : $_SESSION['acc_foto_cut']);
    $stmt->bindValue(10, isset($_SESSION['foto_origin']) ? $_SESSION['foto_origin'] : $_SESSION['acc_foto_original']);
    $stmt->bindValue(11, $_SESSION['acc_id']);
    $stmt->execute();
    
    $_SESSION['acc_foto_cut'] = isset($_SESSION['foto_cut']) ? $_SESSION['foto_cut'] : $_SESSION['acc_foto_cut'];
    $_SESSION['acc_foto_original'] = isset($_SESSION['foto_origin']) ? $_SESSION['foto_origin'] : $_SESSION['acc_foto_original'];
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $_SESSION['acc_id'];
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Dados pessoais alterados com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar os dados pessoais:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
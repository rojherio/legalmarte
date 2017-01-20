<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_senha = @$_POST['usuario_senha_atual'];
$usuario_senha_nova = @$_POST['usuario_senha_nova'];

$error = false;

$mensagem = "";

if (! is_numeric(pesquisa("id", "seg_usuario", "senha = ?", sha1($usuario_senha), "AND id = ?", $_SESSION['acc_id'], "", "", "", "", ""))) {
  $error = true;
  $mensagem .= "<span>A senha atual digitada é inválida.</span>";
  $msg['tipo'] = "redefinicao";
}

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("UPDATE seg_usuario SET senha = ? WHERE id = ?");
    $stmt->bindValue(1, sha1($usuario_senha_nova));
    $stmt->bindValue(2, $_SESSION['acc_id']);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $_SESSION['acc_id'];
    $msg['msg'] = 'success';
    $msg['retorno'] = 'Senha alterada com sucesso.';
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
  $msg['retorno'] = "Erro ao tentar alterar a senha:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
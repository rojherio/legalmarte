<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$recuperacao_codigo = @$_POST['recuperacao_codigo'];
$usuario_senha_nova = @$_POST['usuario_senha_nova'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {
  
  if ($error == false) {
    
    $stmt = $db->prepare("UPDATE seg_usuario SET senha = ?, senha_codigo_recuperacao = '' WHERE senha_codigo_recuperacao = ?");
    $stmt->bindValue(1, sha1($usuario_senha_nova));
    $stmt->bindValue(2, $recuperacao_codigo);
    $stmt->execute();
    
    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = 0;
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
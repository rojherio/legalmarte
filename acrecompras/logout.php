<?php
require_once ('acrecompras/template/head.php');

if (isset($_SESSION['acc_id'])) {
  $id = $_SESSION['acc_id'];
} else {
  $id = 0;
}
$idsessao = session_id();
$db = Conexao::getInstance();

setcookie('acc_id', '', time() - 1, '/', '.localhost', false);
setcookie('acc_cod_logado', '', time() - 1, '/', '.localhost', false);

$stmt = $db->prepare("UPDATE seg_usuario SET senha_codigo_manter_logado = '' WHERE id = ?");
$stmt->bindValue(1, $id);
$stmt->execute();

$sair = $db->prepare("UPDATE seg_sessao SET data_logout = NOW() WHERE seg_usuario_id = ?");
$sair->bindValue(1, $id);
$sair->execute();

session_unset();
session_destroy();

echo "<script language='javaScript'>window.location.href='" . ConstantesAcreCompras::$PORTAL_URL . "acesso'</script>";
?>

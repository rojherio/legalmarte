<?php

require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$status = @$_POST['status'];
$codigo = @$_POST['codigo'];

$error = false;

$mensagem = "";

$db->beginTransaction();

try {

    $stmt = $db->prepare("UPDATE acc_fornecedor SET acc_fornecedor_status_id = ? WHERE id = ?");
    $stmt->bindValue(1, $status);
    $stmt->bindValue(2, $codigo);
    $stmt->execute();

    // ENVIAR E-MAIL
    /* $sms = "O usuário " . $_SESSION['acc_id'] . " - " . $_SESSION['acc_nome'] . " solicitou correção.";

      email($_SESSION['acc_email'], "adm@tudotemdesconto.com", $sms, "Solicitação de correção"); */

    // MENSAGEM DE SUCESSO
    $db->commit();
    $msg['id'] = $codigo;
    $msg['msg'] = 'success';
    $msg['retorno'] = $status;
    echo json_encode($msg);
    exit();
} catch (PDOException $e) {
    $db->rollback();
    $msg['msg'] = 'error';
    $msg['retorno'] = "Erro ao tentar solicitar a correção:" . $e->getMessage();
    echo json_encode($msg);
    exit();
}
?>
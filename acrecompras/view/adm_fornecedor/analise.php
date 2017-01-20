<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();

$id = (!isset($_POST['id']) && isset($_GET['id']) ? $_GET['id'] : (isset($_POST['id']) ? $_POST['id'] : 0));
$param = Url::getURL(3);
$param = $param == '' && $id != '' ? $id : $param;

if ($param != 0) {
    $_SESSION['acc_fornecedor_id'] = $param;
}

$stmt = $db->prepare("SELECT *
                      FROM acc_fornecedor
                      WHERE id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_fornecedor = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT fe.*, c.nome AS cidade_nome, e.sigla AS estado_sigla
                      FROM acc_fornecedor_endereco AS fe 
                      LEFT JOIN bsc_cidade AS c ON c.id = fe.bsc_cidade_id 
                      LEFT JOIN bsc_estado AS e ON e.id = c.bsc_estado_id
                      WHERE acc_fornecedor_id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_fornecedor_endereco = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT *
                      FROM acc_fornecedor_bancario
                      WHERE acc_fornecedor_id = ? AND bsc_tipo_bancario_id = 2");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_bancario = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT f.status, fs.id AS status_id, fs.nome, fs.descricao, fs.class
                      FROM acc_fornecedor AS f
                      LEFT JOIN acc_fornecedor_status AS fs ON fs.id = f.acc_fornecedor_status_id
                      WHERE f.id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_ativacao = $stmt->fetch(PDO::FETCH_ASSOC);

if (isset($_POST['retorno_sucesso'])) {
    $retorno_sucesso = $_POST['retorno_sucesso'];
} else {
    $retorno_sucesso = 0;
}
?>
<style>
    #map {
        width: 100%;
        height: 333px;
        border: none;
    }
</style>
<!-- BEGIN CONTAINER -->
<div class="page-container row">
    <!-- BEGIN SIDEBAR -->
    <?php
    require_once ('acrecompras/template/sidebar.php');
    ?>
    <!-- END SIDEBAR -->
    <!-- BEGIN PAGE CONTAINER-->
    <div class="page-content">
        <div id="portlet-config" class="modal hide">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"></button>
                <h3>Widget Settings</h3>
            </div>
            <div class="modal-body">Widget settings form goes here</div>
        </div>
        <div class="clearfix"></div>
        <div class="content">
                <input type="hidden" id="retorno_sucesso" name="retorno_sucesso" value="<?= $retorno_sucesso; ?>" />
    <div id="msg_sucesso" class="alert alert-success" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <b>Aprovado:</b>&nbsp;Solicitação aprovada com sucesso.
    </div>
    <div id="msg_correcao" class="alert alert-info" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <b>Validação:</b>&nbsp;Solicitação de correção enviada com sucesso.
    </div>
    <div id="msg_erro" class="alert alert-error" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <b>Recusado:</b>&nbsp;Solicitação recusada com sucesso.
    </div>
            <ul class="breadcrumb">
                <li>
                    <a href="#">FORNECEDOR</a>
                </li>
                <li class="active">ANÁLISE</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <ul id="tab-01" class="nav nav-tabs">
                        <li class="active">
                            <a href="#dados">DADOS E INFORMAÇÕES</a>
                        </li>
                        <li>
                            <a href="#acompanhamento">ACOMPANHAMENTO</a>
                        </li>
                        <li>
                            <a href="#alterarSituacao">ALTERAR SITUAÇÃO</a>
                        </li>
                    </ul>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                        <a class="config" data-toggle="modal" href="#grid-config"></a>
                        <a class="reload" href="javascript:;"></a>
                        <a class="remove" href="javascript:;"></a>
                    </div>
                    <div class="tab-content">
                        <div id="dados" class="tab-pane active">
                            <div class="row column-seperation">
                                <div class="col-md-12">
                                    <?php include('acrecompras/view/adm_fornecedor/analise_frm_dados.php'); ?>
                                </div>
                            </div>
                        </div>
                        <div id="acompanhamento" class="tab-pane">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php include('acrecompras/view/adm_fornecedor/analise_frm_acompanhamento.php'); ?>
                                </div>
                            </div>
                        </div>
                        <div id="alterarSituacao" class="tab-pane">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php include('acrecompras/view/adm_fornecedor/analise_frm_alterar_situacao.php'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CHAT -->
    <?php
    require_once ('acrecompras/template/chat.php');
    ?>
    <!-- END CHAT -->
</div>
<!-- END CONTAINER -->
<?php
require_once ('acrecompras/template/footer.php');
?>
<!-- BEGIN CUSTON JS-->
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/analise.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/analise_dados.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/analise_acompanhamento.js" type="text/javascript"></script>
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/adm_fornecedor/analise_alterar_situacao.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/fornecedor/google_maps.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGH8guJUpbwSzVnqTQxGUTclDamTX5QVc&sensor=false&signed_in=true&callback=initMap"></script>

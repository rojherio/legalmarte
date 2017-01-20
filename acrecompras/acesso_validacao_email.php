<?php
include_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$id = (! isset($_POST['id']) && isset($_GET['id']) ? $_GET['id'] : (isset($_POST['id']) ? $_POST['id'] : 0));
$param = Url::getURL(2);
$param = $param == '' && $id != '' ? $id : $param;
$codigo = $param;

if (is_numeric(pesquisa("id", "seg_usuario", "email_codigo_validacao = ?", $codigo, "", "", "", "", "", "", ""))) {
  
  $email_valido = true;
  
  $stmt = $db->prepare("SELECT *
                            FROM seg_usuario
                            WHERE email_codigo_validacao = ?");
  $stmt->bindValue(1, $codigo);
  $stmt->execute();
  $dados_usuario = $stmt->fetch(PDO::FETCH_ASSOC);
  
  $stmt = $db->prepare("UPDATE seg_usuario SET email_codigo_validacao = '' WHERE id = ?");
  $stmt->bindValue(1, $dados_usuario['id']);
  $stmt->execute();
  
  $id_patrocinador = pesquisa("acc_pessoa_id_amigo", "acc_pessoa", "seg_usuario_id = ?", $dados_usuario['id'], "", "", "", "", "", "", "");
  
  $stmt = $db->prepare("SELECT u.id, u.nome, u.email 
                            FROM seg_usuario AS u
                            LEFT JOIN acc_pessoa AS p ON p.seg_usuario_id = u.id
                            WHERE p.id = ?");
  $stmt->bindValue(1, $id_patrocinador);
  $stmt->execute();
  $dados_patrocinador = $stmt->fetch(PDO::FETCH_ASSOC);
  
  // ENVIANDO E-MAIL PARA O USUÁRIO
  $mensagem_usuario = "O seu cadastro foi validado com sucesso!";
  email($dados_usuario['email'], "", $mensagem_usuario, utf8_decode("Cadastro Validado"));
  
  // ENVIANDO E-MAIL PARA O PATROCINADOR
  $mensagem_patrocinador = "O cadastro do usuário " . $dados_usuario['nome'] . " com você como patrocinador foi validado com sucesso!";
  email($dados_patrocinador['email'], "", $mensagem_patrocinador, utf8_decode("Cadastro Validado"));
  
  if (@is_numeric($_SESSION['id'])) {
    echo "<script language='javaScript'>window.location.href='" . ConstantesAcreCompras::$PORTAL_URL . "dashboard'</script>";
  }
} else {
  $email_valido = false;
}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<title><?= ConstantesAcreCompras::$TITULOSISTEMA; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/animate.min.css" rel="stylesheet" type="text/css" />
<!-- END CORE CSS FRAMEWORK -->
<!-- BEGIN CSS TEMPLATE -->
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/style.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/responsive.css" rel="stylesheet" type="text/css" />
<link href="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>css/custom-icon-set.css" rel="stylesheet" type="text/css" />
<!-- END CSS TEMPLATE -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="error-body no-top lazy"  data-original="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg"  style="background-image: url('<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/work.jpg')">
  <form action="#" method="post" id="form_validacao_email" name="form_validacao_email" class="animated fadeIn">
    <div class="container">
      <div class="row login-container animated fadeInUp">
        <div class="col-md-7 col-md-offset-2 tiles white no-padding">
          <div class="p-t-30 p-l-40 p-b-20 xs-p-t-10 xs-p-l-10 xs-p-b-10">
                            <?php
                            if ($email_valido) {
                              ?>
                                <h1 class="normal">Seu email está confirmado</h1>
            <p class="p-b-20">Agora você já pode efetuar transações no Acre Compras</p>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>acesso">
              <button type="button" class="btn btn-info btn-cons" id="usuario_redefinir_senha">Acessar sua conta</button>
            </a>
                                <?php
                            } else {
                              ?>
                                <h1 class="normal">Seu código de verificação está inválido</h1>
            <p class="p-b-20">Solicite agora um novo código de validação para o seu e-mail</p>
            <div class="form-group">
              <label for="usuario_login">Email</label>
              <div id="div_usuario_email" class="input-group">
                <span class="input-group-addon">
                  <i class="fa fa-envelope-o"></i>
                </span>
                <input required="true" name="usuario_email" id="usuario_email" type="email" class="form-control" placeholder="Email de sua conta">
              </div>
            </div>
            <button type="submit" class="btn btn-info btn-cons" id="usuario_redefinir_senha">Enviar código de validação</button>

                                <?php
                            }
                            ?>          
                        </div>
        </div>
      </div>
    </div>
  </form>
  <!-- END CONTAINER -->
  <!-- BEGIN CORE JS FRAMEWORK-->
  <script src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-1.8.3.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/boostrapv3/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/pace/pace.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>plugins/jquery-lazyload/jquery.lazyload.min.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$JS_FOLDER ?>livequery.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>util/projeto.utils.js" type="text/javascript"></script>
  <script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/acesso_validacao_email.js" type="text/javascript"></script>
  <!-- BEGIN CORE TEMPLATE JS -->
  <!-- END CORE TEMPLATE JS -->
</body>
</html>
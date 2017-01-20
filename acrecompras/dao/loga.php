<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

$db = Conexao::getInstance();

$usuario_login = '';
$usuario_senha = '';
$usuario_manter_logado = 0;
$codigo_logado = '';
$logaCookie = false;
$mensagem = "";
$error = false;
$msg = [ ];

if (isset($_POST['acesso_usuario_login'])) {
  $usuario_login = @$_POST['acesso_usuario_login'];
  $usuario_senha = @$_POST['acesso_usuario_senha'];
  $usuario_manter_logado = @$_POST['usuario_manter_conectado'];
} else if (isset($_COOKIE['acc_id']) && isset($_COOKIE['acc_cod_logado'])) {
  $usuario_login = $_COOKIE['acc_id'];
  $usuario_senha = $_COOKIE['acc_cod_logado'];
  $usuario_manter_logado = 1;
  $logaCookie = true;
}

try {
  
  $db->beginTransaction();
  
  if (!$logaCookie) {
    $stmt = $db->prepare("SELECT *
                          FROM seg_usuario
                          WHERE (email = ? OR nickname = ? OR contato_1 = ? OR contato_2 = ? OR contato_3 = ?) 
                          AND senha = ? AND seg_usuario_status_id = 1");
    $stmt->bindValue(1, $usuario_login);
    $stmt->bindValue(2, $usuario_login);
    $stmt->bindValue(3, $usuario_login);
    $stmt->bindValue(4, $usuario_login);
    $stmt->bindValue(5, $usuario_login);
    $stmt->bindValue(6, sha1($usuario_senha));
  } else {
    $stmt = $db->prepare("SELECT *
                          FROM seg_usuario
                          WHERE id = ? AND senha_codigo_manter_logado = ? AND seg_usuario_status_id = 1");
    $stmt->bindValue(1, $usuario_login);
    $stmt->bindValue(2, $usuario_senha);
  }
  
  $stmt->execute();
  if ($stmt->rowCount() > 0) {
    
    $dados_usuario = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $id = $dados_usuario['id'];
    // CRIAR O TIMEOUT DA SESSÃO PARA EXPIRAR
    $_SESSION['acc_timeout'] = time();
    // CRIAR AS SESSÕES DO USUARIO
    $_SESSION['acc_id'] = $id;
    $_SESSION['acc_nome'] = ($dados_usuario['nome']);
    $_SESSION['acc_email'] = $dados_usuario['email'];
    $_SESSION['acc_login'] = $dados_usuario['login'];
    $_SESSION['acc_nickname'] = ($dados_usuario['nickname']);
    $_SESSION['acc_data_nascimento'] = $dados_usuario['data_nascimento'];
    $_SESSION['acc_tipo_pessoa'] = $dados_usuario['tipo_pessoa'];
    $_SESSION['acc_cpf_cnpj'] = $dados_usuario['cpf_cnpj'];
    $_SESSION['acc_rg_ie'] = $dados_usuario['rg_ie'];
    $_SESSION['acc_rg_orgao_expedidor'] = $dados_usuario['rg_orgao_expedidor'];
    $_SESSION['acc_sexo'] = $dados_usuario['sexo'];
    $_SESSION['acc_estado_civil'] = $dados_usuario['estado_civil'];
    $_SESSION['acc_contato_1'] = $dados_usuario['contato_1'];
    $_SESSION['acc_contato_2'] = $dados_usuario['contato_2'];
    $_SESSION['acc_contato_3'] = $dados_usuario['contato_3'];
    $_SESSION['acc_data_cadastro'] = $dados_usuario['data_cadastro'];
    $_SESSION['acc_status'] = $dados_usuario['seg_usuario_status_id'];
    // STATUS ONLINE -> 1 - ONLINE e 2 - OFFLINE
    $_SESSION['acc_online'] = 1;
    $_SESSION['acc_foto_cut'] = $dados_usuario['foto'];
    $_SESSION['acc_foto_original'] = $dados_usuario['foto_original'];
    // SET COOKIES MANTER LOGADO
    if ($usuario_manter_logado == 1) {
      $codigo_logado = sha1(rand(1, 999) . '' . time());
      setcookie('acc_id', $id, time() + 1259200, '/', '.localhost', false);
      setcookie('acc_cod_logado', $codigo_logado, time() + 1259200, '/', '.localhost', false);
    } else {
      setcookie('acc_id', '');
      setcookie('acc_cod_logado', '');
    }
    
    // CARREGANDO DADOS DA ACC_PESSOA
    $stmt = $db->prepare("SELECT *
                                FROM acc_pessoa
                                WHERE seg_usuario_id = ?");
    $stmt->bindValue(1, $id);
    $stmt->execute();
    
    $dados_acc_pessoa = $stmt->fetch(PDO::FETCH_ASSOC);
    $_SESSION['acc_pessoa_id'] = $dados_acc_pessoa['id'];
    
    if (is_numeric($_SESSION['acc_pessoa_id'])) {
      $stmt = $db->prepare("SELECT *
                                  FROM acc_cliente
                                  WHERE acc_pessoa_id = ?");
      $stmt->bindValue(1, $dados_acc_pessoa['id']);
      $stmt->execute();
      
      $dados_acc_cliente = $stmt->fetch(PDO::FETCH_ASSOC);
      $_SESSION['acc_cliente_id'] = $dados_acc_cliente['id'];
    }
    
    if (is_numeric($_SESSION['acc_pessoa_id'])) {
      // CARREGANDO DADOS DO FORNECEDOR
      $stmt = $db->prepare("SELECT * 
                                FROM acc_fornecedor
                                WHERE acc_pessoa_id = ?");
      $stmt->bindValue(1, $dados_acc_pessoa['id']);
      $stmt->execute();
      
      $dados_fornecedor = $stmt->fetch(PDO::FETCH_ASSOC);
      $_SESSION['acc_fornecedor_id'] = $dados_fornecedor['id'];
    }
    
    // ATUALIZANDO O STATUS ONLINE DO USUARIO
    $stmt = $db->prepare("UPDATE seg_usuario SET status = '1', senha_codigo_manter_logado = ? WHERE id = ?");
    $stmt->bindValue(1, $codigo_logado);
    $stmt->bindValue(2, $id);
    $stmt->execute();
    
    // ATUALIZANDO DADOS DA SESSÃO DO USUÁRIO
    $useragent = $_SERVER['HTTP_USER_AGENT'];
    if (preg_match('|MSIE ([0-9].[0-9]{1,2})|', $useragent, $matched)) {
      $browser_version = $matched[1];
      $browser = 'IE';
    } elseif (preg_match('|Opera/([0-9].[0-9]{1,2})|', $useragent, $matched)) {
      $browser_version = $matched[1];
      $browser = 'Opera';
    } elseif (preg_match('|Firefox/([0-9\.]+)|', $useragent, $matched)) {
      $browser_version = $matched[1];
      $browser = 'Firefox';
    } elseif (preg_match('|Chrome/([0-9\.]+)|', $useragent, $matched)) {
      $browser_version = $matched[1];
      $browser = 'Chrome';
    } elseif (preg_match('|Safari/([0-9\.]+)|', $useragent, $matched)) {
      $browser_version = $matched[1];
      $browser = 'Safari';
    } else {
      $browser_version = 0;
      $browser = 'Desconhecido';
    }
    $separa = explode(";", $useragent);
    $so = $separa[1];
    
    $stmt2 = $db->prepare("UPDATE seg_sessao SET host = ?, navegador = ?, sistema_operacional = ?, data_login = NOW() WHERE seg_usuario_id = ?");
    $stmt2->bindValue(1, $_SERVER["SERVER_NAME"]);
    $stmt2->bindValue(2, $browser . " " . $browser_version);
    $stmt2->bindValue(3, $so);
    $stmt2->bindValue(4, $id);
    $stmt2->execute();
    /*
     * //SALVANDO DADOS DE PERMISSÕES DO MODULO/OBJETO/AÇÃO
     * $stmt = $db->prepare("SELECT m.id, LOWER(m.nome) AS nome
     * FROM seg_modulo m
     * LEFT JOIN seg_usuario_modulo AS um ON um.modulo_id = m.id
     * WHERE um.usuario_id = ? AND um.status = 1");
     * $stmt->bindValue(1, $id);
     * $stmt->execute();
     * $rsModulo = $stmt->fetchAll(PDO::FETCH_OBJ);
     * foreach ($rsModulo AS $kModulo => $vModulo) {
     *
     * $_SESSION['permissao'][$vModulo->nome] = [];
     *
     * $stmt = $db->prepare("SELECT o.id, LOWER(o.nome) AS nome
     * FROM seg_usuario_modulo_objeto_acao AS umoa
     * LEFT JOIN seg_modulo_objeto_acao AS moa ON moa.id = umoa.modulo_objeto_acao_id
     * LEFT JOIN seg_objeto AS o ON o.id = moa.objeto_id
     * WHERE moa.modulo_id = ? AND umoa.usuario_id = ?");
     * $stmt->bindValue(1, $vModulo->id);
     * $stmt->bindValue(2, $id);
     * $stmt->execute();
     * $rsObjeto = $stmt->fetchAll(PDO::FETCH_OBJ);
     *
     * foreach ($rsObjeto AS $kObjeto => $vObjeto) {
     *
     * $_SESSION['permissao'][$vModulo->nome][$vObjeto->nome] = [];
     *
     * $stmt = $db->prepare("SELECT a.id, LOWER(a.nome) AS nome
     * FROM seg_usuario_modulo_objeto_acao AS umoa
     * LEFT JOIN seg_modulo_objeto_acao AS moa ON moa.id = umoa.modulo_objeto_acao_id
     * LEFT JOIN seg_acao AS a ON a.id = moa.acao_id
     * WHERE moa.modulo_id = ? AND moa.objeto_id = ? AND umoa.usuario_id = ?");
     * $stmt->bindValue(1, $vModulo->id);
     * $stmt->bindValue(2, $vObjeto->id);
     * $stmt->bindValue(3, $id);
     * $stmt->execute();
     * $rsAcao = $stmt->fetchAll(PDO::FETCH_OBJ);
     *
     * foreach ($rsAcao AS $kAcao => $vAcao) {
     * $_SESSION['permissao'][$vModulo->nome][$vObjeto->nome][$vAcao->nome] = [];
     * }
     * }
     * }
     */
  } else {
    $error = true;
    $mensagem .= "<span>O login e senha são inválidos.</span>";
    $msg['tipo'] = "login";
  }
  
  if (! $logaCookie) {
    if ($error == false) {
      // MENSAGEM DE SUCESSO
      $db->commit();
      $msg['id'] = $dados_usuario['id'];
      $msg['msg'] = 'success';
      $msg['retorno'] = 'Login realizado com sucesso.';
      echo json_encode($msg);
      exit();
    } else {
      $msg['msg'] = 'error';
      $msg['retorno'] = $mensagem;
      echo json_encode($msg);
      exit();
    }
  } else {
    if ($error == false) {
      // MENSAGEM DE SUCESSO
      $db->commit();
    } else {
      $msg['msg'] = 'error';
      $msg['retorno'] = $mensagem;
    }
  }
} catch ( PDOException $e ) {
  $db->rollback();
  $msg['msg'] = 'error';
  $msg['retorno'] = "Erro ao tentar realizar o login:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
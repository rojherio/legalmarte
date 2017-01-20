
<?php

// ----------------------------------------------------------------------------------------------------------------------------
// PESQUISAR ESTADO PELO ID DA CIDADE
function pesquisar_estado_cidade($campo, $id_cidade) {
  $stmt = "";
  
  // UTILIZANDO O PDO PARA CONEXÃO AO BANCO DE DADOS
  require_once ('acrecompras/util/ConstantesAcreCompras.php');
  include_once ("acrecompras/conn/Conexao.class.php");
  
  $db = Conexao::getInstance();
  
  $sql = $db->prepare("SELECT bsc_estado_id FROM bsc_cidade WHERE id = ?");
  $sql->bindValue(1, $id_cidade);
  $sql->execute();
  $reg1 = $sql->fetch(PDO::FETCH_BOTH);
  
  if ($campo == 'nome') {
    
    $sql = $db->prepare("SELECT nome FROM bsc_estado WHERE id = ?");
    $sql->bindValue(1, $reg1['bsc_estado_id']);
    $sql->execute();
    $reg2 = $sql->fetch(PDO::FETCH_BOTH);
    
    $stmt = $reg2['nome'];
  } else {
    $stmt = $reg1['bsc_estado_id'];
  }
  
  return $stmt;
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO QUE CALCULA A IDADE DE UMA PESSOA PELA DATA INFORMADA
function CalcularIdade($data) {
  
  // Separa em dia, mês e ano
  list ( $dia, $mes, $ano ) = explode('/', $data);
  
  // Descobre que dia é hoje e retorna a unix timestamp
  $hoje = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
  // Descobre a unix timestamp da data de nascimento do fulano
  $nascimento = mktime(0, 0, 0, $mes, $dia, $ano);
  
  // Depois apenas fazemos o cálculo já citado :)
  $idade = floor((((($hoje - $nascimento) / 60) / 60) / 24) / 365.25);
  
  return $idade;
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA REALIZAR QUALQUER TIPO DE PESQUISA NO BANCO E RETORNAR UM VALOR DESEJADO - PODE FAZER ATÉ 4 CONDIÇÕES
function pesquisa($retorno, $tabela, $campo1, $valor1, $campo2, $valor2, $campo3, $valor3, $campo4, $valor4, $operacao) {
  
  // UTILIZANDO O PDO PARA CONEXÃO AO BANCO DE DADOS
  require_once ('acrecompras/util/ConstantesAcreCompras.php');
  include_once ("acrecompras/conn/Conexao.class.php");
  
  $db = Conexao::getInstance();
  
  $sql = $db->prepare("SELECT $retorno FROM $tabela WHERE $campo1 $campo2 $campo3 $campo4 $operacao");
  
  $sql->bindParam(1, $valor1);
  if ($valor2 != "")
    $sql->bindParam(2, $valor2);
  if ($valor3 != "")
    $sql->bindParam(3, $valor3);
  if ($valor4 != "")
    $sql->bindParam(4, $valor4);
  
  $sql->execute();
  
  if ($sql->rowCount() > 0) {
    $l = $sql->fetch(PDO::FETCH_BOTH);
    return $l[$retorno];
  }
  return "vazio"; // Retorna vazio caso não tenha encontrado o resultado desejado
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA FORMATAR O VALOR PARA SALVAR NO BANCO
function real2float($num) {
  $num = str_replace(".", "", $num);
  $num = str_replace(",", ".", $num);
  return $num;
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA FORMATAR O VALOR EM FORMATO DE DINHEIRO
function fdec($numero, $formato = NULL, $tmp = NULL) {
  switch ($formato) {
    case null :
      if ($numero != 0)
        $numero = number_format($numero, 2, ',', '.');
      else
        $numero = '0,00';
      break;
    case '%' :
      if ($numero > 0)
        $numero = number_format((($numero / $tmp) * 100), 2, ',', '.') . '%';
      else
        $numero = '0%';
      break;
    case '-' :
      $numero = "<font color='red'>" . fdec($numero) . "</font>";
      break;
  }
  return $numero;
}

// ----------------------------------------------------------------------------------------------------------------------------
// Função.....: ctexto
// Objetivo...: Converte um texto para primeira letra maiuscula de cada palavra
// Parametros.: $texto-> texto a ser convertido
// $frase-> Indica qual o tipo de conversão que será utilizado
// pal - todas as palavras da sentença
// fra - apenas a 1° letra da sentença
// min - todas no formato minusculo
// mai - todas no formato maiusculos
// Sistema....: Nada
// Retorno....: texto convertido
function ctexto($texto, $frase = 'pal') {
  switch ($frase) {
    case 'fra' : // Apenas a a primeira letra em maiusculo
      $texto = ucfirst(strtolower($texto));
      break;
    case 'min' :
      $texto = strtolower($texto);
      break;
    case 'mai' :
      $texto = strtoupper($texto);
      break;
    case 'pal' : // Todas as palavras com a primeira em maiusculo
      $texto = ucwords(strtolower($texto));
      break;
  }
  return $texto;
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA VALIDAR O CNPJ INFORMADO
function valida_CNPJ($cnpj) {
  $cnpj = preg_replace("@[./-]@", "", $cnpj);
  if (strlen($cnpj) == 14) {
    if (strlen($cnpj) != 14 or ! is_numeric($cnpj)) {
      return 0;
    }
    $j = 5;
    $k = 6;
    $soma1 = "";
    $soma2 = "";
    
    for ($i = 0; $i < 13; $i ++) {
      $j = $j == 1 ? 9 : $j;
      $k = $k == 1 ? 9 : $k;
      $soma2 += ($cnpj{$i} * $k);
      
      if ($i < 12) {
        $soma1 += ($cnpj{$i} * $j);
      }
      $k --;
      $j --;
    }
    
    $digito1 = $soma1 % 11 < 2 ? 0 : 11 - $soma1 % 11;
    $digito2 = $soma2 % 11 < 2 ? 0 : 11 - $soma2 % 11;
    return (($cnpj{12} == $digito1) and ($cnpj{13} == $digito2));
  } else {
    return true;
  }
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA VALIDAR O CPF INFORMADO
function valida_CPF($cpf) {
  if (strlen($cpf) == 14) {
    $cpf = "$cpf";
    if (strpos($cpf, "-") !== false) {
      $cpf = str_replace("-", "", $cpf);
    }
    if (strpos($cpf, ".") !== false) {
      $cpf = str_replace(".", "", $cpf);
    }
    $sum = 0;
    $cpf = str_split($cpf);
    $cpftrueverifier = array ();
    $cpfnumbers = array_splice($cpf, 0, 9);
    $cpfdefault = array (
      10,
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2 
    );
    for ($i = 0; $i <= 8; $i ++) {
      $sum += $cpfnumbers[$i] * $cpfdefault[$i];
    }
    $sumresult = $sum % 11;
    if ($sumresult < 2) {
      $cpftrueverifier[0] = 0;
    } else {
      $cpftrueverifier[0] = 11 - $sumresult;
    }
    $sum = 0;
    $cpfdefault = array (
      11,
      10,
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2 
    );
    $cpfnumbers[9] = $cpftrueverifier[0];
    for ($i = 0; $i <= 9; $i ++) {
      $sum += $cpfnumbers[$i] * $cpfdefault[$i];
    }
    $sumresult = $sum % 11;
    if ($sumresult < 2) {
      $cpftrueverifier[1] = 0;
    } else {
      $cpftrueverifier[1] = 11 - $sumresult;
    }
    $returner = false;
    if ($cpf == $cpftrueverifier) {
      $returner = true;
    }
    
    $cpfver = array_merge($cpfnumbers, $cpf);
    
    if (count(array_unique($cpfver)) == 1 || $cpfver == array (
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      0 
    )) {
      
      $returner = false;
    }
    return $returner;
  } else {
    return true;
  }
}

// ----------------------------------------------------------------------------------------------------------------------------
function dataISO() {
  $hoje = date('Y-m-d');
  return $hoje;
}
function dataISOhora() {
  $hoje = date('Y-m-d H:i:s');
  return $hoje;
}
function hora() {
  $hoje = date('H:i:s');
  return $hoje;
}
function dataBR() {
  $hoje = date('d/m/Y');
  return $hoje;
}
function dataBRhora() {
  $hoje = date('d/m/Y H:i:s');
  return $hoje;
}
function convertDataBR2ISO($data) {
  if ($data == '')
    return false;
  $explodida = explode("/", $data);
  $dataIso = $explodida[2] . "-" . $explodida[1] . "-" . $explodida[0];
  return $dataIso;
}
function convertDataISO2BR($data) {
  $explodida = explode("-", $data);
  $dataIso = $explodida[2] . "/" . $explodida[1] . "/" . $explodida[0];
  return $dataIso;
}
function obterDataBRTimestamp($data) {
  if ($data != '') {
    $data = substr($data, 0, 10);
    $explodida = explode("-", $data);
    $dataIso = $explodida[2] . "/" . $explodida[1] . "/" . $explodida[0];
    return $dataIso;
  }
  return NULL;
}
function obterHoraTimestamp($data) {
  return substr($data, 11, 8);
}
function obterAno($data) {
  return substr($data, 6, 4);
}
function diferencaDias($dataBRinicial, $dataBRfinal = 0) {
  if (! $this->validaDataBR($dataBRinicial))
    return '';
  
  list ( $dia_inicial, $mes_inicial, $ano_inicial ) = explode("/", $dataBRinicial);
  
  if ($dataBRfinal == 0)
    $dataBRfinal = date('d/m/Y');
  list ( $dia_final, $mes_final, $ano_final ) = explode("/", $dataBRfinal);
  
  $inicial = mktime(0, 0, 0, $mes_inicial, $dia_inicial, $ano_inicial);
  $final = mktime(0, 0, 0, $mes_final, $dia_final, $ano_final);
  
  $dias = ($final - $inicial) / 86400;
  
  return $dias;
}
function diferencaHoras($horaInicial, $horaFinal) {
  list ( $hor_i, $min_i ) = explode(":", $horaInicial);
  list ( $hor_f, $min_f ) = explode(":", $horaFinal);
  
  $inicio = ($hor_i * 60) + $min_i;
  $fim = ($hor_f * 60) + $min_f;
  
  $dif = ($fim - $inicio);
  
  return $dif;
}
function somarDias($data, $dias) {
  $data = explode("/", $data);
  $dia = ( int ) $data[0];
  $mes = ( int ) $data[1];
  $ano = ( int ) $data[2];
  $data = date("d/m/Y", mktime(0, 0, 0, $mes, $dia + $dias, $ano));
  
  return $data;
}
function diminuirDias($data, $dias) {
  $data = explode("/", $data);
  $dia = ( int ) $data[0];
  $mes = ( int ) $data[1];
  $ano = ( int ) $data[2];
  $data = date("d-m-Y", mktime(0, 0, 0, $mes, $dia - $dias, $ano));
  return $data;
}
function diaExtenso($dia) {
  $stmtado = "Dia inválido!";
  $dias = array (
    'Domingo',
    'Segunda-Feira',
    'Terça-Feira',
    'Quarta-Feira',
    'Quinta-Feira',
    'Sexta-Feira',
    'Sábado' 
  );
  if (($dia >= 0) && ($dia < 6))
    $stmtado = $dias[$dia];
  return $stmtado;
}
function mesExtenso($mes) {
  $stmtado = "Més inválido";
  $meses = array (
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro" 
  );
  if (($mes >= 0) && ($mes < 11))
    $stmtado = $meses[$mes];
  
  return $stmtado;
}
function dataExtenso($dataBR) {
  $mes = substr($dataBR, 3, 2);
  
  switch ($mes) {
    case 1 :
      $mes = 'Janeiro';
      break;
    case 2 :
      $mes = 'Fevereiro';
      break;
    case 3 :
      $mes = 'Março';
      break;
    case 4 :
      $mes = 'Abril';
      break;
    case 5 :
      $mes = 'Maio';
      break;
    case 6 :
      $mes = 'Junho';
      break;
    case 7 :
      $mes = 'Julho';
      break;
    case 8 :
      $mes = 'Agosto';
      break;
    case 9 :
      $mes = 'Setembro';
      break;
    case 10 :
      $mes = 'Outubro';
      break;
    case 11 :
      $mes = 'Novembro';
      break;
    case 12 :
      $mes = 'Dezembro';
      break;
  }
  
  $msg = "Rio Branco, " . substr($dataBR, 0, 2) . " de $mes de " . substr($dataBR, 6, 4);
  
  return $msg;
}
function diferencaHoraBR($hora1, $data1, $hora2, $data2) {
  if ($data1 == '')
    $data1 = $this->dataISO();
  else
    $data1 = $this->convertDataBR2ISO($data1);
  
  if ($data2 == '')
    $data2 = $this->dataISO();
  else
    $data2 = $this->convertDataBR2ISO($data2);
  
  if ($hora2 == '')
    $hora2 = date('H:i:s');
  
  $valor1 = strtotime("$data1 $hora1");
  $valor2 = strtotime("$data2 $hora2");
  
  return "$valor2 - $valor1";
}
function validaDataBR($dat) {
  if ($dat == '')
    return 0;
  
  $data = explode("/", "$dat");
  $d = $data[0];
  $m = $data[1];
  $y = $data[2];
  
  if (! is_numeric($d) or ! is_numeric($m) or ! is_numeric($y))
    return 0;
  
  $res = checkdate($m, $d, $y);
  if ($res == 1) {
    return 1; // Valida
  } else {
    return 0; // Invalida
  }
}
function diffDate($data_inicial, $data_final) {
  $diff = strtotime($data_final) - strtotime($data_inicial);
  // 24 horas * 60 Min * 60 seg = 86400
  $horas = floor($diff / 3600);
  $minutos = floor(($diff / 60) % 60);
  $segundos = floor($diff % 60);
  return $horas;
}

// ----------------------------------------------------------------------------------------------------------------------------
// FUNÇÃO PARA ENVIAR UM E-MAIL
function email($para, $cc, $mensagem, $assunto) {
  // Inclui o arquivo class.phpmailer.php localizado na pasta phpmailer
  require_once ("acrecompras/assets/plugins/phpmailer/PHPMailerAutoload.php");
  // Inicia a classe PHPMailer
  $mail = new PHPMailer();
  // Define os dados do servidor e tipo de conexão
  // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  $mail->CharSet = "UTF-8";
  $mail->isSMTP(); // Define que a mensagem será SMTP
  $mail->Host = "mail.tudotemdesconto.com"; // Endereço do servidor SMTP
  $mail->SMTPAuth = true; // Usa autenticação SMTP? (opcional)
  $mail->Username = 'contato@tudotemdesconto.com'; // Usuário do servidor SMTP
  $mail->Password = '!Osempnmf25contato'; // Senha do servidor SMTP
                                          // Define o remetente
                                          // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  $mail->From = "contato@tudotemdesconto.com"; // Seu e-mail
  $mail->FromName = "AcreCompras"; // Seu nome
                                   // Define os destinatário(s)
                                   // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                                   // Adicionando copia da mensagem
  if ($cc != "") {
    $dados = explode(";", $cc);
    reset($dados);
    while ( list ( $tp, $id ) = each($dados) ) {
      if ($id != "")
        $mail->AddCC($id); // if para verificar se o email é valido e não está em branco
    }
  }
  
  $mail->AddAddress($para); // E-mail do destinatário
                            // $mail->AddCC('ciclano@site.net', 'Ciclano'); // Copia
                            // $mail->AddBCC('fulano@dominio.com.br', 'Fulano da Silva'); // Cópia Oculta
                            // Define os dados técnicos da Mensagem
                            // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  $mail->IsHTML(true); // Define que o e-mail será enviado como HTML
                       // $mail->CharSet = 'iso-8859-1'; // Charset da mensagem (opcional)
                       // Define a mensagem (Texto e Assunto)
                       // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  $mail->Subject = $assunto; // Assunto da mensagem
  $mail->Body = $mensagem;
  $mail->AltBody = $mensagem;
  // Define os anexos (opcional)
  // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  // $mail->AddAttachment("c:/temp/documento.pdf", "novo_nome.pdf"); // Insere um anexo
  // Exibe uma mensagem de resultado
  if ($mail->send()) {
    return true;
  } else {
    return false;
  }
  // Limpa os destinatários e os anexos
  $mail->ClearAllRecipients();
  $mail->ClearAttachments();
}
?>
    

<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ("acrecompras/conn/Conexao.class.php");
include_once ("acrecompras/dao/generico/funcoes.php");

// BEGIN - Integração com boleto_simples
require_once 'acrecompras/lib/vendor/autoload.php';
error_reporting(E_ALL ^ E_NOTICE);
BoletoSimples::configure(array (
    "environment" => 'sandbox', // default: 'sandbox'
    "access_token" => 'f02bd06ba00834358855101523f47873f5538d0c675c98246889c9dce476c95e'
));
// END - Integração com boleto_simples

$db = Conexao::getInstance();

// $produto = @$_POST['produto'];
// $qtd = real2float(@$_POST["qtd"]);

// $error = false;

// $mensagem = "";

// if ($produto == "" || $qtd == "") {
//   $error = true;
//   $mensagem = "Dados, do Item, inválidos!";
// }

$db->beginTransaction();

try {
  
//   if ($error == false) {
    
//     $stmt = $db->prepare("INSERT INTO acc_orcamento (acc_cliente_id, acc_produto_id, quantidade, data_cadastro, status) VALUES (?, ?, ?, NOW(), 1)");
//     $stmt->bindValue(1, $_SESSION['acc_cliente_id']);
//     $stmt->bindValue(2, $produto);
//     $stmt->bindValue(3, $qtd);
//     $stmt->execute();
    
/****************************************************************************
 * BankBillet.create (success)
 ****************************************************************************/

// $bank_billet = BoletoSimples\BankBillet::create(array (
//   'amount' => 9.01,
//   'description' => 'Despesas Teste',
//   'expire_at' => '2017-01-01',
//   'customer_address' => 'Rua quinhentos',
//   'customer_address_complement' => 'Sala 4',
//   'customer_address_number' => '111',
//   'customer_city_name' => 'Rio de Janeiro',
//   'customer_cnpj_cpf' => '012.345.678-90',
//   'customer_email' => 'cliente@example.com',
//   'customer_neighborhood' => 'Sao Francisco',
//   'customer_person_name' => 'Joao da Silva',
//   'customer_person_type' => 'individual',
//   'customer_phone_number' => '2112123434',
//   'customer_state' => 'RJ',
//   'customer_zipcode' => '12312-123'
// ));
// if($bank_billet->isPersisted()) {
//   echo "Sucesso :)\n";
//   print_r($bank_billet->attributes());
// } else {
//   echo "Erro :(\n";
//   print_r($bank_billet->response_errors);
// }

/****************************************************************************
 * BankBillet.find
 ****************************************************************************/

// $bank_billet_id = 8763;
// $bank_billet = BoletoSimples\BankBillet::find($bank_billet_id);
// print_r($bank_billet->attributes());
// echo json_encode($bank_billet->attributes()['shorten_url']);

/****************************************************************************
 * BankBillet.find
 ****************************************************************************/
  
//     // MENSAGEM DE SUCESSO
    $db->commit();
//     $msg['msg'] = 'success';
//     $msg['retorno'] = 'Item adicionado ao Carrinho com Sucesso.';
//     echo json_encode($msg);
//     exit();
//   } else {
//     $msg['msg'] = 'error';
//     $msg['retorno'] = $mensagem;
//     echo json_encode($msg);
//     exit();
//   }
} catch ( PDOException $e ) {
  $db->rollback();
  $msg['msg'] = 'error';
  $msg['retorno'] = "Erro ao tentar adicionar o Item ao Carrinho:" . $e->getMessage();
  echo json_encode($msg);
  exit();
}
?>
<?php

include('phpQuery-onefile.php');

function simple_curl($url, $post = array(), $get = array()) {
    $url = explode('?', $url, 2);
    if (count($url) === 2) {
        $temp_get = array();
        parse_str($url[1], $temp_get);
        $get = array_merge($get, $temp_get);
    }

    $ch = curl_init($url[0] . "?" . http_build_query($get));
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    return curl_exec($ch);
}

$cep = $_POST['cep'];
$numero = $_POST['numero'];

$html = simple_curl('http://m.correios.com.br/movel/buscaCepConfirma.do', array(
    'cepEntrada' => $cep,
    'tipoCep' => '',
    'cepTemp' => '',
    'metodo' => 'buscarCep'
        ));

phpQuery::newDocumentHTML($html, $charset = 'utf-8');

$dados = array(
    'logradouro' => trim(pq('.caixacampobranco .resposta:contains("Logradouro: ") + .respostadestaque:eq(0)')->html()),
    'bairro' => trim(pq('.caixacampobranco .resposta:contains("Bairro: ") + .respostadestaque:eq(0)')->html()),
    'cidade/uf' => trim(pq('.caixacampobranco .resposta:contains("Localidade / UF: ") + .respostadestaque:eq(0)')->html()),
    'cep' => trim(pq('.caixacampobranco .resposta:contains("CEP: ") + .respostadestaque:eq(0)')->html())
);

$dados['cidade/uf'] = explode('/', $dados['cidade/uf']);
$dados['cidade'] = trim($dados['cidade/uf'][0]);
$dados['uf'] = trim($dados['cidade/uf'][1]);
unset($dados['cidade/uf']);


$lat = "";
$long = "";

$request_url = "http://maps.googleapis.com/maps/api/geocode/xml?address=" . $dados['logradouro'] . " " . $numero . ", " . $dados['bairro'] . ", " . $dados['cidade'] . " " . $dados['uf'] . "&sensor=true";
$xml = simplexml_load_file($request_url) or die("url not loading");
$status = $xml->status;
if ($status == "OK") {
    $lat = $xml->result->geometry->location->lat;
    $long = $xml->result->geometry->location->lng;
}

$msg['latitude'] = "$lat";
$msg['longitude'] = "$long";
$msg['msg'] = 'success';
$msg['uf'] = $dados['uf'];
$msg['cidade'] = $dados['cidade'];
$msg['bairro'] = $dados['bairro'];
$msg['logradouro'] = $dados['logradouro'];
$msg['retorno'] = "Cep encontrado com sucesso.";

echo json_encode($msg);
exit();
?>
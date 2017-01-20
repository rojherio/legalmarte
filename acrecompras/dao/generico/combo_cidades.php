<?php
require_once ('acrecompras/util/ConstantesAcreCompras.php');
include_once ('acrecompras/conn/Conexao.class.php');

$db = Conexao::getInstance();

$estado = $_POST['estado'];

$stmp = $db->prepare("SELECT * FROM bsc_cidade WHERE bsc_estado_id = ? ORDER BY nome ASC");
$stmp->bindValue(1, $estado);
$stmp->execute();

if ($stmp->rowCount() == 0) {
  echo '<option value="">' . htmlentities('Escolha primeiro o Estado') . '</option>';
} else {
  echo '<option value="">' . htmlentities('Escolha uma Cidade') . '</option>';
  while ( $row = $stmp->fetch(PDO::FETCH_ASSOC) ) {
    echo '<option label="' . ($row['nome']) . '" value="' . $row['id'] . '">' . ($row['nome']) . '</option>';
  }
}
?>


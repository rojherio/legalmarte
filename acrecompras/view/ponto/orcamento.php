<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
$retorno_sucesso = isset($_POST['retorno_sucesso']) ? 1 : 0;
$stmt = $db->prepare("SELECT o.id, o.acc_produto_id, o.quantidade, p.nome, p.descricao, p.valor, p.quantidade_ponto 
                      FROM acc_orcamento AS o
                      LEFT JOIN acc_produto AS p ON p.id = o.acc_produto_id
                      WHERE o.status = 1 AND p.status = 1 
                        AND o.acc_cliente_id = ?
                      ORDER BY o.data_cadastro");
$stmt->bindValue(1, $_SESSION['acc_cliente_id']);
$stmt->execute();
$rsProdutos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
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
      <ul class="breadcrumb">
        <li>
          <a href="#">CARRINHO</a>
        </li>
        <li class="active">ORÇAMENTO</li>
      </ul>
      <h3>Carrinho de Compras</h3>
      <!-- BEGIN MSG TOGGLER -->
      <input type="hidden" id="retorno_sucesso" name="retorno_sucesso" value="<?= $retorno_sucesso; ?>" />
      <div id="msg_sucesso" class="alert alert-success" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <span>
          <b>Sucesso:</b>&nbsp;<?= $_POST['retorno_sucesso']; ?></span>
      </div>
      <div id="msg_erro" class="alert alert-error" style="display: none">
        <button class="close" data-dismiss="alert"></button>
        <span>
          <b>Atenção:</b>&nbsp;<?= $_POST['retorno_msg']; ?></span>
      </div>
      <!-- END MSG TOGGLER -->
      <div class="grid simple vertical blue">
        <div class="grid-body">
          <table id="itens" class="table table-hover no-more-tables table-data">
            <thead>
              <tr>
                <th>#</th>
                <th>ITEM</th>
                <th></th>
                <th>QUANTIDADE</th>
                <th>PONTOS/ITEM</th>
                <th>PONTOS SUBTOTAL</th>
                <th>VALOR/ITEM</th>
                <th>VALOR SUBTOTAL</th>
              </tr>
            </thead>
            <tbody>
            <?php
            if (sizeof($rsProdutos) > 0) {
              foreach ( $rsProdutos as $kP => $objP ) {
                ?>
              <tr>
                <td><?= ($kP + 1);?></td>
                <td><?= $objP['descricao'];?></td>
                <td>
                  <button id="btn_item_remove" rel="<?= $objP['id'];?>" class="btn btn-danger btn-font">
                    <i class="fa fa-trash-o"></i>
                    </a>
                
                </td>
                <td id="td_produto_qtd">
                  <input id="produto_qtd" rel="<?= $objP['id'];?>" qtd_last="<?= $objP['quantidade'];?>" class="form-control" type="text" placeholder="Quantidade de pontos" value="<?=fdec($objP['quantidade']);?>">
                </td>
                <td id="td_ponto_unit" rel="<?=$objP['quantidade_ponto'];?>"><?=fdec($objP['quantidade_ponto']);?></td>
                <td id="td_ponto_subtotal"><?=fdec($objP['quantidade_ponto'] * $objP['quantidade']);?></td>
                <td id="td_produto_vlr_unit" rel="<?=$objP['valor'];?>">R$&nbsp;<?=fdec($objP['valor']);?></td>
                <td id="td_produto_vlr_subtotal">R$&nbsp;<?=fdec($objP['valor'] * $objP['quantidade']);?></td>
              </tr>
              <?php
              }
            } else {
              ?>
              <tr>
                <td colspan="8">Você não tem itens adicionados ao carrinho.</td>
              </tr>
              <?php
            }
            ?>
            </tbody>
            <tfoot>
              <tr>
                <th colspan="5" class="text-right">TOTAL DE PONTOS</th>
                <th id="th_ponto_total"></th>
                <th class="text-right">VALOR TOTAL</th>
                <th id="th_vlr_total"></th>
              </tr>
            </tfoot>
          </table>
          <div class="row">
            <div class="col-md-12 text-center">
              <a href="<?= ConstantesAcreCompras::$PORTAL_URL ;?>ponto/showroom" class="btn btn-warning btn-size-200 btn-font">Mais Pontos</a>
              <!--               <a href="#" class="btn btn-success btn-size-200 btn-font">Limpar</a> -->
              <a href="<?= ConstantesAcreCompras::$PORTAL_URL ;?>ponto/comprar" class="btn btn-primary btn-size-200 btn-font">Comprar</a>
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
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/ponto/orcamento.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
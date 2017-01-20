<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
$retorno_sucesso = isset($_POST['retorno_sucesso']) ? 1 : 0;
$stmt = $db->prepare("SELECT id, nome, descricao, valor, quantidade_ponto 
                      FROM acc_produto 
                      WHERE status = 1 
                      ORDER BY quantidade_ponto");
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
  <form id="form_showroom" action="#" method="post">
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
            <a href="#">PONTOS</a>
          </li>
          <li class="active">PACOTES</li>
        </ul>
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
        <?php
        if (sizeof($rsProdutos) > 0) {
          $objP = $rsProdutos[array_search('1', array_column($rsProdutos, 'id'))];
          if (isset($objP)) {
            ?>
        <div class="row">
          <div class="col-md-4">
            <div id="div_pacote" class="pct-pontos">
              <h1 class="price">
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <div class="controls">
                        <input id="produto_qtd" class="form-control" type="text" placeholder="Quantidade de pontos" value="">
                      </div>
                    </div>
                  </div>
                </div>
              </h1>
              <h2><?=$objP['descricao'];?></h2>
              <div class="row">
                <div class="col-md-12 text-center">
                  <a href="#" id="orcamento_add" rel="<?=$objP['id'];?>" custon="true" class="btn">
                    <i class="fa fa-shopping-cart"></i>
                  </a>
                  <a href="#" id="orcamento_finish" rel="<?=$objP['id'];?>" custon="true" class="btn">
                    <i class="fa fa-money"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php
          }
        }
        ?>
<!--       <div class="row"> -->
        <!--         <div class="col-md-4"> -->
        <!--           <div class="pct-pontos"> -->
        <!--             <h1 class="price">1,00</h1> -->
        <!--             <h2>Pontos</h2> -->
        <!--             <div class="row"> -->
        <!--               <div class="col-md-12 text-center"> -->
        <!--                 <a href="#" class="btn"> -->
        <!--                   <i class="fa fa-shopping-cart"></i> -->
        <!--                 </a> -->
        <!--                 <a href="#" class="btn"> -->
        <!--                   <i class="fa fa-money"></i> -->
        <!--                 </a> -->
        <!--               </div> -->
        <!--             </div> -->
        <!--           </div> -->
        <!--         </div> -->
        <!--         <div class="col-md-4"> -->
        <!--           <h4>PACOTE PERSONALIZADO</h4> -->
        <!--           <div class="row"> -->
        <!--             <div class="col-md-12"> -->
        <!--               <div class="form-group"> -->
        <!--                 <label class="form-label">Pontos</label> -->
        <!--                 <div class="controls"> -->
        <!--                   <input class="form-control" type="text" placeholder="Quantidade de pontos"> -->
        <!--                 </div> -->
        <!--               </div> -->
        <!--             </div> -->
        <!--           </div> -->
        <!--           <div class="row"> -->
        <!--             <div class="col-md-12 text-center"> -->
        <!--               <input type="submit" name="" class="btn btn-primary btn-size-200 btn-font" value="Personalizar" /> -->
        <!--             </div> -->
        <!--           </div> -->
        <!--         </div> -->
        <!--       </div> -->
        <div class="row">
        <?php
        foreach ( $rsProdutos as $kP => $objP ) {
          if ($objP['quantidade_ponto'] > 1) {
            ?>
          <div class="col-md-4">
            <div id="div_pacote" class="pct-pontos">
              <h1 class="price"><?=fdec($objP['quantidade_ponto']);?></h1>
              <input id="produto_qtd" class="form-control" type="hidden" value="1">
              <h2><?=$objP['nome'];?></h2>
              <div class="row">
                <div class="col-md-12 text-center">
                  <a href="#" id="orcamento_add" rel="<?=$objP['id'];?>" class="btn">
                    <i class="fa fa-shopping-cart"></i>
                  </a>
                  <a href="#" id="orcamento_finish" rel="<?=$objP['id'];?>" class="btn">
                    <i class="fa fa-money"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <?php
          }
        }
        ?>
        </div>
      </div>
    </div>
  </form>
  <!-- BEGIN CHAT -->
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
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/ponto/showroom.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
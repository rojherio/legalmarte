<?php
require_once ('acrecompras/template/head.php');
$db = Conexao::getInstance();
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
          <a href="#">PONTOS</a>
        </li>
        <li class="active">TRANSFERÊNCIA</li>
      </ul>

      <div class="grid simple">
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="seus-pontos">
                <h3>Seus Pontos</h3>
                <form method="post" action="">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">CPF</label>
                        <div class="controls">
                          <input class="form-control" type="text" value="343.545.545-21" disabled />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">NOME</label>
                        <div class="controls">
                          <input class="form-control" type="text" value="Rojhério Moura Rosas Marinho" disabled />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">SALDO</label>
                        <div class="controls">
                          <input class="form-control" type="text" value="2.000" disabled />
                        </div>
                      </div>
                    </div>
                  </div>
                  <br/>
                  <h5>TRANSFERIR PARA:</h5>
                  <hr/>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">CPF</label>
                        <div class="controls">
                          <input class="form-control" type="text" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">NOME</label>
                        <div class="controls">
                          <input class="form-control" type="text" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">QTD. PONTOS</label>
                        <div class="controls">
                          <input class="form-control" type="text" />
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                      <div class="form-group">
                        <div class="controls">
                          <input class="form-control text-center" type="password" name="senha" id="senha" placeholder="Senha" />
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-12 text-center">
                      <input type="submit" class="btn btn-success btn-font btn-size-200" value="Limpar">
                      <input type="submit" class="btn btn-primary btn-font btn-size-200" value="Transferir">
                      <input type="submit" class="btn btn-danger btn-font btn-size-200" value="Cancelar">
                    </div>
                  </div>

                </form>
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
<script src="<?= ConstantesAcreCompras::$PORTAL_FOLDER ?>js/produto/showroom.js" type="text/javascript"></script>
<!-- BEGIN CUSTON JS -->
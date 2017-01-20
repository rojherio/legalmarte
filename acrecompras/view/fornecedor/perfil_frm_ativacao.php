<?php
$stmt = $db->prepare("SELECT f.status, fs.id AS status_id, fs.nome, fs.descricao, fs.class 
                        FROM acc_fornecedor AS f 
                        LEFT JOIN acc_fornecedor_status AS fs ON fs.id = f.acc_fornecedor_status_id 
                        WHERE f.id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_ativacao = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<form id="fornecedor_ativacao" name="fornecedor_ativacao" action="#parametrosAtivacao" method="post">
  <div class="row">
    <div class="col-md-6">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Ativação</span>
          </h4>
          <h5>
            <span class="label label-<?=$dados_ativacao['class']?>"><?=strtoupper($dados_ativacao['nome']);?></span>
          </h5>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="row-fluid">
                <div class="checkbox check-success ">
                <?php
                if ($dados_ativacao['status_id'] > 1) {
                  ?>
                  <input id="usuario_ativacao" type="checkbox" value="2" name="status" <?= in_array($dados_ativacao['status_id'], [2, 3]) ? 'checked="true"' : '' ?>>
                  <label for="usuario_ativacao">Solicitar Ativação</label>
                  <?php
                } else {
                  ?>
                  <input id="usuario_ativacao" type="checkbox" value="5" name="status" <?= $dados_ativacao['status_id'] == 5 ? 'checked="true"' : '' ?>>
                  <label for="usuario_ativacao">Inativar</label>
                  <?php
                }
                ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="usuario_ativacao_contrato" class="form-label">
                Ao ativar este Fornecedor, você concorda com o
                <strong>
                  <a href="<?= Constantes::$ASSETS_FOLDER ?>documentos/termo-de-uso.pdf" target="_blank">Contrato</a>
                </strong>
                de serviços.
              </label>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-12 text-center">
              <div id="div_loader_ativacao" style="display: none">
                <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/loading.gif" />
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-12 text-center">
              <button type="submit" class="btn btn-info btn-cons" id="dados_bancario_usuario">Salvar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  <input type="hidden" id="fornecedor_id" name="fornecedor_id" value="<?= $param ?>" />
</form>
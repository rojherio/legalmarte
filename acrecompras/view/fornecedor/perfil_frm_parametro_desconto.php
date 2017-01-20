<?php
$stmt = $db->prepare("SELECT *
                      FROM acc_fornecedor_desconto
                      WHERE acc_fornecedor_id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$rsParamDescontos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<form id="fornecedor_parametro" name="fornecedor_parametro" action="#" method="post">
  <div class="row">
    <div class="col-md-8">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Parâmetros
            <span class="semi-bold">Desconto</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <?php
          for ($contador = 0; $contador < 4; $contador ++) {
            ?>
            <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_param_pct_<?= $contador+1; ?>" class="form-label">Percentual de Desconto (%)</label>
                <div id="div_fornecedor_param_pct_<?= $contador+1; ?>" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="fornecedor_param_pct_<?= $contador+1; ?>" id="fornecedor_param_pct_<?= $contador+1; ?>" class="form-control param_pct" data-v-min="0" data-v-max="99.99" placeholder="Percentual desconto" value="<?= isset($rsParamDescontos[$contador]) ? $rsParamDescontos[$contador]['pct'] : ''; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_param_vlr_min_<?= $contador+1; ?>" class="form-label">Valor mínimo para desconto</label>
                <div id="div_fornecedor_param_vlr_min_<?= $contador+1; ?>" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="fornecedor_param_vlr_min_<?= $contador+1; ?>" id="fornecedor_param_vlr_min_<?= $contador+1; ?>" class="form-control param_vlr_min" placeholder="Valor mínimo para desconto" value="<?= isset($rsParamDescontos[$contador]) ? fdec($rsParamDescontos[$contador]['limite_inicio']) : ''; ?>">
                </div>
              </div>
            </div>
          </div>
          <hr>
            <?php
          }
          ?>
          <div class="row">
            <div class="col-md-12">
              <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-info btn-cons" id="dados_fornecedor_parametro">Salvar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="fornecedor_id" name="fornecedor_id" value="<?= $param ?>" />
</form>
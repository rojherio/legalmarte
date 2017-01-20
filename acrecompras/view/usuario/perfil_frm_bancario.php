<?php
$stmt = $db->prepare("SELECT *
                        FROM acc_cliente_bancario
                        WHERE acc_cliente_id = ? AND bsc_tipo_bancario_id = 1");
$stmt->bindValue(1, $_SESSION['acc_cliente_id']);
$stmt->execute();
$dados_bancario = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<form id="usuario_bancario" name="usuario_bancario" action="#dadosBancarios" method="post">
  <div class="row">
    <div class="col-md-6">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Bancários</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_bancario_banco" class="form-label">Banco</label>
                <div id="div_usuario_bancario_banco" class="left">
                  <i class=""></i>
                  <select required="true" name="usuario_bancario_banco" id="usuario_bancario_banco" class="select2 form-control">
                    <option value="">Selecione o Banco</option>
                      <?php
                      $stmt = $db->prepare("SELECT *  
                                             FROM bsc_banco 
                                             ORDER BY codigo ASC");
                      $stmt->execute();
                      while ( $banco = $stmt->fetch(PDO::FETCH_ASSOC) ) {
                        if ($dados_bancario['bsc_banco_id'] == $banco['id']) {
                          ?>
                              <option selected='true' value='<?= $banco['id']; ?>'><?= ($banco['codigo'].'-'.$banco['nome']); ?></option>
                              <?php
                        } else {
                          ?>
                              <option value='<?= $banco['id']; ?>'><?= ($banco['codigo'].'-'.$banco['nome']); ?></option>
                              <?php
                        }
                      }
                      ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="form-group">
                <label for="usuario_bancario_agencia" class="form-label">Agência</label>
                <div id="div_usuario_bancario_agencia" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="usuario_bancario_agencia" id="usuario_bancario_agencia" class="form-control" placeholder="Agência" value="<?= $dados_bancario['agencia']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label for="usuario_bancario_agencia_dv" class="form-label">Agência dv</label>
                <div id="div_usuario_bancario_agencia_dv" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="usuario_bancario_agencia_dv" maxlength="1" id="usuario_bancario_agencia_dv" class="form-control" placeholder="dv" value="<?= $dados_bancario['agencia_dv']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="form-group">
                <label for="usuario_bancario_conta" class="form-label">Conta</label>
                <div id="div_usuario_bancario_conta" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="usuario_bancario_conta" id="usuario_bancario_conta" class="form-control" placeholder="Conta" value="<?= $dados_bancario['conta']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label for="usuario_bancario_conta_dv" class="form-label">Conta dv</label>
                <div id="div_usuario_bancario_conta_dv" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="usuario_bancario_conta_dv" maxlength="1" id="usuario_bancario_conta_dv" class="form-control" placeholder="dv" value="<?= $dados_bancario['conta_dv']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_bancario_tipo_conta" class="form-label">Tipo de conta</label>
                <div id="div_usuario_bancario_tipo_conta" class="left">
                  <i class=""></i>
                  <select required="true" name="usuario_bancario_tipo_conta" id="usuario_bancario_tipo_conta" class="select2 form-control">
                    <option value="">Selecione o tipo de Conta</option>
                                        <?php
                                        if ($dados_bancario['tipo_conta'] == 1) {
                                          ?>
                                            <option selected="true" value='1'>Conta Corrente</option>
                    <option value='2'>Conta Poupança</option>
                                            <?php
                                        } else if ($dados_bancario['tipo_conta'] == 2) {
                                          ?>
                                            <option value='1'>Conta Corrente</option>
                    <option selected="true" value='2'>Conta Poupança</option>
                                            <?php
                                        } else {
                                          ?>
                                            <option value='1'>Conta Corrente</option>
                    <option value='2'>Conta Poupança</option>
                                            <?php
                                        }
                                        ?>

                                    </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_bancario_variacao" class="form-label">Variação</label>
                <div id="div_usuario_bancario_variacao" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="usuario_bancario_variacao" id="usuario_bancario_variacao" class="form-control" placeholder="Variação" value="<?= $dados_bancario['variacao']; ?>">
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
</form>
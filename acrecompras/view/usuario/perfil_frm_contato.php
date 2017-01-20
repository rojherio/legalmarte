<?php
$stmt = $db->prepare("SELECT *
                        FROM seg_usuario
                        WHERE id = ?");
$stmt->bindValue(1, $_SESSION['acc_id']);
$stmt->execute();
$dados_tel = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT *
                        FROM bsc_usuario_endereco
                        WHERE seg_usuario_id = ? AND bsc_tipo_endereco_id = 1");
$stmt->bindValue(1, $_SESSION['acc_id']);
$stmt->execute();
$dados_contato = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<form id="usuario_contato" name="usuario_contato" action="#dadosContato" method="post">
  <div class="row">
    <div class="col-md-7">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Endereço</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="endereco_logradouro" class="form-label">Logradouro</label>
                <div id="div_endereco_logradouro" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="endereco_logradouro" id="endereco_logradouro" class="form-control" placeholder="Logradouro" value="<?= $dados_contato['logradouro']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                <label for="endereco_numero" class="form-label">Número</label>
                <div id="div_endereco_numero" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="endereco_numero" id="endereco_numero" class="form-control" placeholder="Número" value="<?= $dados_contato['numero']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="form-group">
                <label for="endereco_complemento" class="form-label">Complemento</label>
                <div id="div_endereco_complemento" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="endereco_complemento" id="endereco_complemento" class="form-control" placeholder="Complemento" value="<?= $dados_contato['complemento']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_cep" class="form-label">CEP</label>
                <div id="div_endereco_cep" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input maxlength="10" type="text" name="endereco_cep" id="endereco_cep" class="form-control" placeholder="CEP" value="<?= $dados_contato['cep']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_bairro" class="form-label">Bairro</label>
                <div id="div_endereco_bairro" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="endereco_bairro" id="endereco_bairro" class="form-control" placeholder="Bairro" value="<?= $dados_contato['bairro']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_estado" class="form-label">Estado</label>
                <div id="div_endereco_estado" class="left">
                  <i class=""></i>
                  <select required="true" name="endereco_estado" id="endereco_estado" class="select2 form-control">
                    <option value="">Selecione o Estado</option>
                                        <?php
                                        $estado_id = pesquisar_estado_cidade("id", $dados_contato['bsc_cidade_id']);
                                        $stmt = $db->prepare("SELECT nome, id, sigla 
                                                 FROM bsc_estado 
                                                 ORDER BY nome ASC");
                                        $stmt->execute();
                                        while ( $estado = $stmt->fetch(PDO::FETCH_ASSOC) ) {
                                          if ($estado_id == $estado['id']) {
                                            ?>
                                                <option label='<?= $estado['sigla']; ?>' selected='true' value='<?= $estado['id']; ?>'><?= ($estado['nome']); ?></option>
                                                <?php
                                          } else {
                                            ?>
                                                <option label='<?= $estado['sigla']; ?>' value='<?= $estado['id']; ?>'><?= ($estado['nome']); ?></option>
                                                <?php
                                          }
                                        }
                                        ?>
                                    </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_cidade" class="form-label">Cidade</label>
                <div id="div_endereco_cidade" class="left">
                  <i class=""></i>
                  <select required="true" name="endereco_cidade" id="endereco_cidade" class="select2 form-control">
                    <option value="">Selecione primeiro o Estado</option>
                                        <?php
                                        $stmt = $db->prepare("SELECT nome, id 
                                                 FROM bsc_cidade
                                                 ORDER BY nome ASC");
                                        $stmt->execute();
                                        while ( $municipio = $stmt->fetch(PDO::FETCH_ASSOC) ) {
                                          if ($dados_contato['bsc_cidade_id'] == $municipio['id']) {
                                            ?>
                                                <option selected='true' value='<?= $municipio['id']; ?>'><?= ($municipio['nome']); ?></option>
                                                <?php
                                          }
                                        }
                                        ?>
                                    </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-5">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Telefone</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_contato_1" class="form-label">Celular</label>
                <div id="div_usuario_contato_1" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="usuario_contato_1" id="usuario_contato_1" class="form-control" maxlength="15" placeholder="Celular" value="<?= $dados_tel['contato_1']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_contato_2" class="form-label">Residencial</label>
                <div id="div_usuario_contato_2" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="usuario_contato_2" id="usuario_contato_2" class="form-control" maxlength="15" placeholder="Residencial" value="<?= $dados_tel['contato_2']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_contato_3" class="form-label">Comercial</label>
                <div id="div_usuario_contato_3" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="usuario_contato_3" id="usuario_contato_3" class="form-control" maxlength="15" placeholder="Comercial" value="<?= $dados_tel['contato_3']; ?>">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="col-md-12 text-center">
        <button type="submit" class="btn btn-info btn-cons" id="dados_contato_usuario">Salvar</button>
      </div>
    </div>
  </div>
</form>
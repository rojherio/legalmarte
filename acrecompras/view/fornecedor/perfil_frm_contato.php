<?php
$stmt = $db->prepare("SELECT *
                        FROM acc_fornecedor AS f
                        WHERE f.id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_fornecedor = $stmt->fetch(PDO::FETCH_ASSOC);

$_SESSION['acc_fornecedor_id'] = $param;

$stmt = $db->prepare("SELECT *
                        FROM acc_fornecedor_endereco
                        WHERE acc_fornecedor_id = ?");
$stmt->bindValue(1, $param);
$stmt->execute();
$dados_fornecedor_endereco = $stmt->fetch(PDO::FETCH_ASSOC);

if (isset($_POST['retorno_sucesso'])) {
  $retorno_sucesso = 1;
} else {
  $retorno_sucesso = 0;
}
?>
<input type="hidden" id="retorno_sucesso" name="retorno_sucesso" value="<?= $retorno_sucesso; ?>" />
<div id="msg_sucesso" class="alert alert-success" style="display: none">
  <button class="close" data-dismiss="alert"></button>
  <b>Success:</b>&nbsp;<?= $_POST['retorno_sucesso']; ?>
</div>
<div id="msg_erro" class="alert alert-error" style="display: none">
  <button class="close" data-dismiss="alert"></button>
  <b>Danger:</b>
  &nbsp;Erro ao tentar atualizar os dados pessoais.
</div>
<form id="fornecedor_contato" name="fornecedor_contato" action="#dadosContato" method="post">
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Apresentação ao Cliente</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_nome_fantasia" class="form-label">Nome Fantasia</label>
                <div id="div_fornecedor_nome_fantasia" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="fornecedor_nome_fantasia" id="fornecedor_nome_fantasia" class="form-control" placeholder="Nome fantasia" value="<?= $dados_fornecedor['nome_fantasia']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_razao_social" class="form-label">Razão Social</label>
                <div id="div_fornecedor_razao_social" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="fornecedor_razao_social" id="fornecedor_razao_social" class="form-control" placeholder="Razão Social" value="<?= $dados_fornecedor['razao_social']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_email" class="form-label">Email</label>
                <div id="div_fornecedor_email" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="email" name="fornecedor_email" id="fornecedor_email" class="form-control" placeholder="Email" value="<?= $dados_fornecedor['email']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="fornecedor_site" class="form-label">Site</label>
                <div id="div_fornecedor_site" class="input-with-icon left">
                  <i class="fa fa-calendar"></i>
                  <input type="text" name="fornecedor_site" id="fornecedor_site" class="form-control" placeholder="Site" value="<?= $dados_fornecedor['site']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                <label for="fornecedor_contato_1" class="form-label">Celular</label>
                <div id="div_fornecedor_contato_1" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="fornecedor_contato_1" id="fornecedor_contato_1" class="form-control" maxlength="15" placeholder="Celular" value="<?= $dados_fornecedor['contato_1']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label for="fornecedor_contato_2" class="form-label">Comercial</label>
                <div id="div_fornecedor_contato_2" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="fornecedor_contato_2" id="fornecedor_contato_2" class="form-control" maxlength="15" placeholder="Residencial" value="<?= $dados_fornecedor['contato_2']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label for="fornecedor_contato_3" class="form-label">Fax</label>
                <div id="div_fornecedor_contato_3" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="fornecedor_contato_3" id="fornecedor_contato_3" class="form-control" maxlength="15" placeholder="Comercial" value="<?= $dados_fornecedor['contato_3']; ?>">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Endereço</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_cep" class="form-label">CEP</label>
                <div class="row">
                  <div class="col-md-10">
                    <div id="div_endereco_cep" class="input-with-icon left">
                      <i class="fa fa-keyboard-o"></i>
                      <input onkeyup="consultacep()" required="true" type="text" name="endereco_cep" id="endereco_cep" class="form-control" placeholder="CEP" value="<?= $dados_fornecedor_endereco['cep']; ?>">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div id="div_loader" style="display: none">
                      <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>img/loading.gif" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="endereco_logradouro" class="form-label">Logradouro</label>
                <div id="div_endereco_logradouro" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="endereco_logradouro" id="endereco_logradouro" class="form-control" placeholder="Logradouro" value="<?= $dados_fornecedor_endereco['logradouro']; ?>">
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
                  <input onchange="consultacep()" required="true" type="text" name="endereco_numero" id="endereco_numero" class="form-control" placeholder="Número" value="<?= $dados_fornecedor_endereco['numero']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="form-group">
                <label for="endereco_complemento" class="form-label">Complemento</label>
                <div id="div_endereco_complemento" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="endereco_complemento" id="endereco_complemento" class="form-control" placeholder="Complemento" value="<?= $dados_fornecedor_endereco['complemento']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="endereco_bairro" class="form-label">Bairro</label>
                <div id="div_endereco_bairro" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" type="text" name="endereco_bairro" id="endereco_bairro" class="form-control" placeholder="Bairro" value="<?= $dados_fornecedor_endereco['bairro']; ?>">
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
                      $estado_id = pesquisar_estado_cidade("id", $dados_fornecedor_endereco['bsc_cidade_id']);
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
                        if ($dados_fornecedor_endereco['bsc_cidade_id'] == $municipio['id']) {
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
    <div class="col-md-6">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Localização</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_latitude" class="form-label">Latitude</label>
                <div id="div_endereco_latitude" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="endereco_latitude" id="endereco_latitude" class="form-control" placeholder="Latitude" value="<?= $dados_fornecedor_endereco['latitude']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="endereco_longitude" class="form-label">Longitude</label>
                <div id="div_endereco_longitude" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input type="text" name="endereco_longitude" id="endereco_longitude" class="form-control" placeholder="Longitude" value="<?= $dados_fornecedor_endereco['longitude']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div id="map" class="demo-map overlay-fixed"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="col-md-12 text-center">
        <button type="submit" class="btn btn-info btn-cons" id="dados_pessoais_usuario">Salvar</button>
      </div>
    </div>
  </div>
  <input type="hidden" id="fornecedor_id" name="fornecedor_id" value="<?= $param ?>" />
  <input type="hidden" id="fornecedor_endereco_id" name="fornecedor_endereco_id" value="<?= $dados_fornecedor_endereco['id'] ?>" />
</form>
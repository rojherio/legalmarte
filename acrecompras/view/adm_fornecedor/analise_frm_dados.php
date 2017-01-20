<form id="fornecedor_dados" name="fornecedor_dados" action="#dados" method="post">
<div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Fornecedor
            <span class="semi-bold">Dados e Informações</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Nome Fantasia: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['nome_fantasia']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_nome_fantasia" value="1" type="checkbox">
                <label for="campo_nome_fantasia">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Razão Social: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['razao_social']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_razao_social" value="1" type="checkbox">
                <label for="campo_razao_social">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Email: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['email']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_email" value="1" type="checkbox">
                <label for="campo_email">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Site: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['site']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_site" value="1" type="checkbox">
                <label for="campo_site">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Celular: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['contato_1']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_celular" value="1" type="checkbox">
                <label for="campo_celular">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Comercial: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['contato_2']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_comercial" value="1" type="checkbox">
                <label for="campo_comercial">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Fax: </b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor['contato_3']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_fax" value="1" type="checkbox">
                <label for="campo_fax">Divergência</label>
              </div>
            </div>
          </label>
        </div>
        <br />

        <div class="grid-title no-border">
          <h4>
            Fornecedor
            <span class="semi-bold">Endereço</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>CEP:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['cep']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_cep" value="1" type="checkbox">
                <label for="campo_cep">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Logradouro:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['logradouro'].', '.$dados_fornecedor_endereco['numero']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_logradouro" value="1" type="checkbox">
                <label for="campo_logradouro">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Complemento:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['complemento']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_complemento" value="1" type="checkbox">
                <label for="campo_complemento">Divergência</label>
              </div>
            </div>
          </label>
          
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Bairro:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['bairro']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_bairro" value="1" type="checkbox">
                <label for="campo_bairro">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Cidade:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['cidade_nome'].' - '.$dados_fornecedor_endereco['estado_sigla']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_cidade" value="1" type="checkbox">
                <label for="campo_cidade">Divergência</label>
              </div>
            </div>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Localização</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Latitude:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['latitude']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_latitude" value="1" type="checkbox">
                <label for="campo_latitude">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Longitude:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_fornecedor_endereco['longitude']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_longitude" value="1" type="checkbox">
                <label for="campo_longitude">Divergência</label>
              </div>
            </div>
          </label>
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
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Bancários</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Banco:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $banco['id']; ?> - <?= ($banco['codigo'].'-'.$banco['nome']); ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_banco" value="1" type="checkbox">
                <label for="campo_banco">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Agência:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['agencia']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_agencia" value="1" type="checkbox">
                <label for="campo_agencia">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Agencia dv:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['agencia_dv']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_agencia_dv" value="1" type="checkbox">
                <label for="campo_agencia_dv">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Conta:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['conta']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_conta" value="1" type="checkbox">
                <label for="campo_conta">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Conta dv:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['conta_dv']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_conta_dv" value="1" type="checkbox">
                <label for="campo_conta_dv">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Tipo de conta:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['conta_dv']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_tipo_conta" value="1" type="checkbox">
                <label for="campo_tipo_conta">Divergência</label>
              </div>
            </div>
          </label>

          <!-- elemento -->
          <label class="row item">
            <div class="col-md-2">
              <span class="titulo"><b>Variação:</b></span>
            </div>
            <div id="resultado" class="col-md-7">
              <span><?= $dados_bancario['variacao']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_variacao" value="1" type="checkbox">
                <label for="campo_variacao">Divergência</label>
              </div>
            </div>
          </label>
        </div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Parâmetros
            <span class="semi-bold">Desconto</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-3">
              <span class="titulo"><b>Percentual de Desconto (%):</b></span>
            </div>
            <div class="col-md-1">
              <span>10%</span>
            </div>
            <div class="col-md-3">
              <span class="titulo"><b>Valor mínimo para desconto:</b></span>
            </div>
            <div id="resultado" class="col-md-2"><span>R$ 1.000,00</span></div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_desconto_1" value="1" type="checkbox">
                <label for="campo_desconto_1">Divergência</label>
              </div>
            </div>
          </label>

             <!-- elemento -->
          <label class="row item">
            <div class="col-md-3">
              <span class="titulo"><b>Percentual de Desconto (%):</b></span>
            </div>
            <div class="col-md-1">
              <span>10%</span>
            </div>
            <div class="col-md-3">
              <span class="titulo"><b>Valor mínimo para desconto:</b></span>
            </div>
            <div id="resultado" class="col-md-2"><span>R$ 1.000,00</span></div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_desconto_2" value="1" type="checkbox">
                <label for="campo_desconto_2">Divergência</label>
              </div>
            </div>
          </label>

     <!-- elemento -->
          <label class="row item">
            <div class="col-md-3">
              <span class="titulo"><b>Percentual de Desconto (%):</b></span>
            </div>
            <div class="col-md-1">
              <span>10%</span>
            </div>
            <div class="col-md-3">
              <span class="titulo"><b>Valor mínimo para desconto:</b></span>
            </div>
            <div id="resultado" class="col-md-2"><span>R$ 1.000,00</span></div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_desconto_3" value="1" type="checkbox">
                <label for="campo_desconto_3">Divergência</label>
              </div>
            </div>
          </label>

             <!-- elemento -->
          <label class="row item">
            <div class="col-md-3">
              <span class="titulo"><b>Percentual de Desconto (%):</b></span>
            </div>
            <div class="col-md-1">
              <span>10%</span>
            </div>
            <div class="col-md-3">
              <span class="titulo"><b>Valor mínimo para desconto:</b></span>
            </div>
            <div id="resultado" class="col-md-2"><span>R$ 1.000,00</span></div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_desconto_4" value="1" type="checkbox">
                <label for="campo_desconto_4">Divergência</label>
              </div>
            </div>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Publicidade</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <!-- elemento -->
          <label class="row item">
            <div class="col-md-3">
              <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER; ?>img/profiles/sem-imagem.jpg" border="0" />
            </div>
            <div class="col-md-2">
              <span class="titulo"><b>Banner:</b></span>
            </div>
            <div id="resultado" class="col-md-4">
              <span><?= $dados_fornecedor['endereco']; ?></span>
            </div>
            <div class="col-md-3">
              <div class="checkbox check-success">
                <input id="campo_foto" value="1" type="checkbox">
                <label for="campo_foto">Divergência</label>
              </div>
            </div>
          </label>

        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            <span class="semi-bold">Observação</span>
          </h4>
        </div>
        <div class="grid-body no-border container-form">
          <div class="row">
            <div class="col-md-12">
              <textarea id="text_editor" placeholder="Enter text ..." class="form-control" rows="10"></textarea>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
  <input type="hidden" id="codigo" name="codigo" value="<?= $param; ?>"/>
    
  <div class="row">
    <div class="col-md-12 text-center">
      <input type="submit" id="solicitar" name="solicitar" status="3" value="Solicitar Correção" class="btn btn-success btn-font btn-size-200" />
      <input type="submit" id="recusar" name="recusar" status="5" value="Recusar" class="btn btn-danger btn-font btn-size-200" />
      <input type="submit" id="aprovar" name="aprovar" status="1" value="Aprovar" class="btn btn-primary btn-font btn-size-200" />
    </div>
  </div>

</form>
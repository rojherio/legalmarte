<form id="fornecedor_acompanhamento" name="fornecedor_acompanhamento" action="#acompanhamento" method="post">
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Fornecedor
            <span class="semi-bold">Acompanhamento</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <h4>Nova Mensagem</h4>
          <form action="" method="post">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="form-label">Assunto</label>
                  <div class="controls">
                    <input class="form-control" type="text">
                  </div>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label class="form-label">Assunto</label>
                  <textarea id="text-editor" placeholder="Enter text ..." class="form-control" rows="10"></textarea>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 text-center">
                <input type="submit" name="" class="btn btn-primary btn-font btn-size-200" value="Enviar" />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</form>

<div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            <span class="semi-bold">Histórico</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <table class="table table-hover no-more-tables table-data">
              <thead>
                  <tr>
                      <th>#</th>
                      <th>DATA</th>
                      <th>E/R</th>
                      <th>ASSUNTO</th>
                      <th>MENSAGEM</th>
                      <th>STATUS</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td>1</td>
                      <td>00/00/0000</td>
                      <td>E</td>
                      <td>Assunto da Mensagem ao Fornecedor</td>
                      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                      <td><span class="label label-success label-size">LIDA</span></td>
                  </tr>
                  <tr>
                      <td>2</td>
                      <td>00/00/0000</td>
                      <td>E</td>
                      <td>Assunto da Mensagem ao Fornecedor</td>
                      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                      <td><span class="label label-primary label-size">ENVIADO</span></td>
                  </tr>
                  <tr>
                      <td>3</td>
                      <td>00/00/0000</td>
                      <td>E</td>
                      <td>Assunto da Mensagem ao Fornecedor</td>
                      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                      <td><span class="label label-warning label-size">RECEBIDO</span></td>
                  </tr>
                  <tr>
                      <td>4</td>
                      <td>00/00/0000</td>
                      <td>E</td>
                      <td>Assunto da Mensagem ao Fornecedor</td>
                      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                      <td><span class="label label-danger label-size">CANCELADO</span></td>
                  </tr>
              </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
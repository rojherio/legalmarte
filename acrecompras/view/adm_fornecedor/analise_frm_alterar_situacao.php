<form id="fornecedor_alterar_situacao" name="fornecedor_alterar_situacao" action="#alterar_situacao" method="post">
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Fornecedor
            <span class="semi-bold">Alterar Situação</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <h4>Status: <strong>Ativo</strong></h4>
          <div class="new-status">
            <h4>Novo Status</h4>
            <form action="" method="post">
              <div class="row">
                <div class="col-md-2">
                  Status:
                </div>
                <div class="col-md-2">
                  <div class="checkbox check-success">
                    <input id="checkbox3" value="1" type="checkbox">
                    <label for="checkbox3">Ativo</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="checkbox check-success">
                    <input id="checkbox3" value="1" type="checkbox">
                    <label for="checkbox3">Inativo</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="checkbox check-success">
                    <input id="checkbox3" value="1" type="checkbox">
                    <label for="checkbox3">Bloqueado</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="checkbox check-success">
                    <input id="checkbox3" value="1" type="checkbox">
                    <label for="checkbox3">Análise</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="checkbox check-success">
                    <input id="checkbox3" value="1" type="checkbox">
                    <label for="checkbox3">Pendente</label>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="form-label">Observação</label>
                    <textarea id="text-editor" placeholder="Observação" class="form-control" rows="10"></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 text-center">
                  <input type="submit" name="" class="btn btn-primary btn-font btn-size-200" value="Alterar Status" />
                </div>
              </div>
            </form>
          </div>
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
                    <th>USUÁRIO</th>
                    <th>OBSERVAÇÃO</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>00/00/0000</td>
                    <td>Rojhério Moura Rosas Marinho</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                    <td><span class="label label-success label-size">LIDA</span></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>00/00/0000</td>
                    <td>Rojhério Moura Rosas Marinho</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                    <td><span class="label label-success label-size">LIDA</span></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>00/00/0000</td>
                    <td>Rojhério Moura Rosas Marinho</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                    <td><span class="label label-success label-size">LIDA</span></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>00/00/0000</td>
                    <td>Rojhério Moura Rosas Marinho</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut beatae ipsa rem explicabo, at maiores eligendi sunt quas. Perspiciatis tempora repudiandae cumque. Odit dicta, harum ab inventore ex sit aperiam.</td>
                    <td><span class="label label-success label-size">LIDA</span></td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
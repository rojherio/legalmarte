<form action="#alterarSenha" method="post" id="usuario_redefinicao" class="animated fadeIn">
  <div class="row">
    <div class="col-md-6">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Alterar
            <span class="semi-bold">Senha</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_senha_atual" class="form-label">Senha atual</label>
                <div id="div_usuario_senha_atual" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" name="usuario_senha_atual" id="usuario_senha_atual" type="password" class="form-control" placeholder="Senha atual">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_senha_nova" class="form-label">Nova senha</label>
                <div id="div_usuario_senha_nova" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" name="usuario_senha_nova" id="usuario_senha_nova" type="password" class="form-control" placeholder="Senha nova">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_senha_confere_nova" class="form-label">Confirme a nova senha</label>
                <div id="div_usuario_senha_confere_nova" class="input-with-icon left">
                  <i class="fa fa-keyboard-o"></i>
                  <input required="true" name="usuario_senha_confere_nova" id="usuario_senha_confere_nova" type="password" class="form-control" placeholder="Redigite a senha nova">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-info btn-cons" id="usuario_redefinir_senha">Redefinir senha</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
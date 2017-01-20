
<form action="#login" method="post" id="usuario_login" name="usuario_login" class="animated fadeIn">
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="acesso_usuario_login">Email ou Telefone</label>
        <div id="div_acesso_usuario_login">
          <input required="true" name="acesso_usuario_login" id="acesso_usuario_login" type="text" class="form-control" placeholder="Email ou telefone">
        </div>
      </div>
    </div>
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="acesso_usuario_senha">Senha</label>
        <div id="div_acesso_usuario_senha">
          <input required="true" name="acesso_usuario_senha" id="acesso_usuario_senha" type="password" class="form-control" placeholder="Senha">
        </div>
      </div>
    </div>
  </div>
  <div class="row p-t-10 m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="control-group  col-md-10">
      <div class="checkbox checkbox check-success">
        <a href="#" id="usuario_problema_toggle">Problemas com acesso?</a>
        &nbsp;&nbsp;
        <input type="checkbox" id="usuario_manter_conectado" name="usuario_manter_conectado" value="1">
        <label for="usuario_manter_conectado">Manter conectado</label>
      </div>
    </div>
  </div>
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-12 col-sm-12 text-center">
      <button type="submit" class="btn btn-success btn-cons" id="usuario_login">Entrar</button>
    </div>
  </div>
</form>

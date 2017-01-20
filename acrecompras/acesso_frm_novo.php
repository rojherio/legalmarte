
<form action="#novo" method="post" id="usuario_novo" name="usuario_novo" class="animated fadeIn" style="display: none">
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="usuario_nickname">Nome de usuário</label>
        <div id="div_usuario_nickname" class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-user"></i>
          </span>
          <input required="true" name="usuario_nickname" id="usuario_nickname" type="text" class="form-control" placeholder="Nome de usuário">
        </div>
      </div>
    </div>
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="usuario_data_nascimento">Data de Nascimento</label>
        <div id="div_usuario_data_nascimento" class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-calendar-o"></i>
          </span>
          <input required="true" name="usuario_data_nascimento" id="usuario_data_nascimento" type="text" class="form-control" placeholder="Data de nascimento">
        </div>
      </div>
    </div>
  </div>
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-12">
      <div class="form-group">
        <label for="usuario_email">E-mail</label>
        <div id="div_usuario_email" class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-envelope-o"></i>
          </span>
          <input required="true" name="usuario_email" id="usuario_email" type="email" class="form-control" placeholder="E-mail">
        </div>
      </div>
    </div>
  </div>
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="usuario_senha">Senha</label>
        <div id="div_usuario_senha" class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-lock"></i>
          </span>
          <input required="true" name="usuario_senha_digitado" id="usuario_senha_digitado" type="password" class="form-control" placeholder="Senha">
        </div>
      </div>
    </div>
    <div class="col-md-6 col-sm-6">
      <div class="form-group">
        <label for="usuario_senha_confere">Confirmar Senha</label>
        <div id="div_usuario_senha_confere" class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-lock"></i>
          </span>
          <input required="true" name="usuario_senha_confere" id="usuario_senha_confere" type="password" class="form-control" placeholder="Redigite a senha">
        </div>
      </div>
    </div>
  </div>
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-12 ">
      <div class="form-group">
        <label for="pessoa_patrocinador">Patrocinador</label>
        <div class="input-group">
          <span class="input-group-addon">
            <i class="fa fa-users"></i>
          </span>
          <select id="pessoa_patrocinador" name="pessoa_patrocinador" placeholder="Escolha o Patrocinador" style="width: 100%">
            <option value="">Escolha o Patrocinador</option>
                        <?php
                        $stmt = $db->prepare("SELECT a.id, u.nome 
                                 FROM acc_pessoa AS a
                                 LEFT JOIN seg_usuario AS u ON u.id = a.seg_usuario_id
                                 WHERE a.status = 1 AND u.nome <> ''
                                 ORDER BY u.nome ASC");
                        $stmt->execute();
                        while ( $patrocinador = $stmt->fetch(PDO::FETCH_ASSOC) ) {
                          ?>
                            <option value='<?= $patrocinador['id']; ?>'><?= ($patrocinador['nome']); ?></option>
                            <?php
                        }
                        ?>
                    </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
    <div class="col-md-12 ">
      <p class="p-b-20">
        Ao clicar em Criar uma conta, você concorda com os nossos
        <strong>
          <a href="<?= Constantes::$ASSETS_FOLDER ?>documentos/termo-de-uso.pdf" target="_blank">Termos de Uso</a>
        </strong>
        e que leu a nossa
        <strong>
          <a href="<?= Constantes::$ASSETS_FOLDER ?>documentos/termo-de-uso.pdf" target="_blank">Política de Privacidade</a>
        </strong>
        .
      </p>
    </div>
    <div class="col-md-12 text-center">
      <button type="submit" class="btn btn-success btn-cons" id="usuario_novo">Criar</button>
    </div>
  </div>
</form>

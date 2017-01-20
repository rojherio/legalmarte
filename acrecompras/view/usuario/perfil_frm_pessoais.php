<?php
$stmt = $db->prepare("SELECT *
                        FROM seg_usuario
                        WHERE id = ?");
$stmt->bindValue(1, $_SESSION['acc_id']);
$stmt->execute();
$dados_pessoais = $stmt->fetch(PDO::FETCH_ASSOC);

$_SESSION['acc_foto_cut'] = $dados_pessoais['foto'];
$_SESSION['acc_foto_origi'] = $dados_pessoais['foto_original'];
?>
<div class="row">
  <div class="col-md-2">
    <!-- CSS DO PLUGIN DE UPLOAD DE FOTOS -->
    <link href="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>upload-fotos/cropper.min.css" rel="stylesheet">
    <link href="<?= ConstantesAcreCompras::$PLUGINS_FOLDER ?>upload-fotos/main.css" rel="stylesheet">
    <!-- FIM DO PLUGIN -->
    <div id="crop-avatar">
      <!-- Current avatar -->
      <div class="avatar-view" style="width: 160px; height: 100%;" title="Trocar o Foto">
                <?php
                if ($_SESSION['acc_foto_cut'] != "") {
                  ?>
                    <img src="<?= $_SESSION['acc_foto_cut']; ?>" alt="Avatar" />
                    <?php
                } else {
                  ?>
                    <img src="<?= ConstantesAcreCompras::$IMG_FOLDER ?>profiles/avatar_male.jpg" alt="Avatar" />
                    <?php
                }
                ?>
            </div>
      <!-- Cropping modal -->
      <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <form class="avatar-form" action="crop.php" enctype="multipart/form-data" method="post">
              <div class="modal-header">
                <button class="close" data-dismiss="modal" type="button">&times;</button>
                <h4 class="modal-title" id="avatar-modal-label">Trocar Foto</h4>
              </div>
              <div class="modal-body">
                <div class="avatar-body">
                  <!-- Upload image and data -->
                  <div class="avatar-upload">
                    <input class="avatar-src" name="avatar_src" type="hidden">
                    <input class="avatar-data" name="avatar_data" type="hidden">
                    <label for="avatarInput">Local upload</label>
                    <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                  </div>
                  <!-- Crop and preview -->
                  <div class="row">
                    <div class="col-md-9">
                      <div class="avatar-wrapper"></div>
                    </div>
                    <div class="col-md-3">
                      <div class="avatar-preview preview-lg"></div>
                      <div class="avatar-preview preview-md"></div>
                      <div class="avatar-preview preview-sm"></div>
                    </div>
                  </div>
                  <div class="row avatar-btns">
                    <div class="col-md-9">
                      <div class="btn-group">
                        <button class="btn btn-primary" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees">Rotate Left</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="-15" type="button">-15deg</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="-30" type="button">-30deg</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="-45" type="button">-45deg</button>
                      </div>
                      <div class="btn-group">
                        <button class="btn btn-primary" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees">Rotate Right</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="15" type="button">15deg</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="30" type="button">30deg</button>
                        <button class="btn btn-primary" data-method="rotate" data-option="45" type="button">45deg</button>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <button class="btn btn-primary btn-block avatar-save" type="submit">Salvar</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--<div class="modal-footer">
                                <button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
                            </div>-->
            </form>
          </div>
        </div>
      </div>
      <!-- /.modal -->
    </div>
  </div>
  <form action="#dadosPessoais" method="post" id="cadastro_perfil" class="animated fadeIn">
    <div class="col-md-5">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Básicos</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_nickname" class="form-label">Nome de Usuário</label>
                <div id="div_usuario_nickname" class="input-with-icon left">
                  <i class="fa fa-user"></i>
                  <input required="true" type="text" name="usuario_nickname" id="usuario_nickname" class="form-control" placeholder="Nome de Usuário" value="<?= $dados_pessoais['nickname']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_nome" class="form-label">Nome Completo</label>
                <div id="div_usuario_nome" class="input-with-icon left">
                  <i class="fa fa-user"></i>
                  <input required="true" type="text" name="usuario_nome" id="usuario_nome" class="form-control" placeholder="Nome Completo" value="<?= $dados_pessoais['nome']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_data_nascimento" class="form-label">Nascimento</label>
                <div id="div_usuario_data_nascimento" class="input-with-icon left">
                  <i class="fa fa-calendar"></i>
                  <input required="true" type="text" name="usuario_data_nascimento" id="usuario_data_nascimento" class="form-control" placeholder="Data de Nascimento" value="<?= obterDataBRTimestamp($dados_pessoais['data_nascimento']); ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_sexo" class="form-label">Sexo</label>
                <div id="div_usuario_sexo" class="left">
                  <i class=""></i>
                  <select required="true" name="usuario_sexo" id="usuario_sexo" class="select2 form-control">
                    <option value="" disabled="true">Selecione o sexo</option>
                    <option value="1" <?= $dados_pessoais['sexo'] == 1 ? 'selected="selected"' : ''; ?>>Masculino</option>
                    <option value="2" <?= $dados_pessoais['sexo'] == 2 ? 'selected="selected"' : ''; ?>>Feminino</option>
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
            <span class="semi-bold">Documentos</span>
          </h4>
        </div>
        <div class="grid-body no-border">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_rg" class="form-label">RG</label>
                <div id="div_usuario_rg" class="input-with-icon left">
                  <i class="fa fa-credit-card"></i>
                  <input required="true" type="text" name="usuario_rg" id="usuario_rg" class="form-control" placeholder="RG" value="<?= $dados_pessoais['rg_ie']; ?>">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="usuario_rg_orgao_expedidor" class="form-label">Órgão Expedidor</label>
                <div id="div_usuario_rg_orgao_expedidor" class="input-with-icon left">
                  <i class="fa fa-credit-card"></i>
                  <input required="true" type="text" name="usuario_rg_orgao_expedidor" id="usuario_rg_orgao_expedidor" class="form-control" placeholder="Órgão Expedidor" value="<?= $dados_pessoais['rg_orgao_expedidor']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_cpf_cnpj" class="form-label">CPF ou CNPJ</label>
                <div id="div_usuario_cpf_cnpj" class="input-with-icon left">
                  <i class="fa fa-credit-card"></i>
                  <input required="true" type="text" name="usuario_cpf_cnpj" id="usuario_cpf_cnpj" class="form-control cpf" maxlength="18" placeholder="CPF ou CNPJ" value="<?= $dados_pessoais['cpf_cnpj']; ?>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="usuario_estado_civil" class="form-label">Estado Civil</label>
                <div id="div_usuario_estado_civil" class="left">
                  <i class=""></i>
                  <select name="usuario_estado_civil" id="usuario_estado_civil" class="select2 form-control">
                    <option value="" disabled="true">Estado Civil</option>
                    <option value="1" <?= $dados_pessoais['estado_civil'] == 1 ? 'selected="selected"' : ''; ?>>Solteiro</option>
                    <option value="2" <?= $dados_pessoais['estado_civil'] == 2 ? 'selected="selected"' : ''; ?>>Casado</option>
                    <option value="3" <?= $dados_pessoais['estado_civil'] == 3 ? 'selected="selected"' : ''; ?>>União Estável</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="col-md-12 text-center">
        <button type="submit" class="btn btn-info btn-cons" id="dados_pessoais_usuario">Salvar</button>
      </div>
    </div>
  </form>
</div>

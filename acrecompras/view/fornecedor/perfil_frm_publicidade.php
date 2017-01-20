<form id="fornecedor_publicidade" name="fornecedor_publicidade" action="#" method="post" enctype="multipart/form-data">
  <div class="row">
    <div class="col-md-12">
      <div class="grid simples agrupar">
        <div class="grid-title no-border">
          <h4>
            Dados
            <span class="semi-bold">Publicidade</span>
          </h4>
        </div>
        <div class="grid-body no-border">
        <?php
        $cont = 1;
        $stmt = $db->prepare("SELECT *
            FROM acc_fornecedor_banner
            WHERE acc_fornecedor_id = ?");
        $stmt->bindValue(1, $param);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
          while ( $dados_fornecedor = $stmt->fetch(PDO::FETCH_ASSOC) ) {
            ?>
          <div id="form_previa" class="row">
            <div class="col-md-3">
              <div class="file-preview">
                <div class="file-drop-disabled" style="width: 100%; height: 140px">
                  <div class="file-preview-thumbnails">
                    <div class="file-default-preview">
                      <img style="width: 100%; height: 140px" id="image_upload_preview" src="../../../<?= $dados_fornecedor['endereco']; ?>">
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="file-preview-status text-center text-success"></div>
                  <div class="kv-fileinput-error"></div>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="fornecedor_banner_endereco_<?= $cont; ?>" class="form-label">Banner</label>
                    <div id="div_fornecedor_banner_endereco_<?= $cont; ?>" class="input-with-icon left">
                      <i class="fa"></i>
                      <div id="file_input_<?= $cont; ?>" class="file-input">
                        <div class="kv-upload-progress hide">
                          <div class="progress">
                            <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" role="progressbar" class="progress-bar progress-bar-success progress-bar-striped active">0%</div>
                          </div>
                        </div>
                        <div class="input-group file-caption-main">
                          <div class="form-control file-caption  kv-fileinput-caption" tabindex="500" style="height: 36px">
                            <div class="file-caption-name" title="<?= $dados_fornecedor['endereco']; ?>"><?= $dados_fornecedor['endereco']; ?></div>
                          </div>
                          <div class="input-group-btn">
                            <button class="btn btn-default fileinput-remove fileinput-remove-button" title="Clear selected files" tabindex="500" type="button" onclick="remover_banner(<?= $cont; ?>)">
                              <span class="hidden-xs">Remove</span>
                            </button>
                          </div>
                        </div>
                      </div>
                      <input type="hidden" value="<?= $dados_fornecedor['endereco']; ?>" id="fornecedor_banner_endereco_<?= $cont; ?>" name="fornecedor_banner_endereco_<?= $cont; ?>">
                    </div>
                  </div>
                </div>
                <div class="col-md-10">
                  <div class="form-group">
                    <label for="fornecedor_banner_nome_<?= $cont; ?>" class="form-label">Descrição</label>
                    <div id="div_fornecedor_banner_nome_<?= $cont; ?>" class="input-with-icon left">
                      <i class="fa"></i>
                      <input type="text" name="fornecedor_banner_nome_<?= $cont; ?>" id="fornecedor_banner_nome_<?= $cont; ?>" class="form-control" placeholder="Descrição" value="<?= $dados_fornecedor['nome']; ?>">
                    </div>
                  </div>
                </div>
                <div class="col-md-1">
                  <div class="form-group">
                    <div class="radio radio-success">
                      <input id="fornecedor_banner_principal_<?= $cont; ?>" type="radio" name="fornecedor_banner_principal" value="<?= $cont; ?>" <?= $dados_fornecedor['principal'] == 1 ? 'checked="true"' : '' ?>>
                      <label for="fornecedor_banner_principal_<?= $cont; ?>">Principal</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr size="1" width="100%" />
          <?php
            $cont ++;
          }
          if ($cont <= 4) {
            for ($contador = $cont; $contador <= 4; $contador ++) {
              ?>
          <div id="form_previa" class="row">
            <div class="col-md-3">
              <div class="file-preview">
                <div class="file-drop-disabled" style="width: 100%; height: 140px">
                  <div class="file-preview-thumbnails">
                    <div class="file-default-preview">
                      <img style="width: 100%; height: 140px" id="image_upload_preview" src="<?= ConstantesAcreCompras::$ASSETS_FOLDER; ?>img/profiles/sem-imagem.jpg">
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="file-preview-status text-center text-success"></div>
                  <div class="kv-fileinput-error"></div>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="fornecedor_banner_endereco_<?= $contador; ?>" class="form-label">Banner</label>
                    <div id="div_fornecedor_banner_endereco_<?= $contador; ?>" class="input-with-icon left">
                      <i class="fa"></i>
                      <input type="file" name="fornecedor_banner_endereco_<?= $contador; ?>" id="fornecedor_banner_endereco_<?= $contador; ?>" class="form-control" placeholder="Banner" value="">
                    </div>
                  </div>
                </div>
                <div class="col-md-10">
                  <div class="form-group">
                    <label for="fornecedor_banner_nome_<?= $contador; ?>" class="form-label">Descrição</label>
                    <div id="div_fornecedor_banner_nome_<?= $contador; ?>" class="input-with-icon left">
                      <i class="fa"></i>
                      <input type="text" name="fornecedor_banner_nome_<?= $contador; ?>" id="fornecedor_banner_nome_<?= $contador; ?>" class="form-control" placeholder="Descrição" value="">
                    </div>
                  </div>
                </div>
                <div class="col-md-1">
                  <div class="form-group">
                    <div class="radio radio-success">
                      <input id="fornecedor_banner_principal_<?= $contador; ?>" type="radio" name="fornecedor_banner_principal" value="<?= $contador; ?>">
                      <label for="fornecedor_banner_principal_<?= $contador; ?>">Principal</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr size="1" width="100%" />
          <?php
            }
          }
        } else {
          $checked = 'checked="true"';
          for ($contador = 1; $contador <= 4; $contador ++) {
            ?>

          <div id="form_previa" class="row">
            <div class="col-md-3">
              <div class="file-preview">
                <div class="file-drop-disabled" style="width: 100%; height: 140px">
                  <div class="file-preview-thumbnails">
                    <div class="file-default-preview">
                      <img style="width: 100%; height: 140px" id="image_upload_preview" src="<?= ConstantesAcreCompras::$ASSETS_FOLDER; ?>img/profiles/sem-imagem.jpg">
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="file-preview-status text-center text-success"></div>
                  <div class="kv-fileinput-error"></div>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="fornecedor_banner_endereco_<?= $contador; ?>" class="form-label">Banner</label>
                  <div id="div_fornecedor_banner_endereco_<?= $contador; ?>" class="input-with-icon left">
                    <i class="fa"></i>
                    <input type="file" name="fornecedor_banner_endereco_<?= $contador; ?>" id="fornecedor_banner_endereco_<?= $contador; ?>" class="form-control" placeholder="Banner" value="">
                  </div>
                </div>
              </div>
              <div class="col-md-10">
                <div class="form-group">
                  <label for="fornecedor_banner_nome_<?= $contador; ?>" class="form-label">Descrição</label>
                  <div id="div_fornecedor_banner_nome_<?= $contador; ?>" class="input-with-icon left">
                    <i class="fa"></i>
                    <input type="text" name="fornecedor_banner_nome_<?= $contador; ?>" id="fornecedor_banner_nome_<?= $contador; ?>" class="form-control" placeholder="Descrição" value="">
                  </div>
                </div>
              </div>
              <div class="col-md-1">
                <div class="radio radio-success">
                  <input <?= $checked; ?> id="fornecedor_banner_principal_<?= $contador; ?>" type="radio" name="fornecedor_banner_principal" value="1">
                  <label for="fornecedor_banner_principal_<?= $contador; ?>">Principal</label>
                </div>
              </div>
            </div>
          </div>
          <hr size="1" width="100%" />
          <?php
            $checked = '';
          }
        }
        ?>
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
</form>
<?php
if (isset($_FILES['fornecedor_banner_endereco_1']) || isset($_FILES['fornecedor_banner_endereco_2']) || isset($_FILES['fornecedor_banner_endereco_3']) || isset($_FILES['fornecedor_banner_endereco_4'])) {
  
  $fornecedor_banner_principal = $_POST['fornecedor_banner_principal'];
  
  if (isset($_POST['fornecedor_banner_endereco_1'])) {
    $fornecedor_banner_endereco_1 = $_POST['fornecedor_banner_endereco_1'];
  } else {
    $fornecedor_banner_endereco_1 = "";
  }
  
  if (isset($_POST['fornecedor_banner_endereco_2'])) {
    $fornecedor_banner_endereco_2 = $_POST['fornecedor_banner_endereco_2'];
  } else {
    $fornecedor_banner_endereco_2 = "";
  }
  
  if (isset($_POST['fornecedor_banner_endereco_3'])) {
    $fornecedor_banner_endereco_3 = $_POST['fornecedor_banner_endereco_3'];
  } else {
    $fornecedor_banner_endereco_3 = "";
  }
  
  if (isset($_POST['fornecedor_banner_endereco_4'])) {
    $fornecedor_banner_endereco_4 = $_POST['fornecedor_banner_endereco_4'];
  } else {
    $fornecedor_banner_endereco_4 = "";
  }
  
  // REMOVENDO OS BANNERS ANTIGOS DA PASTA PARA INSERIR OS NOVOS
  $stmt = $db->prepare("SELECT endereco
                            FROM acc_fornecedor_banner WHERE acc_fornecedor_id = ?");
  $stmt->bindValue(1, $param);
  $stmt->execute();
  while ( $banners = $stmt->fetch(PDO::FETCH_ASSOC) ) {
    if (is_file($banners['endereco']) && $banners['endereco'] != $fornecedor_banner_endereco_1 && $banners['endereco'] != $fornecedor_banner_endereco_2 && $banners['endereco'] != $fornecedor_banner_endereco_3 && $banners['endereco'] != $fornecedor_banner_endereco_4) {
      unlink($banners['endereco']);
    }
  }
  
  // REMOVENDO OS BANNERS ANTIGOS PARA INSERIR OS ATUALIZADOS
  $stmt = $db->prepare("DELETE FROM acc_fornecedor_banner WHERE acc_fornecedor_id = ?");
  $stmt->bindValue(1, $param);
  $stmt->execute();
  
  $dir = '../acrecompras_anexos/banner_fornecedor/'; // Diretório para uploads
  
  if (isset($_FILES['fornecedor_banner_endereco_1'])) {
    $random = rand(1, 999);
    $data = date('YmdHis');
    $ext = strtolower(substr($_FILES['fornecedor_banner_endereco_1']['name'], - 4)); // Pegando extensão do arquivo
    $new_name = $dir . $random . $data . $ext; // Definindo um novo nome para o arquivo
    move_uploaded_file($_FILES['fornecedor_banner_endereco_1']['tmp_name'], $new_name);
  } else {
    $new_name = $_POST['fornecedor_banner_endereco_1'];
  }
  
  if ($_POST['fornecedor_banner_nome_1'] != "") {
    $stmt = $db->prepare("INSERT INTO acc_fornecedor_banner (acc_fornecedor_id, nome, endereco, ordem, principal, status, data_cadastro) VALUES (?, ?, ?, ?, ?, 0, NOW())");
    $stmt->bindValue(1, $param);
    $stmt->bindValue(2, $_POST['fornecedor_banner_nome_1']);
    $stmt->bindValue(3, $new_name);
    $stmt->bindValue(4, 1);
    $stmt->bindValue(5, $fornecedor_banner_principal == 1 ? 1 : 0);
    $stmt->execute();
  }
  
  if (isset($_FILES['fornecedor_banner_endereco_2'])) {
    $random = rand(1, 999);
    $data = date('YmdHis');
    $ext = strtolower(substr($_FILES['fornecedor_banner_endereco_2']['name'], - 4)); // Pegando extensão do arquivo
    $new_name = $dir . $random . $data . $ext; // Definindo um novo nome para o arquivo
    move_uploaded_file($_FILES['fornecedor_banner_endereco_2']['tmp_name'], $new_name);
  } else {
    $new_name = $_POST['fornecedor_banner_endereco_2'];
  }
  
  if ($_POST['fornecedor_banner_nome_2'] != "") {
    $stmt = $db->prepare("INSERT INTO acc_fornecedor_banner (acc_fornecedor_id, nome, endereco, ordem, principal, status, data_cadastro) VALUES (?, ?, ?, ?, ?, 0, NOW())");
    $stmt->bindValue(1, $param);
    $stmt->bindValue(2, $_POST['fornecedor_banner_nome_2']);
    $stmt->bindValue(3, $new_name);
    $stmt->bindValue(4, 1);
    $stmt->bindValue(5, $fornecedor_banner_principal == 2 ? 1 : 0);
    $stmt->execute();
  }
  
  if (isset($_FILES['fornecedor_banner_endereco_3'])) {
    $random = rand(1, 999);
    $data = date('YmdHis');
    $ext = strtolower(substr($_FILES['fornecedor_banner_endereco_3']['name'], - 4)); // Pegando extensão do arquivo
    $new_name = $dir . $random . $data . $ext; // Definindo um novo nome para o arquivo
    move_uploaded_file($_FILES['fornecedor_banner_endereco_3']['tmp_name'], $new_name);
  } else {
    $new_name = $_POST['fornecedor_banner_endereco_3'];
  }
  
  if ($_POST['fornecedor_banner_nome_3'] != "") {
    $stmt = $db->prepare("INSERT INTO acc_fornecedor_banner (acc_fornecedor_id, nome, endereco, ordem, principal, status, data_cadastro) VALUES (?, ?, ?, ?, ?, 0, NOW())");
    $stmt->bindValue(1, $param);
    $stmt->bindValue(2, $_POST['fornecedor_banner_nome_3']);
    $stmt->bindValue(3, $new_name);
    $stmt->bindValue(4, 1);
    $stmt->bindValue(5, $fornecedor_banner_principal == 3 ? 1 : 0);
    $stmt->execute();
  }
  
  if (isset($_FILES['fornecedor_banner_endereco_4'])) {
    $random = rand(1, 999);
    $data = date('YmdHis');
    $ext = strtolower(substr($_FILES['fornecedor_banner_endereco_4']['name'], - 4)); // Pegando extensão do arquivo
    $new_name = $dir . $random . $data . $ext; // Definindo um novo nome para o arquivo
    move_uploaded_file($_FILES['fornecedor_banner_endereco_4']['tmp_name'], $new_name);
  } else {
    $new_name = $_POST['fornecedor_banner_endereco_4'];
  }
  
  if ($_POST['fornecedor_banner_nome_4'] != "") {
    $stmt = $db->prepare("INSERT INTO acc_fornecedor_banner (acc_fornecedor_id, nome, endereco, ordem, principal, status, data_cadastro) VALUES (?, ?, ?, ?, ?, 0, NOW())");
    $stmt->bindValue(1, $param);
    $stmt->bindValue(2, $_POST['fornecedor_banner_nome_4']);
    $stmt->bindValue(3, $new_name);
    $stmt->bindValue(4, 1);
    $stmt->bindValue(5, $fornecedor_banner_principal == 4 ? 1 : 0);
    $stmt->execute();
  }
  
  echo "<script language='javaScript'>window.location.href='" . ConstantesAcreCompras::$PORTAL_URL . "fornecedor/perfil/" . $param . "'</script>";
}
?>
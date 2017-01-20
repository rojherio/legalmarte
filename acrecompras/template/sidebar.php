<?php
$stmt = $db->prepare("SELECT id, nome_fantasia
                        FROM acc_fornecedor
                        WHERE acc_pessoa_id = ?");
$stmt->bindValue(1, $_SESSION['acc_pessoa_id']);
$stmt->execute();
$fornecedores = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar" id="main-menu">
  <!-- BEGIN MINI-PROFILE -->
  <div class="page-sidebar-wrapper scrollbar-dynamic" id="main-menu-wrapper">
    <div class="user-info-wrapper">
      <div class="profile-wrapper">
                <?php
                if ($_SESSION['acc_foto_cut'] != "") {
                  ?>
                    <img src="<?= $_SESSION['acc_foto_cut'] ?>" alt="" data-src="<?= $_SESSION['acc_foto_cut'] ?>" data-src-retina="<?= $_SESSION['acc_foto_cut'] ?>" width="69" height="69" />
                    <?php
                } else {
                  ?>
                    <img src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>/img/profiles/avatar.jpg" alt="" data-src="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>/img/profiles/avatar.jpg" data-src-retina="<?= ConstantesAcreCompras::$ASSETS_FOLDER ?>/img/profiles/avatar2x.jpg" width="69" height="69" />

                    <?php
                }
                ?>
            </div>
      <div class="user-info">
        <div class="greeting">Bem Vindo</div>
        <div class="username">
          <span class="semi-bold"><?= $_SESSION['acc_nome']; ?></span>
        </div>
        <div class="status">
          Status
          <a href="#">
            <div class="status-icon green"></div>
            Online
          </a>
        </div>
      </div>
    </div>
    <!-- END MINI-PROFILE -->
    <!-- BEGIN SIDEBAR MENU -->
    <ul>
      <li class="start">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>dashboard">
          <i class="icon-custom-home"></i>
          <span class="title">Dashboard</span>
        </a>
      </li>
      <li class="">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>usuario/perfil">
          <i class="fa fa-user"></i>
          <span class="title">Perfil</span>
        </a>
      </li>
      <li class="start ">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/dasboard">
          <i class="fa fa-ticket"></i>
          <span class="title">Pontos</span>
          <span class="selected"></span>
          <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
          <li class="active">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/showroom"> Comprar </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/orcamento"> Carrinho </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/trocar"> Trocar </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/transferir"> Transferir </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/saldo"> Saldo </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>ponto/extrato"> Extrato </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>fornecedor/perfil">
          <i class="fa fa-building-o"></i>
          <span class="title">Parceria</span>
          <span class="selected"></span>
          <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
        <?php
        foreach ( $fornecedores as $kForn => $objForn ) {
          ?>
          <li class="active">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>fornecedor/perfil/<?= $objForn['id'] ?>"> <?= $objForn['nome_fantasia'] ?> </a>
          </li>
          <?php
        }
        ?>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>fornecedor/perfil"> Nova parceria </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>rede/dashboard">
          <i class="fa fa-sitemap"></i>
          <span class="title">Rede</span>
          <span class="selected"></span>
          <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
          <li class="active">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>rede/minha"> Minha Rede </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>rede/estatistica"> Estatística </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>rede/grafico"> Gráficos </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>rede/relatorio"> Relatórios </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="#">
          <i class="fa fa-money"></i>
          <span class="title">Financeiro</span>
          <span class="selected"></span>
          <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
          <li class="active">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/saldo"> Saldo </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/extrato"> Extrato </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/estatistica"> Estatística </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/saque"> Saque </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/pagamento"> Pagamentos </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>financeiro/recedimento"> Recebimentos </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="#">
          <i class="fa fa-cogs"></i>
          <span class="title">Administração</span>
          <span class="selected"></span>
          <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
          <li class="active">
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_usuario/dashboard"> Usuários </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_fornecedor/ativacao"> Fornecedores </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_rede/dashboard"> Rede </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_administrador/dashboard"> Administradores </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_parametro/dashboard"> Parâmentros </a>
          </li>
          <li>
            <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>adm_operacao/dashboard"> Operações </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>logout">
          <i class="fa fa-power-off"></i>
          <span class="title">Sair</span>
        </a>
      </li>
    </ul>
    <!-- END SIDEBAR MENU -->
  </div>
</div>
<a href="#" class="scrollup">Scroll</a>
<div class="footer-widget">
  <div class="pull-right">
    <a href="<?= ConstantesAcreCompras::$PORTAL_URL ?>lockscreen">
      <i class="fa fa-power-off"></i>
    </a>
  </div>
</div>
<!-- END SIDEBAR -->
<form id="fornecedor_todos" name="fornecedor_todos" action="#" method="post">
  <div class="row">
    <div class="col-md-12">
      <h5>
        FORNECEDORES |
        <span class="label label-danger">BLOQUEADO</span>
      </h5>
      <hr />
      <table class="table no-more-tables">
        <!--         <thead> -->
        <!--           <tr> -->
        <!--             <th style="width: 95%"></th> -->
        <!--             <th style="width: 5%"></th> -->
        <!--           </tr> -->
        <!--         </thead> -->
        <tbody>
        <?php
        $stmt = $db->prepare("SELECT *
            FROM acc_fornecedor
            WHERE acc_fornecedor_status_id = 4");
        $stmt->execute();
        while ( $fornecedor = $stmt->fetch(PDO::FETCH_ASSOC) ) {
          ?>
          <tr>
            <td class="v-align-middle" style="width: 95%"><?= $fornecedor['nome_fantasia'] . " - " . $fornecedor['razao_social']; ?></td>
            <td class="v-align-middle" style="width: 5%">
              <a href="<?=ConstantesAcreCompras::$PORTAL_URL;?>adm_fornecedor/analise/<?=$fornecedor['id'];?>" class="tip text-info" data-placement="bottom" title="" data-toggle="tooltip" data-original-title="Detalhar">
                <i class="fa fa-search"></i>
              </a>
            </td>
          </tr>
        <?php
        }
        ?>
        </tbody>
      </table>
    </div>
  </div>
</form>
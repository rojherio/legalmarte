<?php
$stmt = $db->prepare("SELECT s.id, s.nickname, s.nome, s.data_nascimento, s.sexo, s.rg_ie, s.rg_orgao_expedidor, s.cpf_cnpj, s.estado_civil, 
                      s.email, s.contato_1, s.contato_2, s.contato_3 
                      FROM seg_usuario AS s 
                      WHERE s.id = ?");
$stmt->bindValue(1, $_SESSION['acc_id']);
$stmt->execute();
$dados_pessoais = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT ue.id, ue.logradouro, ue.numero, ue.complemento, ue.bairro, ue.cep, 
                      c.nome AS cidade_nome, e.nome AS estado_nome, e.sigla AS estado_sigla 
                      FROM bsc_usuario_endereco AS ue 
                      LEFT JOIN bsc_cidade AS c ON c.id = ue.bsc_cidade_id 
                      LEFT JOIN bsc_estado AS e ON e.id = c.bsc_estado_id 
                      WHERE ue.seg_usuario_id = ? AND bsc_tipo_endereco_id = 1");
$stmt->bindValue(1, $_SESSION['acc_id']);
$stmt->execute();
$dados_contato = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $db->prepare("SELECT b.codigo, b.nome, 
                        cb.agencia, cb.agencia_dv, cb.conta, cb.conta_dv, cb.variacao, 
                        tb.nome AS tipo_conta_nome
                        FROM acc_cliente_bancario AS cb 
                        LEFT JOIN bsc_banco AS b ON b.id = cb.bsc_banco_id 
                        LEFT JOIN bsc_tipo_bancario AS tb ON tb.id = cb.bsc_tipo_bancario_id 
                        WHERE acc_cliente_id = ? AND bsc_tipo_bancario_id = 1");
$stmt->bindValue(1, $_SESSION['acc_cliente_id']);
$stmt->execute();
$dados_bancario = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<form id="fornecedor_analises" name="fornecedor_analises" action="#" method="post">
  <h4>
    Dados
    <span class="semi-bold">Básicos</span>
  </h4>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Nome de Usuário: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['nickname']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Nome Completo: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['nome']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Nascimento: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= obterDataBRTimestamp($dados_pessoais['data_nascimento']);  ?></span>
      </div>
    </label>
  </div>
  
  <?php
  $sexo = array (
    '' => '',
    1 => 'Masculino',
    2 => 'Feminino' 
  );
  ?>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Sexo: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $sexo[$dados_pessoais['sexo']];?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>RG: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['rg_ie']; ?>&nbsp;<?= $dados_pessoais['rg_orgao_expedidor']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>CPF ou CNPJ: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['cpf_cnpj']; ?></span>
      </div>
    </label>
  </div>
  <?php
  $estCivil = array (
    '' => '',
    1 => 'Solteiro',
    2 => 'Casado',
    3 => 'União Estável' 
  );
  ?>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Estado Civil: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $estCivil[$dados_pessoais['estado_civil']]; ?></span>
      </div>
    </label>
  </div>
  <h4>
    Dados
    <span class="semi-bold">Contato</span>
  </h4>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Logradouro: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['logradouro']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Número: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['numero']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Complemento: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['complemento']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>CEP: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['cep']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Bairro: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['bairro']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Cidade: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_contato['cidade_nome']; ?>&nbsp;-&nbsp;<?= $dados_contato['estado_sigla']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>E-mail: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['email']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Celular: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['contato_1']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Residencial: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['contato_2']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Comercial: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_pessoais['contato_3']; ?></span>
      </div>
    </label>
  </div>
  <h4>
    Dados
    <span class="semi-bold">Bancário</span>
  </h4>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Banco: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_bancario['codigo']; ?>&nbsp;-&nbsp;<?= $dados_bancario['nome']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Tipo: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_bancario['codigo']; ?>&nbsp;-&nbsp;<?= $dados_bancario['nome']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Agência: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_bancario['agencia']; ?>-<?= $dados_bancario['agencia_dv']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Conta&nbsp;<?= $dados_bancario['tipo_conta_nome']; ?>: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_bancario['conta']; ?>-<?= $dados_bancario['conta_dv']; ?></span>
      </div>
    </label>
  </div>
  <div class="row">
    <label class="row">
      <div class="col-md-2 titulo-view-r">
        <span>
          <b>Variação: </b>
        </span>
      </div>
      <div id="resultado" class="col-md-10">
        <span><?= $dados_bancario['variacao']; ?></span>
      </div>
    </label>
  </div>
</form>
/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
//Máscara
jQuery(function($) {
    $("#usuario_bancario_agencia").mask("9?999");
    $("#usuario_bancario_conta").mask("9?999999999");
});
//ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
$('form#fornecedor_bancario').submit(function() {
    if (validar_formulario_fornecedor_bancario("")) {
        $.ajax({
            type: "POST",
            url: PORTAL_URL + 'dao/fornecedor/bancario',
            data: $('form#fornecedor_bancario').serialize(),
            cache: false,
            success: function(obj) {
                obj = JSON.parse(obj);
                onSuccessSendFornecedorBancario(obj);
            },
            error: function(obj) {
                onErrorFornecedorBancario(obj);
            }
        });
        return false;
    } else {
        return false;
    }
});

/* SUCESSO AO ENVIAR */
function onSuccessSendFornecedorBancario(obj) {
    if (obj.msg == 'success') {
        postToURL(PORTAL_URL + 'fornecedor/perfil');
    } else if (obj.msg == 'error') {
        validar_formulario_fornecedor_bancario(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorFornecedorBancario(args) {
    alert("Erro: " + args.retorno);
    return false;
}

//VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_fornecedor_bancario(obj) {

    var valido = true;
    var usuario_bancario_banco = $("#usuario_bancario_banco").val();
    var usuario_bancario_agencia = $("#usuario_bancario_agencia").val();
    var usuario_bancario_agencia_dv = $("#usuario_bancario_agencia_dv").val();
    var usuario_bancario_conta = $("#usuario_bancario_conta").val();
    var usuario_bancario_conta_dv = $("#usuario_bancario_conta_dv").val();
    var usuario_bancario_tipo_conta = $("#usuario_bancario_tipo_conta").val();
    var usuario_bancario_variacao = $("#usuario_bancario_variacao").val();

    var element = null;

    //LIMPA MENSAGENS DE ERRO
    $(".error").each(function() {
        $(this).remove();
    });

    if (obj.tipo == "" || obj.tipo == null) {

        if (usuario_bancario_variacao == "") {
            $('div#div_usuario_bancario_variacao').after('<label id="erro_usuario_bancario_variacao" class="error">A variação é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_bancario_variacao');
        }

        if (usuario_bancario_tipo_conta == "") {
            $('div#div_usuario_bancario_tipo_conta').after('<label id="erro_usuario_bancario_tipo_conta" class="error">O tipo de conta é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_bancario_tipo_conta');
        }

        if (usuario_bancario_conta == "") {
            $('div#div_usuario_bancario_conta').after('<label id="erro_usuario_bancario_conta" class="error">A conta é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_bancario_conta');
        }

        if (usuario_bancario_agencia == "") {
            $('div#div_usuario_bancario_agencia').after('<label id="erro_usuario_bancario_agencia" class="error">A agência é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_bancario_agencia');
        }

        if (usuario_bancario_banco == "") {
            $('div#div_usuario_bancario_banco').after('<label id="erro_usuario_bancario_banco" class="error">O banco é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_bancario_banco');
        }

    }

    if (element != null) {
        var topPosition = element.offset().top - 135;
        $('html, body').animate({
            scrollTop: topPosition
        }, 800);
    }
    return valido;
}
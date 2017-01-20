/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
//Máscara
jQuery(function($) {
    $("#endereco_numero").mask("9?9999");
    $("#endereco_cep").mask("99.999-999");

    $('#fornecedor_contato_1').mask("(99) 9999-9999?9").live('blur', function(event) {
        manipula_telefone(event);
    });
    $('#fornecedor_contato_2').mask("(99) 9999-9999?9").live('blur', function(event) {
        manipula_telefone(event);
    });
    $('#fornecedor_contato_3').mask("(99) 9999-9999?9").live('blur', function(event) {
        manipula_telefone(event);
    });

    function manipula_telefone(event) {
        var target, phone, element;
        target = (event.currentTarget) ? event.currentTarget : event.srcElement;
        phone = target.value.replace(/\D/g, '');
        element = $(target);
        element.unmask();
        if (phone.length > 10) {
            element.mask("(99) 99999-999?9");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }
});
//COMBO ESTADO E MUNICIPIO

$("#endereco_estado").change(function() {
    $("#endereco_cidade").html('<option value="0">Carregando...</option>');
    $.post(PORTAL_URL + "dao/generico/combo_cidades.php",
            {estado: $(this).val()},
    function(valor) {
        $("#endereco_cidade").html(valor);
        $("#endereco_cidade").select2();
    });
});

//ENVIANDO FORMULÁRIO DE CADASTRO
$('form#fornecedor_contato').submit(function() {
    if (validar_formulario_Contato("")) {
        $.ajax({
            type: "POST",
            url: PORTAL_URL + 'dao/fornecedor/contato',
            data: $('form#fornecedor_contato').serialize(),
            cache: false,
            success: function(obj) {
                obj = JSON.parse(obj);
                onSuccessSendContato(obj);
            },
            error: function(obj) {
                onErrorContato(obj);
            }
        });
        return false;
    } else {
        return false;
    }
});

/* SUCESSO AO ENVIAR */
function onSuccessSendContato(obj) {
    if (obj.msg == 'success') {
        postToURL(PORTAL_URL + 'fornecedor/perfil');
    } else if (obj.msg == 'error') {
        validar_formulario_Contato(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorContato(args) {
    alert("Erro: " + args.retorno);
    return false;
}

//VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_Contato(obj) {

    var valido = true;
    var fornecedor_nome_fantasia = $("#fornecedor_nome_fantasia").val();
    var fornecedor_email = $("#fornecedor_email").val();

    var element = null;

    //LIMPA MENSAGENS DE ERRO
    $(".error").each(function() {
        $(this).remove();
    });

    if (obj.tipo == "" || obj.tipo == null) {

        if (fornecedor_email == "") {
            $('div#div_fornecedor_email').after('<label id="erro_fornecedor_email" class="error">O e-mail é obrigatório.</label>');
            valido = false;
            element = $('div#div_fornecedor_email');
        }

        if (fornecedor_nome_fantasia == "") {
            $('div#div_fornecedor_nome_fantasia').after('<label id="erro_fornecedor_nome_fantasia" class="error">O nome fantasia é obrigatório.</label>');
            valido = false;
            element = $('div#div_fornecedor_nome_fantasia');
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
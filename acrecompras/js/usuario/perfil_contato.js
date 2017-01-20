/* Webarch Admin Dashboard */

//Máscara
jQuery(function($) {
    $("#endereco_numero").mask("9?9999");
    $("#endereco_cep").mask("99.999-999");

    $('#usuario_contato_1').mask("(99) 9999-9999?9").live('blur', function(event) {
        manipula_telefone(event);
    });
    $('#usuario_contato_2').mask("(99) 9999-9999?9").live('blur', function(event) {
        manipula_telefone(event);
    });
    $('#usuario_contato_3').mask("(99) 9999-9999?9").live('blur', function(event) {
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
    $.post(PORTAL_URL + "dao/generico/combo_cidades",
            {estado: $(this).val()},
    function(valor) {
        $("#endereco_cidade").html(valor);
        $("#endereco_cidade").select2();
    });
});

//ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
$('form#usuario_contato').submit(function() {
    if (validar_formulario_contato("")) {
        $.ajax({
            type: "POST",
            url: PORTAL_URL + 'dao/usuario/contato',
            data: $('form#usuario_contato').serialize(),
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
        postToURL(PORTAL_URL + 'usuario/perfil', {retorno_sucesso: obj.retorno});
    } else if (obj.msg == 'error') {
        validar_formulario_contato(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorContato(args) {
    $("#msg_erro").slideToggle().fadeOut(4000);
    return false;
}

//VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_contato(obj) {

    var valido = true;

    var element = null;

    //LIMPA MENSAGENS DE ERRO
    $(".error").each(function() {
        $(this).remove();
    });

    if (element != null) {
        var topPosition = element.offset().top - 135;
        $('html, body').animate({
            scrollTop: topPosition
        }, 800);
    }
    return valido;
}
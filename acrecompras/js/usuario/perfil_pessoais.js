//Máscara
jQuery(function($) {
    $("#usuario_rg").mask("9999?9999999*");
    $("#usuario_data_nascimento").mask("99/99/9999");
    $("#usuario_data_nascimento").datepicker({ format: 'dd/mm/yyyy'});
});

//MÁSCARA CPF OU CNPJ NO MESMO CAMPO
$(document).ready(function() {
    if ($("input[name=usuario_cpf_cnpj]").val().length > 14)
        $("input[name=usuario_cpf_cnpj]").mask("99.999.999/9999-99");
    else
        $("input[name=usuario_cpf_cnpj]").mask("999.999.999-99?99999");

    $('input[name=usuario_cpf_cnpj]').live('keyup', function(e) {

        var query = $(this).val().replace(/[^a-zA-Z 0-9]+/g, '');

        if (query.length == 11) {
            $("input[name=usuario_cpf_cnpj]").mask("999.999.999-99?99999");
        }

        if (query.length == 14) {
            $("input[name=usuario_cpf_cnpj]").mask("99.999.999/9999-99");
        }
    });
});

var btnCust = '<button type="button" class="btn btn-default" title="Adicionar tags" ' + 'onclick="alert(\'Call your custom code here.\')">' + '<i class="glyphicon glyphicon-tag"></i>' + '</button>';
var btnCust = '';
$("#avatar-2").fileinput({
    overwriteInitial: false,
    maxFileSize: 1500,
    showClose: true,
    showCaption: false,
    showBrowse: true,
    showZoom: false,
    browseOnZoneClick: true,
    browseLabel: '',
    removeLabel: '',
    resizeImage: true,
    maxImageWidth: 90,
    maxImageHeight: 200,
    size: 90,
    resizePreference: 'width',
    browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    browseTitle: 'Selecionar foto',
    removeTitle: 'Cancelar ou desfazer alterações',
    zoomTitle: 'teste',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="' + PORTAL_FOLDER + 'assets/img/profiles/avatar_male.jpg" alt="Seu avatar" style="width:90px"><h6 class="text-muted">Selecionar foto</h6>',
    layoutTemplates: {
        main2: '{preview} ' + btnCust + ' {remove} {browse}'
    },
    allowedFileExtensions: ["jpg", "png", "gif", "jpeg"]
});

/*
 * Webarch Admin Dashboard -----------------------------------------------------------------
 */
// ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
$('form#cadastro_perfil').submit(function() {
    if (validar_formulario_usuario("")) {
        $.ajax({
            type: "POST",
            url: PORTAL_URL + 'dao/usuario/pessoais',
            data: $('form#cadastro_perfil').serialize(),
            cache: false,
            success: function(obj) {
                obj = JSON.parse(obj);
                onSuccessSendUsuario(obj);
            },
            error: function(obj) {
                onErrorUsuario(obj);
            }
        });
        return false;
    } else {
        return false;
    }
});

/* SUCESSO AO ENVIAR */
function onSuccessSendUsuario(obj) {
    if (obj.msg == 'success') {
        postToURL(PORTAL_URL + 'usuario/perfil', {retorno_sucesso: obj.retorno});
    } else if (obj.msg == 'error') {
        validar_formulario_usuario(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorUsuario(args) {
    $("#msg_erro").slideToggle().fadeOut(4000);
    return false;
}

// VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_usuario(obj) {

    var valido = true;
    var usuario_nickname = $("#usuario_nickname").val();
    var usuario_nome = $("#usuario_nome").val();
    var usuario_data_nascimento = $("#usuario_data_nascimento").val();
    var usuario_sexo = $("#usuario_sexo").val();
    var usuario_rg = $("#usuario_rg").val();
    var usuario_rg_orgao_expedidor = $("#usuario_rg_orgao_expedidor").val();
    var usuario_cpf_cnpj = $("#usuario_cpf_cnpj").val();
    var usuario_estado_civil = $("#usuario_estado_civil").val();

    var element = null;

    // LIMPA MENSAGENS DE ERRO
    $(".error").each(function() {
        $(this).remove();
    });

    if (obj.tipo == "" || obj.tipo == null) {

        if (usuario_estado_civil == "") {
            $('div#div_usuario_estado_civil').after('<label id="erro_usuario_estado_civil" class="error">O estado civil é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_estado_civil');
        }

        if (usuario_cpf_cnpj == "") {
            $('div#div_usuario_cpf_cnpj').after('<label id="erro_usuario_cpf_cnpj" class="error">O cpf ou cnpj é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_cpf_cnpj');
        }

        if (usuario_rg_orgao_expedidor == "") {
            $('div#div_usuario_rg_orgao_expedidor').after('<label id="erro_usuario_rg_orgao_expedidor" class="error">O órgão expedidor é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_rg_orgao_expedidor');
        }

        if (usuario_rg == "") {
            $('div#div_usuario_rg').after('<label id="erro_usuario_rg" class="error">O rg é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_rg');
        }

        if (usuario_sexo == "") {
            $('div#div_usuario_sexo').after('<label id="erro_usuario_sexo" class="error">O sexo é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_sexo');
        }

        if (usuario_data_nascimento == "") {
            $('div#div_usuario_data_nascimento').after('<label id="erro_usuario_data_nascimento" class="error">A data de nascimento é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_data_nascimento');
        }

        if (usuario_nome == "") {
            $('div#div_usuario_nome').after('<label id="erro_usuario_nome" class="error">O nome completo é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_nome');
        }

        if (usuario_nickname == "") {
            $('div#div_usuario_nickname').after('<label id="erro_usuario_nickname" class="error">O nick name é obrigatório.</label>');
            valido = false;
            element = $('div#div_usuario_nickname');
        }

    } else if (obj.tipo == 'nickname') {
        $('div#div_usuario_nickname').after('<label id="erro_usuario_nickname" class="error">' + obj.retorno + '</label>');
        valido = false;
        element = $('div#div_usuario_nickname');
    } else if (obj.tipo == 'nome') {
        $('div#div_usuario_nome').after('<label id="erro_usuario_nome" class="error">' + obj.retorno + '</label>');
        valido = false;
        element = $('div#div_usuario_nome');
    } else if (obj.tipo == 'cpf_cnpj') {
        $('div#div_usuario_cpf_cnpj').after('<label id="erro_usuario_cpf_cnpj" class="error">' + obj.retorno + '</label>');
        valido = false;
        element = $('div#div_usuario_cpf_cnpj');
    }

    if (element != null) {
        var topPosition = element.offset().top - 135;
        $('html, body').animate({
            scrollTop: topPosition
        }, 800);
    }
    return valido;
}
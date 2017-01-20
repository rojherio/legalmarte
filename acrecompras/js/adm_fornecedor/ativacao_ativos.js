/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
//ENVIANDO FORMULÁRIO
$('form#fornecedor_publicidade').submit(function() {
    if (!validar_formulario_fornecedor_publicidade("")) {
        return false;
    }
    /*if (validar_formulario_fornecedor_publicidade("")) {
     $.ajax({
     type: "POST",
     url: PORTAL_URL + 'dao/fornecedor/publicidade',
     data: $('form#fornecedor_publicidade').serialize(),
     cache: false,
     success: function(obj) {
     obj = JSON.parse(obj);
     onSuccessSendFornecedorPublicidade(obj);
     },
     error: function(obj) {
     onErrorFornecedorPublicidade(obj);
     }
     });
     return false;
     } else {
     return false;
     }*/
});

/* SUCESSO AO ENVIAR */
function onSuccessSendFornecedorPublicidade(obj) {
    if (obj.msg == 'success') {
        postToURL(PORTAL_URL + 'fornecedor/perfil');
    } else if (obj.msg == 'error') {
        validar_formulario_fornecedor_publicidade(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorFornecedorPublicidade(args) {
    alert("Erro: " + args.retorno);
    return false;
}

//VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_fornecedor_publicidade(obj) {

    var valido = true;

    var fornecedor_banner_endereco_1 = $("#fornecedor_banner_endereco_1").val();
    var fornecedor_banner_nome_1 = $("#fornecedor_banner_nome_1").val();

    var fornecedor_banner_endereco_2 = $("#fornecedor_banner_endereco_2").val();
    var fornecedor_banner_nome_2 = $("#fornecedor_banner_nome_2").val();

    var fornecedor_banner_endereco_3 = $("#fornecedor_banner_endereco_3").val();
    var fornecedor_banner_nome_3 = $("#fornecedor_banner_nome_3").val();

    var fornecedor_banner_endereco_4 = $("#fornecedor_banner_endereco_4").val();
    var fornecedor_banner_nome_4 = $("#fornecedor_banner_nome_4").val();

    var fornecedor_banner_principal = $('input[name="fornecedor_banner_principal"]:checked').val();

    var element = null;

    //LIMPA MENSAGENS DE ERRO
    $(".error").each(function() {
        $(this).remove();
    });

    if (obj.tipo == "" || obj.tipo == null) {

        if (fornecedor_banner_principal == 4 && fornecedor_banner_endereco_4 == "" && fornecedor_banner_nome_4 == "" ||
                fornecedor_banner_endereco_4 != "" && fornecedor_banner_nome_4 == "" ||
                fornecedor_banner_nome_4 != "" && fornecedor_banner_endereco_4 == "") {
            $('div#div_fornecedor_banner_nome_4').after('<label id="erro_div_fornecedor_banner_nome_4" class="error">O banner e a descrição são obrigatórios.</label>');
            $('div#div_fornecedor_banner_endereco_4').after('<label id="erro_div_fornecedor_banner_endereco_4" class="error">O banner e a descrição são obrigatórios.</label>');
            valido = false;
            element = $('div#div_fornecedor_banner_endereco_4');
        }

        if (fornecedor_banner_principal == 3 && fornecedor_banner_endereco_3 == "" && fornecedor_banner_nome_3 == "" ||
                fornecedor_banner_endereco_3 != "" && fornecedor_banner_nome_3 == "" ||
                fornecedor_banner_nome_3 != "" && fornecedor_banner_endereco_3 == "") {
            $('div#div_fornecedor_banner_nome_3').after('<label id="erro_div_fornecedor_banner_nome_3" class="error">O banner e a descrição são obrigatórios.</label>');
            $('div#div_fornecedor_banner_endereco_3').after('<label id="erro_div_fornecedor_banner_endereco_3" class="error">O banner e a descrição são obrigatórios.</label>');
            valido = false;
            element = $('div#div_fornecedor_banner_endereco_3');
        }

        if (fornecedor_banner_principal == 2 && fornecedor_banner_endereco_2 == "" && fornecedor_banner_nome_2 == "" ||
                fornecedor_banner_endereco_2 != "" && fornecedor_banner_nome_2 == "" ||
                fornecedor_banner_nome_2 != "" && fornecedor_banner_endereco_2 == "") {
            $('div#div_fornecedor_banner_nome_2').after('<label id="erro_div_fornecedor_banner_nome_2" class="error">O banner e a descrição são obrigatórios.</label>');
            $('div#div_fornecedor_banner_endereco_2').after('<label id="erro_div_fornecedor_banner_endereco_2" class="error">O banner e a descrição são obrigatórios.</label>');
            valido = false;
            element = $('div#div_fornecedor_banner_endereco_2');
        }

        if (fornecedor_banner_principal == 1 && fornecedor_banner_endereco_1 == "" && fornecedor_banner_nome_1 == "" ||
                fornecedor_banner_endereco_1 != "" && fornecedor_banner_nome_1 == "" ||
                fornecedor_banner_nome_1 != "" && fornecedor_banner_endereco_1 == "") {
            $('div#div_fornecedor_banner_nome_1').after('<label id="erro_div_fornecedor_banner_nome_1" class="error">O banner e a descrição são obrigatórios.</label>');
            $('div#div_fornecedor_banner_endereco_1').after('<label id="erro_div_fornecedor_banner_endereco_1" class="error">O banner e a descrição são obrigatórios.</label>');
            valido = false;
            element = $('div#div_fornecedor_banner_endereco_1');
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

function remover_banner(codigo) {
    //$("#file_input_" + codigo).parents('div#form_previa').find('.file-preview').hide();
    $("#file_input_" + codigo).parents('div#form_previa').find('.file-preview').find('#image_upload_preview').attr('src', PORTAL_URL+'assets/img/profiles/sem-imagem.jpg');
    $("#file_input_" + codigo).remove();
    $("#div_fornecedor_banner_endereco_" + codigo).html('<input type="file" name="fornecedor_banner_endereco_' + codigo + '" id="fornecedor_banner_endereco_' + codigo + '" class="form-control" placeholder="Banner" value="">');
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $(input).parents('div#form_previa').find('.file-preview').find('#image_upload_preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$('input[type="file"]').livequery("change", function() {
    $(this).parents('div#form_previa').find('.file-preview').show();
    readURL(this);
});
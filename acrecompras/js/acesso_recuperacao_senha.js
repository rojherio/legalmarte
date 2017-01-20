/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
$(document).ready(function() {

    //ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
    $('button#usuario_redefinir_senha').livequery('click', function() {
        if (validar_formulario("")) {
            projetouniversal.util.getjson({
                url: PORTAL_URL + "dao/usuario/recuperacao",
                type: "POST",
                data: $('form#usuario_recuperacao_senha').serialize(),
                enctype: 'multipart/form-data',
                success: onSuccessSend,
                error: onError
            });
        } else {
            return false;
        }
    });

    /* SUCESSO AO ENVIAR */
    function onSuccessSend(obj) {
        if (obj.msg == 'success') {
            postToURL(PORTAL_URL + 'acesso');
        } else if (obj.msg == 'error') {
            validar_formulario(obj);
        }
        return false;
    }
    /* ERRO AO ENVIAR */
    function onError(args) {
        alert("Erro: " + args.retorno);
        return false;
    }

//VALIDATOR FORMULÁRIO DE CADASTRO
    function validar_formulario(obj) {

        var valido = true;
        var usuario_senha_nova = $("#usuario_senha_nova").val();
        var usuario_senha_confere_nova = $("#usuario_senha_confere_nova").val();

        var element = null;

        //LIMPA MENSAGENS DE ERRO
        $(".error").each(function() {
            $(this).remove();
        });

        if (obj.tipo == "" || obj.tipo == null) {

            if (usuario_senha_confere_nova == "") {
                $('div#div_usuario_senha_confere_nova').after('<label id="erro_usuario_senha_confere_nova" class="error">A redigitação da senha nova é obrigatório.</label>');
                valido = false;
                element = $('div#div_usuario_senha_confere_nova');
            }

            if (usuario_senha_nova == "") {
                $('div#div_usuario_senha_nova').after('<label id="erro_usuario_senha_nova" class="error">A senha nova é obrigatório.</label>');
                valido = false;
                element = $('div#div_usuario_senha_nova');
            }

            if (usuario_senha_nova != usuario_senha_confere_nova) {
                $('div#div_usuario_senha_nova').after('<label id="erro_usuario_senha_nova" class="error">A senha nova é obrigatório.</label>');
                $('div#div_usuario_senha_confere_nova').after('<label id="erro_usuario_senha_confere_nova" class="error">A redigitação da senha nova é obrigatório.</label>');
                valido = false;
                element = $('div#div_usuario_senha_nova');
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

    $('button#usuario_login_toggle').click(function() {
        $('form#usuario_novo').hide();
        $('form#usuario_problema').hide();
        $('form#usuario_login').show();
    })
    $('button#usuario_novo_toggle').click(function() {
        $('form#usuario_login').hide();
        $('form#usuario_problema').hide();
        $('form#usuario_novo').show();
    })
    $('a#usuario_problema_toggle').click(function() {
        $('form#usuario_login').hide();
        $('form#usuario_novo').hide();
        $('form#usuario_problema').show();
    })

    $(".lazy").lazyload({
        effect: "fadeIn"
    });

    $('form#usuario_login').validate({
        focusInvalid: false,
        ignore: "",
        rules: {
            txtusername: {
                minlength: 2,
                required: true
            },
            txtpassword: {
                required: true,
            }
        },
        invalidHandler: function(event, validator) {
            // display error alert on form submit
        },
        errorPlacement: function(label, element) { // render error placement for each input type
            $('<span class="error"></span>').insertAfter(element).append(label)
            var parent = $(element).parent('.input-with-icon');
            parent.removeClass('success-control').addClass('error-control');
        },
        highlight: function(element) { // hightlight error inputs
        },
        unhighlight: function(element) { // revert the change done by hightlight
        },
        success: function(label, element) {
            var parent = $(element).parent('.input-with-icon');
            parent.removeClass('error-control').addClass('success-control');
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});
/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
    //ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
    $('form#usuario_redefinicao').submit(function() {
        if (validar_formulario("")) {
            $.ajax({
                type: "POST",
                url: PORTAL_URL + 'dao/usuario/redefinicao',
                data: $('form#usuario_redefinicao').serialize(),
                cache: false,
                success: function(obj) {
                    obj = JSON.parse(obj);
                    onSuccessSend(obj);
                },
                error: function(obj) {
                    onError(obj);
                }
            });
            return false;
        } else {
            return false;
        }
    });

    /* SUCESSO AO ENVIAR */
    function onSuccessSend(obj) {
        if (obj.msg == 'success') {
            postToURL(PORTAL_URL + 'usuario/perfil', {retorno_sucesso: obj.retorno});
        } else if (obj.msg == 'error') {
            validar_formulario(obj);
        }
        return false;
    }
    /* ERRO AO ENVIAR */
    function onError(args) {
        $("#msg_erro").slideToggle().fadeOut(4000);
        return false;
    }

//VALIDATOR FORMULÁRIO DE CADASTRO
    function validar_formulario(obj) {

        var valido = true;
        var usuario_senha = $("#usuario_senha").val();
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

            if (usuario_senha == "") {
                $('div#div_usuario_senha_atual').after('<label id="erro_usuario_senha_atual" class="error">A senha atual é obrigatório.</label>');
                valido = false;
                element = $('div#div_usuario_senha_atual');
            }

            if (usuario_senha_nova != usuario_senha_confere_nova) {
                $('div#div_usuario_senha_nova').after('<label id="erro_usuario_senha_nova" class="error">A senha e confirmação de senha não coincidem.</label>');
                $('div#div_usuario_senha_confere_nova').after('<label id="erro_usuario_senha_confere_nova" class="error">A senha e confirmação de senha não coincidem.</label>');
                valido = false;
                element = $('div#div_usuario_senha_nova');
            }
        } else if (obj.tipo == 'redefinicao') {
            $('div#div_usuario_senha_atual').after('<label id="erro_usuario_senha_atual" class="error">' + obj.retorno + '</label>');
            valido = false;
            element = $('div#div_usuario_senha_atual');
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

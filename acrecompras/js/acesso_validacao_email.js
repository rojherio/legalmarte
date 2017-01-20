/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
$(document).ready(function() {

    //ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
    $('form#form_validacao_email').submit(function() {
        if (validar_formulario_validacao("")) {
            $.ajax({
                type: "POST",
                url: PORTAL_URL + 'dao/usuario/validacao_email',
                data: $('form#form_validacao_email').serialize(),
                cache: false,
                success: function(obj) {
                    obj = JSON.parse(obj);
                    onSuccessSendValidacaoEmail(obj);
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
    function onSuccessSendValidacaoEmail(obj) {
        if (obj.msg == 'success') {
            postToURL(PORTAL_URL + 'acesso');
        } else if (obj.msg == 'error') {
            validar_formulario_validacao(obj);
        }
        return false;
    }
    /* ERRO AO ENVIAR */
    function onError(args) {
        alert("Erro: " + args.retorno);
        return false;
    }

//VALIDATOR FORMULÁRIO DE CADASTRO
    function validar_formulario_validacao(obj) {

        var valido = true;
        var usuario_email = $("#usuario_email").val();

        var element = null;

        //LIMPA MENSAGENS DE ERRO
        $(".error").each(function() {
            $(this).remove();
        });

        if (obj.tipo == "" || obj.tipo == null) {

            if (usuario_email == "") {
                $('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">O e-mail é obrigatório.</label>');
                valido = false;
                element = $('div#div_usuario_email');
            }
            
        } else if (obj.tipo == 'validacao') {
            $('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">' + obj.retorno + '</label>');
            valido = false;
            element = $('div#div_usuario_email');
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
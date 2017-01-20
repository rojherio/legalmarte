/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
function consultacep() {

    var cep = $("#endereco_cep").val();
    var numero = $("#endereco_numero").val();

    if (cep.replace(/[^\d]+/g, '').length == 8) {
        $("#div_loader").show();
        $.ajax({
            type: "POST",
            url: 'http://localhost/acreideiaslegalmarte/acrecompras/assets/plugins/busca-cep-correios/cep',
            data: {numero: numero, cep: cep},
            cache: false,
            success: function(obj) {
                onSuccessSendConsultaCep(obj);
            },
            error: function(obj) {
                onErrorConsultaCep(obj);
            }
        });
        return false;
    }
}

function onSuccessSendConsultaCep(obj) {

    obj = JSON.parse(obj);

    if (obj.msg == 'success') {
    		
    				obj.logradouro = obj.logradouro.substring(0, obj.logradouro.indexOf(' -'));

        document.getElementById('endereco_logradouro').value = obj.logradouro;
        document.getElementById('endereco_bairro').value = obj.bairro;
        document.getElementById('endereco_latitude').value = obj.latitude;
        document.getElementById('endereco_longitude').value = obj.longitude;

        var c = document.getElementById("endereco_estado"), i = 0;
        for (; i < c.options.length; i++)
        {
            if (c.options[i].label == obj.uf)
            {
                var val = c.options[i].value;
                $('#endereco_estado').val(val).trigger('change');
                break;
            }
            $("#endereco_estado").change();
        }
        carrega_municipio(obj.cidade);
    }
    $("#div_loader").hide();

    var myCenter = new google.maps.LatLng($("#endereco_latitude").val(), $("#endereco_longitude").val());

    var mapProp = {
        center: myCenter,
        zoom: 20,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map"), mapProp);

    var marker = new google.maps.Marker({
        position: myCenter,
    });

    marker.setMap(map);

    return false;
}

function onErrorConsultaCep(args) {
    alert('Cep não encontrado.');
    $("#div_loader").hide();
    return false;
}

function carrega_municipio(municipio) {
    $("#endereco_cidade").html('<option value="0">Carregando...</option>');
    $.post(PORTAL_URL + "dao/generico/combo_cidades",
            {estado: $('#endereco_estado').val()},
    function(data) {

        $("#endereco_cidade").html(data);
        $('#endereco_cidade').change();

        if (isNaN(data)) {
            var e = document.getElementById("endereco_cidade"), i = 0;
            for (; i < e.options.length; i++)
            {

                $('#endereco_cidade').change();

                if (e.options[i].label == municipio)
                {
                    var val = e.options[i].value;
                    $("#endereco_cidade").select2();
                    $('#endereco_cidade').val(val).trigger('change');
                    break;
                }
            }
        }

    });
}
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
    $.post(PORTAL_URL + "dao/generico/combo_cidades",
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
        postToURL(PORTAL_URL + 'fornecedor/perfil/' + obj.id, {retorno_sucesso: obj.retorno, id: obj.id});
    } else if (obj.msg == 'error') {
        validar_formulario_Contato(obj);
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorContato(args) {
    $("#msg_erro").slideToggle().fadeOut(4000);
    return false;
}

//VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_Contato(obj) {

    var valido = true;
    var fornecedor_nome_fantasia = $("#fornecedor_nome_fantasia").val();
    var fornecedor_email = $("#fornecedor_email").val();
    var fornecedor_razao_social = $("#fornecedor_razao_social").val();

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

        if (fornecedor_razao_social == "") {
            $('div#div_fornecedor_razao_social').after('<label id="erro_fornecedor_razao_social" class="error">A razão social é obrigatória.</label>');
            valido = false;
            element = $('div#div_fornecedor_razao_social');
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
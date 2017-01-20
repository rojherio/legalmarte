/* Webarch Admin Dashboard 
 /* This JS is only for DEMO Purposes - Extract the code that you need
 -----------------------------------------------------------------*/
//Cool ios7 switch - Beta version
//Done using pure Javascript
// BEGIN ELEMENTS CHECKBOX SWITCH -----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*if (!$('html').hasClass('lte9')) {
    var Switch = require('ios7-switch'), checkbox = document.querySelector('.ios'), mySwitch = new Switch(checkbox);
    mySwitch.toggle();
    mySwitch.el.addEventListener('click', function(e) {
        e.preventDefault();
        mySwitch.toggle();
    }, false);
    // creating multiple instances
    var Switch2 = require('ios7-switch'), checkbox = document.querySelector('.iosblue'), mySwitch2 = new Switch2(checkbox);

    mySwitch2.el.addEventListener('click', function(e) {
        e.preventDefault();
        mySwitch2.toggle();
    }, false);
}*/

$('form#fornecedor_ativacao').submit(function() {
    $.ajax({
        type: "POST",
        url: PORTAL_URL + 'dao/fornecedor/ativacao',
        data: $('form#fornecedor_ativacao').serialize(),
        cache: false,
        success: function(obj) {
            obj = JSON.parse(obj);
            onSuccessSendAtivacao(obj);
        },
        error: function(obj) {
            onErrorAtivacao(obj);
        }
    });
    return false;
});

/* SUCESSO AO ENVIAR */
function onSuccessSendAtivacao(obj) {
    if (obj.msg == 'success') {
        postToURL(PORTAL_URL + 'fornecedor/perfil');
    }
    return false;
}
/* ERRO AO ENVIAR */
function onErrorAtivacao(args) {
    alert("Erro: " + args.retorno);
    return false;
}
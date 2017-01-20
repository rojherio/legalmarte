/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
//Máscara
jQuery(function($) {
		$("#fornecedor_param_pct_1").autoNumeric('init', {mDec: 2, aSep: '.', aDec: ',', aSign: ''});
		$("#fornecedor_param_pct_2").autoNumeric('init', {mDec: 2, aSep: '.', aDec: ',', aSign: ''});
		$("#fornecedor_param_pct_3").autoNumeric('init', {mDec: 2, aSep: '.', aDec: ',', aSign: ''});
		$("#fornecedor_param_pct_4").autoNumeric('init', {mDec: 2, aSep: '.', aDec: ',', aSign: ''});

		$("#fornecedor_param_vlr_min_1").priceFormat({
		  prefix : '',
		  centsSeparator : ',',
		  thousandsSeparator : '.'
		});
		$("#fornecedor_param_vlr_min_2").priceFormat({
		  prefix : '',
		  centsSeparator : ',',
		  thousandsSeparator : '.'
		});
		$("#fornecedor_param_vlr_min_3").priceFormat({
		  prefix : '',
		  centsSeparator : ',',
		  thousandsSeparator : '.'
		});
		$("#fornecedor_param_vlr_min_4").priceFormat({
		  prefix : '',
		  centsSeparator : ',',
		  thousandsSeparator : '.'
		});
});

// ENVIANDO FORMULÁRIO DE CADASTRO
$('form#fornecedor_parametro').submit(function() {

		if (validar_formulario_desconto("")) {
				$.ajax({
				  type : "POST",
				  url : PORTAL_URL + 'dao/fornecedor/parametro_desconto',
				  data : $('form#fornecedor_parametro').serialize(),
				  cache : false,
				  success : function(obj) {
						  obj = JSON.parse(obj);
						  onSuccessSendDesconto(obj);
				  },
				  error : function(obj) {
						  onErrorDesconto(obj);
				  }
				});
				return false;
		} else {
				return false;
		}
});

/* SUCESSO AO ENVIAR */
function onSuccessSendDesconto(obj) {
		if (obj.msg == 'success') {
				postToURL(PORTAL_URL + 'fornecedor/perfil/' + obj.id, {
						retorno_sucesso : obj.retorno
				});
		} else if (obj.msg == 'error') {
				validar_formulario_Contato(obj);
		}
		return false;
}
/* ERRO AO ENVIAR */
function onErrorDesconto(args) {
		$("#msg_erro").slideToggle().fadeOut(4000);
		return false;
}

// VALIDATOR FORMULÁRIO DE CADASTRO
function validar_formulario_desconto(obj) {

		// LIMPA MENSAGENS DE ERRO
		$(".error").each(function() {
				$(this).remove();
		});

		var valido = true;
		var element = null;
		var objs = [];
		var objsSorted = [];

		$('input.param_pct').each(function(k, obj) {
				var pct = Number($(obj).val().replace('.', '').replace('.', '').replace(',', '.'));
				var vlr_min = Number($('input.param_vlr_min').eq(k).val().replace('.', '').replace('.', '').replace(',', '.'));
				if (pct > 0 && vlr_min > 0) {
						var objDesc = {
						  'pct' : pct,
						  'vlr_min' : vlr_min,
						  'element' : $('input.param_vlr_min').eq(k)
						};
						objs.push(objDesc);
				}
		});

		for ( var k in objs) {
				objsSorted.push(objs[k]);
		}
		
		objsSorted.sort(function(a, b) {
				return a.pct > b.pct;
		});

		$.each(objsSorted, function(k, obj) {
				if (k > 0) {
						if (obj.vlr_min <= objsSorted[k - 1].vlr_min) {
								valido = false;
								element =  obj.element;
								$(element).after('<label id="error_vlr" class="error">Este valor não pode ser menor ou igual ao valor mínimo de desconto do percentual '+objsSorted[k - 1].pct+'.</label>');
						}
				}
		});
		

		if (element != null) {
				var topPosition = element.offset().top - 135;
				$('html, body').animate({
						scrollTop : topPosition
				}, 800);
		}
		return valido;
}
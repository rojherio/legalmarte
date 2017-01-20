$(document).ready(function() {
		$("input#produto_qtd").autoNumeric('init', {
		  mDec : 2,
		  aSep : '.',
		  aDec : ',',
		  aSign : '',
		  vMin : '1.00'
		});
		sumOrc();
});

function sumOrc() {
		var sumPontos = 0;
		var sumValores = 0;
		$('table#itens').find('tbody').find('tr').each(function(k, tr) {
				var qtd = Number($(tr).find('input#produto_qtd').val().replace('.', '').replace('.', '').replace('.', '').replace('.', '').replace(',', '.'));
				var ptsUnit = Number($(tr).find('td#td_ponto_unit').attr('rel'));
				var vlrUnit = Number($(tr).find('td#td_produto_vlr_unit').attr('rel'));
				sumPontos += (qtd * ptsUnit);
				sumValores += (qtd * vlrUnit);
				$(tr).find('td#td_ponto_subtotal').html(number_format(parseFloat(qtd * ptsUnit).toFixed(2), 2, ",", "."));
				$(tr).find('td#td_produto_vlr_subtotal').html('R$&nbsp;' + number_format(parseFloat(qtd * vlrUnit).toFixed(2), 2, ",", "."));
		});
		$('table#itens').find('tfoot').find('th#th_ponto_total').html(number_format(parseFloat(sumPontos).toFixed(2), 2, ",", "."));
		$('table#itens').find('tfoot').find('th#th_vlr_total').html('R$&nbsp;' + number_format(parseFloat(sumValores).toFixed(2), 2, ",", "."));
}

$('input#produto_qtd').livequery('keyup', function() {
		sumOrc();
});

$('input#produto_qtd').livequery('blur', function() {
		orcamentoEdit($(this));
});

$('button#btn_item_remove').livequery('click', function() {
		orcamentoRemove($(this));
		return false;
});

function orcamentoEdit(obj) {
		var input = ($(obj));
		var item = $(obj).attr('rel');
		var qtd = $(obj).val();
		var qtdNow = Number(qtd.replace('.', '').replace('.', '').replace('.', '').replace('.', '').replace(',', '.'));
		var qtdLast = Number($(obj).attr('qtd_last'));
		if (qtdNow != qtdLast) {
				$.ajax({
				  type : "POST",
				  url : PORTAL_URL + 'dao/ponto/orcamento_edit',
				  data : {
				    item : item,
				    qtd : qtd
				  },
				  cache : false,
				  success : function(obj) {
						  obj = JSON.parse(obj);
						  onSuccessSendOrcEdit(obj, input, qtdNow);
				  },
				  error : function(obj) {
						  obj = JSON.parse(obj);
						  onErrorOrc(obj);
				  }
				});
		}
		return false;
}

function orcamentoRemove(obj) {
		var btn = ($(obj));
		var item = $(obj).attr('rel');
		$.ajax({
		  type : "POST",
		  url : PORTAL_URL + 'dao/ponto/orcamento_remove',
		  data : {
				  item : item
		  },
		  cache : false,
		  success : function(obj) {
				  obj = JSON.parse(obj);
				  onSuccessSendOrcRemove(obj, btn);
		  },
		  error : function(obj) {
				  obj = JSON.parse(obj);
				  onErrorOrc(obj);
		  }
		});
		return false;
}

function onSuccessSendOrcEdit(obj, input, qtdNow) {
		if (obj.msg == 'success') {
				$(input).attr('qtd_last', qtdNow);
				$('#msg_sucesso').find('span').html('<b>Sucesso:</b>&nbsp;' + obj.retorno);
				$("#msg_sucesso").slideToggle().fadeOut(4000);
		} else if (obj.msg == 'error') {
				$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
				$("#msg_erro").slideToggle().fadeOut(4000);
		}
		return false;
}

function onSuccessSendOrcRemove(obj, btn) {
		if (obj.msg == 'success') {
				$('#msg_sucesso').find('span').html('<b>Sucesso:</b>&nbsp;' + obj.retorno);
				$("#msg_sucesso").slideToggle().fadeOut(4000);
		} else if (obj.msg == 'error') {
				$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
				$("#msg_erro").slideToggle().fadeOut(4000);
		}
		$(btn).parents('tr').fadeOut(400, function() {
				$(this).remove();
		});
		return false;
}

function onErrorOrc(args) {
		$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
		$("#msg_erro").slideToggle().fadeOut(4000);
		return false;
}
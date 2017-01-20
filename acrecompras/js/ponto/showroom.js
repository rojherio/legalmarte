$(document).ready(function() {
		$("#produto_qtd").autoNumeric('init', {
		  mDec : 2,
		  aSep : '.',
		  aDec : ',',
		  aSign : ''
		});
});

$('a#orcamento_add').livequery('click', function() {
		orcamentoSalva($(this), 'add');
		return false;
});

$('a#orcamento_finish').livequery('click', function() {
		orcamentoSalva($(this), 'finish');
		return false;
});

function orcamentoSalva(obj, op) {
		var produto = $(obj).attr('rel');
		var qtd = $(obj).parents('#div_pacote').find('#produto_qtd').val();
		$.ajax({
		  type : "POST",
		  url : PORTAL_URL + 'dao/ponto/orcamento_add',
		  data : {
		    produto : produto,
		    qtd : qtd
		  },
		  cache : false,
		  success : function(obj) {
				  obj = JSON.parse(obj);
				  if (op == 'add') {
						  onSuccessSendOrcAdd(obj);
				  } else if (op == 'finish') {
						  onSuccessSendOrcFinish(obj);
				  }
		  },
		  error : function(obj) {
				  obj = JSON.parse(obj);
				  onErrorOrc(obj);
		  }
		});
		return false;
}

function onSuccessSendOrcAdd(obj) {
		if (obj.msg == 'success') {
				$('#msg_sucesso').find('span').html('<b>Sucesso:</b>&nbsp;' + obj.retorno);
				$("#msg_sucesso").slideToggle().fadeOut(4000);
		} else if (obj.msg == 'error') {
				$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
				$("#msg_erro").slideToggle().fadeOut(4000);
		}
		return false;
}

function onSuccessSendOrcFinish(obj) {
		if (obj.msg == 'success') {
				postToURL(PORTAL_URL + 'ponto/orcamento', {
						retorno_sucesso : obj.retorno
				});
		} else if (obj.msg == 'error') {
				$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
				$("#msg_erro").slideToggle().fadeOut(4000);
		}
		return false;
}

function onErrorOrc(args) {
		$('#msg_erro').find('span').html('<b>Atenção:</b>&nbsp;' + obj.retorno);
		$("#msg_erro").slideToggle().fadeOut(4000);
		return false;
}
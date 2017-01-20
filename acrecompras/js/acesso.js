/* Webarch Admin Dashboard 
 -----------------------------------------------------------------*/
//Máscara
jQuery(function($) {
		$("#pessoa_patrocinador").select2();
		$("#usuario_data_nascimento").mask("99/99/9999");
  $("#usuario_data_nascimento").datepicker({ format: 'dd/mm/yyyy'});
});

$(document).ready(function() {

		// ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
		/*
		 * $('form#usuario_novo').submit(function () { if (validar_formulario("")) { projetouniversal.util.getjson({ url: PORTAL_URL + "dao/usuario/cadastro", type: "POST", data: $('form#usuario_novo').serialize(), enctype: 'multipart/form-data', success: onSuccessSend, error: onError }); } else { return false; } });
		 */

		// ENVIANDO FORMULÁRIO DE CADASTRO DO USUÁRIO
		/*
		 * $('form#usuario_login').submit(function () { if (validar_formulario_login("")) { projetouniversal.util.getjson({ url: PORTAL_URL + "dao/usuario/login", type: "POST", data: $('form#usuario_login').serialize(), enctype: 'multipart/form-data', success: onSuccessSend2, error: onError }); } else { return false; } });
		 */

		$('form#usuario_problema').submit(function() {
				if (validar_formulario_email("")) {
						$.ajax({
						  type : "POST",
						  url : PORTAL_URL + 'dao/usuario/email',
						  data : $('form#usuario_problema').serialize(),
						  cache : false,
						  success : function(obj) {
								  obj = JSON.parse(obj);
								  onSuccessSendEmail(obj);
						  },
						  error : function(obj) {
								  onError(obj);
						  }
						});
						return false;
				} else {
						return false;
				}
		});

		$('form#usuario_login').submit(function() {
				if (validar_formulario_login("")) {
						$.ajax({
						  type : "POST",
						  url : PORTAL_URL + 'dao/loga',
						  data : $('form#usuario_login').serialize(),
						  cache : false,
						  success : function(obj) {
								  obj = JSON.parse(obj);
								  onSuccessSend(obj);
						  },
						  error : function(obj) {
								  onError(obj);
						  }
						});
						return false;
				} else {
						return false;
				}
		});

		$('form#usuario_novo').submit(function() {
				if (validar_formulario("")) {
						$.ajax({
						  type : "POST",
						  url : PORTAL_URL + 'dao/usuario/cadastro',
						  data : $('form#usuario_novo').serialize(),
						  cache : false,
						  success : function(obj) {
								  obj = JSON.parse(obj);
								  onSuccessSend2(obj);
						  },
						  error : function(obj) {
								  onError(obj);
						  }
						});
						return false;
				} else {
						return false;
				}
		});

		/* SUCESSO AO ENVIAR E-MAIL */
		function onSuccessSendEmail(obj) {
				if (obj.msg == 'success') {
						postToURL(PORTAL_URL + 'acesso');
				} else if (obj.msg == 'error') {
						validar_formulario_email(obj);
				}
				return false;
		}
		/* SUCESSO AO ENVIAR */
		function onSuccessSend(obj) {
				if (obj.msg == 'success') {
						postToURL(PORTAL_URL + 'dashboard');
				} else if (obj.msg == 'error') {
						validar_formulario_login(obj);
				}
				return false;
		}
		/* SUCESSO AO ENVIAR LOGIN */
		function onSuccessSend2(obj) {
				if (obj.msg == 'success') {
						postToURL(PORTAL_URL + 'dashboard');
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

		// VALIDATOR FORMULÁRIO DE CADASTRO
		function validar_formulario_email(obj) {

				var valido = true;
				var usuario_email = $("#usuario_redefinir_email").val();

				var element = null;

				// LIMPA MENSAGENS DE ERRO
				$(".error").each(function() {
						$(this).remove();
				});

				if (obj.tipo == "" || obj.tipo == null) {

						if (usuario_email == "") {
								$('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">O e-mail é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_email');
						}

				} else if (obj.tipo == 'email') {
						$('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">' + obj.retorno + '</label>');
						valido = false;
						element = $('div#div_usuario_email');
				}

				if (element != null) {
						var topPosition = element.offset().top - 135;
						$('html, body').animate({
								scrollTop : topPosition
						}, 800);
				}
				return valido;
		}

		// VALIDATOR FORMULÁRIO DE LOGIN
		function validar_formulario_login(obj) {
				var valido = true;
				var usuario_login = $("#acesso_usuario_login").val();
				var usuario_senha = $("#acesso_usuario_senha").val();

				var element = null;

				// LIMPA MENSAGENS DE ERRO
				$(".error").each(function() {
						$(this).remove();
				});

				if (obj.tipo == "" || obj.tipo == null) {

						if (usuario_senha == "") {
								$('div#div_acesso_usuario_senha').after('<label id="erro_acesso_usuario_senha" class="error">A senha é obrigatório.</label>');
								valido = false;
								element = $('div#div_acesso_usuario_senha');
						}

						if (usuario_login == "") {
								$('div#div_acesso_usuario_login').after('<label id="erro_acesso_usuario_login" class="error">O login é obrigatório.</label>');
								valido = false;
								element = $('div#div_acesso_usuario_login');
						}
				} else if (obj.tipo == "login") {
						valido = false;
						$('div#div_acesso_usuario_login').after('<label id="erro_acesso_usuario_login" class="error">' + obj.retorno + '</label>');
						$('div#div_acesso_usuario_senha').after('<label id="erro_acesso_usuario_senha" class="error">' + obj.retorno + '</label>');
						element = $('div#div_acesso_usuario_login');
				}

				if (element != null) {
						var topPosition = element.offset().top - 135;
						$('html, body').animate({
								scrollTop : topPosition
						}, 800);
				}
				return valido;
		}

		// VALIDATOR FORMULÁRIO DE CADASTRO
		function validar_formulario(obj) {

				var valido = true;
				var usuario_nickname = $("#usuario_nickname").val();
				var usuario_data_nascimento = $("#usuario_data_nascimento").val();
				var usuario_email = $("#usuario_email").val();

				var usuario_senha_digitado = $("#usuario_senha_digitado").val();
				var usuario_senha_confere = $("#usuario_senha_confere").val();

				var element = null;

				// LIMPA MENSAGENS DE ERRO
				$(".error").each(function() {
						$(this).remove();
				});

				if (obj.tipo == "" || obj.tipo == null) {

						if (usuario_email == "") {
								$('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">O e-mail é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_email');
						}

						if (usuario_data_nascimento == "") {
								$('div#div_usuario_data_nascimento').after('<label id="erro_usuario_data_nascimento" class="error">A data de nascimento é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_data_nascimento');
						}

						if (usuario_nickname == "") {
								$('div#div_usuario_nickname').after('<label id="erro_usuario_nickname" class="error">O nickname é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_nickname');
						}

						if (usuario_senha_digitado == "") {
								$('div#div_usuario_senha').after('<label id="erro_usuario_senha" class="error">A senha é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_senha');
						}

						if (usuario_senha_confere == "") {
								$('div#div_usuario_senha_confere').after('<label id="erro_usuario_senha_confere" class="error">A confirmação de senha é obrigatório.</label>');
								valido = false;
								element = $('div#div_usuario_senha_confere');
						}

						if (usuario_senha_digitado != usuario_senha_confere) {
								$('div#div_usuario_senha').after('<label id="erro_usuario_senha" class="error">A senha e confirmação de senha não coincidem.</label>');
								$('div#div_usuario_senha_confere').after('<label id="erro_usuario_senha_confere" class="error">A senha e confirmação de senha não coincidem.</label>');
								valido = false;
								element = $('div#div_usuario_senha');
						}
				} else if (obj.tipo == "nickname") {
						$('div#div_usuario_nickname').after('<label id="erro_usuario_nickname" class="error">' + obj.retorno + '</label>');
						valido = false;
						element = $('div#div_usuario_nickname');
				} else if (obj.tipo == "email") {
						$('div#div_usuario_email').after('<label id="erro_usuario_email" class="error">' + obj.retorno + '</label>');
						valido = false;
						element = $('div#div_usuario_email');
				}

				if (element != null) {
						var topPosition = element.offset().top - 135;
						$('html, body').animate({
								scrollTop : topPosition
						}, 800);
				}
				return valido;
		}

		$(function() {
				if (window.location.hash == '#novo') {
						$('button#usuario_novo_toggle').click();
				}
		});
		
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
				effect : "fadeIn"
		});


		/*
		 * $('form#usuario_login').validate({ focusInvalid: false, ignore: "", rules: { txtusername: { minlength: 2, required: true }, txtpassword: { required: true, } }, invalidHandler: function(event, validator) { // display error alert on form submit }, errorPlacement: function(label, element) { // render error placement for each input type $('<span class="error"></span>').insertAfter(element).append(label) var parent = $(element).parent('.input-with-icon'); parent.removeClass('success-control').addClass('error-control'); }, highlight: function(element) { // hightlight error inputs }, unhighlight: function(element) { // revert the change done by hightlight }, success: function(label, element) { var parent = $(element).parent('.input-with-icon'); parent.removeClass('error-control').addClass('success-control'); }, submitHandler: function(form) { form.submit(); } });
		 */
});
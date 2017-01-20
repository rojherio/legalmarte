$(document).ready(function() {

});

// Form Wizard Validations
var $validator = $("#commentForm").validate({
  rules : {
    emailfield : {
      required : true,
      email : true,
      minlength : 3
    },
    txtFullName : {
      required : true,
      minlength : 3
    },
    txtFirstName : {
      required : true,
      minlength : 3
    },
    txtLastName : {
      required : true,
      minlength : 3
    },
    txtCountry : {
      required : true,
      minlength : 3
    },
    txtPostalCode : {
      required : true,
      minlength : 3
    },
    txtPhoneCode : {
      required : true,
      minlength : 3
    },
    txtPhoneNumber : {
      required : true,
      minlength : 3
    },
    urlfield : {
      required : true,
      minlength : 3,
      url : true
    }
  },
  errorPlacement : function(label, element) {
		  $('<span class="arrow"></span>').insertBefore(element);
		  $('<span class="error"></span>').insertAfter(element).append(label)
  }
});

$('#rootwizard').bootstrapWizard({
  'tabClass' : 'form-wizard',
  'onNext' : function(tab, navigation, index) {
		  var $valid = $("#commentForm").valid();
		  if (!$valid) {
				  $validator.focusInvalid();
				  return false;
		  } else {
				  $('#rootwizard').find('.form-wizard').children('li').eq(index - 1).addClass('complete');
				  $('#rootwizard').find('.form-wizard').children('li').eq(index - 1).find('.step').html('<i class="fa fa-check"></i>');
		  }
  }
});

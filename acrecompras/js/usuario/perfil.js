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
 }
 */
// END ELEMENTS CHECKBOX SWITCH -----------------------------------------------------------------------------------------------------------------------------------------------------------------
$(document).ready(function() {
//VERIFICANDO SE ALGUMA MSG COM SUCESSO FOI ENVIADA
    if ($("#retorno_sucesso").val() == 1) {
        $("#msg_sucesso").slideToggle().fadeOut(4000);
    }
    // BEGIN TABS AND ACCORDIAN -----------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Accordians
    $('.panel-group').collapse({
        toggle: false
    })

    /** *** Tabs **** */
    // Normal Tabs - Positions are controlled by CSS classes
    $('#tab-01 a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('#tab-2 a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('#tab-2 li:eq(1) a').tab('show');

    $('#tab-3 a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('#tab-3 li:eq(2) a').tab('show');

    $('#tab-4 a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('#tab-5 a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    // END TABS AND ACCORDIAN -----------------------------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ELEMENTS MASK AND PLUGINS -----------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Dropdown menu - select2 plug-in
    $("select.select2").select2();

    // Multiselect - Select2 plug-in
//		$("select#multi").val([ "Jim", "Lucy" ]).select2();

    // Date Pickers
    $('.input-append.date').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    $('#dp5').datepicker();

    $('#sandbox-advance').datepicker({
        format: "dd/mm/yyyy",
        startView: 1,
        daysOfWeekDisabled: "3,4",
        autoclose: true,
        todayHighlight: true
    });

    // Time pickers
    $('.clockpicker ').clockpicker({
        autoclose: true
    });
    // Color pickers
    $('.my-colorpicker-control').colorpicker()

    // Input mask - Input helper
    $(function($) {
        $("#date").mask("99/99/9999");
        $("#phone").mask("(999) 999-9999");
        $("#tin").mask("99-9999999");
        $("#ssn").mask("999-99-9999");
    });

    // Autonumeric plug-in - automatic addition of dollar signs,etc controlled by tag attributes
    $('.auto').autoNumeric('init');

    // HTML5 editor
    $('#text-editor').wysihtml5();

    // Drag n Drop up-loader
    $("div#myId").dropzone({
        url: "/file/post"
    });

    // Single instance of tag inputs - can be initiated with simply using data-role="tagsinput" attribute in any input field
    $('#source-tags').tagsinput({
        typeahead: {
            source: ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo']
        }
    });

    // END MASK AND PLUGINS -----------------------------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN VALIDATION -----------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Traditional form validation sample
    $('#form_traditional_validation').validate({
        focusInvalid: false,
        ignore: "",
        rules: {
            form1Amount: {
                minlength: 2,
                required: true
            },
            form1CardHolderName: {
                minlength: 2,
                required: true,
            },
            form1CardNumber: {
                required: true,
                creditcard: true
            },
            cardType: {
                required: true
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
            var parent = $(element).parent();
            parent.removeClass('success-control').addClass('error-control');
        },
        unhighlight: function(element) { // revert the change done by hightlight

        },
        success: function(label, element) {
            var parent = $(element).parent('.input-with-icon');
            parent.removeClass('error-control').addClass('success-control');
        },
        submitHandler: function(form) {

        }
    });

    $('.select2', "#form_traditional_validation").change(function() {
        $('#form_traditional_validation').validate().element($(this)); // revalidate the chosen dropdown value and show error or success message for the input
    });
    // Iconic form validation sample
    $('#form_iconic_validation').validate({
        errorElement: 'span',
        errorClass: 'error',
        focusInvalid: false,
        ignore: "",
        rules: {
            form1Name: {
                minlength: 2,
                required: true
            },
            form1Email: {
                required: true,
                email: true
            },
            form1Url: {
                required: true,
                url: true
            },
            gendericonic: {
                required: true
            }
        },
        invalidHandler: function(event, validator) {
            // display error alert on form submit
        },
        errorPlacement: function(error, element) { // render error placement for each input type
            var icon = $(element).parent('.input-with-icon').children('i');
            var parent = $(element).parent('.input-with-icon');
            icon.removeClass('fa fa-check').addClass('fa fa-exclamation');
            parent.removeClass('success-control').addClass('error-control');
        },
        highlight: function(element) { // hightlight error inputs
            var parent = $(element).parent();
            parent.removeClass('success-control').addClass('error-control');
        },
        unhighlight: function(element) { // revert the change done by hightlight

        },
        success: function(label, element) {
            var icon = $(element).parent('.input-with-icon').children('i');
            var parent = $(element).parent('.input-with-icon');
            icon.removeClass("fa fa-exclamation").addClass('fa fa-check');
            parent.removeClass('error-control').addClass('success-control');
        },
        submitHandler: function(form) {

        }

    });
    $('.select2', "#form_iconic_validation").change(function() {
        $('#form_iconic_validation').validate().element($(this)); // revalidate the chosen dropdown value and show error or success message for the input
    });
    // Form Condensed Validation
    $('#form-condensed').validate({
        errorElement: 'span',
        errorClass: 'error',
        focusInvalid: false,
        ignore: "",
        rules: {
            form3FirstName: {
                minlength: 3,
                required: true
            },
            form3LastName: {
                minlength: 3,
                required: true
            },
            form3Gender: {
                required: true,
            },
            form3DateOfBirth: {
                required: true,
            },
            form3Occupation: {
                minlength: 3,
                required: true,
            },
            form3Email: {
                required: true,
                email: true
            },
            form3Address: {
                minlength: 10,
                required: true,
            },
            form3City: {
                minlength: 5,
                required: true,
            },
            form3State: {
                minlength: 3,
                required: true,
            },
            form3Country: {
                minlength: 3,
                required: true,
            },
            form3PostalCode: {
                number: true,
                maxlength: 4,
                required: true,
            },
            form3TeleCode: {
                minlength: 3,
                maxlength: 4,
                required: true,
            },
            form3TeleNo: {
                maxlength: 10,
                required: true,
            },
        },
        invalidHandler: function(event, validator) {
            // display error alert on form submit
        },
        errorPlacement: function(label, element) { // render error placement for each input type
            $('<span class="error"></span>').insertAfter(element).append(label)
        },
        highlight: function(element) { // hightlight error inputs

        },
        unhighlight: function(element) { // revert the change done by hightlight

        },
        success: function(label, element) {

        },
        submitHandler: function(form) {

        }
    });

    // Form Wizard Validations
    var $validator = $("#commentForm").validate({
        rules: {
            emailfield: {
                required: true,
                email: true,
                minlength: 3
            },
            txtFullName: {
                required: true,
                minlength: 3
            },
            txtFirstName: {
                required: true,
                minlength: 3
            },
            txtLastName: {
                required: true,
                minlength: 3
            },
            txtCountry: {
                required: true,
                minlength: 3
            },
            txtPostalCode: {
                required: true,
                minlength: 3
            },
            txtPhoneCode: {
                required: true,
                minlength: 3
            },
            txtPhoneNumber: {
                required: true,
                minlength: 3
            },
            urlfield: {
                required: true,
                minlength: 3,
                url: true
            }
        },
        errorPlacement: function(label, element) {
            $('<span class="arrow"></span>').insertBefore(element);
            $('<span class="error"></span>').insertAfter(element).append(label)
        }
    });

    $('#rootwizard').bootstrapWizard({
        'tabClass': 'form-wizard',
        'onNext': function(tab, navigation, index) {
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

    // END VALIDATION -----------------------------------------------------------------------------------------------------------------------------------------------------------------

});
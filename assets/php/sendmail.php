<?php

	// PUT YOUR MAIL BETWEEN THE SEMICOLS
	$yourmail = "spambox@inssitu.com";

	// Prepare your subject
	$subject = "New contact";

	// Prepare your email body text
	$Body = "";
	$Body .= "Name: ";
	$Body .= $_POST['name'];
	$Body .= "\n";
	$Body .= "Message: ";
	$Body .= $_POST['message'];
	$Body .= "\n";
	$Body .= "Email: ";
	$Body .= $_POST['email'];
	$Body .= "\n";

	// This line checks that we have a valid email address (Note: filter_var() requires PHP >= 5.2.0)
	if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {


		// Detect & prevent header injections
		$test = "/(content-type|bcc:|cc:|to:)/i";
		foreach ( $_POST as $key => $val ) {
			if ( preg_match( $test, $val ) ) {
				exit;
			}
		}

		// This method sends the mail.
		mail($yourmail, $subject, $Body, "From:" . $_POST['email']);

	} 

?>
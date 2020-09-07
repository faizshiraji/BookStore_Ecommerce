$(function() {
		$("form[name='customerForm']").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				firstName : "required",
				lastName : "required",
				password : "required",

				confirmPassword : {
					required : true,
					equalTo : "#password"
				},

				phone : "required",
				addressLine1 : "required",
				addressLine2 : "required",
				city : "required",
				state : "required",
				zipCode : "required",
				country : "required"
			},
			messages : {
				email : {
					required : "Please enter e-mail address",
					email : "Please enter a valid e-mail address"
				},
				firstName : "Please enter first name.",
				lastName : "Please enter last name.",
				password : "Please enter your password.",
				confirmPassword : {
					required : "Please enter your confirm password.",
					equalTo : "Confirm password does not match."
				},
				phone : "Please enter phone number.",
				addressLine1 : "Please enter your address.",
				addressLine2 : "Please enter your address.",
				city : "Please enter your city.",
				state : "Please enter your state.",
				zipCode : "Please enter your zip code number.",
				country : "Please enter your country."
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
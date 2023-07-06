<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>SignUp</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 ads mt-13">
				<a class="loginA" href="loginPage">Already a member ? Login</a>
				<h1>
					<span id="fl"> <span class="cmp">Start your 14 day
							FREE Trial Now</span>
				</h1>
				<!-- <img src="assets/img/Users-to-Whatsapp.png"> -->
				<ul class="whatsapp">
					<li><i class="fa fa-check-circle-o" aria-hidden="true"></i>
						&nbsp;FREE WhatsApp Business API Verification</li>
					<li><i class="fa fa-check-circle-o" aria-hidden="true"></i>
						&nbsp;Unlimited Monthly Active Users on new plans</li>
					<li><i class="fa fa-check-circle-o" aria-hidden="true"></i>
						&nbsp;1000 FREE conversations/month on all plans</li>
					<li><i class="fa fa-check-circle-o" aria-hidden="true"></i>
						&nbsp;Access all Basic Plan Features in your Free Trial</li>
				</ul>
			</div>
			<div class="col-md-6 login-form2">
				<div class="profile-img">
					<a class="loginB" href="https://www.ai.vnsai.com/login" target="_blank">Already a member ? Login</a> <img
						src="assets/img/ai-logo.png" alt="profile_img">
				</div>
				<h3>
					<b>Create Your VNSAI Account</b>
				</h3>
				<a class="loginB" href="logout" >Change Gmail?</a>
				<form:form  method="post" onSubmit = "return checkPassword(this)" action="RegisterUser" modelAttribute="signup">
					<div class="form-group">
						<input type="text" class="form-control" name="name" value="${name}"
						readonly="readonly"
							placeholder="Full Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="email" value="${email}"
						readonly="readonly"
							placeholder="Email">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="phone"
							placeholder="Phone" required >
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password" required>
					</div>

					<div class="form-group">
						<input type="password" class="form-control" name="repassword"
							placeholder="Re-Password" required>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-lg btn-block">Start
							Your Free Trial</button>
					</div>
					<div class="form-group forget-password">
						<a href="#">The Google Privacy Policy and Terms of Service
							apply.</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>
<script>
          
            // Function to check Whether both passwords
            // is same or not.
            function checkPassword(form) {
                password1 = form.password.value;
                password2 = form.repassword.value;
  
                if (password1 == ''){
                    alert ("Please enter Password");
                }else if (password2 == ''){
                    alert ("Please enter confirm password");
                }else if (password1 != password2) {
                    alert ("Password did not match: Please try again...");
                    return false;
                }else{
                    return true;
                }
            }
        </script>
</html>
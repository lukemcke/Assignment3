<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title> IT Service Portal </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginStyleSheet.css" />
</head>
<body>
<%@include file="UserMaster.jsp"%>
<div class="text-center">
	<div class ="container login-container">
		<div class ="row">
			<div class = "col-md-5 login-form-1 text-center">	
				<h3>LOGIN</h3>
				<form action="Login" method="POST">
					<div class="form-group">
						<label for="email"> Email </label>
						<input name="email" type="text" class= "form-control" 
						placeholder="Your Email *" value =""/>
					</div>
					<div>
						<label for="passowrd"> Password </label>
						<input name="password" type="password" class= "form-control" 			placeholder="Your Password*" value =""/>
					</div>
					<div class = form-group>
						<br>
						<input type="Submit" class ="btnSubmit" name="login" value="Login" />
					</div>
					<div class="form-group">
						<a href="#" class="PWForget">Forget Password?</a>
					</div>
				</form>
			</div>
	</div>
</div>
</body>



</html>
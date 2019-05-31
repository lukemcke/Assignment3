<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title> IT Service Portal </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="UserMaster.jsp"%>
	
	
<form action="Login" method="POST">
		<div class="Container">
			<label for="email"> Email </label>
			<input name="email" type="text" />
			<label for="passowrd"> Password </label>
			<input name="password" type="password" />
			<input type="Submit" name="login" value="Login" />
		</div>
	</form>
</body>



</html>
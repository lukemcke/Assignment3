<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>

<html>
	<head>
		<title>Knowledge Menu </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
<body>
<%@include file="../UserMaster.jsp"%>

<div class="container">
<h1> Knowledge Menu </h1>
<form action="Knowledge" method="POST">
		<div class="row">
			<c:if test="${userLogin.getIsadmin()}">
			<div class="col-md-12">
				<input class="btn btn-lg btn-default" type="submit" name="addArticle" value="Add An Article"/>
			</div>
			</c:if>
			<br /><br /><br /><br />
			<div class="col-md-12">
				<input class="btn btn-lg btn-default" type="submit" name="viewArticles" value="View Articles"/>
			</div>
		</div>
	</div>
</form>
</body>
</html>
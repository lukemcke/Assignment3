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
<c:choose>
    <c:when test="${masterPage=='User'}">
		<%@include file="UserMaster.jsp"%>
    </c:when>    
    <c:otherwise>
        <%@include file="AdminMaster.jsp"%>
    </c:otherwise>
</c:choose>
	
	<div class="Container">
		<h1> IT Service Portal </h1>
		<h1> ${masterPage} </h1>
	</div>
</body>



</html>
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
	
	<form action="assignment3" method="POST">

	<c:choose>
		<c:when test="${empty notifications}">
			<div class="bg-success">
				<span> You have no notifications </span>
			</div>
		</c:when>
		<c:otherwise>
		<div class="bg-danger">
			<h2> Notifications </h2>
			<table>
			<tr><th> Title </th> <th> Category </th> <th> Sub Category </th> <th> date reported </th><th> Issue fixed?</tr>
			<c:forEach var="notif" items="${notifications}">
				<tr>
					<td><c:out value="${notif.title}"/></td>
					<td><c:out value="${notif.category}"/></td>
					<td><c:out value="${notif.subcategory}"/></td>
					<td><c:out value="${notif.datereported}"/></td>
					<td> <select id="option"> <option id="select"> Select option </option> <option value="Resolved"> Accept </option> <option value ="Not accepted"> Decline </option> </select> </td>
					<td> <input type="Submit" name="notify" value="Submit"/></td>
				</tr>
				<input id="ID" name="ID" type="hidden" value="<c:out value="${notif.issueid}"/>"/>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	<input id="hidden" name="status" type="hidden" value=""/>
	</form>
	<div class="Container">
		<h1> IT Service Portal </h1>
	</div>
	<script>
		$('#option').change( function() {
			$('#select').remove();
			$('#hidden').val(this.value);
		});
	</script>
</body>



</html>
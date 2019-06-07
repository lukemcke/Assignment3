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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
	<%@include file="UserMaster.jsp"%>
	
	<form action="Index" method="POST">

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
			<tr><th> Title </th> <th> Category </th> <th> Sub Category </th> <th> date reported </th><th> Status </th>
			<!-- displays different results based on if the user is an admin -->
			<c:if test="${not userLogin.getIsadmin()}">
			<th> Issue fixed? </th></tr>
			</c:if>
			<!-- users receive notifications based on whether the issue is in the 'waiting on reporter' state or 'Not accepted' state -->
			<c:forEach var="notif" items="${notifications}">
				<tr>
					<td><c:out value="${notif.title}"/></td>
					<td><c:out value="${notif.category}"/></td>
					<td><c:out value="${notif.subcategory}"/></td>
					<td><c:out value="${notif.datereported}"/></td>
					<td><c:out value="${notif.status}"/></td>
					<c:if test="${not userLogin.getIsadmin()}"> 
					<td> <select class="option" name="status"> <option id="select"> Select option </option> <option id="accept" value="Resolved"> Accept </option> <option value ="Not accepted"> Decline </option> </select>  </td>
					<td> <input type="Submit" name="notify" value="Submit"/></td>
					</c:if>
				</tr>
				<input id="ID" name="ID" type="hidden" value="<c:out value="${notif.issueid}"/>"/>
				<c:if test="${not userLogin.getIsadmin()}"> 
			</c:if>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<div class="resolvedetails">
		<label for="resolvedetails"> Resolve Details </label><br />
		<textarea name="resolvedetails" rows="5" cols="30" placeholder="Enter how your problem was solved"></textarea> <br />
	</div>
	</div>
	</form>
	<div class="container">
		<h1> IT Service Portal </h1><br />
		
		<p> Welcome to IT Service Portal here you can report an issue, view the knowledge base of previous issues and view your own issues. </p>
		
	</div>
	<script>
		$('.resolvedetails').hide();
		$('.option').change( function() {
			$(this).parent().find('#select').remove(); 
						
			if(this.value == 'Resolved'){
				$(this).closest('.bg-danger').find('.resolvedetails').show();
				}
			else {
				$(this).closest('.bg-danger').find('.resolvedetails').hide();
			}
		});
	</script>
</body>



</html>
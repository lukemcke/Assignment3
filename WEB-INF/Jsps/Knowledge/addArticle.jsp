<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--create the HTML table using foreach tag--%>
<!DOCTYPE>

<html>
	<head>
		<title>Report An Issue </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
<body>
	<%@include file="../UserMaster.jsp"%>

<div class="container">
<form id="reportForm" action="Knowledge" Method="POST">
	<a href="Knowledge"> Return to Menu </a> <br/><br/>
	<c:choose>
	<c:when test="${empty issues}">
		<span> There are currently no issues to add </span>
	</c:when>
	<c:otherwise>
	<table class="table">
		<th> Title </th>
		<th> Resolve Details </th>
		<th> Category </th>
		<th> Sub Category </th>
		<th> Status </th>
		<c:forEach var="issue" items="${issues}">
		<tr>
			<td><c:out value="${issue.title}"/>  </td>
			<td><c:out value="${issue.resolvedetails}"/>  </td>
			<td><c:out value="${issue.category}"/>  </td>
			<td><c:out value="${issue.subcategory}"/>  </td>
			<td><c:out value="${issue.status}"/>  </td>
			<td><a href="Knowledge?ID=<c:out value="${issue.issueid}"/>"> Add to Knowledge Base </td>
		</tr>
		</c:forEach>
	</table>
	<input type="submit" name="addArticle" value="Add Article"/>
	</c:otherwise>
	</c:choose>
</form>
</div>
</body>
</html>
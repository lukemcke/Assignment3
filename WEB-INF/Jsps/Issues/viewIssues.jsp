<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>

<html>
	<head>
		<title>View Issues </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
<body>
<%@include file="../UserMaster.jsp"%>

<form action="Issue" method="POST">
<div class="container">
	<div class="row">
		<div class="col-xs-4">
			<input type="text" name="search" placeholder="Search for key words" />
			<input type="submit" class="btn btn-default" name="keySearch" value="Search"/>
		</div>
		<div class="col-xs-4">
			<select id="Cat" name="category">
				<option value="Network"> Network </option>
				<option value="Software"> Software </option>
				<option value="Hardware"> Hardware </option>
				<option value="Email"> Email </option>
				<option value="Account"> Account </option>
			</select>
			<input type="submit" class="btn btn-default" name="sortCat" value="Sort By Category"/>
		</div>
		<div class="col-xs-4">
			<select name="date">
				<option value="ASC"> Ascending </option>
				<option value="DESC"> Decending </option>
			</select>
			<input type="submit" class="btn btn-default" name="sortDate" value="Sort by Date"/>
		</div>
	</div>
</div>
<br />


<c:choose>
	<c:when test="${userLogin.getIsadmin()}">
	<table class="table">
	<tr><th scope="col">IssueID</th><th scope="col">Title</th><th scope="col">Description</th>
	<th scope="col">DateReported</th><th scope="col">Category</th><th scope="col">SubCategory</th><th scope="col">Status</th></tr>
	<c:forEach var="issue" items="${issues}">
		<tr>
			<td><c:out value="${issue.issueid}"/></td>
			<td><c:out value="${issue.title}"/></td>
			<td><c:out value="${issue.description}"/></td>
			<td><c:out value="${issue.datereported}"/></td>
			<td><c:out value="${issue.category}"/></td>
			<td><c:out value="${issue.subcategory}"/></td>
			<td><c:out value="${issue.status}"/></td>
			<td><a href="Issue?ID=<c:out value="${issue.issueid}"/>">View Issue</a> </td>
		</tr>
	</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
	<table class="table">
		<tr><th>IssueID</th><th>Title</th><th>Description</th>
	<th>DateReported</th><th>Category</th><th>SubCategory</th><th>Status</th></tr>
	<c:forEach var="issue" items="${userissues}">
		<tr>
			<td><c:out value="${issue.issueid}"/></td>
			<td><c:out value="${issue.title}"/></td>
			<td><c:out value="${issue.description}"/></td>
			<td><c:out value="${issue.datereported}"/></td>
			<td><c:out value="${issue.category}"/></td>
			<td><c:out value="${issue.subcategory}"/></td>
			<td><c:out value="${issue.status}"/></td>
			<td><a href="Issue?ID=<c:out value="${issue.issueid}"/>">View Issue</a> </td>
		</tr>
	</c:forEach>
	</table>
	</c:otherwise>
	
	</c:choose>
</table>
</form>
</body>
</html>
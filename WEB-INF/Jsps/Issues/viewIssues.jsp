<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@include file="../master.jsp"%>

<form action="Issue" method="POST">
<label for="search"> Search for key words</label>
<input type="text" name="search" />
<input type="submit" name="keySearch" value="Search"/>
<br />
<table>
	<tr><th>IssueID</th><th>Title</th><th>Description</th>
	<th>DateReported</th><th>Category</th><th>SubCategory</th><th>Status</th></tr>
	<c:forEach var="issue" items="${issues}">
		<tr>
			<td><c:out value="${issue.issueID}"/></td>
			<td><c:out value="${issue.title}"/></td>
			<td><c:out value="${issue.description}"/></td>
			<td><c:out value="${issue.datereported}"/></td>
			<td><c:out value="${issue.category}"/></td>
			<td><c:out value="${issue.subcategory}"/></td>
			<td><c:out value="${issue.status}"/></td>
			<td><a href="Issue?ID=<c:out value="${issue.issueID}"/>">View Issue</a> </td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
</html>
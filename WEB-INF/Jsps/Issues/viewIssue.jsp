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
<%@include file="../UserMaster.jsp"%>
<form action="Issue" method="POST">
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<h2><c:out value="${issue.title}"/> </h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<span>Issue ID </span>
			<label name="ID" for="category"><c:out value="${issue.issueid}"/></label> <br />
			<span>Category Type </span>
			<label for="category"><c:out value="${issue.category}"/></label> <br />
			<span> SubCategory </span>
			<label for="subcategory"><c:out value="${issue.subcategory}"/></label> <br>
			<span> Description </span>
			<label for="description"><c:out value="${issue.description}"/></label> <br />
		</div>
		<div class="col-xs-6">
			<c:out value="${issue.datereported}"/>
			<c:out value="${issue.status}"/>
		</div>
		<div class="col-xs-6">
		<c:if test="${userLogin.getIsadmin()}">
			<Select id="status" name="changeStatus">
				<c:forEach var="s" items="${status}">
					<option> ${s} </option>
				</c:forEach>
			</Select>
			<input type="hidden" name="issueID" value="<c:out value="${issue.issueid}"/>"/>
			<input type="submit" class="btn btn-default" name="Status" value="Change Status"/>
		</c:if>
		</div>
	</div>
</div>
			
</form>		
</body>
</html>
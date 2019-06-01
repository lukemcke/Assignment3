<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>

<html>
	<head>
		<title>View Issue </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<style>
			span {font-size : 20px  }
			label {font-size : 20px }
		</style>
	</head>
<body>
<%@include file="../UserMaster.jsp"%>
<form action="viewIssue" method="POST">
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<h2><c:out value="${issue.title}"/> </h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<span>Issue ID </span>
			<label name="ID" for="category"><c:out value="${issue.issueid}"/></label> <br />
			<span>Category Type </span>
			<label for="category"><c:out value="${issue.category}"/></label> <br />
			<span> SubCategory Type </span>
			<label for="subcategory"><c:out value="${issue.subcategory}"/></label> <br>
			<span> Description </span>
			<label for="description"><c:out value="${issue.description}"/></label> <br />
			<span> Date Reported</span>
			<label for="deteReported"><c:out value="${issue.datereported}"/></label> <br />
			<span> Status </span>
			<label for="deteReported"><c:out value="${issue.status}"/></label> <br />
			<input type="hidden" name="issueID" value="<c:out value="${issue.issueid}"/>"/>
		</div>

		<div class="col-md-6">
		<c:if test="${userLogin.getIsadmin()}">
			<Select id="status" name="changeStatus">
				<c:forEach var="s" items="${status}">
					<option> ${s} </option>
				</c:forEach>
			</Select>
			<input type="submit" class="btn btn-default" name="Status" value="Change Status"/>
		</c:if>
		<c:choose>
			<c:when test="${empty comments}">
				<span> There are no comments for this issue </span>
			</c:when>
			<c:otherwise>
			<h2> Comments </h2>
			<table class="table"> <th> Title </th> <th> Field </th>
			<c:forEach var="com" items="${comments}">
				<tr> <td> <c:out value="${com.title}"/> </td>
					<td> <c:out value="${com.field}"/> </td> </tr>
			</c:forEach>
			</table>
			</c:otherwise>
		</c:choose>
			<h3> Add Comment </h3>
			<span> Title </span> <br />
			<input type="text" name="commTitle" /> <br />
			<span> Comment </span> <br />
			<textarea name="comment" rows="3" cols="30" placeholder="Enter your Comment here"></textarea> <br />
			<input id="btnaddComment" type="submit" name="addComment" value="Add Comment"/>
		</div>
	</div>
</div>
			
</form>
<script>
</script>
</body>
</html>
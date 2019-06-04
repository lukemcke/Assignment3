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
			<hr />
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
			<input id="btnaddComment" class="btn btn-default" type="submit" name="addComment" value="Add Comment"/>
		</div>

		<div class="col-md-6">
			
			<h3> Change Status </h3>
			<Select id="status" name="changeStatus">
				<option id="select"> Select an Option </option>
			<c:if test="${userLogin.getIsadmin()}">
				<option value="Waiting on third party"> Waiting on third party</option>
				<option value="Waiting on reporter"> Waiting on reporter</option>
				<option value="Completed"> Completed </option>
			</c:if>
			<c:if test="${not userLogin.getIsadmin()}">
				<option value="Resolved"> Resolved </option>
			</c:if>
			</Select> <br /><br />
			<div id="resolvedetails">
				<label for="resolvedetails"> Resolve Details </label><br />
				<textarea name="resolvedetails" rows="5" cols="30" placeholder="Enter how your problem was solved"></textarea> <br />
			</div>
			<input type="submit" class="btn btn-default" name="Status" value="Change Status"/> <br />
		</div>
	</div>
</div>
			
</form>
<script>
	$('#resolvedetails').hide();
		$('#status').change( function() {
			$('#select').remove();
			if(this.value == 'Resolved' || this.value == 'Completed'){
				$('#resolvedetails').show();
			}
			else {
				$('#resolvedetails').hide();
			}
		});
</script>
</body>
</html>
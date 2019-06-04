<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>

<html>
	<head>
		<title>View Articles </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
<body>
<%@include file="../UserMaster.jsp"%>

<jsp:useBean id="DA" class="Beans.DataAccess"/>
<form action="Knowledge" method="POST">
<div class="container">
	<div class="row">
	<div class="col-xs-4">
		<input type="text" name="search" placeholder="Search for key words" />
		<input type="submit" class="btn btn-dafault" name="keySearch" value="Search" />
	</div>
				
	<div class="col-xs-4">
		<select id="Cat" name="category">
			<option value="Network"> Network </option>
			<option value="Software"> Software </option>
			<option value="Hardware"> Hardware </option>
			<option value="Email"> Email </option>
			<option value="Account"> Account </option>
		</select>
	<input type="submit" class="btn btn-default" name="sortCat" value="Sort by Category" />
	</div>
	</div>
	<c:choose>
		<c:when test="${empty articles}">
			<span> There are no articles in the knowledge base </span>
		</c:when>
		<c:otherwise>
			<c:forEach var="art" items="${articles}">
			<div class="row">
				<div class="col-md-8">
				<h2> <c:out value="${art.originalissue}"/> </h2> <br />
					<div class="col-md-4">
					<label for="Category"> Category </label> 
					<span> <c:out value="${art.category}"/> </span> <br />
					<label for="SubCategory"> Sub Category </label>
					<span> <c:out value="${art.subcategory}"/> </span>	
					<label for="dateresolved"> Date Resolved </label>
					<span> <c:out value="${art.datesolved}"/> </span>
					
				</div>
				<div class="col-md-4">
					<h4> Description </h4>
					<span> <c:out value="${art.description}"/> </span> <br />
					<h4> Resolve Details </h4>
					<span> <c:out value="${art.resolvedetails}"/> </span>
				</div>
				</div>
				<div class="col-md-4">
				<br /> <br /> <br />
				<c:choose>
				<c:when test="${empty DA.getArticleComments(art.articleid)}">
					<span> There are no comments for this article </span> <br />
				</c:when>
				<c:otherwise>
				<h4> Comments </h4>
				<!-- Displaying comments from the specific article -->
				<table class="table"> <tr> <th> Title </th> <th> Field </th>
					<c:forEach var="com" items="${DA.getArticleComments(art.articleid)}"> 
					<tr>
						<td><span> <c:out value="${com.title}"/> </span> </td>
						<td><span> <c:out value="${com.field}"/> </span></td>
					</c:forEach>
				</table>
				</c:otherwise>
				</c:choose>
				<button class="btn" type="button">Add a Comment</button>
				<div class="comments">
					<label for="title"> Title </label> <br />
					<input class="commTitle" type="text" name="commTitle"/> <br />
					<label for="field"> Field </label>  <br/>
					<textarea class="commField" name="commField" rows="5" cols="30" placeholder="Enter A comment"></textarea> <br /> <br />
					<input class="btnSubmit" type="submit" name="addComment" value="Submit Comment"/>
					<input name="articleID" type="hidden" value="<c:out value="${art.articleid}"/>"/>
				</div>
				</div>
			</c:forEach>
			</div>
			</div>
			<hr />
		</c:otherwise>
	</c:choose>
</form>
<script>
	$('.comments').hide();
	$('.btn').click(function() {
		$(this).parent().find('.comments').toggle(); //Finds closets comment div and toggles it
	});
</script>
</body>
</html>
<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Beans.Category" %>

<%--create the HTML table using foreach tag--%>
<!DOCTYPE>

<html>
	<head>
		<title>Report An Issue </title>
	</head>
<body>
	<div class="heading">
		
	</div>
	<% request.setAttribute("categories", Category.getCategories()); %>
	
<form action="Issue" Method="POST">
	<label for="issueTitle"> Title </label>
	<input type="text" name="issueTitle"> <br />
	
	<label for="issueDescription"> Description </label>
	<input type="text" name="issueDescription"/>
	
	<select name="category">
		<c:forEach items="${categories}" var="category">
			<option value="${category.categoryID}">${category.categoryType}</option>
		</c:forEach>
	</select>
	
	<select name="subCategory">
		<c:forEach items="${categories}" var="subcategory">
		<c:if test=""
	</select>
	
</form>
</body>
</html>
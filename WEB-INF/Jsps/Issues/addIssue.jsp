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
	
<form action="assignment3" Method="POST">
	<label for="issueTitle"> Title </label>
	<input type="text" name="issueTitle"> <br />
	
	<label for="issueDescription"> Description </label><br />
	<textarea name="issueDescription" rows="10" cols="30"> Enter your problem here </textarea> <br />
	
	<select name="category">
		<c:forEach items="${categories}" var="category">
			<option value="${category.categoryID}">${category.categoryType}</option>
		</c:forEach>
	</select>
	
	<select name="subCategory">
		<c:forEach items="${subcategories}" var="sub">
			<option value="${sub.subcategoryid}">${sub.subcategorytype}</option>
		</c:forEach>
	</select>
	
	<input type="submit" name="report" value="Report Issue"/>
</form>
</body>
</html>
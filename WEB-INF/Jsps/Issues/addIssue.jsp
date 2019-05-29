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
	<%@include file="master.jsp"%>
	
<form id="reportForm" action="assignment3" Method="POST">
	<label for="issueTitle"> Title </label>
	<input type="text" name="issueTitle"> <br />
	
	<label for="issueDescription"> Description </label><br />
	<textarea name="issueDescription" rows="10" cols="30"> Enter your problem here </textarea> <br />
	
	<select id="Cat" name="category">
		<c:forEach items="${categories}" var="category">
			<option value="${category}">${category}</option>
		</c:forEach>
	</select>
	
	<select id="subCat" name="subCategory">
		<c:forEach items="${subcategories}" var="sub">
			<option value="${sub}">${sub}</option>
		</c:forEach>
	</select>
	
	<input type="submit" name="report" value="Report Issue"/>
</form>
<script>
	$('reportForm').ready(function () {
		$('#SubCat').bind('change', function(){
			var elements = $('div.container').children().hide();
			var value = $(this).val();
					
			if (value.length) {
				elements.filter('.' + value).show();
			} else {
				elements.filter('default').show();
			}
		}).trigger('change');
	});
</script>
</body>
</html>
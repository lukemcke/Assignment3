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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/js/Script.js"></script>
		
	</head>
<body>
	<%@include file="../UserMaster.jsp"%>
	
<div class="container">
<h1> Report An Issue </h1>
<div class="row">
<div class="col-md-4">
<form action="Issue" method="POST" onsubmit="return validateReport()">
	<div class="form-group">
	<label for="issueTitle"> Title </label> <br />
	<input class="form-control" id="txtTitle" type="text" name="issueTitle"> <br />
	</div>
	
	<div class="form-group">
	<label for="issueDescription"> Description </label><br />
	<textarea class="form-control" id="txtarea" name="issueDescription" rows="5" cols="30" placeholder="Enter your problem here"></textarea> <br />
	</div>
	<div class="form-group">
	<select class="form-control" id="Cat" name="category">
		<option id="select"> Select A Category </option>
		<c:forEach items="${categories}" var="category">
			<option value="${category}">${category}</option>
		</c:forEach>
	</select>
	<br /><br />
	
	<select id="network" name="subCategory" class="subCat form-control">
		<option value="Can't Connect"> Can't Connect</option>
		<option value="Speed"> Speed </option>
		<option value="Constant Dropouts"> Constant Dropouts</option>
	</select>
	
	<select id="software" name="subCategory" class="subCat form-control">
		<option value="Slow to load"> Slow to load</option>
		<option value="Won't load at all"> Won't load at all </option>
	</select>
	
	<select id="hardware" name="subCategory" class="subCat form-control">
		<option value="Computer won't turn on"> Computer won't turn on</option>
		<option value="Computer 'blue screens'"> Computer "blue screens" </option>
		<option value="Disk drive"> Disk drive</option>
		<option value="Peripherals">Peripherals </option>
	</select>
	
	<select id="email" name="subCategory" class="subCat form-control">
		<option value="Can't send"> Can't send</option>
		<option value="Can't receive"> Can't receive </option>
		<option value="SPAM/Phishing"> SPAM/Phishing </option>
	</select>
	
	<select id="account" name="subCategory" class="subCat form-control">
		<option value="Password reset"> Password reset</option>
		<option value="Wrong details">Wrong details</option>
	</select>
	<br /> <br /> <br />
	
	</div>
	<input id="hidden" name="inputSubCategory" type="hidden" value=""/>
	<input type="submit" name="report" value="Report Issue"/>
</form>
</div>

</div>
</div>
<script>
	$(".subCat").hide();
	var name = "";
	$('#Cat').change( function() {
		$('.subCat').hide();
		$('#select').remove();
		if(this.value == "Network"){
			$('#network').show();
			name = $("#network option:first").val();
		}
		else if(this.value == "Software"){
			$('#software').show();
			name = $("#software option:first").val();
		}
		else if(this.value == "Hardware"){
			$('#hardware').show();
			name = $("#hardware option:first").val();
		}
		else if(this.value == "Email"){
			$('#email').show();
			name = $("#email option:first").val();
		}
		else if(this.value == "Account"){
			$('#account').toggle();
			name = $("#account option:first").val();
		}
		$('#hidden').val(name);
	});
	
	$('.subCat').change(function() {
		$('#hidden').val(this.value);
	});
	
</script>
</body>
</html>
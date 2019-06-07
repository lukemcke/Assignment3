<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Index">IT Service Portal</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Index">Home</a></li>
	  <c:choose>
		<c:when test="${sessionScope.userLogin == null || not userLogin.getIsadmin()}">
			<li><a href="Issue">Report An Issue</a></li>
			<li><a href="viewIssue">View Your Issues </a></li>
		</c:when>
		<c:otherwise>
			<li><a href="viewIssue">View All Issues </a></li>
		</c:otherwise>
	  </c:choose>
	  <li><a href="Knowledge">Knowledge Base </a></li>

	  <c:choose>
	  <c:when test="${sessionScope.userLogin != null}">
			<p class="navbar-text" style="color : black">
				Hello <c:out value="${userLogin.getFirstname()}"/>
			</p>
			<li><a href="Logout">Logout</a> </li>
	  </c:when>
	  <c:otherwise>
			<li style="float: right"><a href="Login">Login</a>
	  </c:otherwise>
	  </c:choose>
    </ul>
	</div>
</nav>


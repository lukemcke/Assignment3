<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">IT Servicce Portal</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="assignment3">Home</a></li>
	  <c:choose>
		<c:when test="${sessionScope.userLogin == null || not userLogin.getIsadmin()}">
			<li><a href="Issue">Report An Issue</a></li>
			<li><a href="Issue">View Your Issues </a></li>
		</c:when>
		<c:otherwise>
			<li><a href="Issue">View All Issues </a></li>
		</c:otherwise>
	  </c:choose>
	  <li><a href="#">Knowledge Base </a></li>

	  <c:choose>
	  <c:when test="${sessionScope.userLogin != null}">
			<li style="float: right"><a href="Logout">Logout</a>
			<li>Hello, <c:out value="${userLogin.getFirstname()}"/> </li>
	  </c:when>
	  <c:otherwise>
			<li style="float: right"><a href="Login">Login</a>
	  </c:otherwise>
	  </c:choose>
    </ul>
  </div>
</nav>


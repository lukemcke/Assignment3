<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Beans.Issue" %>

<%--create the HTML table using foreach tag--%>
<table>
	<% request.setAttribute("issues", Issue.getAllIssues()); %>
	<tr><th>IssueID</th><th>Title</th><th>Status</th></tr>
	<c:forEach var="issue" items="${issues}">
		<tr>
			<td><c:out value="${issue.issueID}"/></td>
			<td><c:out value="${issue.title}"/></td>
			<td><c:out value="${issue.description}"/></td>
		</tr>
	</c:forEach>
</table>
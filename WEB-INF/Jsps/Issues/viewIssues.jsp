<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table>
	<tr><th>IssueID</th><th>Title</th><th>Description</th>
	<th>DateReported</th><th>Category</th><th>SubCategory</th><th>Status</th></tr>
	<c:forEach var="issue" items="${issues}">
		<tr>
			<td><c:out value="${issue.issueID}"/></td>
			<td><c:out value="${issue.title}"/></td>
			<td><c:out value="${issue.description}"/></td>
			<td><c:out value="${issue.datereported}"/></td>
			<td><c:out value="${issue.category}"/></td>
			<td><c:out value="${issue.subcategory}"/></td>
			<td><c:out value="${issue.status}"/></td>
			<td><a href="IssueController?<c:out value="${issue.issueID}"/>">View Issue</a> </td>
		</tr>
	</c:forEach>
</table>
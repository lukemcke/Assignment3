<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Movies.Movie" %>

<%--create the HTML table using foreach tag--%>
<table>
	<% request.setAttribute("movies", Movie.getAllMovies()); %>
	<tr><th>Name</th><th>Year</th><th>URL</th></tr>
	<c:forEach var="movie" items="${movies}">
		<tr>
			<td><c:out value="${movie.name}"/></td>
			<td><c:out value="${movie.year}"/></td>
			<td><c:out value="${movie.url}"/></td>
		</tr>
	</c:forEach>
</table>
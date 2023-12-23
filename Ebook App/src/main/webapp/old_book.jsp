<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	if (u == null) {
		session.setAttribute("message", "You are not loged in");
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<div class="container p-5">
		<%@include file="all_component/message.jsp"%>
		<h3 class="text-center text-primary">Old Book</h3>
		<table class="table mt-3">
			<thead class="thead-light">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
				List<BookDtls> list = dao.getBookByOld(u.getEmail(), "Old");
				for (BookDtls b : list) {
				%>

				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="DeleteOldBook?em=<%=u.getEmail()%>&&bid=<%=b.getBookId() %>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
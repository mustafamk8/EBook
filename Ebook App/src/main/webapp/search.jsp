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
<title>Ebook : Search</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<div class="container">
<h3 class="text-center">Recent Book</h3>
		<div class="row">
		
		<%
			String search = request.getParameter("ch");
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getConnection());
			List<BookDtls> list2 = dao2.getBookBySearch(search);
			for (BookDtls b : list2) {
			%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" class="img-thumblin"
							src="images/book/<%=b.getPhotoName()%>" width="150px"
							height="200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>Categories :<%=b.getBookCategory()%></p>
						<%
						if(b.getBookCategory().equals("Old")){
						%>
						<div class="row ">
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%	
						}else{
							%>
							
							<%
						User u = (User) session.getAttribute("userobj");
						%>
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
							class="fas fa-cart-plus"></i>Add Cart</a>
						<%
						} else {
						%>

						<div class="row">
							<a href="CartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>	
						<%	
						}
						%>
						
						 
						
					</div>
				</div>
			</div>

		<%
			}
		%>
			
			
		</div>
		
	</div>


</body>
</html>
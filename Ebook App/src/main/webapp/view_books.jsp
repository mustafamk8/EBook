<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : View Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
	BookDtls b = dao.getBookById(bid);
	%>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 txt-center p-5 border bg-white">
				<div class="text-center">
					<img src="images/book/<%=b.getPhotoName()%>"
						style="height: 150px; width: 150px">
					<h4 class="mt-2">
						Book Name : <span class="text-success"><%=b.getBookName()%></span>
					</h4>
					<h4>
						Author Name : <span class="text-success"> <%=b.getAuthor()%>
						</span>
					</h4>
					<h4>
						Category : <span class="text-success"><%=b.getBookCategory()%></span>
					</h4>
				</div>

			</div>
			<div class="col-md-6 txt-center p-5 border bg-white">
				<div class="col-md-12 text-center p-2">
					<h2><%=b.getBookName()%></h2>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<h5 class="text-center text-primary">Contact To Seller</h5>
				<h5 class="text-center text-primary">
					<i class="fa fa-envelope"></i> Email :
					<%=b.getEmail()%></h5>

				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center">
					<a href="index.jsp" class="btn btn-success"> Continue Shopping</a> <a
						href="" class="btn btn-danger"> <i class="fa fa-rupee-sign"></i>
						299
					</a>
				</div>

				<%
				}else{
				%>
				<div class="text-center">
					<a href="" class="btn btn-primary"><i class="fa fa-cart-plus"></i>Add
						Cart</a> <a href="" class="btn btn-danger"> <i
						class="fa fa-rupee-sign"></i> 299
					</a>
				</div>
				<%
				}
				%>
				
			</div>
		</div>
	</div>
</body>
</html>
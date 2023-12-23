<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Edit Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						
						<h3 class="card-title text-center">Edit Book</h3>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
						BookDtls b = dao.getBookById(id);
						%>
						
						<form action="../UpdateBooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="bname" class="form-control" value="<%=b.getBookName() %>"
									aria-describedby="emailHelp" placeholder="Enter Book Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="author" value="<%=b.getAuthor() %>" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Author Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" value="<%=b.getPrice() %>" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Price">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Book Status</label> <select
									name="bstatus" class="form-control" id="inputState">
									
									<%
									if("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}else{
									%>	
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%	
									}
									%>
								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary bg-custom">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
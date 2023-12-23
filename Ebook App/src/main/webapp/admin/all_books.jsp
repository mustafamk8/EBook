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
<title>Admin : All books</title>
<%@include file="allCss.jsp"%>

<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>

<style type="text/css">
img{
height:50px;
width:50px;
}
</style>

</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid">
<h2 class="text-center">Hello Admin</h2>
<%@include file="message.jsp"%>
<table class="table table-striped">
  <thead class="bg-dark text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Book Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  
  <%
  BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
  List<BookDtls> list = dao.getAllBooks();
  for(BookDtls b : list){
  %> 
	<tr>
	  <td><%=b.getBookId() %></td>
      <td> <img alt="" src="../images/book/<%=b.getPhotoName() %>"></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="edit_book.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a>
      <a href="../DeleteBook?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>Delete</a>
      </td>
    </tr>  
  <%	  
  }
  %>
  
    
    
  </tbody>
  
</table>
</div>
<div style="margin-top: 10px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>
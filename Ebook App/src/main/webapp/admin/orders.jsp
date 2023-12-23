<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
User user = (User) session.getAttribute("userobj");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! login First");
	response.sendRedirect("../login.jsp");
	return;
}
%>
<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid">
<h2 class="text-center">Hello Admin</h2>
<table class="table table-striped">
  <thead class="bg-dark text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
   <%
  BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
  List<BookOrder> list = dao.getAllOrder();
  for(BookOrder b : list){
  %>
    <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getAddress() %></td>
      <td><%=b.getPhone() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPayment() %></td>
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
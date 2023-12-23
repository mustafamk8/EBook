
<%
String message = (String) session.getAttribute("message");
if (message != null) {

	//prints
	//out.println(message);
%>
<div class="alert alert-success" role="alert"><%=message%></div>

<%
session.removeAttribute("message");
}
%>
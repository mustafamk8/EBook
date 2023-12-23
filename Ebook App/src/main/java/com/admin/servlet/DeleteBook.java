package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DBConnect;

@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));
		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
		boolean f = dao.deleteBook(id);
		
		HttpSession session = request.getSession();
		if(f) {
			request.setAttribute("message", "Book deleted successfully");
			response.sendRedirect("admin/all_books.jsp");
		}else {
			request.setAttribute("message", "something wrong book not deleted");
			response.sendRedirect("admin/all_books.jsp");
		}
		
	}

}

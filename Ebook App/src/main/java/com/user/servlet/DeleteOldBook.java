package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DBConnect;


@WebServlet("/DeleteOldBook")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String cat = "Old";
		String em = request.getParameter("em");
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
		boolean  f = dao.oldBookDelete(em, cat,bid);
		
HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("message", "Book Deleted");
			response.sendRedirect("old_book.jsp");
		}else {
			session.setAttribute("message", "Something wrong on server");
			response.sendRedirect("old_book.jsp");
		}
		
	}

}

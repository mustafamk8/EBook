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
import com.entity.BookDtls;


@WebServlet("/UpdateBooks")
public class UpdateBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String status = request.getParameter("bstatus");
		
		BookDtls b = new BookDtls();
		b.setBookId(id);
		b.setBookName(bname);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
		boolean f = dao.updateEditBooks(b);
		
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("message", "Book Updated Successfully");
			response.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("message", "Some thing wrong book not updated");
			response.sendRedirect("admin/edit_book.jsp");
		}
		
		
	}

}

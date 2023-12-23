package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDaoImpl;
import com.db.DBConnect;

@WebServlet("/RemoveBook")
public class RemoveBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Integer bid = Integer.parseInt(request.getParameter("bid"));
		Integer uid = Integer.parseInt(request.getParameter("uid"));
		Integer cid = Integer.parseInt(request.getParameter("cid"));
		CartDaoImpl dao = new CartDaoImpl(DBConnect.getConnection());
		boolean f = dao.deletBook(bid,uid,cid);
		HttpSession session = request.getSession();

		if (f) {
			session.setAttribute("message", "book removed from cart");
			response.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("message", "Book Not removed");
			response.sendRedirect("checkout.jsp");
		}

	}

}

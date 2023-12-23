package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImpl;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("contact");
		String password = request.getParameter("password");
		
		User u = new User(name, email, password, phno);
		
		UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
		boolean f = dao.checkPassword(id, password);

		HttpSession session = request.getSession();

		if (f) {
			boolean ff = dao.updateProfile(u, id);
			if(ff) {
				session.setAttribute("message", "Profile Updated");
				response.sendRedirect("edit_profile.jsp");
			}else {
				session.setAttribute("message", "Something wrong");
				response.sendRedirect("edit_profile.jsp");
			}
		} else {
			session.setAttribute("message", "Entered wrong password");
			response.sendRedirect("edit_profile.jsp");
		}

	}

}

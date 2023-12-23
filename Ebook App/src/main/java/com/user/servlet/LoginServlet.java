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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDaoImpl model = new UserDaoImpl(DBConnect.getConnection());
		
		
		HttpSession session = request.getSession();
		
		if("admin@gmail.com".equals(email) && "admin".equals(password) ) {
			User user = new User();
			user.setName("Admin");
			session.setAttribute("userobj", user);
			response.sendRedirect("admin/home.jsp");;
		}else {
			User user = model.UserLogin(email,password);
			System.out.println("login : "+user);
			if(user!=null) {
				session.setAttribute("userobj", user);
				response.sendRedirect("index.jsp");
			}else {
				session.setAttribute("message", "invalid credentials");
				response.sendRedirect("login.jsp");
			}
		}
		
		
	}

}

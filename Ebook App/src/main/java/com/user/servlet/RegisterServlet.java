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


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("contact");
		String password = request.getParameter("password");
		
		User u = new User(name, email, password, phno);
		HttpSession session = request.getSession();
		UserDaoImpl model = new UserDaoImpl(DBConnect.getConnection());
		boolean f2 = model.checkUser(email);
		if(f2) {
			boolean f = model.UserRegister(u);
			
			if(f) {
				session.setAttribute("message", "Registration success id  ");
				response.sendRedirect("register.jsp");
			}else {
				session.setAttribute("message", "Registration Failed..");
				response.sendRedirect("register.jsp");
			}
		}else {
			session.setAttribute("message", "User already exist try another email id");
			response.sendRedirect("register.jsp");
		}
	}

}

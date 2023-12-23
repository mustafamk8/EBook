package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;


@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String address = request.getParameter("address");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String payment = request.getParameter("payment");
		
		String fullAddress = address+", "+landmark+", "+city+", "+state+", "+pincode;
		
		CartDaoImpl dao = new CartDaoImpl(DBConnect.getConnection());
		
		HttpSession session = request.getSession();
		
		List<Cart> list = dao.getBookByUser(id);
		if(list.isEmpty()) {
			session.setAttribute("message", "Add something in your cart");
			response.sendRedirect("checkout.jsp");
		}else {
			BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConnection());
			
			
			BookOrder o = null;
			
			ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
			Random r = new Random();
			for(Cart c : list) {
				o = new BookOrder();
				o.setOrderId("BOOK-ORD-00 "+r.nextInt(1000));
				o.setUsername(name);
				o.setEmail(email);
				o.setPhone(phno);
				o.setAddress(fullAddress);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPayment(payment);
				orderList.add(o);
				
			}
			
			
			if("noselect".equals(payment)) {
				session.setAttribute("message", "Choose payment method");
				response.sendRedirect("checkout.jsp");
			}else {
				boolean f = dao2.saveOrder(orderList);
				if(f) {
					session.setAttribute("message", "Order placed successfully");
					response.sendRedirect("order_success.jsp");
				}else {
					session.setAttribute("message", "Order Not placed something wrong");
					response.sendRedirect("checkout.jsp");
				}
			}
		}
		
	}

}

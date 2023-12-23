package com.admin.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDaoImpl;
import com.db.DBConnect;
import com.entity.BookDtls;


@WebServlet("/AddBooks")
@MultipartConfig
public class AddBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String category = request.getParameter("btype");
		String status = request.getParameter("bstatus");
		Part image = request.getPart("bimg");
		String fileName = image.getSubmittedFileName();
		
		BookDtls b = new BookDtls(bname, author, price, category, status, fileName,"admin@gmail.com");
		
		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
		
		boolean f = dao.addBooks(b);
		
		
		//String path = "D:/Java All/My cart/src/main/webapp/images/products/"+imageName;
		String path = "D:/Java All/Ebook App/src/main/webapp/images/book/"+fileName;
		System.out.println(path);
		try {
		
		// uploading code
		
		FileOutputStream fos = new FileOutputStream(path);
		
		InputStream is = image.getInputStream();
		
		// reading data
		
		byte[] data = new byte[is.available()];
		is.read(data);
		
		// writing the data
		
		fos.write(data);
		fos.close();
		is.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("message","Book Add Successfully..");
			response.sendRedirect("admin/add_books.jsp");
		}else {
			session.setAttribute("message","Something Wrong..");
			response.sendRedirect("admin/add_books.jsp");
		}
		
		
		
	}

}

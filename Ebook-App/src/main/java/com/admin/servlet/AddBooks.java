package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.DAO.BookDAOimpl;
import com.DB.DBconnect;
import com.entity.Bookdetails;

@MultipartConfig
@WebServlet("/addbook")
public class AddBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bookName = req.getParameter("bname");

			String author = req.getParameter("author");

			String price = req.getParameter("price");

			String categories = req.getParameter("categories");

			String status = req.getParameter("status");
			String image = req.getParameter("bimg");


			Bookdetails b = new Bookdetails(bookName, author, price, categories, status,image, "admin");
        
			BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
			boolean f=dao.addBooks(b);
			
			HttpSession session =req.getSession();
			if(f) {
				

				
				
				session.setAttribute("succmsg" , "Book Added Successfully");
				resp.sendRedirect("admin/addbooks.jsp");
			}else {
				session.setAttribute("failedmsg" , "Something went Wrong");
				resp.sendRedirect("admin/addbooks.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

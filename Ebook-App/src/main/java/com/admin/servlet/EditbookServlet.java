package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DB.DBconnect;
import com.entity.Bookdetails;

@WebServlet("/editbook")
public class EditbookServlet extends HttpServlet {
    public EditbookServlet() {
        super();  
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			String Imageurl = req.getParameter("bimg");

			
			Bookdetails b=new Bookdetails();
             b.setBookid(id);
             b.setBookname (bookName);
             b.setAuthor (author);
             b.setPrice(price);
             b.setStatus (status);
             b.setImageurl(Imageurl);

             BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
             boolean f=dao.updatebooks (b);
              HttpSession session=req.getSession();

               if(f){
             session.setAttribute("succmsg", "Data Update Successfully.."); 
             resp.sendRedirect("admin/allbooks.jsp");
              }else {
           session.setAttribute("failedmsg", "Something went wrong ");
           resp.sendRedirect("admin/allbooks.jsp");
        }		
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}

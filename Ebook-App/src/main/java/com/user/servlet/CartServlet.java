package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DAO.CardDaoimpl;
import com.DB.DBconnect;
import com.entity.Bookdetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                 try {
                	 int bid=Integer.parseInt(req.getParameter("bookid"));
                	 int uid=Integer.parseInt(req.getParameter("userid"));

                	 BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
                	 Bookdetails b=dao.getBookbyid(bid);
                	 Cart c=new Cart();

                	 c.setBookid(bid);
                	 c.setUserId(uid);
                	 c.setBookName (b.getBookname());
                	 c.setAuthor(b.getAuthor());
                	 c.setPrice(Double.parseDouble(b.getPrice()));
                	 c.setTotalPrice (Double.parseDouble(b.getPrice()));
                	 CardDaoimpl dao2=new CardDaoimpl(DBconnect.getConn());
                	 boolean f=dao2.AddtoCart(c);
                	 HttpSession session=req.getSession();
                	 
                	 if(f) {
                	 session.setAttribute("addCart", "Book Added to cart");
                	 resp.sendRedirect("Newbooks.jsp");
                	 }else {
                	 session.setAttribute("failed", "Something Wrong on server");
                	 resp.sendRedirect("Newbooks.jsp");
                	 }
				} catch (Exception e) {
					
					  
				}
		

	 }

}

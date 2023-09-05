package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CardDaoimpl;
import com.DB.DBconnect;

@WebServlet("/removebook")
public class RemoveCartBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));

		CardDaoimpl dao=new CardDaoimpl(DBconnect.getConn());
		boolean f=dao.removebook(bid,uid);
		HttpSession session=req.getSession();

		if(f)

		{

		session.setAttribute("succMsg", "Book Removed from Cart");
		resp.sendRedirect("checkout.jsp");

		}else {

		session.setAttribute("failedMsg", "Something wrong on server");
		resp.sendRedirect("checkout.jsp");

		}
		
		
	}
	

}

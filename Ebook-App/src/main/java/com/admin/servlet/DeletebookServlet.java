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

@WebServlet("/delete")
public class DeletebookServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn()); 
			boolean f = dao.deletebook (id); HttpSession session = req.getSession();
			if (f) {
			session.setAttribute("succmsg", "Book deleted Successfully..");
			res.sendRedirect("admin/allbooks.jsp");
			} else {
			session.setAttribute("failedmsg", "Something went wrong"); 
			res.sendRedirect("admin/allbooks.jsp");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

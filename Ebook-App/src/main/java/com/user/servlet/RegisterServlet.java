
package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBconnect;
import com.entity.User;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("fname");
		String email = req.getParameter("email");
		String mobile_no = req.getParameter("mobile_no");
		String password = req.getParameter("password");
		String check = req.getParameter("check");

		User users = new User();
		users.setName(name);
		users.setEmail(email);
		users.setMobile_no(mobile_no);
		users.setPassword(password);
		
		System.out.println(name);

		HttpSession session = req.getSession();
		if (check != null)

		{

			UserDAOimpl dao = new UserDAOimpl(DBconnect.getConn());
			boolean f = dao.userregister(users);
			if (f) {
				session.setAttribute("successMsg", "Registration Successfull.. Please Login To Your Account");
				resp.sendRedirect("register.jsp");

			} else {
				session.setAttribute("failMsg", "Someting went Wrong... ");
				resp.sendRedirect("register.jsp");

			}
		} else {
			session.setAttribute("failMsg", "Please Agree our Terms & Conditions");
			resp.sendRedirect("register.jsp");
		}
	}
}

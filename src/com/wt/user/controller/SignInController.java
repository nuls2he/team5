package com.wt.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.user.dao.UserDAO;
import com.wt.user.domain.User;

@WebServlet("/user/signin")
public class SignInController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호출됨..");
		
		if(request.getParameter("password").equals(request.getParameter("check-pass"))) {
			UserDAO dao = new UserDAO();
			User user = new User();
			user.setID(request.getParameter("id"));
			user.setNick(request.getParameter("nick"));
			user.setPwd(request.getParameter("password"));
			user.setEmail(request.getParameter("email"));
			user.setHintQ(request.getParameter("hintQ"));
			user.setHintA(request.getParameter("hintA"));
			
			dao.join(user);
			
			response.sendRedirect("/team5_miniprj/html/wtmain.jsp");
		} else {
			response.sendRedirect("/team5_miniprj/html/user/signin.jsp");
		}
		
		
	}
	
}

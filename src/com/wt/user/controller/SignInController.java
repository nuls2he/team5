package com.wt.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
			request.setCharacterEncoding("utf-8");
			UserDAO dao = new UserDAO();
			User user = new User();
			user.setId(request.getParameter("id"));
			user.setNick(request.getParameter("nick"));
			user.setPwd(request.getParameter("password"));
			user.setEmail(request.getParameter("email"));
			user.setHintQ(request.getParameter("hintQ"));
			user.setHintA(request.getParameter("hintA"));
			
			dao.join(user);
			
			response.sendRedirect("/team5_miniprj/mainform");
		} else {
			request.setAttribute("errMsg", "* 입력정보 확인 후 다시 입력해 주세요. *");
			
			RequestDispatcher rd = request.getRequestDispatcher("/html/user/signin.jsp");
			rd.forward(request, response);
		}
		
		
	}
	
}

package com.wt.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.user.dao.UserDAO;

@WebServlet("/user/chkadult")
public class CheckAdultController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserDAO dao = new UserDAO();
		String msg = dao.adult(request.getParameter("id"), 
				Integer.parseInt(request.getParameter("birthYear")), 
				Integer.parseInt(request.getParameter("birthMonth")), 
				Integer.parseInt(request.getParameter("birthDay")));
		
		System.out.println("인증메시지 : "+msg);
		
		request.setAttribute("chkMsg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("/html/user/chkAdult.jsp");
		rd.forward(request, response);
	}

}

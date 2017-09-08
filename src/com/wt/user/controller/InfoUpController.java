package com.wt.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wt.user.dao.UserDAO;
import com.wt.user.domain.User;

@WebServlet("/user/infoup")
public class InfoUpController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Cookie[] c = request.getCookies();
		String cID = c[0].getValue();
		UserDAO dao = new UserDAO();
		User usr = new User();
		usr.setEmail(request.getParameter("email"));
		usr.setName(request.getParameter("name"));
		usr.setCall(request.getParameter("call"));
		usr.setAddHead(request.getParameter("addHead"));
		usr.setAddTail(request.getParameter("addTail"));
		usr.setId(cID);
		dao.updateInfo(usr);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/infoForm");
		rd.forward(request, response);
		
	}

}

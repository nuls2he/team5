package com.wt.user.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@WebServlet("/user/login")
public class LoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		user.setId(id);
		user.setPwd(request.getParameter("pwd"));
		
		UserDAO udao = new UserDAO();
		User usr = udao.login(user);
		
		
		String page = "main/wtmain.jsp";
		if (usr != null) {
			HttpSession session = request.getSession();
			
			Cookie c = new Cookie("loginID", URLEncoder.encode(id, "utf-8"));
			response.addCookie(c);
			
			Cookie ad = new Cookie("certAD", URLEncoder.encode(udao.certAD(id), "utf-8"));
			response.addCookie(ad);
			session.setAttribute("user", usr);
		}
		else {
			page = "user/login.jsp";
			request.setAttribute("error", "입력하신 정보가 올바르지 않습니다.");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/html/"+page);
		rd.forward(request, response);
		
	}
	
}

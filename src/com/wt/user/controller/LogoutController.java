package com.wt.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/logout")
public class LogoutController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		Cookie[] c = request.getCookies();
		
		for(int i = 0; i<c.length; i++){
			c[i].setMaxAge(0);                  // 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 
												// 쿠키의 유효시간을 만료시킨다.
			response.addCookie(c[i]);      
		}
		response.sendRedirect("/team5_miniprj/html/main/wtmain.jsp");
	}
	
}

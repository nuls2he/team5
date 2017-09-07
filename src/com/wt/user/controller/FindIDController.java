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

@WebServlet("/user/findid")
public class FindIDController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setNick(request.getParameter("nick"));
		user.setEmail(request.getParameter("email"));
		
		UserDAO dao = new UserDAO();
		String fid = dao.findID(user);
		System.out.println(fid);
		request.setAttribute("msgID", fid != null ? "검색된 아이디 : "+fid : "아이디를 찾을 수 없습니다.");
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/user/finduser.jsp");
		rd.forward(request, response);
	}
	
}

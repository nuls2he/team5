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

@WebServlet("/user/findpw")
public class FindPWController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setID(request.getParameter("id"));
		user.setHintQ(request.getParameter("hintQ"));
		user.setHintA(request.getParameter("hintA"));

		UserDAO dao = new UserDAO();
		String fpw = dao.findPW(user);
		request.setAttribute("msgPW", fpw != null ? "사용자 비밀번호 : "+fpw : "정보를 다시 입력해 주세요.");
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/user/finduser.jsp");
		rd.forward(request, response);
	}
	
}

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

@WebServlet("/user/withraw")
public class WithRawController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pwd = request.getParameter("pwd");
		String chkPwd = request.getParameter("checkPwd");
		
		String page = "/html/wtmain.jsp";
		if (pwd.equals(chkPwd)) {
			Cookie[] c = request.getCookies();
			String cID = c[0].getValue();
			UserDAO dao = new UserDAO();
			dao.withRaw(cID);
			HttpSession session = request.getSession();
			session.invalidate();
		} else {
			page = "/withrawForm";
			request.setAttribute("miss", "비밀번호가 틀렸습니다.");
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}
	
}

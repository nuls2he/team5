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

import org.apache.catalina.tribes.util.Arrays;

import com.wt.user.dao.UserDAO;
import com.wt.user.domain.User;

@WebServlet("/infoForm")
public class InfoFormController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		System.out.println("user : " + session.getAttribute("user"));
//		String ssID = (String)session.getAttribute("id");
//		System.out.println("유저아이디 : "+session.getAttribute("id"));
		//Cookie[] c = request.getCookies();
		//String cID = c[0].getValue();
		
		UserDAO dao = new UserDAO();
		//request.setAttribute("user", dao.showInfo(cID));
//		request.setAttribute("ID", cID);
		//request.setAttribute("certAD", c[1]);
		RequestDispatcher rd = request.getRequestDispatcher("/html/user/info.jsp");
		rd.forward(request, response);
	}
	
}

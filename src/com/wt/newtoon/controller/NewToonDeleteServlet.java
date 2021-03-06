package com.wt.newtoon.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.common.dao.CommonDao;

@WebServlet("/newtoondelete")
public class NewToonDeleteServlet extends HttpServlet{
	
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CommonDao dao = new CommonDao();
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));

		dao.deleteBoard(no);
		
		response.sendRedirect("/team5_miniprj/newtoonlist");
	}

	
	
}

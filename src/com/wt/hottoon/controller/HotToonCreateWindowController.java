package com.wt.hottoon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.hottoon.dao.HotToonDAO;

@WebServlet("/hottoon/createbtn")
public class HotToonCreateWindowController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// /hottoon/create
		
		//response.sendRedirect("/05_servletjsp/hottoon/create.jsp");
	}
	
}

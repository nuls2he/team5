package com.wt.hottoon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.hottoon.dao.HotToonDAO;
import com.wt.hottoon.domain.HotToon;

@WebServlet("/hottoon/create")
public class HotToonCreateController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HotToon hottoon = new HotToon();
		hottoon.setCompletion(request.getParameter("completion"));
		hottoon.setGenre(request.getParameter("genre"));
		hottoon.setTitle(request.getParameter("title"));
		hottoon.setContent(request.getParameter("content"));
		hottoon.setUrl(request.getParameter("url"));
//		hottoon.setImagePath(request.getParameter("imgpath"));
		dao.createHotToon(hottoon);
		
		//response.sendRedirect("/05_servletjsp/day02/test06.jsp");
	}
}

package com.wt.hottoon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.hottoon.dao.HotToonDAO;
import com.wt.hottoon.domain.HotToon;

@WebServlet("/hottoon/modifybtn")
public class HotToonModifyWindowController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("no");
		
		HotToon hottoon = dao.detailHotToon(Integer.parseInt(no));
		
		request.setAttribute("hottoon", hottoon);
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/hottoon/modifyHotToon.jsp");
		
		rd.forward(request, response);
	}
	
}

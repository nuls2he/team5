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

@WebServlet("/hottoon/detail")
public class HotToonDetailController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		String genre = request.getParameter("genre");
		String page = request.getParameter("page");
		String block = request.getParameter("block");
		System.out.println("no : " + no);
		HotToon hottoon = dao.selectByNo(Integer.parseInt(no));
		
		request.setAttribute("hottoon", hottoon);
		request.setAttribute("genre", genre);
		request.setAttribute("page", page);
		request.setAttribute("block", block);
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/hottoon/formdetail.jsp");
		rd.forward(request, response);
		//response.sendRedirect("/team5_miniprj/html/hottoon/formdetail.jsp");
	}
	
}

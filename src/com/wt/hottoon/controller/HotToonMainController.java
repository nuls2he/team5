package com.wt.hottoon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.hottoon.dao.HotToonDAO;
import com.wt.hottoon.domain.HotToon;

@WebServlet("/hottoon/main")
public class HotToonMainController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<HotToon> list = new ArrayList<>();
		list = dao.selectHotToon();
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/hottoon/main.jsp");
		
		rd.forward(request, response);
	}
	
}

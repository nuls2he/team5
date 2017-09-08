package com.wt.newtoon.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.common.dao.CommonDao;
import com.wt.common.domain.Common;
import com.wt.common.domain.Search;

@WebServlet("/newtoondetail")
public class NewToondetailServlet extends HttpServlet{
	CommonDao dao = new CommonDao();
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Search vo = new Search();
		request.setCharacterEncoding("utf-8");
		String type = "n";
		String selType ="no";
		String word = request.getParameter("no");
		String id = request.getParameter("id");
		
		vo.setType(type);
		vo.setSelType(selType);
		vo.setWord(word);
		vo.setId(id);
		
		System.out.println(vo);
		//dao.searchToon(vo);
		List<Common> list = dao.searchToon(vo);
		request.setAttribute("list", list);
	RequestDispatcher rd = request.getRequestDispatcher("/html/newtoon/newtoondetail.jsp");
	rd.forward(request, response);
		
}

}

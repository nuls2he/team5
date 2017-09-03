package com.wt.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.wt.common.dao.CommonDao;
import com.wt.common.domain.Common;
import com.wt.common.domain.Search;

@WebServlet("/commonInsertToUpdate")
public class CommonInsertToUpdate extends HttpServlet{
	CommonDao dao = new CommonDao();
	
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		
		Search vo = new Search();
		request.setCharacterEncoding("utf-8");
		String type = "n";
		String type_NT = "no";
		String word = request.getParameter("no");
		String id = "admin";
		
		vo.setType(type);
		vo.setType_NT(type_NT);
		vo.setWord(word);
		vo.setId(id);
		
		System.out.println(vo);
		//dao.searchToon(vo);
		List<Common> list = dao.searchToon(vo);
		request.setAttribute("list", list);
	RequestDispatcher rd = request.getRequestDispatcher("/Common/insertNewToon.jsp");
	rd.forward(request, response);
		
}

}

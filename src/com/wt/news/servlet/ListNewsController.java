package com.wt.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.news.dao.NewsDAO;
import com.wt.news.domain.NewsVO;

@WebServlet("/wt/news/list")
public class ListNewsController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDAO dao = new NewsDAO();
		List<NewsVO> list = dao.selectNews(); 
	System.out.println("list");
		request.setAttribute( "list" , list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/html/news/list.jsp");
		
		rd.forward(request, response);
	}
	
}

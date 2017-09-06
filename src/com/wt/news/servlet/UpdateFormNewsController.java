package com.wt.news.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.news.dao.NewsDAO;
import com.wt.news.domain.NewsVO;

@WebServlet("/wt/news/updateform")
public class UpdateFormNewsController extends HttpServlet {

	
		@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int no = Integer.parseInt(request.getParameter("no"));
			NewsDAO dao = new NewsDAO();
			NewsVO news = dao.detailNews(no);
			
			request.setAttribute("news", news);
			
			RequestDispatcher rd = request.getRequestDispatcher("/html/news/updateForm.jsp");
			rd.forward(request, response);
	}

}

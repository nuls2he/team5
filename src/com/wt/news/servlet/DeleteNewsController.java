package com.wt.news.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.news.dao.NewsDAO;

@WebServlet("/wt/news/delete")
public class DeleteNewsController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no 갖고옴");
		NewsDAO dao = new NewsDAO();
		dao.deleteNews(no);
		System.out.println("삭제");
		
		response.sendRedirect(request.getContextPath() + "/news/list");
	}
}

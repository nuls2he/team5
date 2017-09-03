package com.wt.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.wt.common.dao.CommonDao;
import com.wt.common.domain.Common;
@WebServlet("/com/wt/common/controller/commoninsertServlet")
public class CommonInsertServlet extends HttpServlet{
		
		@Override
		public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			System.out.println("서블릿 호출됨...");
			System.out.println("서블릿 호출됨...");
			System.out.println("서블릿 호출됨...");
			Common vo = new Common();
			request.setCharacterEncoding("utf-8");
			String title = request.getParameter("title");
			String id = request.getParameter("id");
			String content = request.getParameter("content");
			String image = request.getParameter("image");
			String type = request.getParameter("type");
			
			vo.setTitle(title);
			vo.setContent(content);
			vo.setImage(image);
			vo.setType(type);
			
			CommonDao dao = new CommonDao();
			dao.insertBoard(vo);
			
			response.sendRedirect("/team5/newtoonList");
//			RequestDispatcher rd = request.getRequestDispatcher("/com/wt/common/controller/commonListServlet");
//			rd.forward(request, response);
			
}
	

}

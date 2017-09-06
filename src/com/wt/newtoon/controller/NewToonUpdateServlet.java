package com.wt.newtoon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.common.dao.CommonDao;
import com.wt.common.domain.Common;

@WebServlet("/newtoonupdate")
public class NewToonUpdateServlet extends HttpServlet{
	CommonDao dao = new CommonDao();
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Common vo = new Common();
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String image = request.getParameter("image");
		String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setImage(image);
		vo.setType(type);
		vo.setNo(no);
		System.out.println("실행됫니?");
		dao.updateBoard(vo);
//		System.out.println(vo);
//		//dao.searchToon(vo);
//		List<Common> list = dao.updateBoard(vo);
//		request.setAttribute("list", list);
		response.sendRedirect("/team5/newtoonlist");
//	RequestDispatcher rd = request.getRequestDispatcher("/newtoonList");
//	rd.forward(request, response);
		
}

}

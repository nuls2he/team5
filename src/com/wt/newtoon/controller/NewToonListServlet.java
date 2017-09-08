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

@WebServlet("/newtoonlist")
public class NewToonListServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CommonDao dao = new CommonDao();
		int rnum = 0;
		
		Search vo = new Search();
		request.setCharacterEncoding("utf-8");
		String type = "n";
		String selType = request.getParameter("selType");
		String word = request.getParameter("word");
		String id = request.getParameter("id");
		
		if(request.getParameter("rnum") != null) {
			rnum = Integer.parseInt(request.getParameter("rnum"));
			if(rnum<0) {rnum = 0;}
			vo.setRnum(rnum);
		}
		System.out.println("rnum : " +rnum);
		vo.setType(type);
		vo.setSelType(selType);
		vo.setWord(word);
		vo.setId(id);
		
		
		//dao.searchToon(vo);
		List<Common> list = dao.searchToon(vo);
		int pnum = dao.pageBoard(type);
		if(rnum>pnum/5) rnum=pnum/5;{
			vo.setRnum(rnum);
			list = dao.searchToon(vo);
		}
		request.setAttribute("list", list);
		request.setAttribute("pnum", pnum);
		request.setAttribute("rnum", rnum);
		
		System.out.println(pnum);
	RequestDispatcher rd = request.getRequestDispatcher("/html/newtoon/newtoonmain.jsp");
	rd.forward(request, response);
		
}

}

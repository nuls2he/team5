package com.wt.toonart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.common.domain.ToonArt;
import com.wt.dao.toonart.ToonArt_DAO;

@WebServlet("/denglu")
public class toonart_insert_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ToonArt tart = new ToonArt();
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String image = request.getParameter("img");
		String type = request.getParameter("type");
	
		tart.setTitle(title);
		tart.setId(id);
		tart.setImage(image);
		tart.setType(type);
	
		ToonArt_DAO dao = new ToonArt_DAO(); 
		dao.insertToon(tart);
		
		response.sendRedirect("/team5_mini/mulu");
	}

}

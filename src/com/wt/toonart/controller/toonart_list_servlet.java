package com.wt.toonart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.common.domain.Search;
import com.wt.common.domain.ToonArt;
import com.wt.dao.toonart.ToonArt_DAO;

/**
 * Servlet implementation class toonart_list_servlet
 */
@WebServlet("/mulu")
public class toonart_list_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Search art = new Search();
	request.setCharacterEncoding("utf-8");
	String type = "t";
	String word = request.getParameter("word");
	String notitle = request.getParameter("notitle");
	
	ToonArt_DAO dao = new ToonArt_DAO();
	art.setNotitle(notitle);
	art.setType(type);
	art.setWord(word);
	
	List<ToonArt> list= dao.selectToon(art);
	request.setAttribute("list",list );
	RequestDispatcher rd = request.getRequestDispatcher("/TA.jsp");
	rd.forward(request, response);
	
	}

}

package com.wt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wt.dao.toonart.ToonArt_DAO;

@WebServlet("/toonart/taform")
public class TAFormController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ToonArt_DAO tdao = new ToonArt_DAO();
		request.setAttribute("list", tdao.selectAll());
//		List<ToonArt> list = tdao.selectAll();
//		System.out.println(list.get(0).getImage());
		
		response.setContentType("text/html; charset=utf-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/team5_mini/TA.jsp");
		rd.forward(request, response);
//		response.sendRedirect("/testing/html/toonart/TA.jsp");
	}

}

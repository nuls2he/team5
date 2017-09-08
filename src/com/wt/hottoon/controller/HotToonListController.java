package com.wt.hottoon.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wt.common.dao.PagingDAO;
import com.wt.common.domain.PagingVO;
import com.wt.hottoon.dao.HotToonDAO;
import com.wt.hottoon.domain.HotToon;

@WebServlet("/hottoon/showlist")
public class HotToonListController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	PagingDAO pDao = new PagingDAO();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String genre = request.getParameter("genre");
		String page = request.getParameter("page");
		String block = request.getParameter("block");
		
		if(page == null)
		{
			page = "1";
		}
		if(block == null)
		{
			block = "0";
		}
		
		// 세션을 추출하기
		HttpSession session = request.getSession(); 
		
		// 클라이언트를 구분하기 위한 ID 확인
		String id = session.getId();
		
		System.out.println("id : " + URLEncoder.encode(id, "utf-8"));
		
		Cookie[] cookies = request.getCookies();
		System.out.println(URLEncoder.encode(cookies[0].getValue(), "utf-8"));
		System.out.println(URLDecoder.decode(cookies[0].getValue(), "utf-8"));
		System.out.println(cookies[0].getValue());
		//		if(cookies != null)
//		{
//			for(Cookie c : cookies)
//			{
//				String name = c.getName();
//				String value = c.getValue();
//				String comment = c.getComment();
//				String domain = c.getDomain();
//				String path = c.getPath();
//
//					System.out.println("이름: " + name + ", 값 : " + value + ", comment : " + comment + ", domain : " + domain + ", path : " + path );
//
//			}
//		}
		
		PagingVO vo = pDao.settingVO(Integer.parseInt(page), Integer.parseInt(block));
		System.out.println("genre : " + genre);
		List<HotToon> list = new ArrayList<>();
		list = dao.selectHotToon(genre, vo.getCountList(), vo.getPage());
		System.out.println(list.toString());
		request.setAttribute("genre", genre);
		request.setAttribute("list", list);
		request.setAttribute("paging", vo);
		
		//계산할 totalcount 는 페이징 DAO에서 하는걸로
		//나머지 데이터들만 넣어서 넘기면 됨
		
		
		
		//page.setTotalCount(pDao.selectTotalCount);
		/*String genre = request.getParameter("genre");
		
		request.setAttribute(genre, "active");
		
		request.setAttribute("number", 3);*/
		RequestDispatcher rd = request.getRequestDispatcher("/html/hottoon/formlist.jsp");
		
		rd.forward(request, response);
	}
	
}

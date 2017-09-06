package com.wt.news.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.wt.news.dao.NewsDAO;
import com.wt.news.domain.NewsVO;

import kr.co.mlec.util.MlecFileRenamePolicy;
@WebServlet ("/wt/news/update")
public class UpdateNewsController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDAO dao = new NewsDAO();
		NewsVO news = new NewsVO();
		
		/*		
		String upload = "C:/java97/team5_temp/wtpwebapps/team5_temp/upload"; // 디렉토리 위치에 사용자가 지정한 파일을 저장하겠다.
		String path = new SimpleDateFormat("/yyyy/MM/dd").format(new Date()); // 현재 날짜 생성 -> 날짜를 문자열로 변환
		File f = new File(upload + path);
		if (!f.exists()) f.mkdirs();
		MultipartRequest mRequest = new MultipartRequest( 
				request, 
				upload + path, 
				1024 * 1024 * 30, 
				"utf-8", 

				new MlecFileRenamePolicy() 
		); 
		System.out.println("파일 업로드 성공");
		*/
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String url = request.getParameter("url");
		
		news.setNo(no);
		news.setTitle(title);
		news.setContent(content);
		news.setUrl(url);
		/*		
		Enumeration<String> fNames = mRequest.getFileNames();
		
		String fileName = fNames.nextElement();
		
		File file = mRequest.getFile(fileName);
		String systemName = "";
		
		String pic = path + "/" + systemName;
		System.out.println("pic : " + pic);
		news.setPic(pic);
		*/
		dao.updateNews(news);
		System.out.println("저장");
		
		response.sendRedirect(request.getContextPath() + "/wt/news/list");
	}
	
}
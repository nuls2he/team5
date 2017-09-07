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
@WebServlet ("/wt/news/write")
public class WriteNewsController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDAO dao = new NewsDAO();
		NewsVO vo = new NewsVO();
		String upload = "C:/java97/server-work/wtpwebapps/team5_miniprj/upload"; // 디렉토리 위치에 사용자가 지정한 파일을 저장하겠다.
		String path = new SimpleDateFormat("/yyyy/MM/dd").format(new Date()); // 현재 날짜 생성 -> 날짜를 문자열로 변환
		
		System.out.println(request.getServletContext().getRealPath("/upload"));
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
		
	//	int no = Integer.parseInt(request.getParameter("no").trim());
		String title = mRequest.getParameter("title");
		String content = mRequest.getParameter("content");
		String url = mRequest.getParameter("url");
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUrl(url);
		
		
		System.out.println("요청 파라미터 정보");
	//	System.out.println("no : " + no);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("url : " + url);
		
		Enumeration<String> fNames = mRequest.getFileNames();
		
		String fileName = fNames.nextElement();
		
		File file = mRequest.getFile(fileName);
		String systemName = "";
		if (file != null) {
			System.out.println("파일 사이즈 : " + file.length());
			System.out.println("파일 패스 : " + path); 
			String orgName = mRequest.getOriginalFileName(fileName); 
			systemName = mRequest.getFilesystemName(fileName); 
			System.out.println("사용자가 올린 파일 이름 : " + orgName); 
			System.out.println("서버에 실제 저장된 파일 이름 : " + systemName); 
		}
		String pic = path + "/" + systemName;
		System.out.println("pic : " + pic);
		
		vo.setPic(pic);
		
		dao.insertNews(vo);
		System.out.println("저장");
		
		
		response.sendRedirect(request.getContextPath() + "/wt/news/list");
	}
	
}

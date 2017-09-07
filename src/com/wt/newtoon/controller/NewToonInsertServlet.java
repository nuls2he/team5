package com.wt.newtoon.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.wt.common.dao.CommonDao;
import com.wt.common.domain.Common;

import kr.co.mlec.util.MlecFileRenamePolicy;
@WebServlet("/newtooninsert")
public class NewToonInsertServlet extends HttpServlet{
		
		@Override
		public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Common vo = new Common();			
			request.setCharacterEncoding("utf-8");			
			String upload = request.getServletContext().getRealPath("/image");
			System.out.println(upload);
			String path = new SimpleDateFormat("/yyyy/MM/dd/hh/").format(new Date());
			
			File f = new File(upload + path);
			if(!f.exists())
			{
				f.mkdirs();
			}
			MultipartRequest mRequest = new MultipartRequest(
					request, 
					upload+path,
					1024*1024*30,
					"utf-8",
					new MlecFileRenamePolicy());
			System.out.println("파일 업로드");
			
			String imagePath = "";
			Enumeration<String> fNames = mRequest.getFileNames();
			while(fNames.hasMoreElements())
			{
				String fileName = fNames.nextElement();
				File file = mRequest.getFile(fileName);
				
				if(file != null)
					System.out.println("파일 사이즈 : " + file.length());
					System.out.println("파일 패스 : " + path);
					String orgName = mRequest.getOriginalFileName(fileName);
					System.out.println("사용자가 올린 파일 이름 : " + orgName);
					String systemName = mRequest.getFilesystemName(fileName);
					System.out.println("서버에 실제 저장된 파일 이름 : " + systemName);
					imagePath = path + systemName; 
			}
		
			
			
			String title = mRequest.getParameter("title");
			String id = mRequest.getParameter("id");
			String content = mRequest.getParameter("content");
			String type = "n";
			System.out.println(title);
			System.out.println(content);
			System.out.println(type);
			
			vo.setTitle(title);
			vo.setId(id);
			vo.setContent(content);
			vo.setType(type);
			vo.setImagepath(imagePath);
			
			CommonDao dao = new CommonDao();
			dao.insertBoard(vo);
			
			response.sendRedirect("/team5_miniprj/newtoonlist");	
//			RequestDispatcher rd = request.getRequestDispatcher("/com/wt/common/controller/commonListServlet");
//			rd.forward(request, response);
			
}
	

}

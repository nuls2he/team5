package com.wt.hottoon.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.wt.hottoon.dao.HotToonDAO;
import com.wt.hottoon.domain.HotToon;

import kr.co.mlec.util.MlecFileRenamePolicy;

@WebServlet("/hottoon/create")
public class HotToonCreateController extends HttpServlet{
	HotToonDAO dao = new HotToonDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = new SimpleDateFormat("/yyyy/MM/dd/hh/").format(new Date());
		
		//test
		String uploadPath = request.getServletContext().getRealPath("/upload");
		System.out.println("uploadPath : " + uploadPath);
		
		File f = new File(uploadPath + path);
		if(!f.exists())
		{
			f.mkdirs();
		}
		MultipartRequest mRequest = new MultipartRequest(request, uploadPath + path // 업로드할 디렉토리 경로
														, 1024 * 1024 * 30 // 업로드 최대 사이즈);
														, "utf-8" // 파라미터 인코딩 지정
														, new MlecFileRenamePolicy()); // new DefaultFileRenamePolicy() 동일한 파일이 있을 경우 넘버링을 올려 저장
		System.out.println("파일 업로드 성공!");
		String imgPath = "";
		
		Enumeration<String> fNames = mRequest.getFileNames();
		while (fNames.hasMoreElements())
		{
			String fileName = fNames.nextElement();
			File file = mRequest.getFile(fileName);
			// 사용자가 파일을 첨부했다면
			if(file != null)
			{
				System.out.println("파일 사이즈 : " + file.length());
				System.out.println("파일 패스 : " + path);
				String orgName = mRequest.getOriginalFileName(fileName);
				System.out.println("사용자가 올린 파일 이름 : " + orgName);
				String systemName = mRequest.getFilesystemName(fileName);
				System.out.println("서버에 실제 저장된 파일 이름 : " + systemName);
				imgPath = path + systemName;
			}
		}
		System.out.println(imgPath);
		HotToon hottoon = new HotToon();
		hottoon.setCompletion(mRequest.getParameter("completion"));
		hottoon.setGenre(mRequest.getParameter("genre"));
		hottoon.setTitle(mRequest.getParameter("title"));
		hottoon.setId(mRequest.getParameter("id")); //임시
		hottoon.setContent(mRequest.getParameter("content"));
		hottoon.setImagePath(imgPath);	// 앞의 경로 "프로젝트명/폴더"를 제외한 경로
		
		dao.createHotToon(hottoon); 
		
		response.sendRedirect("/team5_miniprj/hottoon/showlist");
	}
}

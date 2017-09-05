package com.wt.upload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.wt.util.MlecFileRenamePolicy;

@WebServlet("/com.wt.upload/ta_servlet")
public class Ta_servlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("호출");
	String upload = "C:/java97/server-work/wtpwebapps/team5_mini/upload";
	String path = new SimpleDateFormat("/yyyy/MM/dd/HH").format(new Date());
	File f= new File(upload + path);
	if(f.exists()==false){
		f.mkdirs();
	}
	MultipartRequest mRequest = new MultipartRequest(
			request, upload + path,	1024 *1024 * 10,
			"utf-8", new MlecFileRenamePolicy()
			);
	System.out.println("파일 업로드 성공");
	String title = mRequest.getParameter("title");
	String img = "";
	
	 Enumeration<String> fNames = mRequest.getFileNames();
	 while(fNames.hasMoreElements()){
		 String fileName = fNames.nextElement();
		 File file = mRequest.getFile(fileName);
		 //사용자가 파일을 첨부(null 이 아니라면)
		 if(file != null){
			 System.out.println("파일 사이즈: " + file.length());
			 System.out.println("파일 패스(path): " + path);
			 String orgName = mRequest.getOriginalFileName(fileName);
			 String systemName = mRequest.getFilesystemName(fileName);
			 System.out.println("사용자가 올린 파일 이름: " + orgName);
			 System.out.println("서버에 실제 저장된 파일 이름: " + systemName);
			 img = path + "/" + orgName;
		 }  
	
	}

	 	request.setAttribute("img", img);
	 	RequestDispatcher rd = request.getRequestDispatcher("/team5_mini/denglu");
	 	
	 
	}

}

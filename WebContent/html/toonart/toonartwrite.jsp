<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 

<%-- <form method="post"  action="${pageContext.request.contextPath}/denglu"> --%>
	   <form method="post" action="${pageContext.request.contextPath}/com.wt.upload/ta_servlet" enctype="multipart/form-data">
 	 제목 : <input type="text" name="title">
      <!-- 
      <div>
         내용 : <textarea rows="30" cols="100" name="content"></textarea>
      </div>
       -->
      <div>
         첨부파일 : <input type="file" name="attachFile">
      </div>
      <button >등록</button>
   </form>
<!-- </form> -->
</body>
</html>
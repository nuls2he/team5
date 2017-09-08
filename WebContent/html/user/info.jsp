<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
* {
    margin: 0px;
    padding: 0px;
}
html, body {
    height: 100%;
    background: url(user/bg03.png);
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-attachment: fixed;
    background-size: cover;
}
.back {
    height: 98%; 
    border: 3px solid blue;}
}
.box {
	margin-top: 50px;
}

</style>
<title>W.T.개인정보</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
 	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/mainform">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
					<li><a href="#ToonArt">ToonArt</a></li>
					<li><a href="#19+">19+</a></li>
				</ul>
				<div class="row">
					<div class="col-xs-8 col-sm-6"></div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
						<c:choose>
							<c:when test="${empty user}">
								<li><a href="${pageContext.request.contextPath}/loginForm">Login</a></li>
								<li><a href="${pageContext.request.contextPath}/signinForm">Join</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/infoForm">Info</a></li>
								<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>

			</div>

		</div>

	</nav>
	<div id = "container" >
		<div id = "header" style="background-color:#FFA500;">
			<h3 style = "margin-bottom:20;"> main title</h3>
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
			<div class="contentwrap">
  <article class="container">
    <form action="${pageContext.request.contextPath}/user/infoup" class="form-horizontal" method="post">
   <fieldset style="border-style: double; width: 80%;  height: 200px" class="box"><br>
   <legend>기본 정보</legend>
    <div class="form-group">
<!--     <table style="width: 100%"> -->
<!--     	<tr> -->
<!--     	<th> -->
<!-- 	    	<label>아이디</label> -->
<!--     	</th> -->
<!--     	<th> -->
<%-- 	    	<label>${user.id}</label> --%>
<!--     	</th> -->
<!--     	<th> -->
<!--     		<label>닉네임</label> -->
<!--     	</th> -->
<!--     	<th> -->
<%--     		<label>${user.nick}</label> --%>
<!--     	</th> -->
<!--     	</tr> -->
<!--     </table> -->
    <label class="col-sm-2 control-label">닉네임</label>
    <div class="col-sm-6">
    <label class="form-control">${user.nick}</label>
    </div>
    </div>
    <div class="form-group">
    <label for="inputNick" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="email" id="inputNick" value="${user.email}">
    </div>
    </div>
   </fieldset><br>
  <fieldset style="border-style: double; width: 80%;  height: 400px;" class="box">
  <legend>상세 정보</legend>
  <br>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="name" id="inputName" value="${user.name}" placeholder="홍길동">
    </div>
    </div><br>
       <div class="form-group">
    <label for="inputPhoneNum" class="col-sm-2 control-label">휴대폰 번호</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="call"id="inputPhoneNum" value="${user.call}"  placeholder="010-0000-0000">
    </div>
    </div><br>
    
    <div class="form-group">
    <label for="inputAdd" class="col-sm-2 control-label">주소</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="addHead" id="inputAdd" value="${user.addHead}" >
    </div>
    </div><br>
    <div class="form-group">
    <label for="inputAddress" class="col-sm-2 control-label">상세 주소</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="addTail" value="${user.addTail}">
    </div>
    </div>
  </fieldset>
 
    <div class="form-group">
    	<c:choose>
			<c:when test="${certAD eq y}">
      			<a href="${pageContext.request.contextPath}/withrawForm">회원탈퇴</a>
			</c:when>
			<c:otherwise>
		      	<a href="${pageContext.request.contextPath}/chkAdform" style="margin: 30px;">성인인증</a>
      			<a href="${pageContext.request.contextPath}/withrawForm">회원탈퇴</a>
			</c:otherwise>
		</c:choose>
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary" style="margin-left: 25px;">저장</button>
    </div>
    </div>
    </form>
  </article>
</div>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
		</div>
		
	</div>
	
</body>
</html>
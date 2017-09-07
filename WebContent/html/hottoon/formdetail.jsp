<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type = "text/css">
* {
    margin: 0px;
    padding: 0px;
}
html, body {
    height: 100%;
    background-image: url(bg03.png);
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-attachment: fixed;
    background-size: cover;
}
.back {
    height: 98%; 
    border: 3px solid blue;}
}
img.bg{
	min-height: 100%;
	min-width: 1024px;
	width:100%;
	height:auto;
	position:fixed;
	top:0;
	left:0;
}

@media screen and (max-width:1024px){
	img.bg{
	left: 50%;
	margin-left: -512px;}
}

div#container{
	position:relative;
}
.content {
		width: 596px;
		height: 500px;
		border: 1px solid black;
		
		
	}
<%--float: left;--%>
</style>
<title>W.T.</title>


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
				<a class="navbar-brand"  href="${pageContext.request.contextPath}/html/main/wtmain.jsp">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
					<li><a href="#ToonArt">ToonArt</a></li>
					<li><a href="#19+">19+</a></li>
				</ul>
				<div class="row">
					<div class="col-xs-8 col-sm-6"></div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="#Login">Login</a></li>
							<li><a href="#Join">Join</a></li>

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
		
			<%-- 로그인 했거나 관리자일 경우만 글쓰기, 수정, 삭제 버튼 활성화 --%>
			<div style="text-align: right;">
					<a href="/team5_miniprj/hottoon/createbtn">글쓰기</a>
			</div>
			<div style="border: 1px solid black;">
				<div align = left>
					<%-- <c:out value="[완결]-액션"/> --%>						
					<c:out value="[${hottoon.completion}]-${hottoon.genre}"/>
				</div>
				<div align = right>
					<%-- <fmt:parseDate var="d" value="2017-09-05 3:20:50" pattern="yyyy-MM-dd hh:mm:ss"/>
					<fmt:formatDate var="date" value="${d}" pattern="yyyy-MM-dd HH:mm:ss" />
					날짜 :${date} --%>
					<fmt:formatDate value="${hottoon.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				<div align = center>
					<!-- <h2>열렙전사</h2> -->
					<h2>${hottoon.title}</h2>
  					<img src="${pageContext.request.contextPath}/upload/${hottoon.imagePath}" width="100px"height="100px" /><br>
 				</div>
				<div class="row">
	        		<div class="col-xs-12">
	        			<c:out value="${hottoon.content}"/>
	        			<%-- <c:out value="아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오아리랑아리랑아라리오"/> --%>
	        		</div>
        		</div>
        		<div align = right>
        			<button type = button onClick="location.href='${pageContext.request.contextPath}/hottoon/showlist?genre=<c:out value="${genre}"/>&page=<c:out value="${page}"/>&block=<c:out value="${block}"/>'">목록</button>
        			<button type = button>수정</button>
        			<button type = button onClick="location.href='${pageContext.request.contextPath}/hottoon/remove?no=<c:out value="${hottoon.no}"/>'">삭제</button>
        		</div>
			</div>
			<%-- 댓글 기능 여기에 넣어야함 --%>

		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>

</html>
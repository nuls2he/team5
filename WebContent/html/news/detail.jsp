<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    background-image: url(bg02.png);
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
	left: 30%;
	margin-left: -512px;}
}

div#container{
	position:relative;
}

.content1{
	width:100%;
}

.img1{
	width: 40%;
}
.img2{
	width: 90%;
	margin: 10;
	float: left; 
}
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/mainform">W.T</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
					<li><a href="TA.jsp">ToonArt</a></li>
					<li><a href="#">19+</a></li>
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
		<div id = "header" style="height:70px;">
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8;">
			<h2>News</h2>
			<table class="content1">
				<tr>
					<th colspan="2"><h3>${news.title}</h3></th>
				</tr>
				<tr>
					<td class="img1"><img class="img2" src="${pageContext.request.contextPath}/upload${news.pic}" /></td>
					<td>${news.content}</td>
				</tr>
				<tr>	
					<td><a href="${news.url}">뉴스 바로가기</a></td>
					<td><h6>${news.regDate}</h6></td>
				</tr>
				
			</table>
		<a href="${pageContext.request.contextPath}/wt/news/list">목록</a>
		<a href="${pageContext.request.contextPath}/wt/news/updateform?no=${news.no}">수정</a>
		<a href="${pageContext.request.contextPath}/wt/news/delete?no=${news.no}">삭제</a>
			
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
</body>

</html>
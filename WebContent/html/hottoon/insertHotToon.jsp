<%@ page import="com.wt.common.domain.Common"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<a class="navbar-brand"  href="${pageContext.request.contextPath}/mainform">W.T</a>
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
			<table summary="글쓰기 전체 테이블">
				<h4>게시판 글쓰기</h4>
				<form name="BoardWriteForm" 
				method="post" 
				action="/team5_miniprj/hottoon/create?id=${user.id}" 
				onsubmit="return boardWriteCheck();" 
				enctype = "multipart/form-data">
					<table summary="테이블 구성" >
						<tr>
							<td><input type=hidden name="no" value=></td>
						</tr>
						<tr>
							<td>완결여부</td>
							<td>
								<select name="completion">
									<option>완결</option>
									<option>미완결</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>
			   					<select name="genre">
									<option>액션</option>
									<option>코믹</option>
									<option>판타지</option>
									<option>공포/스릴러</option>
									<option>로맨스</option>
								</select>
		   					</td>
						</tr>
						<tr>
							<td>제 목</td>
							<td><input type=text name="title" value=""></td>
			    		</tr>
					 	<tr>
	   						<td>이미지</td>
	   						<td><input type=file name="image" size=30></td>
	   					</tr>
			    		<tr>
			     			<td>내 용</td>
			     			<td><textarea name="content" rows ="10" cols="100" style="resize:none"></textarea></td>
			    		</tr>    	
			    		<tr>
			     			<td colspan=2><hr size=1></td>
			    		</tr>
			    		<tr>
			     			<td colspan="2"><div align="center">
			     				<button>등록</button>&nbsp;&nbsp;&nbsp;
			    	     		<input type="button" value="뒤로" onClick="location.replace='/team5_miniprj/hottoon/showlist'"></div>
			     			</td>
			    		</tr> 
					</table>
				</form> 
			</table>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>

</html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@ page import="com.wt.common.domain.Common"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
DecimalFormat format = new DecimalFormat("0");
%>
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/mainform">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
					<li><a href="#ToonArt">ToonArt</a></li>
					<li><a href="${pageContext.request.contextPath}/adulttoonlist">19+</a></li>
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
	
	
	<a href="${pageContext.request.contextPath}/newtoonlist"> 목록</a>
	<a href="${pageContext.request.contextPath}/html/newtoon/newtooninsert.jsp">등록</a>
	<table class="table table-hover" >
		<tr>
			<th>글번호</th>
			<th>이미지</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="Common" items="${list}">
		<tr>
			<td><c:out value="${Common.no}" /></td>
			<td><a href="${pageContext.request.contextPath}/newtoondetail?no=${Common.no}"><img src="<c:out value="${pageContext.request.contextPath}/image${Common.imagepath}"/>" width="250" height="200"></a></td>
			<td><c:out value="${Common.title}"/></td>
			<td><c:out value="${Common.content}" /></td>
			<td><c:out value="${Common.regdate}"/>
			<a href="${pageContext.request.contextPath}/newtooninserttoupdate?no=${Common.no}">수정</a>
			<a href="${pageContext.request.contextPath}/newtoondelete?no=${Common.no}">삭제</a> </td>
		</tr> 
		</c:forEach>
	</table>	 
			<a href="${pageContext.request.contextPath}/newtoonlist?rnum=0"><<</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/newtoonlist?rnum=<fmt:formatNumber value="${((rnum/5-(rnum/5%1))-1)*5}" pattern="0"/>"><</a>&nbsp;&nbsp;&nbsp;
			<c:choose>
			<c:when test="${((rnum/5-(rnum/5%1)+1)*5-1)>=(pnum/5)}">
				<c:forEach var="i" begin="${(rnum/5-(rnum/5%1))*5}" end="${pnum/5}">
				<a href="${pageContext.request.contextPath}/newtoonlist?rnum=${i}">${i+1}</a>&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="${(rnum/5-(rnum/5%1))*5}" end="${(rnum/5-(rnum/5%1)+1)*5-1}">
				<a href="${pageContext.request.contextPath}/newtoonlist?rnum=${i}">${i+1}</a>&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</c:otherwise>
			</c:choose>
	
			<a href="${pageContext.request.contextPath}/newtoonlist?rnum=<fmt:formatNumber value="${((rnum/5-(rnum/5%1))+1)*5}" pattern="0"/>">></a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/newtoonlist?rnum=<fmt:formatNumber value="${pnum/5}" pattern="0"/>">>></a>&nbsp;&nbsp;&nbsp;
				
		<form name="SearchForm" method="post" action="${pageContext.request.contextPath}/newtoonlist">
			<select name="selType" style="height:30px">
				<option value="no">글 번호</option>
				<option value="title">제목</option>
			</select>&nbsp;&nbsp;&nbsp;
				<input type="text" name="word" >&nbsp;&nbsp;&nbsp;
				<input type="submit" value="검색">		
		</form>
		
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">

		</div>
		
	</div>
	
	<form>
	</form>
</body>

</html>
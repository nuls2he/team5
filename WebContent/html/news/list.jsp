<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type = "text/css">
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
* {
    margin: 0px;
    padding: 0px;
}
html, body {
    height: 100%;
    background-image: url(bg03.jpg);
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-attachment: fixed;
    background-size: cover;
}
.back {
    height: 98%; 
    border: 3px solid blue;}
}
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #4B5A64;
  margin : 20px 10px;
}

table.type04 th {
    width: 200px;
    padding: 30px;
    
    font-size:16px;
    vertical-align: top;
    border-top: 1px solid #42779A;
    border-bottom: 1px solid #42779A;
}
table.type04 td {
    width: 800px;
    padding: 30px;
    font-size:16px;
    vertical-align: top;
    border-top: 1px solid #5B96A6;
    border-bottom: 1px solid #5B96A6;
}
 .num {
margin: 0 auto;
}

</style>
<title>W.T.News</title>


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
	<form action="/05_servletjsp/wt/news">
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/html/main/wtmain.jsp">W.T</a>
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
							<li><a href="${pageContext.request.contextPath}/loginForm">Login</a></li>
							<li><a href="${pageContext.request.contextPath}/signinForm">Join</a></li>

						</ul>
					</div>
				</div>

			</div>

		</div>

	</nav>
	<div id = "container">
		<div id = "header" style="height:70px;"></div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
		
		<h2>News</h2>
		<br>
		<br>
			<table class="type04">
				
				<c:forEach var="b" items="${list}">
				<tr>
			        <th>${b.regDate} </th>
			        <td><a href="${pageContext.request.contextPath}/wt/news/detail?no=${b.no}">${b.title} </a></td>
			    </tr>
				</c:forEach>
			</table>
			<br>
			<br>
			<br>
			<div class="num">
				<nav>
				  <ul class="pagination" class="col-xs-6 col-sm-5">
				    <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
				    <li><a href="${pageContext.request.contextPath}/wt/news/list">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
				  </ul>
				</nav>
				
				<input type="button"  value="글등록" onclick="location.href='${pageContext.request.contextPath}/wt/news/wirteform'">
				
				
			</div>
		</div>
		<div id="rightblank" class="col-xs-6 col-sm-2" >
			
		</div>
		
	</div>
	
</body>

</html>
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
    border-bottom: 1px solid #42779A;
}
table.type04 td {
    width: 800px;
    padding: 30px;
    font-size:16px;
    vertical-align: top;
    border-bottom: 1px solid #5B96A6;
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
				<a class="navbar-brand" href="/team5_html/wt/wtmain.html">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="#NewToon">NewToon</a></li>
					<li><a href="#HotToon">HotToon</a></li>
					<li><a href="#ToonArt">ToonArt</a></li>
					<li><a href="${pageContext.request.contextPath}/wt/news/write">19+</a></li>
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
		<div id = "header" style="height:70px;">
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
		<h2>News</h2>
		<br>
		<br>
			<form method="post" action="${pageContext.request.contextPath}/wt/news/write" enctype="multipart/form-data">
				<input type="hidden" name="no" value="3">
				<table class="type04" >
					<c:forEach var="b" items="${list}">
					<tr>
		     			<td><input type="text" class="form-control" value="Title"></td>
 			   		</tr>
		    		<tr>
     					<td><textarea class="content" name="content" id="title"  placeholder="  Content"></textarea></td>
    				</tr>
    				<tr>
		     			<td><input type="text" name="url" class="form-control" value="URL"></td>
 			   		</tr>
		    		<tr>
  			   			<td><input type="file" name="file1"></td>
   			 		</tr>
		    		<tr>
		     			<td colspan=2><hr size=1></td>
		    		</tr>
		    		<tr>
		     			<td colspan="2">
		     				<div align="center">
			     				<input type="submit" class="btn btn-default" value="등록" >&nbsp;&nbsp;&nbsp;
			    	     		<input type="button" class="btn btn-default" value="뒤로" onclick="location.href='${pageContext.request.contextPath}/news/list'" />
		    	     		</div>
		     			</td>
		    		</tr> 
				</table>
				</c:forEach>
			</form> 
		
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>

</html>
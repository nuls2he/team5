<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	left: 50%;
	margin-left: -512px;}
}

div#container{
	position:relative;
}
table {
		width: 300px;
		table-layout: fixed;
		
	}
table, td {
		border: 1px solid black;
		border-collapse: collapse; 
		
		
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/wt/wtmain.html">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="#NewToon">NewToon</a></li>
					<li><a href="#HotToon">HotToon</a></li>
					<li><a href="TA.jsp">ToonArt</a></li>
					<li><a href="#19+">19+</a></li>
				</ul>
				<div class="row">
					<div class="col-xs-8 col-sm-6"></div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="login.jsp">Login</a></li>
							<li><a href="signin.jsp">Join</a></li>

						</ul>
					</div>
				</div>

			</div>

		</div>

	</nav>
	<div id = "container" >
		<div id = "header" style="height:70px;">
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2"></div>
		<div id="main" class="col-xs-6 col-sm-8;">
			<h2>News</h2>
		<form method="post" action="${pageContext.request.contextPath}/wt/news/update" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${news.no}" />
			<table width="700px">
				<tr>
					<td><input type="text" name="title" value="${news.title}"/></td>
				</tr>
				<tr>
					<td><textarea name="content" rows="6" cols="70">${news.content}</textarea></td>
				</tr>	
				<tr>
					<td><input type="file" name="pic" value="${news.pic}" value="{news.pic}"/></td>
				</tr>
				<tr>	
					<td><input type="text" name="url" value="${news.url}"/></td>
				</tr>
				<tr>	
					<td>${news.regDate}</td>
				</tr>
			</table>
		<button type="submit" class="btn btn-default">수정</button>
		<input type="button" class="btn btn-default" value="목록" onclick="location.href='${pageContext.request.contextPath}/wt/news/list'" />
		</form>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
		</div>
		
	</div>
</body>

</html>
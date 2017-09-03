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
				<a class="navbar-brand" href="/team5_miniprj/html/wtmain.jsp">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="news.jsp">News</a></li>
					<li><a href="#NewToon">NewToon</a></li>
					<li><a href="#HotToon">HotToon</a></li>
					<li><a href="/testing/toonart/taform">ToonArt</a></li>
					<li><a href="#19+">19+</a></li>
				</ul>
				<div class="row">
					<div class="col-xs-8 col-sm-6"></div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="user/login.jsp">Login</a></li>
							<li><a href="user/signin.jsp">Join</a></li>

						</ul>
					</div>
				</div>

			</div>
		
		</div>

	</nav>
	<div id = "container" >
		<div id = "header" style="height:130px">
			<h3 style = "margin-bottom:20;"> main title</h3>
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
			<table style="margin:auto">
				<tr style ="height:300px">
				<td colspan = "2"><a href="news.jsp"><img src = "NT.png" style ="height:300px"></a></td>
				<td><a href="news.jsp"><img src = "HT.png" style ="height:300px"></td>
				</tr>
				<tr>
				<td><a href="news.jsp"><img src = "News.jpg" style ="height:300px"></a></td>
				<td><a href="TA.jsp"><img src = "TA.jpg" style ="height:300px"></a></td>
				<td><a href="news.jsp"><img src = "19191.png" style ="height:300px"></a></td>
				</tr>
				
				
			</table>
			</div>
		</div>
		<div id="rightblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
</body>
</html>
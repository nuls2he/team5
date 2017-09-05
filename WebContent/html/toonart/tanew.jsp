<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type = "text/css">
.jumbotron
{   
padding-top: 0px;
padding-bottom:200px;
background-image:url('css/a.jpg');
background-size: cover;
height:560px;
 }

.searchBlock{
	width : 50%;
	}
.img-responsive{
	width:400px; 
	height:200px;
}
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

	<div id = "container" >
		
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
			<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span>
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">W.T</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">News</a></li>
					<li><a href="#">New Toon</a></li>
					<li><a href="#">Hot Toon</a></li>
					<li><a href="#">ToonArt</a></li>
					<li><a href="#">19+</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<form>
	<input type="button" value="닫기" style="width:30pt; height:20pt;" onclick=window.close()>
</form>
	<div class= "toonimg">
      <a><img src="css/a.jpg" class="img-responsive" style="width:100%; height:80%;" alt="Image"></a>

	</div>
<div class="" onclick="" > 
</div>

<%-- 
<div class="fl"> 
	            	
		            <div class="btn2" onclick="goPrev();clickcr(this,'art.prev','','',event);">
		            	<p><a href="#" class="m-tcol-c"><img src="http://cafeimgs.naver.net/cafe4/ico-btn-pre_.gif" width="10" height="5" alt=""><button>이전글</button></a></p> 
		            </div> 
		            
		            
		            <div class="btn2" onclick="goNext();clickcr(this,'art.next','','',event);"> 
		            	<p><a href="#" class="m-tcol-c"><img src="http://cafeimgs.naver.net/cafe4/ico-btn-net_.gif" width="10" height="5" alt=""><button style="margin-left: 30px">다음글</button></a></p> 
		            </div>
		            
	            </div>
	            --%>
<%-- 	            
<div class="topBlock">
  
		<button>이전글</button>
	<button style="margin-left: 30px">다음글</button>
	
	</div>
--%>
</html>
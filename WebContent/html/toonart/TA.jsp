<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type = "text/css">
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
			

		</div>

	</nav>
	<div id = "container" >
		<div id = "header" style="background-color:#FFA500;">
			<h3 style = "margin-bottom:20;"> main title</h3>
		</div>
		<div id="leftblank" class="col-xs-3 col-sm-2">
		
		</div>
		<div id="main" class="col-xs-6 col-sm-8" >
			<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
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

	<div class="jumbotron">
		<div class="container text-center">
			<h2>ToonArt</h2>
		</div>
	</div>

<div class="topBlock">
   <span class="searchBlock">
		<select>
			<option>제목</option>
			<option>글쓴이</option>
			
		</select>
		<input type="search" name="search_val" no="srch-val" class="form-control" placeholder="글쓴이 또는 제목을 검색하세요"/>
		<button type="submit" class="btn-srch">검색</button>
		<button >글쓰기</button>
		
		
		
   </span>
 </div>

<div class="container-fluid bg-3 text-center">


  <div class="row">

    <!--  -->




  	<!--  -->
  </div>
</div><br>

<div class="container-fluid bg-3 text-center">
  <div class="row">
    <div class="col-sm-3">
     <a href="tanew.jsp" target="css/a.jpg"><img src="css/a.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/b.jpg"><img src="css/b.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
     <p>제목</p>    
      <p>글쓴이 날짜</p>
     </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/c.jpg"><img src="css/c.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
     <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/d.jpg"><img src="css/d.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/e.jpg"><img src="css/e.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/f.jpg"><img src="css/f.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/g.jpg"><img src="css/g.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
    <div class="col-sm-3">
      <a href="http://www.naver.com" target="css/h.jpg"><img src="css/h.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a>
      <p>제목</p>
      <p>글쓴이 날짜</p>
    </div>
  </div>
</div><br><br> 




    <!-- Bootstrap core JavaScript -->

    <script src="js/bootstrap.min.js"></script>
			
			
			
			
			
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>

</html>
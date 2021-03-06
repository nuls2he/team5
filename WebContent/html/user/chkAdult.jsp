<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
* {
    margin: 0px;
    padding: 0px;
}
html, body {
    height: 100%;
    background: url(user/bg03.png);
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-attachment: fixed;
    background-size: cover;
}
.back {
    height: 98%; 
    border: 3px solid blue;
}


</style>
<title>W.T.성인인증</title>

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
					<li class="active"><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
					<li><a href="#ToonArt">ToonArt</a></li>
					<li><a href="#19+">19+</a></li>
				</ul>
				<div class="row">
					<div class="col-xs-8 col-sm-6"></div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
								<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
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
			<div class="contentwrap">
    </div>
  <article class="container">
    <form action="${pageContext.request.contextPath}/user/chkadult" method="post" class="form-horizontal" style="margin-top: 5%;">
<!--     <fieldset style="border-style: double; width: 80%;  height: 200px"> -->
<!--     <legend>아이디 입력</legend> -->
<!--     <div class="form-group"> -->
<!--     <input type="text" class="form-control" name="id" style="width: 65%; margin-left: 17%"> -->
<!--     </div> -->
<!--     </fieldset> -->
    <fieldset style="border-style: double; width: 80%;  height: 200px">
    <legend>성인 인증</legend>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label" style="margin-left: 10%; font-size: large;">태어난 년도</label>
    <div class="col-sm-6">
	<select name="birthYear" class="form-control" style="width: 150px; margin-left: 20%;">
	<c:forEach var="i" begin="0" end="100">
		<c:set var="year" value="${2017-i}" />
		<option><c:out value="${year}" /></option>
	</c:forEach>
	</select>
    </div>
    </div><br>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label" style="margin-left: 10%; font-size: large;">월</label>
    <div class="col-sm-6">
	<select name="birthMonth" class="form-control" style="width: 150px; margin-left: 20%;">
	<c:forEach var="i" begin="1" end="12">
		<option><c:out value="${i}" /></option>
	</c:forEach>
	</select>
    </div>
    </div><br>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label" style="margin-left: 10%; font-size: large;">일</label>
    <div class="col-sm-6">
	<select name="birthDay" class="form-control" style="width: 150px; margin-left: 20%;">
	<c:forEach var="i" begin="1" end="31">
		<option><c:out value="${i}" /></option>
	</c:forEach>
	</select>
    </div>
    </div><br><br><br><br>

    <h3 style="text-align: center; color: red;">${chkMsg}</h3><br>
    </fieldset><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <input type="hidden" name="id" value="${user.id}">
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
      <button type="submit" class="btn btn-primary" style="margin-left: 20%;">성인 인증</button>
    </div>
    </form>
  </article>
</div>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>
</html>
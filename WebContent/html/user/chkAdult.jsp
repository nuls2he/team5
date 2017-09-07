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
    border: 3px solid blue;}
}
select.

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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/wtmain">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#News">News</a></li>
					<li><a href="#NewToon">NewToon</a></li>
					<li><a href="#HotToon">HotToon</a></li>
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
			<div class="contentwrap">
    </div>
  <article class="container">
    <form action="${pageContext.request.contextPath}/user/withraw" method="post" class="form-horizontal" style="margin-top: 5%;">
    <fieldset style="border-style: double; width: 80%;  height: 200px">
    <legend>아이디 입력</legend>
    <div class="form-group">
    <input type="text" class="form-control" name="id" style="width: 65%; margin-left: 17%">
    </div><br>
    </fieldset>
    <fieldset style="border-style: double; width: 80%;  height: 200px">
    <legend>생년월일 입력</legend>
    <div class="form-group">
	<select name="birthYear" class="birth">
	<c:forEach var="i" begin="0" end="100">
		<c:set var="year" value="${2017-i}" />
		<option><c:out value="${year}" /></option>
	</c:forEach>
	</select>
	<select name="birthMonth" class="birth">
	<c:forEach var="i" begin="1" end="12">
		<option><c:out value="${i}" /></option>
	</c:forEach>
	</select>
	<select name="birthDay" class="birth">
	<c:forEach var="i" begin="1" end="31">
		<option><c:out value="${i}" /></option>
	</c:forEach>
	</select>
    </div><h5 style="text-align: center; color: Cornflowerblue">${msg}</h5><br>
    </fieldset>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
      <button type="submit" class="btn btn-primary" style="margin-left: 20%;">계정 삭제</button>
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
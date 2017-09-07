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

</style>
<title>W.T.아이디/비밀번호 찾기</title>

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
					<li><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
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
  <table style="width: 100%">
  	<tr>
  		<th><br>
  		  <form action="${pageContext.request.contextPath}/user/findid" method="post" class="form-horizontal" style="margin-top: 5%;">
  			  <fieldset style="border-style: double; width: 80%;  height: 200px">
   			  <legend>아이디 찾기</legend>
    			<div class="form-group">
   					 <label for="inputNick" class="col-sm-2 control-label">닉네임</label>
   					 <div class="col-sm-6">
   						 <input type="text" class="form-control" name="nick" id="inputNick">
   					 </div>
    			</div><br><br><br>
    			<div class="form-group">
   					 <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
   					 <div class="col-sm-6">
   						 <input type="text" class="form-control" name="email" id="inputEmail" >
   					 </div>
    			</div><br>
    			<h5>${msgID}</h5>
    			<div class="col-sm-6">
			    	<button type="submit" class="btn btn-primary" style="margin-left: 50%; margin-top: 60%">ID 찾기</button>
    			</div>
    		  </fieldset>
    	  </form>
  		</th>

  		<th>
  			<form action="${pageContext.request.contextPath}/user/findpw" method="post" class="form-horizontal" style="margin-top: 5%;">
  			  <fieldset style="border-style: double; width: 80%;  height: 200px">
   			  <legend>비밀번호 찾기</legend>
   				<div class="form-group">
   					 <label for="inputID" class="col-sm-2 control-label">아이디</label>
   					 <div class="col-sm-6">
   						 <input type="text" class="form-control" name="id" id="inputID">
   					 </div>
    			</div><br><br>
    			<div class="form-group">
				    <div class="col-sm-6">
  			  			<select name="hintQ" style="margin-left: 40%">
							<option value="question" selected="selected">비밀번호 힌트 질문</option>
							<option value="q1">내가 다녔던 초등학교 이름은?</option>
							<option value="q2">내가 다녔던 중학교 이름은?</option>
							<option value="q3">내가 다녔던 고등학교 이름은?</option>
							<option value="q4">내가 좋아하는 나의 별명은?</option>
						</select>
    				</div>
    			</div>
    			<div class="form-group">
   			 		<label for="inputName" class="col-sm-2 control-label">답</label>
    				<div class="col-sm-6">
    					<input type="text" class="form-control" name="hintA" id="inputAnswer">
    				</div>
    			</div>
    			<h5>${msgPW}</h5>
    			<div>
			    	 <button type="submit" class="btn btn-primary" style="margin-left: 30%; margin-top: 30%">Password 찾기</button>
    			 </div>
    		  </fieldset>
    		</form>
  		</th>
  	</tr>
  </table>
  </article>
</div>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>
</html>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>
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
							<li><a href="#Login">Login</a></li>
							<li><a href="#Join">Join</a></li>

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
  <article class="container">
    <form action="/team5_miniprj/controller/signin" class="form-horizontal">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="id" id="inputID" placeholder="아이디">
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">닉네임</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="nick" id="inputNick" placeholder="닉네임">
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" name="password" id="inputPassword" placeholder="비밀번호">
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" name="check-pass"id="inputPasswordCheck" placeholder="비밀번호 확인">
      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="email" class="form-control" name="email" id="inputEmail" placeholder="이메일">
    </div>
    </div><br>
    <div class="form-group">
    <label for="inputRipple" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
    <select name="hintQ">
		<option value="question" selected="selected">비밀번호 힌트 질문</option>
		<option value="message1">내가 다녔던 초등학교 이름은?</option>
		<option value="message2">내가 다녔던 중학교 이름은?</option>
		<option value="message3">내가 다녔던 고등학교 이름은?</option>
		<option value="message4">내가 좋아하는 나의 별명은?</option>
	</select>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">질문에 대한 답</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" name="hintA" id="inputAnswer" placeholder="답">
    </div>
    </div>
    <div class="form-group">
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <a href="https://www.naver.com">메인으로</a>
      <button type="submit" class="btn btn-primary" style="margin-left: 25px;">계정 생성</button>
    </div>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type = "text/css">
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

table, td{
	border: 1px solid black;
}

table{
	width:100%;
	margin: auto;
	text-align: center;
}

.table > thead {
	background-color: #ffffff;
}

.table-hover > tbody > tr:hover {
	background-color: #e6eade;
}



.button {
  border-radius: 5px;
  font-size: 20px;
  text-decoration: none;
  margin: 13px 0;
  color: #fff;
  position: relative;
  display: inline-block;
}

.button:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}
.blue {
  background-color: #55acee;
  box-shadow: 0px 5px 0px 0px #3C93D5;
}

.pagination {
  font-weight: bold;
  font-size: 16px;
  font-family: "helvetica neue", helvetica, arial, sans-serif;
}
.pagination a {
  padding: 8px 16px;
  border: 1px solid #262626;
  border-radius: 3px;
  background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2UzZTNlMyIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2I4YjhiOCIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #e3e3e3), color-stop(100%, #b8b8b8));
  background: -moz-linear-gradient(top, #e3e3e3, #b8b8b8);
  background: -webkit-linear-gradient(top, #e3e3e3, #b8b8b8);
  background: linear-gradient(to bottom, #e3e3e3, #b8b8b8);
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.6), inset 0 1px rgba(255, 255, 255, 0.4);
  color: #333;
  text-decoration: none;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.72);
}
.pagination a:hover {
  background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Q5MDA3MyIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2EwMDA1NiIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #d90073), color-stop(100%, #a00056));
  background: -moz-linear-gradient(top, #d90073, #a00056);
  background: -webkit-linear-gradient(top, #d90073, #a00056);
  background: linear-gradient(to bottom, #d90073, #a00056);
  color: #260014;
}
.pagination a.active {
  background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzAwYWRkOSIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzAwNzA4YyIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #00add9), color-stop(100%, #00708c));
  background: -moz-linear-gradient(top, #00add9, #00708c);
  background: -webkit-linear-gradient(top, #00add9, #00708c);
  background: linear-gradient(to bottom, #00add9, #00708c);
  color: #001e26;
}
.pagination a.active:hover {
  cursor: default;
}
.pagination .prev:before {
  content: "« ";
  font-weight: normal;
}
.pagination .next:after {
  content: " »";
  font-weight: normal;
}
.pagination .next:hover, .pagination .prev:hover {
  border-color: #141414;
  background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzI2MjYyNiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzFhMWExYSIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #262626), color-stop(100%, #1a1a1a));
  background: -moz-linear-gradient(top, #262626, #1a1a1a);
  background: -webkit-linear-gradient(top, #262626, #1a1a1a);
  background: linear-gradient(to bottom, #262626, #1a1a1a);
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.6), inset 0 1px rgba(255, 255, 255, 0.1);
  color: #ebebeb;
  text-shadow: none;
}

.pagination {
  margin-top: 200px;
}


/* .pagination a, button {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}
.pagination a:hover:not(.active) {background-color: #ddd;} */
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
				<a class="navbar-brand"  href="${pageContext.request.contextPath}/html/main/wtmain.jsp">W.T</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/wt/news/list">News</a></li>
					<li><a href="${pageContext.request.contextPath}/newtoonlist">NewToon</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/hottoon/showlist">HotToon</a></li>
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
								<li><a href="${pageContext.request.contextPath}/infoForm">Info</a></li>
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
			<div class="pagination col-sm-8">

				<c:choose>
					<c:when test="${genre eq '액션'}'">
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=액션" class="active">액션</a> 	
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=액션">액션</a> 	
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${genre eq '코믹'}">
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=코믹" class="active">코믹</a> 
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=코믹">코믹</a> 	
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${genre eq '판타지'}">
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=판타지" class="active">판타지</a>		
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=판타지">판타지</a> 	
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${genre eq '공포/스릴러'}">
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=공포/스릴러" class="active">공포/스릴러</a> 			
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=공포/스릴러">공포/스릴러</a> 	
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${genre eq '로맨스'}">
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=로맨스" class="active">로맨스</a>			
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=로맨스">로맨스</a> 	
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="col-sm-4">
				<div style="text-align: right;">
					<a href="/team5_miniprj/hottoon/createbtn" class="button blue">글쓰기</a>
						<%-- <c:if test="${!empty user}">
							<a href="/team5_miniprj/hottoon/createbtn">글쓰기</a>
						</c:if> --%>
				</div>
			</div>
			
			<div class="row" style="border: 1px solid black; padding: 15px 15px;">
				<table style="table-layout:fixed;">
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td width="1%" align="center">비어있습니다.</td>
							<tr>
						</c:when>
						<c:otherwise>
							
							<c:forEach var="b" items="${list}"> 
								<tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hottoon/detail?no=<c:out value="${b.no}"/>&genre=<c:out value="${genre}"/>&page=<c:out value="${paging.page}"/>&block=<c:out value="${paging.blockCount}"/>'">
									<td width="10%">${b.no}</td>
									<td width="15%">
										<%-- <c:out value="${pageContext.request.contextPath}/upload${b.imagePath}"/> --%>
										<img src="${pageContext.request.contextPath}/upload${b.imagePath}" width="100%"height="100%" />
									</td>
									<td width="25%">
										[<c:out value="${b.genre}"/>]-
										<c:out value="${b.completion}"/><br>
										<c:out value="${b.title}"/>
									</td>
									<td width="50%">
										<c:out value="${b.content}"/>
									</td>
									
								<tr>
							</c:forEach>
							
						</c:otherwise>
					</c:choose>
						<%-- <tr style="cursor:pointer;" onClick = "location.href='/team5_miniprj/hottoon/detail?no=${number}'">
							<td width="10%">이미지공간
								<img src="/team5_miniprj/html/toonart/css/b.jpg" width="100px"height="100px" />
							</td>
							<td width="30%">
								[<c:out value="액션"/>] -<c:out value="완결"/><br>
								<c:out value="말짱도루묵"/>
							</td>
							<td width="50%"
							    style="text-overflow: ellipsis; overflow: hidden;">
								<c:out value="나랏말쌈이듕국에달아뜻이 나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시나랏말쌈이듕국에달아뜻이 사맛디아니홀시"/>
							</td>
							
						<tr> --%>
						
					</tbody>
				</table>
			</div>
			<hr>
			<div class="row">
        		<div class="col-xs-12">
        			<div class="jb-center" style="text-align: center;">
						<div class="pagination">
							<button type="button" onClick="location.href='${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=1&block=0'" <c:if test="${paging.blockCount eq 0}">disabled</c:if>>
								&laquo;
							</button>
							<button type="button" onClick="location.href='${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=<c:out value="${(paging.blockCount - 1 + 1) * paging.countPage - 9}"/>&block=${paging.blockCount - 1}'" <c:if test="${paging.blockCount eq 0}">disabled</c:if>>
								&lt;
							</button>
							<c:forEach var="index" begin="${paging.startPage}" end="${paging.endPage}" step="1">
								<c:choose>
									<c:when test="${paging.page eq index}">
										<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=${index}&block=${paging.blockCount}" class="active"><c:out value="${index}"/></a>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=${index}&block=${paging.blockCount}"><c:out value="${index}"/></a>
									</c:otherwise>
								</c:choose>
								<%-- <c:if test="${paging.blockCount eq 0}">class="disabled"</c:if> --%>
								<%-- <a <c:if test="${paging.blockCount eq 0}"><c:out value="class='disabled'"/></c:if> href="${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=1&block=0">&laquo;</a> --%>
							</c:forEach>
							<button type="button" onClick="location.href='${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=<c:out value="${(paging.blockCount + 1 + 1) * paging.countPage - 4}"/>&block=${paging.blockCount + 1}'" <c:if test="${paging.blockCount eq paging.lastBlock}">disabled</c:if>>
								&gt;
							</button>
							<button type="button" onClick="location.href='${pageContext.request.contextPath}/hottoon/showlist?genre=${genre}&page=${paging.totalPage}&block=${paging.lastBlock}'" <c:if test="${paging.blockCount eq paging.lastBlock}">disabled</c:if>>
								&raquo;
							</button>
						</div>
					</div>
        		</div>
        	</div>
		</div>
		<div id="leftblank" class="col-xs-6 col-sm-2">
			
		</div>
		
	</div>
	
</body>

</html>
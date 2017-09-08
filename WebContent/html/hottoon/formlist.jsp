<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.table > thead {
	background-color: #ffffff;
}
.table > thead > tr > th {
	text-align: center;
}
.table-hover > tbody > tr:hover {
	background-color: #e6ecff;
}
.table > tbody > tr > td {
	text-align: center;
}
.table > tbody > tr > #title {
	text-align: left;
}

.pagination a, button {
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
.pagination a:hover:not(.active) {background-color: #ddd;}
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
			<div class="pagination">
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
			<div style="text-align: right;">
				<c:if test="${!empty user}">
					<a href="/team5_miniprj/hottoon/createbtn">글쓰기</a>
				</c:if>
			</div>
			<div>
				<table style="table-layout:fixed" class="table table-striped table-bordered table-hover">
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
									<td width="10%">이미지공간
										<%-- <c:out value="${pageContext.request.contextPath}/upload${b.imagePath}"/> --%>
										<img src="${pageContext.request.contextPath}/upload${b.imagePath}" width="100px"height="100px" />
									</td>
									<td width="30%">
										[<c:out value="${b.genre}"/>]-
										<c:out value="${b.completion}"/><br>
										<c:out value="${b.title}"/>
									</td>
									<td width="50%"> 말 줄임 처리 해야됨
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
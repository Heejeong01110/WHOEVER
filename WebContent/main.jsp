<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css "/>
<link rel="stylesheet" href="css/search.css">

<title>게시판</title>
</head>
<body>
	<% 
		//BbsDAO bbsdao = new BbsDAO();
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
			data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class = "icon-bar"></span>
			<span class = "icon-bar"></span>
			<span class = "icon-bar"></span>
			</button>
			<a class = "navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href = "#" class = "dropdown-toggle"
					data-toggle = "dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class = "dropdown-menu">
						<li class = "active"><a href = "main.jsp">메인</a></li>
						<li><a href="bbs.jsp">게시글 목록</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</nav>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
	<div class="search__container" style="width: 450px; margin: 0 auto; margin-top: 50px">
    	<p class="search__title">
        	Go ahead, hover over search
    	</p>
    	<input class="search__input" type="text" placeholder="Search">
	</div>
</body>
</html>
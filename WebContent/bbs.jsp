<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css "/>
<title>게시판</title>
</head>
<body>
	<!--  <nav class = "navbar navbar-default">
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
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href = "#" class = "dropdown-toggle"
					data-toggle = "dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "bbs.jsp">글쓰기</a></li>
						<li class = "active"><a href="bbs.jsp">게시글 목록</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</nav>-->
		<jsp:include page="header.jsp" />
		<div class = "container">
			<div class = "row">
				<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style = "background-color : #eeeeee; text-align: center;">번호</th>
							<th style = "background-color : #eeeeee; text-align: center;">구인/구직</th>
							<th style = "background-color : #eeeeee; text-align: center;">제목</th>
							<th style = "background-color : #eeeeee; text-align: center;">태그</th>
							<th style = "background-color : #eeeeee; text-align: center;">작성자</th>
							<th style = "background-color : #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>구인</td>
							<td>안녕하세요</td>
							<td>#강아지</td>
							<td>홍길동</td>
							<td>2017-05-04</td>
						</tr>
					</tbody>
				</table>
				<a href = "bbswrite.jsp" class = "btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>
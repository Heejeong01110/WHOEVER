<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css "/>
<title>게시판</title>
</head>
<body>
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
	<script src = "resources/js/bootstrap.js"></script>
</body>
</html>
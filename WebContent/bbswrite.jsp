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
				<form method = "post" action = "writeAction.jsp" >
				<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color : #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type = "radio" placeholder = "종류" name="bbsType" maxlength="20" checked>구인
								<input type = "radio" placeholder = "종류" name="bbsType" maxlength="20" >구직
							</td>
						</tr>
						<tr>
							<td><input type = "text" class = "form-control" placeholder = "제목" name="bbsTitle" maxlength="50"></td>
							</tr>
						<tr>
							<td><textarea class = "form-control" placeholder = "내용" name="bbsContent" maxlength="2048" style ="height: 350px;" ></textarea></td>
						</tr>
						
					</tbody>
					
				</table>
				<input type = "submit" class = "btn btn-primary pull-right" value = "글쓰기">
				</form>
				
				
			</div>
		</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "resources/js/bootstrap.js"></script>
</body>
</html>
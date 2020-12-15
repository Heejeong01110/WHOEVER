<%@ page language="java" contentType="text/html; charset = utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css " />
<script src="./resources/js/hashtag.js"></script>
<title>게시판</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="radio" placeholder="종류" name="bbs_type"
								maxlength="20" value="구인" checked>구인 <input type="radio"
								placeholder="종류" name="bbs_type" maxlength="20" value="구직">구직
							</td>
						</tr>
						<tr>
							<td><input type = "text" class = "form-control" placeholder = "키워드" name = "tag_name" maxlength = "30">
							</td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목"
								name="bbs_title" maxlength="50"></td>
						</tr>
						<tr>
							<td ><textarea class="form-control" placeholder="내용"
									name="bbs_content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>

					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>


		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
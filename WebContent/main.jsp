<%@ page language="java" contentType="text/html; charset = utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css " />
<link rel="stylesheet" href="resources/css/card.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>WHOEVER</title>

</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		String msg = request.getParameter("msg");
		
		if (msg != null) {
			if(msg.equals("1")){
				out.println(" <h2 class='alert alert-danger'>회원가입을 완료했습니다.</h2>");
			}else if (msg.equals("2")) {
				//세션 받아오기
				String loginId = (String) session.getAttribute("sessionId");
				out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
			}else if(msg.equals("3")){
				out.println(" <h2 class='alert alert-danger'>" + "로그인이 필요합니다.</h2>");
			}
		} else {
			out.println(" <h2 class='alert alert-danger'>" + "로그인이 필요합니다.</h2>");
		}
%>
	
	<a href="#"> <!-- 클릭 시 링크 설정 -->
		<div class="bbs">
			<!-- BBS 헤더 -->
			<div class="bbs-header">
				<div class="bbs-header-is_closed">
					<div class="bbs-header-text">모집중</div>
					<div class="bbs-header-number">2 / 5</div>
				</div>

			</div>
			<!--  카드 바디 -->

			<div class="bbs-body">
				<!--  카드 바디 헤더 -->
				<div class="bbs-body-header">
					<h1>택시 같이 타실분 구해요!</h1>
					<p class="bbs-body-hashtag">#정왕역 #4시</p>
					<p class="bbs-body-nickname">작성자: 김민우</p>
				</div>

				<p class="bbs-body-description">학교까지 같이 택시 타실분 구합니다! 정왕역 1번출구 택시
					정류장 앞으로 4시까지 와주세요!</p>
				<!--  카드 바디 본문 -->
				<!--  카드 바디 푸터 -->

				<div class="bbs-body-footer">
					<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<i class="icon icon-view_count"></i>조회 38회 
					<i class="reg_date">2020/12/04
					</i>
				</div>
			</div>
		</div>
	</a>
	
	<a href="#"> <!-- 클릭 시 링크 설정 -->
		<div class="bbs">
			<!-- BBS 헤더 -->
			<div class="bbs-header">
				<div class="bbs-header-is_closed">
					<div class="bbs-header-text">모집중</div>
					<div class="bbs-header-number">3 / 5</div>
				</div>

			</div>
			<!--  카드 바디 -->

			<div class="bbs-body">
				<!--  카드 바디 헤더 -->
				<div class="bbs-body-header">
					<h1>롤 같이하실분 구해요!</h1>
					<p class="bbs-body-hashtag">#일반 #5인 #골드</p>
					<p class="bbs-body-nickname">작성자: 강희정</p>
				</div>

				<p class="bbs-body-description">같이 일반 5인큐 돌리실분 구해요!
				평균랭크 골드 이상 환영</p>
				<!--  카드 바디 본문 -->
				<!--  카드 바디 푸터 -->

				<div class="bbs-body-footer">
					<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<i class="icon icon-view_count"></i>조회 68회 
					<i class="reg_date">2020/12/04
					</i>
				</div>
			</div>
		</div>
	</a>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
</body>
</html>
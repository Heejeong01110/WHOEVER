<%@ page language="java" contentType="text/html; charset = utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css " />
<link rel="stylesheet" href="./resources/css/card.css" />
<link rel="stylesheet" href="./resources/css/search.css?after">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="./resources/js/hashtag.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "tag.Tag" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.*" %>
<title>WHOEVER</title>

</head>
<body>
   <jsp:include page="header.jsp" />
	<% 
	 request.setCharacterEncoding("utf-8"); 
	String loginId = null;
	int flag = 1;
	if(session.getAttribute("sessionId") != null){
		  loginId = (String) session.getAttribute("sessionId"); //user 이름
	}
	
		BbsDAO bbsDAO = new BbsDAO();
		TagDAO tagDAO = new TagDAO();
		ArrayList<Bbs> list = bbsDAO.getList(loginId);
		ArrayList<Tag> tlist = tagDAO.getHash();
		for(int i = 0; i< list.size(); i++){
		%>
	<a href="view.jsp?bbs_id=<%= list.get(i).getBbs_id()%>&&flag=<%=flag%>"> <!-- 클릭 시 링크 설정 -->
		<div class="bbs">
			<!-- BBS 헤더 -->
			<div class="bbs-header">
				<div class="bbs-header-is_closed">
					<div class="bbs-header-text"><%=list.get(i).getBbs_type()%></div>
					<div class="bbs-header-number">2 / 5</div>
				</div>
			</div>
			<!--  카드 바디 -->

			<div class="bbs-body">
				<!--  카드 바디 헤더 -->
				<div class="bbs-body-header">
					<h1><%=list.get(i).getBbs_title()%></h1>
					<p class="bbs-body-hashtag"></p>
					<p class="bbs-body-nickname">작성자: <%= list.get(i).getUser_id() %></p>
				</div>

				<p class="bbs-body-description"><%=list.get(i).getBbs_content()%></p>
				<!--  카드 바디 본문 -->
				<!--  카드 바디 푸터 -->

				<div class="bbs-body-footer">
					<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<i class="icon icon-view_count"></i>조회 38회 
					<i class="reg_date"><%=list.get(i).getBbs_date().substring(0 , 11) + list.get(i).getBbs_date().substring(11, 13) + "시 " + list.get(i).getBbs_date().substring(14, 16) + "분 " + list.get(i).getBbs_date().substring(17, 19) + "초"%>
					</i>
				</div>
			</div>
		</div>
	</a>
		
	<%
		} 
	%>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="resources/js/bootstrap.js"></script>
</body>
</html>
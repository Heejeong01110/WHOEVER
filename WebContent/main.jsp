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
		String msg = request.getParameter("msg");
	
		if (msg != null) {
			if(msg.equals("1")){
				out.println(" <h2 class='alert alert-danger'>회원가입을 완료했습니다.</h2>");
			}else if (msg.equals("2")) {
				//세션 받아오기
				String loginId = (String) session.getAttribute("sessionId");
				out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
			}				
		} else {
			out.println(" <h2 class='alert alert-danger'>" + "로그인이 필요합니다.</h2>");
		}
	%>
	
	<div class="search__container" style="width: 450px; margin: 0 auto; margin-top: 50px">
    	<p class="search__title">
        	WHOEVER
    	</p>
    	<form name = "searchBox" action = "mainServlet?cmd=search" method="post">
    		<select id="searchType" name="searchType">
    			<option value="all"<c:if test="${searchType == 'all'}">selected</c:if>>전체</option>
    			<option value="title"<c:if test="${searchType == 'title'}">selected</c:if>>제목</option>
    			<option value="type"<c:if test="${searchType == 'type'}">selected</c:if>>종류</option>
    		</select>
	    	<input class="search__input" type="text" placeholder="Search" name = "searchData">
	    	<p> <!-- <input type="submit" value = "전송"> -->
	    </form>
	</div>
	
	<%
		Bbs bbsvo = new Bbs();
		BbsDAO bbsdao = new BbsDAO();
		TagDAO tagDAO = new TagDAO();
		ArrayList<Bbs> bbslist = (ArrayList<Bbs>)request.getAttribute("bbslist");
		//ArrayList<Bbs> list = bbsDAO.getList();
		//ArrayList<Tag> hashList = tagDAO.getHash();
		for(Bbs B: bbslist){
		%>
	<a href="view.jsp?bbs_id=<%= B.getBbs_id()%>"> <!-- 클릭 시 링크 설정 -->
		<div class="bbs">
			<!-- BBS 헤더 -->
			<div class="bbs-header">
				<div class="bbs-header-is_closed">
					<div class="bbs-header-text"><%=B.getBbs_type()%></div>
					<div class="bbs-header-number">2 / 5</div>
				</div>

			</div>
			<!--  카드 바디 -->

			<div class="bbs-body">
				<!--  카드 바디 헤더 -->
				<div class="bbs-body-header">
					<h1><%=B.getBbs_title()%></h1>
					<p class="bbs-body-hashtag"></p>
					<p class="bbs-body-nickname">작성자: <%= B.getUser_id() %></p>
				</div>

				<p class="bbs-body-description"><%=B.getBbs_content()%></p>
				<!--  카드 바디 본문 -->
				<!--  카드 바디 푸터 -->

				<div class="bbs-body-footer">
					<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<i class="icon icon-view_count"></i>조회 38회 
					<i class="reg_date"><%=B.getBbs_date().substring(0 , 11) + B.getBbs_date().substring(11, 13) + 
						"시 " + B.getBbs_date().substring(14, 16) + "분 " + B.getBbs_date().substring(17, 19) + "초"%>
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
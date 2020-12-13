<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<%@ page import = "bbs.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css "/>
<link rel="stylesheet" href="css/search.css?after">

<title>게시판</title>
</head>
<script type="text/javascript">
</script>
<body>
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
        	WHO EVER
    	</p>
    	<form name = "searchBox" action = "mainServlet?cmd=search" method="post">
    		<select id="searchType" name="searchType">
    			<option value="title"<c:if test="${searchType == 'title'}">selected</c:if>>제목</option>
    			<option value="type"<c:if test="${searchType == 'type'}">selected</c:if>>종류</option>
    		</select>
	    	<input class="search__input" type="text" placeholder="Search" name = "searchData">
	    	<p> <!-- <input type="submit" value = "전송"> -->
	    </form>
	</div>
	
	<div class = "container" style="width: 50%; margin: 0 auto; margin-top: 50px">
		<table border = "1">
		<tr>
			<th width="100"> bbs_id </th>
			<th width="100"> bbs_title </th>
			<th width="100"> bbs_date </th>
			<th width="100"> bbs_content </th>
			<th width="100"> bbs_available </th>
			<th width="100"> bbs_type </th>
		</tr>
		<%
			Bbs bbsvo = new Bbs();
			ArrayList<Bbs> bbslist = (ArrayList<Bbs>)request.getAttribute("bbslist");
			if(bbslist!=null) {
				for(Bbs B: bbslist){
					out.print("<tr><td>" + B.getBbsID() + "</td>");
					out.print("<td>" + B.getBbsTitle() + "</td>");
					out.print("<td>" + B.getBbsDate() + "</td>");
					out.print("<td>" + B.getBbsContent() + "</td>");
					out.print("<td>" + B.getBbsAvailable() + "</td>");
					out.print("<td>" + B.getBbsType() + "</td></tr>\n");
				}
			}else {
				BbsDAO bbsdao = new BbsDAO();
				bbslist = bbsdao.allElement();
				for(Bbs B: bbslist){
					out.print("<tr><td>" + B.getBbsID() + "</td>");
					out.print("<td>" + B.getBbsTitle() + "</td>");
					out.print("<td>" + B.getBbsDate() + "</td>");
					out.print("<td>" + B.getBbsContent() + "</td>");
					out.print("<td>" + B.getBbsAvailable() + "</td>");
					out.print("<td>" + B.getBbsType() + "</td></tr>\n");
				}
			}
		%>
		</table>
	</div>
</body>
</html>
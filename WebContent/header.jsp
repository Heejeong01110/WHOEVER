<%@ page language="java" contentType="text/html; charset = utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%
      String loginId = (String) session.getAttribute("sessionId");
		String user_image = (String) session.getAttribute("sessionuserImage");
%>   

<nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="http://localhost:8080/WHOEVER/main.jsp"><strong>WHOEVER</strong></a>
      </div>
      
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
         <%
         if (loginId != null) {//로그인 되어있을 경우
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/main.jsp\">메인</a></li>");
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/bbs.jsp\">나의 글</a></li>");
                  } else {//로그인이 안되있을 경우
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/main.jsp\">메인</a></li>");
                     }%>
            <!-- <li><a href="http://localhost:8080/WHOEVER/main.jsp">메인</a></li>
            <li><a href="http://localhost:8080/WHOEVER/bbs.jsp">내가 쓴 글</a></li> -->
         </ul>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
               <a class="dropdown-toggle" href="#"data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
<%				
				String fileUploadPath = this.getServletContext().getRealPath("/resources/images");
               if(loginId!=null){//로그인이 안되어있는 경우
%>
				<img src="http://localhost:8080/WHOEVER/resources/images/<%=user_image %>"  width="auto" height="25" border="0" margin="10">
<%
               }else{
%>
				<img src="http://localhost:8080/WHOEVER/resources/images/defaultusrimg.jpg"  width="auto" height="25" border="0" margin="10">
<%   
               }               
%>

                </a>
               <ul class="dropdown-menu">
               <%
                  if (loginId != null) {//로그인 되어있을 경우
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/login/logout.jsp\">로그아웃</a></li>");
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/login/mypage.jsp\">프로필</a></li>");
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/bbswrite.jsp\">게시판 글쓰기</a></li>");
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/bbs.jsp\">내가 쓴 글 보기</a></li>");
                  } else {//로그인이 안되있을 경우
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/login/login.jsp\">로그인</a></li>");
                     out.println("<li><a href=\"http://localhost:8080/WHOEVER/login/signup.jsp\">회원가입</a></li>");
                  }
               %>
               </ul>
            </li>
         </ul>
      </div>
   </nav>
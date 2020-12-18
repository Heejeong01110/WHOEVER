<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session = "false"%>
<%@ page import ="java.sql.*" %>
<%@ page import = "message.ChattingDAO" %>
<%@ page import = "message.Chatting" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/WHOEVER/resources/css/bootstrap.min.css " />
<title>WHOEVER-채팅방 목록</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<%
	   HttpSession sessionsa = request.getSession(false);
	  String loginId = (String) sessionsa.getAttribute("sessionId");
	   
	  if(loginId==null){
	      out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"/WHOEVER/login/login.jsp\"; </script>");}
	  
	  ChattingDAO chattingDAO = new ChattingDAO();
	  ArrayList<Chatting> list = chattingDAO.getMyRoomList(loginId);
	  out.println("<div id=\"wrapper\">");
	  for(Chatting i : list){
		  out.println("<a href=\""+response.encodeURL("chattingRoom.jsp?type=1&num="+ i.getRoom_id())+"\"/>");
		 out.println("<div class=\"list\">");
		 
		 out.println("<div class=\"img-wrapper\">");
		 out.println("<img src=\"http://"+"localhost:8080/WHOEVER/resources/images/"+i.getUser_image()+"\">");
		 out.println("</div>"); //img-wrapper
		 
		 out.println("<div class=\"content-wrapper\">");
		 
		 out.println("<div class=\"title-wrapper\">");
		 out.println("<p>"+i.getRoom_title()+"</p>");
		 out.println("</div>"); //title-wrapper
		 
		 out.println("<div class=\"half-wrapper\">");
		 
		 out.println("<div class=\"con-wrapper\">");
		 out.println("<p>"+i.getContent_content()+"</p>");
		 out.println("</div>"); //con-wrapper
		 
		 out.println("<div class=\"time-wrapper\">");
		 out.println("<p>"+i.getContent_created_time()+"</p>");
		 out.println("</div>"); //time-wrapper
		 
		 out.println("</div>"); //half-wrapper
		 out.println("</div>"); //content-wrapper
		 out.println("</div>"); //list
		 out.println("</a>"); //a tag
	  }
	  out.println("</div>"); //wrapper
	  %>
</body>
</html>
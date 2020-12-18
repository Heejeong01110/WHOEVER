<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import = "message.ChattingDAO"  %>
<!DOCTYPE html>
<%
	HttpSession sessionsa = request.getSession(false);
	String user_id = (String) sessionsa.getAttribute("sessionId");
	String type = request.getParameter("type");
	String room_id = request.getParameter("num");	
	ChattingDAO chattingDao= new ChattingDAO();
	if(user_id==null){
	    out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"/WHOEVER/login/login.jsp\"; </script>");
	}
	
	if(type== null || room_id==null)
	{
		out.println("<script> alert(\"잘못된 접근입니다.\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
	}
	else if(type.equals("0"))//채팅방 첫방문
	{
		if(chattingDao.getRoomExist(room_id, user_id))//채팅방 존재?
		{
			if(chattingDao.checkMember(room_id, user_id)) //기존 멤버라면
			{
				sessionsa.setAttribute("room_id",room_id);
				%><jsp:forward page="chat.jsp" /><%
			}
			else if(chattingDao.getRoomLimt(room_id, user_id)) //새멤버라면 제한인원 검사
			{
				sessionsa.setAttribute("room_id",room_id);
				chattingDao.setChattingMember(room_id,user_id);
				%><jsp:forward page="chat.jsp" /><%
			}
			else
			     out.println("<script> alert(\"정원이 가득차 채팅방에 입장 불가합니다.\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
		}
		else
		    out.println("<script> alert(\"채팅방이 존재하지않습니다..\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
	}
	else if(type.equals("1"))
	{
		if(chattingDao.getRoomExist(room_id, user_id))
		{
			if(chattingDao.checkMember(room_id,user_id))
			{
				sessionsa.setAttribute("room_id",room_id);
				%><jsp:forward page="chat.jsp" /><%
			}
			else
				out.println("<script> alert(\"채팅방 멤버가 아닙니다.\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
		}
		else
			out.println("<script> alert(\"채팅방이 존재하지 않습니다.\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
	}
	else
	{
		out.println("<script> alert(\"잘못된 접근입니다.\"); window.location= \"/WHOEVER/main.jsp\"; </script>");
	}
	
	

%>
<html>
<head>
<meta charset="UTF-8">
<title>WHOEVER-채팅방 목록</title>
</head>
<body>
		
</body>
</html>
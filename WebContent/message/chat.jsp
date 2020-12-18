<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import ="java.sql.*" %>
<%@ page import = "message.ChattingDAO" %>
<%@ page import = "message.Chatting" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<style type="text/css">
input#chat {
 width: 410px
}
#console-container {
 width: 400px;
}
#console {
 border: 1px solid #CCCCCC;
 border-right-color: #999999;
 border-bottom-color: #999999;
 height: 170px;
 overflow-y: scroll;
 padding: 5px;
 width: 100%;
}
#console p {
 padding: 0;
 margin: 0;
}
</style>
</head>
<body>
	<%
	  HttpSession sessionsa = request.getSession(false);
	  String loginId = (String) sessionsa.getAttribute("sessionId");
	  String room_id = (String) sessionsa.getAttribute("room_id");
	  if(loginId==null){
	      out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"/WHOEVER/login/login.jsp\"; </script>");}
	  
	  ChattingDAO chattingDAO = new ChattingDAO();
	  ArrayList<String>log = chattingDAO.getPrivious(room_id,loginId);
	  %>
<div>
 <p><input type="text" placeholder="type and press enter to chat" id="chat" /></p>
 <div id="console-container">
  <div id="console"></div>
 </div>
</div>

<script type="text/javascript">
var Chat = {};
Chat.socket = null;
Chat.connect = (function(host) {
 
 if( "WebSocket" in window) {
  Chat.socket = new WebSocket(host);
 } else if( "MozWebSocket" in window ){
  Chat.socket = new MozWebSocket(host);
 } else {
  Console.log("Error : 지원하지 않는 브라우저 입니다.");
  return;
 }
 
 Chat.socket.onopen = function() {
  document.getElementById("chat").onkeydown = function(event) {
   if( event.keyCode == 13 ) {
    Chat.sendMessage();
   }
  };
 };
 
 Chat.socket.onclose = function() {
  document.getElementById("chat").onkeydown = null;
  Console.log("정보 : 연결 끊어짐..");
 };
 
 Chat.socket.onmessage = function(message) {
  console.log(message);
  Console.log(message.data);
 };
 
});
Chat.initialize = function() {
 if( window.location.protocol == "http:") {
  Chat.connect("ws://localhost:8080/WHOEVER/websocket/chat");
  <%
  		for(int i =0; i<log.size();i++){
  			out.println("Console.log(\""+log.get(i)+"\");");
  		}
	  
	  %>
 } else {
  Chat.connect("wss://http://localhost:8080/WHOEVER/websocket/chat");
 }
};
Chat.sendMessage = (function() {
 var message = document.getElementById("chat").value;
 if( message != "") {
  Chat.socket.send(message);
  document.getElementById("chat").value = '';
 }
});
var Console = {};
Console.log = (function(message) {
 var console = document.getElementById("console");
 var p = document.createElement("P");
 p.style.wordWrap = "break-word";
 p.innerHTML = message;
 
 console.appendChild(p);
 
 while (console.childNodes.length > 25) {
        console.removeChild(console.firstChild);
    }
    console.scrollTop = console.scrollHeight;
});
Chat.initialize();
</script>
</body>
</html>
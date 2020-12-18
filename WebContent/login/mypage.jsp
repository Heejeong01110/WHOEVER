<!doctype html>
<html>
<head>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%@ page import="org.apache.commons.fileupload.*" %>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css " />
<link rel="stylesheet" href="../resources/css/card.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../resources/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.parent {
	width: 90%;
	margin: 5% auto;
}

.mypage_image_container {
	float: left;
	text-align: center;
	margin: 0 10% 0 0;
	width: 30%;
	min-height: 682px;
	background-color: #fff;
	border-radius: 40px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .2);
}

.mypage_msg_container {
	float: left;
	text-align: center;
	margin: 0 auto;
	width: 60%;
	min-height: 682px;
	background-color: #fff;
	border-radius: 40px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .2);
}


.image_view{
}
.info_view{
}
.moveto_passwd{
}
</style>



<%
	request.setCharacterEncoding("UTF-8");
	//세션 받아오기
	String loginId = (String) session.getAttribute("sessionId");
	String loginUserId = (String) session.getAttribute("sessionUserId"); //user 인덱스번호
	
	//로그인 필요한 서비스의 경우
	if(loginId==null ||loginUserId==null){
		out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"login.jsp\"; </script>");
	}
	
	String name=null;
	String email=null;
	String status_msg=null;
	String user_image = "defaultusrimg.jpg";
	//db 읽어오기
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	Statement state = null;

	try {
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
		state = con.createStatement();
		ResultSet rs;
		String sql;

		sql = " SELECT name, email, user_image, status_msg FROM user WHERE id = '" + loginId+"'";
		rs = state.executeQuery(sql);

		while (rs.next()) {
			name = rs.getString("name");
			email = rs.getString("email");
			user_image = rs.getString("user_image");
			status_msg = rs.getString("status_msg");
		}

		rs.close();
		state.close();
		con.close();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (state != null)
				state.close();
		} catch (SQLException ex1) {

		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException ex1) {

		}
	}
%>


<title>WHOEVER MMPAGE</title>
<jsp:include page="../header.jsp" />
</head>

<body style="background: #f3f5f7">
	<div class="parent">
		<div class="mypage_image_container">
			<div class="image_view">
<%
			if("defaultusrimg.jpg".equals(user_image)){
				//기본이미지 출력
%>
				<img src="../resources/images/defaultusrimg.jpg" width="auto" height="100" border="0" margin="10">			
<%
			}else{
				//사용자 설정 이미지 출력
%>
				<img src="../resources/images/<%=user_image %>" width="auto" height="100" border="0" margin="10">
<%				
			}
%>
				<br>
				<!-- 사진 업로드 -->
				<form action="mypage_image.jsp" method="post" enctype="Multipart/form-data">
					<input type = "file" name="filename">
					<input type="submit" value="업로드">
				</form>
				<!-- 사진 초기화-->
				<button type="button" class="remove_img" onClick="location.href='mypage_image.jsp?filedel=no'" >사진 삭제</button>
			</div>
			
			
			
			
			<div class="info_view">
				<p>아이디 : <%out.println(loginId); %></p>
				<p><%out.println("이름 : "+name); %></p>
				<p><%out.println("이메일 : "+email); %></p>
			</div>
			<button type="button" class="moveto_passwd" onClick="location.href='updateinfo.jsp'" >정보 변경</button>
		</div>


		<div class="mypage_msg_container">
			<div class="info_view">
				<h2>기본정보 수정</h2>
				<p>자기소개메시지</p>
				<form action="mypage_process.jsp" method="post">
					<textarea rows="5" cols="30" wrap="hard" name="status_input"><%out.println(status_msg); %></textarea>
					<input type="submit" value="수정">
				</form>
			</div>
		</div>
	</div>



</body>
</html>

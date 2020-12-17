<%@ page contentType = "text/html; charset = utf-8" pageEncoding = "utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%@ page import="user.sEmail" %>
<%
	request.setCharacterEncoding("UTF-8");
	
String loginId = (String) session.getAttribute("sessionId");

if(loginId!=null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'mypage.jsp'");
	script.println("</script>");
}

	String email = request.getParameter("email");
	String identifynum = "a"; 
	identifynum = request.getParameter("identifynum");	
	
	int check=-1;
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

		sql = " SELECT email FROM user ";
		rs = state.executeQuery(sql);

		while (rs.next()) {
			if(rs.getString("email").equals(email)){
				check=1;
			}
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
	
	
	if(check==1){
%>
	<center>
	<b><font color="red"> "<%=email%>" </font>는 이미 사용중인 이메일 입니다.</b><br>
	<b>다른 이메일을 입력해주세요. </b> <br/> <br/>
	<input type="button" value="닫기" onclick="reEmail()">
	</center>
<%
	}
	else if(check ==-1&&identifynum==null){ //사용가능 이메일
%>
	<center>
	<b>입력하신 <font color="red"> "<%=email%>"</font>은 <br/>
	사용하실 수 있는 email 입니다. <br>
	인증코드를 확인해주세요</b>
	<!-- 인증코드 입력창 -->
	
	<form name="identify" method="post" action="send_email.jsp">
	 <br/> <br/>
	<input type="hidden" name="email" value="<%=email%>" readonly/>
	<input type="text" name="identifynum" />
	<input type="submit" value="인증코드 확인"/>
	</form>
	
	</center>
	<%
	}else if("5555".equals(identifynum)){ //인증 성공
%>
			<center>
			<b>인증이 완료되었습니다.</b>
			<input type="button" value="닫기" onclick="setemail()">
			</center>
<%
	}else{//틀린거
		%>
		<center>
			<b>인증을 실패하였습니다.</b>
			<b> <font color="red"> "<%=email%>"</font>를 확인해주세요. <br/>
	<form name="identify" method="post" action="send_email.jsp">
	<b>인증코드를 입력해주세요. </b> <br/> <br/>
	<input type="hidden" name="email" value="<%=email%>" readonly/>
	<input type="text" name="identifynum" />
	<input type="submit" value="인증코드 확인"/>
	</form>
	<input type="button" value="닫기" onclick="reEmail()">
			</center>
			
		<%
	}
%>
<script type="text/javascript">
	function setemail()
	{
		opener.document.signup_info.signup_email.value="<%=email%>";
		//값이 안바뀜
		window.opener.document.getElementById("emailck").text = "이메일 인증이 완료되었습니다.";
		opener.document.getElementById("emailck").style.color="blue";
		opener.document.getElementById("signup_email").readOnly = true;
		window.self.close();
	}
	
	function reEmail(){
		window.self.close();
	}
</script>

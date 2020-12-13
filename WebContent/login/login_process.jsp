<%@ page contentType="text/html; charset = utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("login_id");
	String password = request.getParameter("login_password");
%>
<!-- mysql 아이디, 비밀번호  -->
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC"
	driver="com.mysql.jdbc.Driver" user="whoever" password="Whoever12#" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM USER WHERE id=? and password=?  
	<sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
<%

String user_id= null;
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

	sql = " SELECT user_id FROM user WHERE id = '" + id+"'";
	rs = state.executeQuery(sql);

	while (rs.next()) {
		user_id = rs.getString("user_id");
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

session.setAttribute("sessionId", id); //아이디
session.setAttribute("sessionUserId", user_id);//인덱스번호

%>
	
	<c:redirect url="../main.jsp?msg=2" />
</c:forEach>

<c:redirect url="login.jsp?error=1" />
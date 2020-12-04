<%@ page contentType = "text/html; charset = utf-8" pageEncoding = "utf-8" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("login_id");
	String password = request.getParameter("login_password");
%>
<!-- mysql 아이디, 비밀번호  -->
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/whoever"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM USER WHERE USER_ID=? and password=?  
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="../main.jsp?msg=2" />
</c:forEach>

<c:redirect url="login.jsp?error=1" />
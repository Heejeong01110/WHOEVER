<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%> 
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 
<%
	request.setCharacterEncoding("UTF-8");

	String signup_id = request.getParameter("signup_id");
	String signup_password = request.getParameter("signup_password");
	String signup_name = request.getParameter("signup_name");
	String signup_email = request.getParameter("signup_email");
    
%>  

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/whoever"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO user (user_id, name, password, email) VALUES (?, ?, ?, ?)
   <sql:param value="<%=signup_id%>" />
	<sql:param value="<%=signup_name%>" />
	<sql:param value="<%=signup_password%>" />
	<sql:param value="<%=signup_email%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="../main.jsp?msg=1" />
</c:if>


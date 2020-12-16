<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%> 
<%@ page import="java.util.*"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 
<%
	request.setCharacterEncoding("UTF-8");
	
	String loginId = (String) session.getAttribute("sessionId");
	String signup_email = request.getParameter("signup_email");	
	String signup_id = request.getParameter("signup_id");
	String signup_password = request.getParameter("signup_password");
	String signup_name = request.getParameter("signup_name");
	
	if(loginId!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'mypage.jsp'");
		script.println("</script>");
	}


    
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://blazingcode.asuscomm.com:6000/whoever"
	driver="com.mysql.jdbc.Driver" user="whoever" password="Whoever12#" />

<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO user (name, id, password, email) VALUES (?, ?, ?, ?)
	<sql:param value="<%=signup_name%>" />
    <sql:param value="<%=signup_id%>" />
    <sql:param value="<%=signup_password%>" />
	<sql:param value="<%=signup_email%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="../main.jsp?msg=1" />
</c:if>

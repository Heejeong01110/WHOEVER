<%@ page contentType = "text/html; charset = utf-8" pageEncoding = "utf-8" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String loginId = (String) session.getAttribute("sessionId");
	String id = request.getParameter("login_id");
	String password = request.getParameter("login_password");
	
	if(loginId!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'mypage.jsp'");
		script.println("</script>");
	}
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
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="../main.jsp?msg=2" />
</c:forEach>

<c:redirect url="login.jsp?error=1" />
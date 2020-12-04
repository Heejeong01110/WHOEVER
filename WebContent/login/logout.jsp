<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	session.invalidate();
%>
<c:redirect url="../main.jsp?msg=3" />

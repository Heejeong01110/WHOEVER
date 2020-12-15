<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//세션 받아오기
	String loginId = (String) session.getAttribute("sessionId");
	//status 정보 받아오기
	String status_input = request.getParameter("status_input");
	//db 읽어오기
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
		String sql;

		sql = " UPDATE user SET status_msg=? WHERE id = '" + loginId+"'";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, status_input);
		int r = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}catch (SQLException e) {
		System.out.println("[SQL Error : " + e.getMessage() + "]");
	} catch (ClassNotFoundException e1) {
		System.out.println("[JDBC Connector Driver 오류 : " + e1.getMessage() + "]");
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	response.sendRedirect("mypage.jsp");
%>
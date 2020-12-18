<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//세션 받아오기
	String loginId = (String) session.getAttribute("sessionId");
	//status 정보 받아오기
	String name = request.getParameter("update_name");
	String oldpw = request.getParameter("update_password_old");
	String newpw = request.getParameter("update_password_new");
	String pw_re = request.getParameter("update_password_re");



	//이 값이 null이면 초기화 버튼 클릭
	if(loginId==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	String checkpw=null;
	//db 읽어오기
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	Statement state = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
		String sql;
		
		//1. 기존 비밀번호 일치하는지 확인
		state = con.createStatement();
		ResultSet rs;
		
		sql = " SELECT password FROM user WHERE id = '" + loginId+"'";
		rs = state.executeQuery(sql);
		while (rs.next()) {
			checkpw=rs.getString("password");
		}
		
		
		if(!checkpw.equals(oldpw)){
			response.sendRedirect("mypage.jsp");
		}else{
			//2. 일치할 경우에만 정보 수정
			if("null".equals(name)){
			//3. name 입력값 있을경우, 이름, 비밀번호 둘다 변경
				sql = " UPDATE user SET name=?, password=? WHERE id = '" + loginId+"'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, newpw);
				int r = pstmt.executeUpdate();
				pstmt.close();
			}else{
			//4. name 입력값 없을경우 비밀번호만 수정
				sql = " UPDATE user SET password=? WHERE id = '" + loginId+"'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, newpw);
				int r = pstmt.executeUpdate();
				pstmt.close();	
			}
		}
		
		rs.close();
		state.close();
		con.close();
		response.sendRedirect("mypage.jsp");
		
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
	
%>
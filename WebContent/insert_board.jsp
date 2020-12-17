<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%

String startNum = null; //값 받아오기
//String endNum = 7; //값 받아오기

startNum = request.getParameter("startNum");
int sNum = Integer.parseInt(startNum);
int eNum = sNum+3;




request.setCharacterEncoding("UTF-8");
//세션 받아오기
String loginId = (String) session.getAttribute("sessionId");
//db 읽어오기
String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
Connection con = null;
Statement state = null;


String bbs_id = null;
String bbs_title = null;
String bbs_userId = null;
String bbs_date = null;
String bbs_content = null;
String bbs_available = null;
String bbs_type = null;

String webData = "["; // json문자열
//[{"id" : "id001", "pw" : "pw001"}, {"id" : "id001", "pw" : "pw001"}]




try {
	Class.forName(JDBC_DRIVER);
	con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
	state = con.createStatement();   
	ArrayList<Bbs> bbslist = new ArrayList<Bbs>();
	ResultSet rs;
	String sql;
	

	//sql = " SELECT bbs_id, bbs_title, user_id, bbs_date, bbs_content, bbs_available, bbs_type FROM bbs WHERE bbs_id BETWEEN " + sNum +" AND "+eNum + " ORDER BY bbs_id DESC";
	sql = "SELECT bbs_id, bbs_title, user_id, bbs_date, bbs_content, bbs_available, bbs_type FROM bbs where bbs_available = 1 ORDER BY bbs_id DESC LIMIT " +  sNum + ",4";
	rs = state.executeQuery(sql);

	while (rs.next()) {
		bbs_id = Integer.toString(rs.getInt("bbs_id"));
		bbs_title = rs.getString("bbs_title");
		bbs_userId = rs.getString("user_id");
		bbs_date = rs.getString("bbs_date");
		bbs_content = rs.getString("bbs_content");
		bbs_available = Integer.toString(rs.getInt("bbs_available"));
		bbs_type = rs.getString("bbs_type");
		
		webData += "{ \"bbs_id\" : \""+bbs_id+"\",";
		webData += "\"bbs_title\" :\""+bbs_title+"\",";
		webData += "\"bbs_userId\" :\""+bbs_userId+"\",";
		webData += "\"bbs_date\" :\""+bbs_date+"\",";
		webData += "\"bbs_content\" :\""+bbs_content+"\",";
		webData += "\"bbs_available\" :\""+bbs_available+"\",";
		webData += "\"bbs_type\" :\""+bbs_type+"\"}";
		
		if(!rs.isLast()) {
	        webData += ",";
	    }
	}
	webData+="]";
	//System.out.println(webData);
	out.print(webData);
	
	//response.setContentType("charset=utf-8");
    //response.getWriter().write(webData);

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
package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/";
			String dbID = "root";
			String dbPassword = "lp950528";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			System.out.println("DB connect");
		}catch(Exception e) {
			System.out.println("DB not connect");
			e.printStackTrace();	
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
	
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -1;
	}
	
	public int write(String bbsTitle, String userID, String bbsContent/*, String[] bbsType*/) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			//pstmt.setString(7, bbsType.toString());
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -1;
	}
}
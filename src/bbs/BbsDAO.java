package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	PreparedStatement pstmt = null;
	
	public BbsDAO() {
		try {
			
			String dbURL = "jdbc:mysql://blazingcode.asuscomm.com:6000/whoever";
			String dbID = "whoever";
			String dbPassword = "Whoever12#";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			System.out.println("DB connect");
		}catch(Exception e) {
			System.out.println("DB not connect");
			e.printStackTrace();	
		}
	}
	
	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Bbs> allElement() {
		String SQL = "SELECT * FROM bbs";
		ArrayList<Bbs> bbslist = new ArrayList<Bbs>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bbs bbsvo = new Bbs();
				bbsvo.setBbsID(rs.getInt("bbs_id"));
				bbsvo.setBbsTitle(rs.getString("bbs_title"));
				bbsvo.setBbsDate(rs.getString("bbs_date"));
				bbsvo.setBbsContent(rs.getString("bbs_content"));
				bbsvo.setBbsAvailable(rs.getInt("bbs_available"));
				bbsvo.setBbsType(rs.getString("bbs_type"));
				bbslist.add(0, bbsvo);
			}
		} catch(Exception e){
			System.out.println("allElement Exception" + e.getMessage());
			e.printStackTrace();
		}
		
		return bbslist;
	}
	
	public ArrayList<Bbs> getAll(String sStr) {
		String[] SQL = new String[4];
		SQL[0] = "SELECT * FROM bbs WHERE bbs_title LIKE '%"+ sStr +"%'";
		SQL[1] = "SELECT * FROM bbs WHERE bbs_date LIKE '%"+ sStr +"%'";
		SQL[2] = "SELECT * FROM bbs WHERE bbs_content LIKE '%"+ sStr +"%'";
		SQL[3] = "SELECT * FROM bbs WHERE bbs_type LIKE '%"+ sStr +"%'";
		
		ArrayList<Bbs> bbslist = new ArrayList<Bbs>();
		try {
			for(String s:SQL) {
				pstmt = conn.prepareStatement(s);
				//pstmt.setString(1, title);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Bbs bbsvo = new Bbs();
					bbsvo.setBbsID(rs.getInt("bbs_id"));
					bbsvo.setBbsTitle(rs.getString("bbs_title"));
					bbsvo.setBbsDate(rs.getString("bbs_date"));
					bbsvo.setBbsContent(rs.getString("bbs_content"));
					bbsvo.setBbsAvailable(rs.getInt("bbs_available"));
					bbsvo.setBbsType(rs.getString("bbs_type"));
					if(!bbslist.contains(bbsvo.getBbsID()))
						bbslist.add(0, bbsvo);
				}
				rs.close();
			}
		} catch(Exception e){
			System.out.println("getDatabytitle Exception" + e.getMessage());
			e.printStackTrace();
		}
		
		return bbslist;
	}
	
	public ArrayList<Bbs> getDatabytitle(String title) {
		String SQL = "SELECT * FROM bbs WHERE bbs_title LIKE '%"+ title +"%'";
		ArrayList<Bbs> bbslist = new ArrayList<Bbs>();
		try {
			pstmt = conn.prepareStatement(SQL);
			//pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bbs bbsvo = new Bbs();
				bbsvo.setBbsID(rs.getInt("bbs_id"));
				bbsvo.setBbsTitle(rs.getString("bbs_title"));
				bbsvo.setBbsDate(rs.getString("bbs_date"));
				bbsvo.setBbsContent(rs.getString("bbs_content"));
				bbsvo.setBbsAvailable(rs.getInt("bbs_available"));
				bbsvo.setBbsType(rs.getString("bbs_type"));
				bbslist.add(0, bbsvo);
			}
			rs.close();
		} catch(Exception e){
			System.out.println("getDatabytitle Exception" + e.getMessage());
			e.printStackTrace();
		}
		
		return bbslist;
	}
	
	public ArrayList<Bbs> getDatabytype(String type) {
		String SQL = "SELECT * FROM bbs WHERE bbs_type LIKE '%"+ type +"%'";
		ArrayList<Bbs> bbslist = new ArrayList<Bbs>();
		try {
			pstmt = conn.prepareStatement(SQL);
			//pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bbs bbsvo = new Bbs();
				bbsvo.setBbsID(rs.getInt("bbs_id"));
				bbsvo.setBbsTitle(rs.getString("bbs_title"));
				bbsvo.setBbsDate(rs.getString("bbs_date"));
				bbsvo.setBbsContent(rs.getString("bbs_content"));
				bbsvo.setBbsAvailable(rs.getInt("bbs_available"));
				bbsvo.setBbsType(rs.getString("bbs_type"));
				bbslist.add(0, bbsvo);
			}
			rs.close();
		} catch(Exception e){
			System.out.println("getDatabytitle Exception" + e.getMessage());
			e.printStackTrace();
		}
		
		return bbslist;
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			pstmt = conn.prepareStatement(SQL);
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
			pstmt = conn.prepareStatement(SQL);
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
			pstmt = conn.prepareStatement(SQL);
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
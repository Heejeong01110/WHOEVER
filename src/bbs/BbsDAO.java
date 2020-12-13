package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.ArrayList;
import tag.Tag;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?useSSL=false";
			String dbID = "whoever";
			String dbPassword = "Whoever12#";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}	public String getDate() {
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
		String SQL = "SELECT bbs_id FROM BBS ORDER BY bbs_id DESC";
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
	
	public int write(String bbs_title, String user_id, String bbs_content, String bbs_type) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbs_title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbs_content);
			pstmt.setInt(6, 1);
			pstmt.setString(7, bbs_type);
			//pstmt.setInt(8, getNext());
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -1;
	}
	
	
	
	public ArrayList<Bbs> getList(){
		String SQL = "SELECT * FROM BBS WHERE bbs_available = 1 ORDER BY bbs_id DESC";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//pstmt.setInt(1, getNext() - );
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbs_id(rs.getInt(1));
				bbs.setBbs_title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBbs_date(rs.getString(4));
				bbs.setBbs_content(rs.getString(5));
				bbs.setBbs_available(rs.getInt(6));
				bbs.setBbs_type(rs.getString(7));
				//bbs.setCategory_type(rs.getInt(8));
				list.add(bbs);
			//pstmt.setString(7, bbsType.toString());
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	

	public Bbs getBbs(int bbs_id) {			// 글을 클릭해서 보기
		String SQL = "SELECT * FROM BBS WHERE bbs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbs_id(rs.getInt(1));
				bbs.setBbs_title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBbs_date(rs.getString(4));
				bbs.setBbs_content(rs.getString(5));
				bbs.setBbs_available(rs.getInt(6));
				bbs.setBbs_type(rs.getString(7));
				//pstmt.setString(7, bbs_type.toString());
				return bbs;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	}
	
	public int update(int bbs_id, String bbs_title, String bbs_content, String bbs_type) {
		String SQL = "UPDATE BBS SET bbs_title = ?, bbs_content = ?, bbs_type = ? WHERE bbs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbs_title);
			pstmt.setString(2, bbs_content);
			pstmt.setString(3, bbs_type);
			pstmt.setInt(4, bbs_id);
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -1;
	}
	
	public int delete(int bbs_id){
		String SQL = "UPDATE BBS SET bbs_available = 0 where bbs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs_id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

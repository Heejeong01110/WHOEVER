package category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import category.Category;

public class CategoryDAO {

	private Connection conn;
	private ResultSet rs;
	
	public CategoryDAO() {
		try {
			String dbURL = "jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?useSSL=false";
			String dbID = "whoever";
			String dbPassword = "Whoever12#";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	/*
	public int getNext() {
		String SQL = "SELECT category_type FROM category ORDER BY category_type DESC";
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
	
	public int Hashtag(String[] tagArray) {
		String SQL = "INSERT INTO CATEGORY VALUES (?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			for(int i = 0; i<tagArray.length; i++) {
			//pstmt.setString(2, tagArray[i]);
			pstmt.setInt(2, i+1);
			}
			//pstmt.setInt(8, getNext());
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -1;
	}
	
	/*public ArrayList<Category> getHash() {
		String SQL = "SELECT category_name FROM CATEGORY";
		ArrayList<Category> list = new ArrayList<Category>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//pstmt.setInt(1, getNext() - );
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setCategory_type(rs.getInt(1));
				//category.setCategory_name(rs.getString(2));
				category.setTag_id(rs.getInt(2));
				list.add(category);
				} 
			}catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	}
	*/
}

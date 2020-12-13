package user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;


public class UserDAO {
	private static UserDAO instance;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "park";
			String dbPassword = "lp950528";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	
//	public void allElement() {
//		String SQL = "SELECT * FROM BBS";
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, userID);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				if(rs.getString(1).equals(userPassword))
//					return 1; // �α��� ����
//				else
//					return 0; // �α��� ����(��й�ȣ ����ġ)
//			}
//			return -1; // ���̵� �������� ����
//		} catch(Exception e){
//			e.printStackTrace();
//		}
//	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // �α��� ����
				else
					return 0; // �α��� ����(��й�ȣ ����ġ)
			}
			return -1; // ���̵� �������� ����
		} catch(Exception e){
			e.printStackTrace();
		}
	
		return -2; //DB ����
	}
}
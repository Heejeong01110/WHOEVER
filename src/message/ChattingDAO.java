package message;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import message.Chatting;

public class ChattingDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ChattingDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?useSSL=false";
			String dbID = "whoever";
			String dbPassword = "Whoever12#";
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	public ArrayList<Chatting> getMyRoomList(String id) {
		String SQL = "SELECT * FROM chatting_room_member WHERE user_id ='"+id+"';";
		ArrayList<Chatting> list = new ArrayList<Chatting>(1);
		ArrayList<String> room_id_list = new ArrayList<String>(1);

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("user_id").equals(id))
					room_id_list.add(rs.getString("room_id"));
			}
			for(String i : room_id_list) {
				Chatting chatting = new Chatting();
				chatting.setRoom_id(Integer.parseInt(i));
				SQL = "SELECT title FROM chatting_room WHERE id ='"+i+"';";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {}
				chatting.setRoom_title(rs.getString("title"));
				
				SQL = "SELECT * FROM chatting_list WHERE chatting_room_id ='"+i+"' ORDER BY created_time DESC limit 1;";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {}
				chatting.setContent_content(rs.getString("content"));
				chatting.setContent_created_time(rs.getString("created_time"));
				
				SQL = "SELECT user_image FROM user WHERE id ='"+id+"';";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {}
				chatting.setUser_image(rs.getString("user_image"));
				list.add(chatting);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}

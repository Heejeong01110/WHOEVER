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
	public ArrayList<Chatting> getMyRoomList(String user_id) {
		String SQL = "SELECT * FROM chatting_room_member WHERE user_id ='"+user_id+"';";
		ArrayList<Chatting> list = new ArrayList<Chatting>(1);
		ArrayList<String> room_id_list = new ArrayList<String>(1);

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("user_id").equals(user_id))
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
				
				SQL = "SELECT * FROM chatting_list WHERE room_id ='"+i+"' ORDER BY created_time DESC limit 1;";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
				chatting.setContent_content(rs.getString("content"));
				chatting.setContent_created_time(rs.getString("created_time"));
				}
				
				SQL = "SELECT user_image FROM user WHERE id ='"+user_id+"';";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
				chatting.setUser_image(rs.getString("user_image"));
				list.add(chatting);
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public boolean getRoomExist(String room_id,String user_id) {
	    String SQL = "SELECT id from chatting_room WHERE id = '"+room_id+"';";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if(rs.next()) 
	            return true;
	         else 
	        	return false;
	      } catch(Exception e){
	         e.printStackTrace();
	      }
	   
	      return false;
	}
	public boolean getRoomLimt(String room_id,String user_id){
	    String SQL = "SELECT limit from chatting_room WHERE id = '"+room_id+"';";
	    int limit=0;
	    int number=0;
	    
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 limit=rs.getInt("limit");
	         }
	         else {
	        	return false;
	         }
	         SQL = "SELECT COUNT(*) from chatting_room_member WHERE room_id = '"+room_id+"';";
	         pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if(rs.next()) 
	        	 number=rs.getInt("COUNT(*)");
	         else
	        	 return false;
        	 System.out.println("limit:"+limit);
        	 System.out.println("number:"+number);
        	 if(limit-number<1)
        		 return false;
        	 else
        		 return true;
	      } catch(Exception e){
	         e.printStackTrace();
	      }
	   
	      return false;
	}
	public boolean checkMember(String room_id,String user_id) {
		 String SQL = "SELECT * from chatting_room_member WHERE room_id = '"+room_id+"'AND user_id='"+user_id+"';";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if(rs.next()) 
	            return true;
	         else 
	        	return false;
	      } catch(Exception e){
	         e.printStackTrace();
	      }
	   
	      return false;
	}
	public void setChattingMember(String room_id,String user_id) {
		 String SQL = "UPDATE chatting_room SET limit = limit+1 WHERE id='"+room_id+"';";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.executeUpdate();
	         
	         SQL = "INSERT INTO chatting_room_member (`room_id`, `user_id`) VALUES ('"+room_id+"', '"+user_id+"');";
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.executeUpdate();

	      } catch(Exception e){
	         e.printStackTrace();
	      }
	      return;
	}
	public void logChatting(String room_id,String user_id,String msg) {
		 String SQL = "INSERT INTO chatting_list (`room_id`, `user_id`, `content`) VALUES ('"+ room_id+"','"+ user_id+"','"+ msg+"');";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.executeUpdate();
	      } catch(Exception e){
	         e.printStackTrace();
	      }
	      return;
	}
	public ArrayList<String> getPrivious(String room_id,String user_id){
		String SQL = "SELECT content FROM chatting_list where room_id = '"+room_id+"' ORDER BY  created_time ASC ;";
		ArrayList<String> list = new ArrayList<String>(1);

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("content"));
			}
			return list;
			
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public void createChatting(String user_id,String board_num) {
		
	}
	public void deleteChatting(String room_id) {
		
	}
}

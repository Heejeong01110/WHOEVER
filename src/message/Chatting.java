package message;

public class Chatting {
	
	private int room_id;
	private String room_title;
	private int room_limit;
	
	private int member_id;
	private int member_room_id_;
	private String member_user_id;
	
	private int content_id;
	private int content_room_id;
	private String content_created_time;
	private String content_user_id;
	private String content_content;
	
	private String user_image;
	
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public String getContent_content() {
		return content_content;
	}
	public void setContent_content(String content_content) {
		this.content_content = content_content;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public int getRoom_limit() {
		return room_limit;
	}
	public void setRoom_limit(int room_limit) {
		this.room_limit = room_limit;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMember_room_id_() {
		return member_room_id_;
	}
	public void setMember_room_id_(int member_room_id_) {
		this.member_room_id_ = member_room_id_;
	}
	public String getMember_user_id() {
		return member_user_id;
	}
	public void setMember_user_id(String member_user_id) {
		this.member_user_id = member_user_id;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public int getContent_room_id() {
		return content_room_id;
	}
	public void setContent_room_id(int content_room_id) {
		this.content_room_id = content_room_id;
	}
	public String getContent_created_time() {
		return content_created_time;
	}
	public void setContent_created_time(String content_created_time) {
		this.content_created_time = content_created_time;
	}
	public String getContent_user_id() {
		return content_user_id;
	}
	public void setContent_user_id(String content_user_id) {
		this.content_user_id = content_user_id;
	}
	
}

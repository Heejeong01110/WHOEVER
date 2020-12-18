package message;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import message.ChattingDAO;

@ServerEndpoint(value = "/websocket/chat")
public class Chat {

 private static final Map<String, Session> room_member =new HashMap<String, Session>();
 private String room_id;
 private String user_id;
 private Session session;
 private Map<String, List<String>> params;
 private static final ChattingDAO chatDao=new ChattingDAO();;


 public Chat() {
  String threadName = "Thread-Name:" + Thread.currentThread().getName();
 }

 @OnOpen
 public void start(Session session) {
	 params = session.getRequestParameterMap();
    this.room_id = params.get("sessionId").get(0);
    this.user_id =params.get("sessionId").get(1);
    this.session=session;
    
    if(!room_member.containsKey(room_id+"#"+user_id))
    	room_member.put(room_id+"#"+user_id, session);
 }

 @OnClose
 public void close(Session session) {
    room_member.remove(this.room_id+"#"+this.user_id);
 }

 @OnMessage
 public void message(String message) {
  String threadName = "Thread-name : " + Thread.currentThread().getName();
  if (null == message && "".equals(message))
      return ;
  String filteredMessage = String.format("%s: %s", this.user_id, message);
  multiCast(filteredMessage);
 }

 @OnError
 public void onError(Throwable t) throws Throwable {
  System.err.println("에러(" + this.user_id + "):Chat Error: " + t.toString());
     room_member.remove(this.room_id+"#"+this.user_id);

 }

 
 private void multiCast(String msg) {
	   Set<String> keys =room_member.keySet();
	   Iterator<String> it = keys.iterator();
	   System.out.println(room_member.size());
	   while (it.hasNext()) {
		   String key = it.next();
		  if(key.split("#")[0].equals(this.room_id)) {
			   Session s = room_member.get(key);
			   try 
			   {
				   s.getBasicRemote().sendText(msg);
				   chatDao.logChatting(room_id, user_id, msg);
			   }catch (IOException e) {
				    room_member.remove(key); 
			    try {
			     s.close();
			    } catch (IOException e1) {
			     e1.printStackTrace();
			    }
			  }
		   }
	   }
	 
}
/*
 private void sendToOne(String msg, Session ses) {

  try {
   ses.getBasicRemote().sendText(msg);
  } catch (IOException e) {
   e.printStackTrace();
  }
 }

  private void broadCast(String msg) {
  
  Set<String> keys = sessionMap.keySet();
  Iterator<String> it = keys.iterator();

  while (it.hasNext()) {
   String key = it.next();
   Session s = sessionMap.get(key);

   try {
    s.getBasicRemote().sendText(msg);
    
   } catch (IOException e) {

    sessionMap.remove(key);

    try {
     s.close();
    } catch (IOException e1) {
     e1.printStackTrace();
    }

    String message = String.format("* %s %s", key, "has been disconnected.");
    broadCast(message);
   }

  }
 }
*/
}

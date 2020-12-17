package message;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/websocket/chat",configurator = HttpSessionConfigurator.class)
public class Chat {
 private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());
 private static final String GUEST_PREFIX = "Guest";
 private static final AtomicInteger connectionIds = new AtomicInteger(0);
 private static final Map<String, Session> sessionMap = new HashMap<String, Session>();
 private final String nickname;
 private Session session;

 public Chat() {
  String threadName = "Thread-Name:" + Thread.currentThread().getName();
  nickname = GUEST_PREFIX + connectionIds.getAndIncrement();
 }

 @OnOpen
 public void start(Session session,EndpointConfig config) {
  if (!configs.containsKey(session)) {
	configs.put(session, config);
  }
  String message = String.format("* %s %s", nickname, "접속");
  broadcast(message);
 }

 @OnClose
 public void close(Session session) {
  sessionMap.remove(nickname);
  String message = String.format("* %s %s", nickname, "접속종료");
  if (configs.containsKey(session)) {
	  configs.remove(session);
	  }
  broadcast(message);
 }

 @OnMessage
 public void message(String message) {
  String threadName = "Thread-name : " + Thread.currentThread().getName();
  if (null == message && "".equals(message))
   return;

  String filteredMessage = String.format("%s: %s", nickname, message);
  broadcast(filteredMessage);
 }

 @OnError
 public void onError(Throwable t) throws Throwable {
  System.err.println("에러(" + nickname + "):Chat Error: " + t.toString());
  sessionMap.remove(this.nickname);
 }

 private void broadcast(String msg) {
  
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
    broadcast(message);
   }

  }

 }

 private void sendToOne(String msg, Session ses) {

  try {
   ses.getBasicRemote().sendText(msg);
  } catch (IOException e) {
   e.printStackTrace();
  }
 }

}

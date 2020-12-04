

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ServerEndpoint(value = "/websocket/chat")
// 클라이언트가 접속할 때 사용될 URI
public class Chat {

 private static final Logger logger = LoggerFactory.getLogger(Chat.class);

 private static final String GUEST_PREFIX = "Guest";

 private static final AtomicInteger connectionIds = new AtomicInteger(0);

 private static final Map<String, Session> sessionMap = new HashMap<String, Session>();

 private final String nickname;

 // 클라이언트가 새로 접속할 때마다 한개의 Session 객체가 생성된다.
 // Session 객체를 컬렉션에 보관하여 두고 해당 클라이언트에게 데이터를 전송할 때마다 사용한다
 private Session session;

 public Chat() {

  // 클라이언트가 접속할 때마다 서버측에서는 Thread 가 새로 생성되는 것을 확인할 수 있다
  String threadName = "Thread-Name:" + Thread.currentThread().getName();

  // getAndIncrement()은 카운트를 1 증가하고 증가되기 전의 숫자를 리턴한다
  nickname = GUEST_PREFIX + connectionIds.getAndIncrement();
  logger.info("생성자:" + threadName + ", " + nickname);
 }

 @OnOpen
 public void start(Session session) {
  logger.info("클라이언트 접속 : " + session);
  this.session = session;
  sessionMap.put(nickname, session);

  String message = String.format("* %s %s", nickname, " 접속");
  broadcast(message);
 }

 @OnClose
 public void close() {
  sessionMap.remove(nickname);
  String message = String.format("* %s %s", nickname, " 종료");
  broadcast(message);
 }

 @OnMessage
 public void message(String message) {
  String threadName = "Thread-name : " + Thread.currentThread().getName();
  logger.info("메시지 도착 : " + threadName + ", " + nickname);
  
  logger.info("메시지  : " + message );
  if (null == message && "".equals(message))
   return;

  String filteredMessage = String.format("%s: %s", nickname, message);
  // Guest0의 메시지는 특정 클라이언트(Guest2)에게만 전달하는 경우
  //  if (this.nickname.equals("Guest0")) {
  //   sendToOne(filteredMessage, sessionMap.get("Guest2"));
  //  } else // 현재 접속된 모든 클라이언트에게 메시지를 전달하는 경우
  //  {
  //   broadcast(filteredMessage);
  //  }
  broadcast(filteredMessage);
 }

 @OnError
 public void onError(Throwable t) throws Throwable {
  System.err.println("오류/세션제거(" + nickname + "):Chat Error: " + t.toString());
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

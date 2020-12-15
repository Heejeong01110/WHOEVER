package user;

import java.io.File;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.swing.JOptionPane;




public class sEmail  {
	public sEmail() {
		
	}
	
	public void sendEmail(String email) {
		final String user = "."; //발신할 gmail example@gmail.com
		final String password = "."; //발신할 비밀번호
		
		// Get the session object
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 호스트
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.port", "587"); 
		props.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
	        MimeMessage msg = new MimeMessage(session);
	        String fromName = "WHOEVER";
	        String charSet = "UTF-8";
	         
	        try{
	            // 편지보낸시간 설정
	            msg.setSentDate(new Date());
	              
	            // 송신자 설정
	            InternetAddress from = new InternetAddress() ;
	            from = new InternetAddress(new String(user.getBytes(charSet), "8859_1"));
	            msg.setFrom(from);
	              
	            // 수신자 설정
	            InternetAddress to = new InternetAddress(new String(email.getBytes(charSet), "8859_1"));
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // 제목 설정
	            msg.setSubject("WHOEVER 인증코드 발송", "UTF-8");
	             
	            msg.setText("인증코드 : 5555", "UTF-8");  //일단 인증코드는 5555로 하드코딩
	             
	            // 메일 송신
	            Transport.send(msg);   
	             
	            System.out.println("메일 발송을 완료하였습니다.");
	        }catch (AddressException addr_e) {  //예외처리 주소를 입력하지 않을 경우
	            JOptionPane.showMessageDialog(null, "메일을 입력해주세요", "메일주소입력", JOptionPane.ERROR_MESSAGE);
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) { //메시지에 이상이 있을 경우
	            JOptionPane.showMessageDialog(null, "메일을 제대로 입력해주세요.", "오류발생", JOptionPane.ERROR_MESSAGE);
	            msg_e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		
	}
		


}

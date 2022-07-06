package com.gentle.www.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class MailService {
		
		//dog.gentletest@gmail.com//wpsxmf0706!//rnuzanzewfpicuba
	public void gmailSend() {
        // 메일 전송 선작업
     Properties props = new Properties();
     props.put("mail.smtp.host", "smtp.gmail.com");
     props.put("mail.smtp.port", "587");
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");
     props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
     
     
     props.put("mail.smtp.ssl.protocols", "TLSv1.2");
     

     Session session = Session.getInstance(props, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("dog.gentletest@gmail.com", "rnuzanzewfpicuba");
        }
     });
     
     sendID(session);
	}
	
	
	public void sendID( Session session) {

	      String receiver = "dor@kakao.com"; // 메일 받을 주소
	      String content ="테스트스트테스";
	      String title = "아이디 체크 메일입니다.테스트테스트";
	      Message message = new MimeMessage(session);
	      try {
	         message.setFrom(new InternetAddress("dog.gentletest@gmail.com", "독신사인증", "utf-8"));
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
	         message.setSubject(title);
	         message.setContent(content, "text/html; charset=utf-8");

	         Transport.send(message);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
}
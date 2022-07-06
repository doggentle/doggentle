package com.gentle.www.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class MailService {
	
	public void gmailSend(int cd) {
		// 메일 전송 선작업
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); //보안 프로토콜
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dog.gentletest@gmail.com", "rnuzanzewfpicuba");//dog.gentletest@gmail.com//wpsxmf0706!//rnuzanzewfpicuba
			}
		});
		sendID(session, cd);
	}
		
	public void sendID(Session session, int cd) {
		String receiver = "dor@kakao.com"; // 메일 받을 주소
		String content =	"<head><style>"
							+ ".inB{display:inlineblock;}"
							+ ".f28{fonti-size:28pt;}"
							+ "</style></head>"
							+ "<img src=\"\" alt=\"Some image\" width=\"200\" height=\"100\">"
							+ "<p class=\"inB\" >안녕하세요 (주)독신사 가입을 환영합니다.</p>"
							+ "<p>가입을 완료하기 전 아래의 링크를 클릭하여 인증 절차를 마무리 합니다.</p>"
							+ "인증 링크 : " + cd;
		String title = "독신사 인증메일";
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
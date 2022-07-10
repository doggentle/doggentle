package com.gentle.www.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import com.gentle.www.vo.*;

public class MailService {
	public Session session;
	public void gmailReady() {
		
		// 메일 전송 선작업
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); //보안 프로토콜
		session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dog.gentletest@gmail.com", "rnuzanzewfpicuba");//dog.gentletest@gmail.com//wpsxmf0706!//rnuzanzewfpicuba
			}
		});
		
		
	}
	
	public void certSend(MemberVO mVO, int cd) {
		String content = "<img src=\"https://github.com/doggentle/doggentle/blob/branch/doggentle/src/main/webapp/resources/img/logo.png?raw=true\" alt=\"Some image\" width=\"622\" height=\"115\">" +
				"<p class=\"inB\" >안녕하세요 (주)독신사 가입을 환영합니다.</p>" +
				"<p>가입을 완료하기 전 아래의 링크를 클릭하여 인증 절차를 마무리 합니다.</p>" +
				"인증 링크 : localhost/www/member/joinCert.dog?cmail=" + mVO.getMail() + "&ccode=" + cd;
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dog.gentletest@gmail.com", "독신사인증", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mVO.getMail()));
			message.setSubject("독신사 인증메일");
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void fnidSend(MemberVO mVO) {
		String content = "<img src=\"https://github.com/doggentle/doggentle/blob/branch/doggentle/src/main/webapp/resources/img/logo.png?raw=true\" alt=\"Some image\" width=\"622\" height=\"115\">" +
				"<p class=\"inB\" >안녕하세요 (주)독신사 입니다.</p>" +
				"<p>회원님의 아이디는 [ "+ mVO.getId() +" ] 입니다.</p>";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dog.gentletest@gmail.com", "독신사인증", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mVO.getMail()));
			message.setSubject("회원님의 아이디를 알려드립니다.");
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void fnpwSend(MemberVO mVO) {
		String content = "<img src=\"https://github.com/doggentle/doggentle/blob/branch/doggentle/src/main/webapp/resources/img/logo.png?raw=true\" alt=\"Some image\" width=\"622\" height=\"115\">" +
				"<p class=\"inB\" >안녕하세요 (주)독신사 입니다.</p>" +
				"<p>회원메일 :"+mVO.getMail()+" 회원 아이디 :"+mVO.getId()+"</p>" +
				"<p>회원님의 비밀번호는 [ "+ mVO.getPw() +" ] 입니다.</p>";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dog.gentletest@gmail.com", "독신사인증", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mVO.getMail()));
			message.setSubject("회원님의 비밀번호를 알려드립니다.");
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
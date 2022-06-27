package com.gentle.www.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Mail {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "mailSending.dog")  // mailSending 코드
	public String mailSending(HttpServletRequest request) {

		String setfrom = "";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		//String contents = content + "<img src=\"\">";  //  \"(여기에 그림 경로 넣어주기)\"
		

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			//messageHelper.setText(contents, true); // 그림추가되면 주석 풀

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "main/main.tiles";
	}
}
package com.gentle.www.service;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.stereotype.*;

import com.gentle.www.vo.*;

@Service // service 클래스를 빈등록해주는 어노테이션
@Aspect

public class LoginLogService {
	private static Logger loginLog = LoggerFactory.getLogger("memberLog");

	@Pointcut("execution(* com.gentle.www.controller.Member.loginProc(..))")
	public void recordLogin() {
	}	
	
	@After("recordLogin()")
	public boolean rec(JoinPoint join) {
		MemberVO mVO = (MemberVO) join.getArgs()[0];
		
		if(mVO.getCnt() == 1) {
			loginLog.info(mVO.getId() + " 님 로그인");
		}
		
	return true;
	}
}

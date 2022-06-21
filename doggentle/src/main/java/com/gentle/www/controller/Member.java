package com.gentle.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class Member {
	
	// 로그인 페이지
	@RequestMapping("/login.dog")
	public ModelAndView loginForm(ModelAndView mv) {
		mv.setViewName("member/login");	
		
		return mv;
	}
	
	// 로그인 처리
	@RequestMapping("loginProc.dog")
	public ModelAndView loginProc(ModelAndView mv) {
		mv.setViewName("member/login");
		
		return mv;
	}
}

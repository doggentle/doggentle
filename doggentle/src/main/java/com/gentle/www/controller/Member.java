package com.gentle.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class Member {
	
	@RequestMapping("/login.dog")
	public ModelAndView loginForm(ModelAndView mv) {
		mv.setViewName("member/login");	
		
		return mv;
	}
	
	//@RequestMapping("loginProc.dog")
	//public ModelAndView loginProc(ModelAndView mv) {
		
	//}
}

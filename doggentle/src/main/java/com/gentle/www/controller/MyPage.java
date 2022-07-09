package com.gentle.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/myPage")
public class MyPage {
	
	@RequestMapping("/mypagemain")
	public ModelAndView myPageMain(ModelAndView mv) {
		mv.setViewName("myPage/mypagemain");
		return mv;
	}
	
	@RequestMapping("/myattend")
	public ModelAndView calendar(ModelAndView mv) {
		mv.setViewName("myPage/myattend");
		return mv;
	}
}

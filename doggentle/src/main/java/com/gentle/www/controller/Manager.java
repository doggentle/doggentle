package com.gentle.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class Manager {
	
	@RequestMapping("/main.dog")
	public ModelAndView managerMain(ModelAndView mv) {
		mv.setViewName("manager/main");
		
		return mv;
	}
}

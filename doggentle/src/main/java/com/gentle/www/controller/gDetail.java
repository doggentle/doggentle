package com.gentle.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


	@Controller
	@RequestMapping("/gDetail")
	public class gDetail {
		
		@RequestMapping("/gDetail.dog")
		public ModelAndView managerMain(ModelAndView mv) {
			mv.setViewName("gDetail/gDetail");
			
			return mv;
		}

}
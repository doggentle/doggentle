package com.gentle.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class Attend {
	
	@RequestMapping("")
	public ModelAndView calendar(ModelAndView mv) {
		
		return mv;
	}
}

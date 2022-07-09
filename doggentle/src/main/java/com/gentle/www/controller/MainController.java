package com.gentle.www.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	
	@RequestMapping({"/", "/main.dog"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session) {
	
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/error.dog")
	public String errorPage() {
		return "error";
	}
	
}
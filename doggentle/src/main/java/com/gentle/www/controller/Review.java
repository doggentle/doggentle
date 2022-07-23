package com.gentle.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class Review {
	
	//리뷰 리스트 보기
	@RequestMapping("/reviewList.dog")
	public ModelAndView ReviewList(ModelAndView mv) {
		mv.setViewName("/review/reviewList");	
		
		return mv;
	}
	
	//리뷰 작성 폼보기
	@RequestMapping("/reviewWrite.dog")
	public ModelAndView ReviewWrite(ModelAndView mv) {
		mv.setViewName("/review/reviewWrite");	
		
		return mv;
	}
}

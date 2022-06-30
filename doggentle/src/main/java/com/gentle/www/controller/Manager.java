package com.gentle.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class Manager {
	
	//관리자 메인
	@RequestMapping("/main.dog")
	public ModelAndView managerMain(ModelAndView mv) {
		mv.setViewName("manager/main");
		
		return mv;
	}
	
	@RequestMapping("/market.dog")
	public ModelAndView managerMarket(ModelAndView mv) {
		mv.setViewName("manager/mngmarket");
		
		return mv;
	}
	@RequestMapping("/member.dog")
	public ModelAndView managerMember(ModelAndView mv) {
		mv.setViewName("manager/mngmember");
		
		return mv;
	}
	@RequestMapping("/sales.dog")
	public ModelAndView managerSales(ModelAndView mv) {
		mv.setViewName("manager/mngsales");
		
		return mv;
	}
	@RequestMapping("/stock.dog")
	public ModelAndView managerStock(ModelAndView mv) {
		mv.setViewName("manager/mngstock");
		
		return mv;
	}
	@RequestMapping("/inquiry.dog")
	public ModelAndView managerInquiry(ModelAndView mv) {
		mv.setViewName("manager/mnginquiry");
		
		return mv;
	}
	
}

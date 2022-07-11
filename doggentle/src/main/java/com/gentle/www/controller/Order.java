package com.gentle.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.gentle.www.dao.MemberDao;
import com.gentle.www.service.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/order")
public class Order {
	
	@RequestMapping("/cart.dog")
	public ModelAndView cartForm(ModelAndView mv) {
		mv.setViewName("/order/cart");
		return mv;
	}
	
	@RequestMapping("/payment.dog")
	public ModelAndView payForm(ModelAndView mv) {
		mv.setViewName("/order/payment");
		return mv;
	}
	
}

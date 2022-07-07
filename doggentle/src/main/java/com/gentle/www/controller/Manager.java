package com.gentle.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.ManagerDao;
import com.gentle.www.vo.ManagerVO;
import com.gentle.www.vo.MemberVO;

@Controller
@RequestMapping("/manager")
public class Manager {
	@Autowired
	ManagerDao mgDao;
	
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
	// 매니저 회원 관리 @@@
	@RequestMapping("/member.dog")
	public ModelAndView managerMember(ModelAndView mv) {
		
		List<MemberVO> list = mgDao.getMemberInfo();
		
		mv.addObject("LIST", list);
		
		mv.setViewName("manager/mngmember");
		return mv;
	}
	
	@RequestMapping("/orderList.dog")
	@ResponseBody
	public List<ManagerVO> orderList(ManagerVO mgVO) {
		List<ManagerVO> list = mgDao.getOrderInfo(mgVO.getMno());
		
		return list;
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

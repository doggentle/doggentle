package com.gentle.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.gentle.www.dao.*;
import com.gentle.www.vo.*;

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
		List<ManagerVO> list = mgDao.getLabels();
		
		mv.addObject("LABELS", list);
		
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
		List<ManagerVO> list = mgDao.getLabels();
		
		mv.addObject("LABELS", list);
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
		
		List<ManagerVO> list = mgDao.getQNAList();
		mv.addObject("LIST", list);
				
		return mv;
	}
	
	// 관리자 답변 등록 함수
	@RequestMapping("/addAnswerProc.dog")
	public ModelAndView addAnswerProc(ModelAndView mv, QnAVO qVO) {
				
		qVO.setMno(mgDao.getMngMno(qVO.getId()));
		int cnt = mgDao.addAnswer(qVO);
				
		if(cnt == 0) {
			mv.addObject("MSG", "NO");
		} else {
			mv.addObject("MSG", "OK");
		}
		mv.addObject("VIEW", "/www/manager/inquiry.dog");
		mv.setViewName("manager/redirect");
		return mv;
	}
	
}

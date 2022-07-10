package com.gentle.www.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.gentle.www.dao.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/myPage")
public class MyPage {
	
	@Autowired
	MyPageDao myDao;
	
	@RequestMapping("/mypagemain")
	public ModelAndView myPageMain(ModelAndView mv, HttpSession session) {
		String sid = (String)session.getAttribute("SID");
		if(sid != null) {
			MemberVO mVO = myDao.getMyInfo(sid);
			List<GDetailVO> olist = myDao.getTransacList(sid);
			List<GDetailVO> alist = myDao.getCartList(sid);
			String isshow = mVO.getIsshow();
			if(isshow.equals("cst")) {
				mVO.setIsshow("일반회원");
			} else if(isshow.equals("mng")) {
				mVO.setIsshow("매니저");
			} else if(isshow.equals("ext")) {
				mVO.setIsshow("미인증회원");
			}
			session.setAttribute("MyInfo", mVO);
			session.setAttribute("OLIST", olist);
			session.setAttribute("ALIST", alist);
			mv.setViewName("myPage/mypagemain");
		} else {
			mv.setViewName("main");
		}
		
		return mv;
	}
	
	@RequestMapping("/myattend")
	public ModelAndView calendar(ModelAndView mv) {
		mv.setViewName("myPage/myattend");
		return mv;
	}
	
	
	@RequestMapping("/memberinfopwck")
	public ModelAndView memberInfo(ModelAndView mv) {
		mv.setViewName("myPage/memberinfopwck");
		return mv;
		// 나는 낭만 고양이~~~ 
	}
}

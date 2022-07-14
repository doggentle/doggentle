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
	@Autowired
	MemberDao mDao;
	
	public void getMember(ModelAndView mv, HttpSession session) {
		String sid = (String)session.getAttribute("SID");
		if(sid != null) {
			MemberVO mVO = myDao.getMyInfo(sid);
			String isshow = mVO.getIsshow();
			if(isshow.equals("cst")) {
				mVO.setIsshow("일반회원");
			} else if(isshow.equals("mng")) {
				mVO.setIsshow("매니저");
			} else if(isshow.equals("ext")) {
				mVO.setIsshow("미인증회원");
			}
			session.setAttribute("MyInfo", mVO);
		} else {
			mv.setViewName("main");
		}
	}
	
	@RequestMapping("/mypagemain.dog")
	public ModelAndView myPageMain(ModelAndView mv, HttpSession session) {
			String sid = (String)session.getAttribute("SID");
			getMember(mv, session);
			MemberVO mVO = myDao.getMyInfo(sid);
			List<GDetailVO> olist = myDao.getTransacList(sid);
			List<GDetailVO> alist = myDao.getCartList(sid);
			session.setAttribute("MyInfo", mVO);
			session.setAttribute("OLIST", olist);
			session.setAttribute("ALIST", alist);
			mv.setViewName("myPage/mypagemain");
	
		return mv;
	}
	
	@RequestMapping("/myattend.dog")
	public ModelAndView calendar(ModelAndView mv) {
		mv.setViewName("myPage/myattend");
		return mv;
	}
	
	
	@RequestMapping("/memberinfopwck.dog")
	public ModelAndView memberInfo(ModelAndView mv) {
		mv.setViewName("myPage/memberinfopwck");
		return mv;
	}
	
	@RequestMapping("/memberinfopwckProc.dog")
	@ResponseBody
	public String memberInfopwckProc(MemberVO mVO) {
		String result;
		int cnt = myDao.getMemberCheck(mVO);
		if(cnt == 1) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}
	
	@RequestMapping("/memberinfo.dog")
	public ModelAndView memberInfo(ModelAndView mv, MemberVO mVO, HttpSession session, String result) {
		String sid = (String)session.getAttribute("SID");
		getMember(mv, session);
		if(sid != null) {
			if(result.equals("OK")) {
				// 멤버 정보 담아서
				mVO = myDao.getMember(sid);
				String[] array = mVO.getJdate().split(" ");
				mVO.setJdate(array[0]);
				array = mVO.getBdate().split(" ");
				mVO.setBdate(array[0]);
				session.setAttribute("DATA", mVO);
				mv.setViewName("/myPage/memberinfo");
				return mv;
			}else {
				mv.setViewName("main");
				return mv;
			}
		} else {
			// 세션에 로그인이 안남을 경우
			mv.setViewName("main");
		}
		return mv;
	}
	
	@RequestMapping("/memberinfoProc.dog")
	public ModelAndView memberInfoProc(ModelAndView mv, MemberVO mVO) {
		return mv;
	}
	
	
	
	
	
	//주소록 목록보기요청
	@RequestMapping("/addressList.dog")
	public ModelAndView addrList(ModelAndView mv, HttpSession session) {
		List<AddressVO> adlist = myDao.getMyAddrList((String)session.getAttribute("SID"));
		mv.setViewName("/address/myAddrList");
		mv.addObject("ADLIST", adlist);
		return mv;
	}
}

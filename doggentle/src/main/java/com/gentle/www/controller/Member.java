package com.gentle.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.gentle.www.dao.MemberDao;
import com.gentle.www.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class Member {
	
	@Autowired
	MemberDao mDao;
	
	// 로그인 페이지
	@RequestMapping("/login.dog")
	public ModelAndView loginForm(ModelAndView mv) {
		mv.setViewName("member/login");	
		
		return mv;
	}
	
	// 로그인 처리
	@RequestMapping(path="/loginProc.dog", method=RequestMethod.POST, params={"id", "pw"})
	public ModelAndView loginProc(MemberVO mVO, HttpSession session, ModelAndView mv, RedirectView rv) {
		int cnt = mDao.getLogin(mVO);
		String ck = mDao.ckLogin(mVO.getId());
		
		System.out.println("ck : " + ck);
		
		if(cnt == 1) {
			if(ck.equals("cst")) { // 회원일 경우
				session.setAttribute("SID", mVO.getId());
				
				rv.setUrl("/www/");
			} else { // 관리자일 경우
				session.setAttribute("MID", mVO.getId());
				
				rv.setUrl("/www/manager/main.dog");
			}
		} else { // 로그인 실패
			rv.setUrl("/www/member/login.dog");
		}
		mv.setView(rv);
		
		return mv;
	}
	
	@RequestMapping("/logout.dog")
	public ModelAndView logout(ModelAndView mv, HttpSession session, String vw) {
		session.removeAttribute("SID");
		session.removeAttribute("MID");
		
		if(vw == null) {
			vw = "/www/";
		}
		mv.addObject("VIEW", vw);
		mv.setViewName("member/redirect");
		
		return mv;
	}
	
	@RequestMapping("/join.dog")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("member/join");
		
		return mv;
	}
	
	@RequestMapping("/joinProc.dog")
	public ModelAndView joinProc(MemberVO mVO, ModelAndView mv, RedirectView rv, HttpSession session) {
		int cnt = mDao.addMember(mVO);
		
		if(cnt == 1) {
			// 회원가입 성공한 경우
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/www/");
		} else {
			// 실패
			rv.setUrl("/www/member/join.blp");
		}
		mv.setView(rv);
		
		return mv;
	}
	
	@RequestMapping("/findid.dog")
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("/member/findid");
		return mv;
	}
	@RequestMapping("/findpw.dog")
	public ModelAndView findpw(ModelAndView mv) {
		mv.setViewName("/member/findpw");
		return mv;
	}
	@RequestMapping("/kakaologin.dog")
	public ModelAndView kakaologin(ModelAndView mv) {
		mv.setViewName("member/kakaologin");
		return mv;
	}
}

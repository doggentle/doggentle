package com.gentle.www.controller;

import java.util.List;

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
@RequestMapping("/member")
public class Member {
	
	@Autowired
	MemberDao mDao;
	@Autowired
	MailService mSrvc;
	
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
	public ModelAndView joinProc(MemberVO mVO, CertVO cVO, ModelAndView mv, RedirectView rv, HttpSession session) {
		int cnt = mDao.addMember(mVO);
		
		CodeGenerate cge = new CodeGenerate();
		int cd = cge.codeTwo();
		cVO.setCcode(cd);
		cVO.setCmail(mVO.getMail());
		int cecnt = mDao.addCert(cVO);
		
		if(cnt == 1 && cecnt ==1) {
			// 회원가입 성공한 경우
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/www/");
			
			mSrvc.gmailReady();
			mSrvc.certSend(mVO, cd);
		} else {
			// 실패
			rv.setUrl("/www/member/join.blp");
		}
		mv.setView(rv);
		return mv;
	}
	
	@Transactional
	@RequestMapping(path="/joinCert.dog", method=RequestMethod.GET, params={"cmail", "ccode"})
	public ModelAndView joinCert(ModelAndView mv, CertVO cVO, HttpSession session, RedirectView rv) {
		mv.setViewName("/member/login");// 테스트용 임시
		
		String mail = cVO.getCmail();
		int code = cVO.getCcode();
		cVO = mDao.getJoinCert(mail);
		if( mail.equals(cVO.getCmail()) && code==cVO.getCcode() ) {
			try {   //트랜잭션 처리 완료 할 것, mno처리되고cno처리안되고 예외발생 안됨->서비스클래스로 넘기기가 해법???
				mDao.certMno(cVO.getMno());
				mDao.certCno(cVO.getCno());
				session.setAttribute("SID", cVO.getId());
				mv.setViewName("/main");
				
				mDao.addPoint(cVO.getMno());//신규가입 기녕 100포인트
			}catch(Exception e) {
				e.printStackTrace();
				rv.setUrl("/www/error.dog");
				mv.setView(rv);
			}
		}else {
			//잘못된 접근, 이때 보여줄 뷰를 어떻게 ?
		}
		return mv;
	}
	
	@RequestMapping("/findid.dog")
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("/member/findid");
		return mv;
	}
	@RequestMapping("fnidProc.dog")
	public ModelAndView fnidProc(ModelAndView mv, MemberVO mVO, RedirectView rv) {
		String mail = mVO.getMail();
		mVO = mDao.findidProc(mail);
		mSrvc.gmailReady();
		mSrvc.fnidSend(mVO);
		rv.setUrl("/www/member/login.dog");
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/findpw.dog")
	public ModelAndView findpw(ModelAndView mv) {
		mv.setViewName("/member/findpw");
		return mv;
	}
	@RequestMapping("/fnpwProc.dog")
	public ModelAndView fnpwProc(ModelAndView mv, MemberVO mVO, RedirectView rv) {
		String id = mVO.getId();
		String mail = mVO.getMail();
		
		String pw = mDao.findpwProc(mVO);
		mVO.setPw(pw);
		mSrvc.gmailReady();
		mSrvc.fnpwSend(mVO);
		rv.setUrl("/www/member/login.dog");
		mv.setView(rv);
		return mv;
	}
	
}

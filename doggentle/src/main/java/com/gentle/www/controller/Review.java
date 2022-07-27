package com.gentle.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.*;
import com.gentle.www.service.GoodsService;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/review")
public class Review {   
   @Autowired
   ReviewDao rDao;
   @Autowired
   MyPageDao myDao;

   @Autowired
   GoodsService gSrvc;
	
	//리뷰 리스트 보기
	@RequestMapping("/reviewList.dog")
	public ModelAndView ReviewList(ModelAndView mv, HttpSession session) {
		mv.setViewName("/review/reviewList");	
		String sid = (String) session.getAttribute("SID");
		List<ReviewVO> list = rDao.getReviewList(sid);
		
		mv.addObject("LIST", list); 
		
		return mv;
	}
	
	//리뷰 작성 폼보기
	  @RequestMapping("/reviewWrite.dog")
	   public ModelAndView ReviewWrite(ModelAndView mv, HttpSession session, int tno) {
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
	            mv.setViewName("member/login");
	         }
	      mv.setViewName("/review/reviewWrite");
	     	      
	      String gname = rDao.getReviewGname(tno);
	      mv.addObject("GNAME", gname);
	      mv.addObject("TNO", tno);
	      
	      return mv;
	   }

	
	@RequestMapping("reviewWriteProc.dog")
	public ModelAndView ReViewWriteProc(ModelAndView mv, HttpSession session, String tno, ReviewVO rVO) {
		String sid = (String) session.getAttribute("SID");

	    int stno = Integer.valueOf(tno);
	    rVO.setTno(stno);
	    
		mv.setViewName("review/redirect");
		
		if(sid == null) {
			mv.addObject("VIEW", "/www/member/login.dob");
			return mv;
		}
		try {
			gSrvc.addReview(rVO);
			mv.addObject("VIEW", "/www/review/reviewList.dog");
		} catch(Exception e) {
			mv.addObject("VIEW", "/www/review/reviewWrite.dog");
			e.printStackTrace();
		}
		
		
		
		return mv;
	}
}

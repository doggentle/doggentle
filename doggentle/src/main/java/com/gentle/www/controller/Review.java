package com.gentle.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.ReviewDao;
import com.gentle.www.service.GoodsService;
import com.gentle.www.vo.ImageVO;
import com.gentle.www.vo.ManagerVO;
import com.gentle.www.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class Review {   
   @Autowired
   ReviewDao rDao;
   
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
	public ModelAndView ReviewWrite(ModelAndView mv, int tno) {
		mv.setViewName("/review/reviewWrite");
		
		String gname = rDao.getReviewGname(tno);
		mv.addObject("GNAME", gname);
		mv.addObject("TNO", tno);
		
		return mv;
	}
	
	@RequestMapping("reviewWriteProc.dog")
	public ModelAndView ReViewWriteProc(ModelAndView mv, HttpSession session, ReviewVO rVO) {
		String sid = (String) session.getAttribute("SID");
		
		mv.setViewName("review/redirect");
		System.out.println(rVO);
		
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

package com.gentle.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.GDetailDao;
import com.gentle.www.dao.ReviewDao;
import com.gentle.www.service.GoodsService;
import com.gentle.www.vo.GDetailVO;
import com.gentle.www.vo.ReviewVO;


	@Controller
	@RequestMapping("/gDetail")
	public class GDetail {
		
		@Autowired
		GDetailDao gDao;
		
		@Autowired
		ReviewDao rDao;
		
		@Autowired
		GoodsService gSrvc;

		
		@RequestMapping("/gDetail.dog")
		public ModelAndView GoodsDetail(ModelAndView mv, GDetailVO gVO, int gno) {
			System.out.println("gno : " + gno);
			
			gVO = gDao.gDetInfo(gVO.getGno());
			System.out.println(gVO);
			
			List<ReviewVO> rlist = gDao.goodsReview(gno);
			List<GDetailVO> list = gDao.getIntProductList(gno);
			mv.addObject("RLIST", rlist);
			mv.addObject("LIST", list);
			mv.addObject("DATA", gVO);
			
		
			mv.setViewName("gDetail/gDetail");
			
			return mv;
		}


}
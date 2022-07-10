package com.gentle.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.GDetailDao;
import com.gentle.www.vo.GDetailVO;


	@Controller
	@RequestMapping("/gDetail")
	public class GDetail {
		
		@Autowired
		GDetailDao gDao;

		
		@RequestMapping("/gDetail.dog")
		public ModelAndView GoodsDetail(ModelAndView mv, GDetailVO gVO) {
			GDetailVO gno = gDao.gDetInfo(gVO.getGno());
			mv.addObject("DATA", gVO);
			mv.setViewName("gDetail/gDetail");
			
			return mv;
		}

}
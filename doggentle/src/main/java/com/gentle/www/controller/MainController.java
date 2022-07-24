package com.gentle.www.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.*;
import com.gentle.www.vo.*;


@Controller
public class MainController {
	@Autowired
	GDetailDao gDao;
	
	@Autowired
	MainDao mainDao;
	
	@RequestMapping({"/", "/main.dog"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session) {
		List<GDetailVO> list = gDao.getStratCate();
		
		//데이터 심고
		session.setAttribute("LIST", list);
		
		List<ManagerVO> newItems = mainDao.getMainNew();
		List<ManagerVO> hitItems = mainDao.getMainHit();
		mv.addObject("NEW", newItems);
		mv.addObject("HIT", hitItems);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/error.dog")
	public String errorPage() {
		return "error";
	}
	
	@RequestMapping("/cateList.dog")
	@ResponseBody
	public List<GDetailVO> cateList(GDetailVO gVO){
		List<GDetailVO> list = gDao.getCateList(gVO);
		return list;
	}
	
	// 상품 리스트 요청 전담 처리함수
	@RequestMapping("/productList.dog")
	@ResponseBody
	public List<GDetailVO> productList(GDetailVO gVO){
		List<GDetailVO> list = gDao.getProductList(gVO);
		return list;
	}
	// 상품 리스트 요청 전담 처리함수
	@RequestMapping("/srcList.dog")
	@ResponseBody
	public List<GDetailVO> srcGoods(GDetailVO gVO){
		List<GDetailVO> list = gDao.srcGoods(gVO);
		return list;
	}
	
	//키워드 검색 전담 처리함수
}
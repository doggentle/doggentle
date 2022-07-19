package com.gentle.www.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gentle.www.dao.QnaDao;
import com.gentle.www.util.PageUtil;
import com.gentle.www.vo.QnAVO;


@Controller
	@RequestMapping("/qna")		
		public class QnaWrite {
		
	@Autowired
	QnaDao qDao;
	
		@RequestMapping("/qnaWrite.dog")
		public ModelAndView QnaView(ModelAndView mv, QnAVO qVO, HttpSession session) {
			String id = (String) session.getAttribute("SID");
			List<QnAVO> list = qDao.getOrderList(id);
			mv.addObject("LIST", list);
			mv.setViewName("qna/qnaWrite");
			
			return mv;
		}
		@RequestMapping("/getOrderGoodsList.dog")
		@ResponseBody
		public List<QnAVO> getOrderGoodsList(QnAVO qVO){
			List<QnAVO> list = qDao.getOrderGoodsList(qVO.getTno());
			return list;
		}
		/*
		 * //문의글 등록
		 * 
		 * @RequestMapping("/qnaWrite.dog") public ModelAndView qnaWrite(ModelAndView
		 * mv, QnAVO qVO) {
		 * 
		 * return mv; }
		 */

	}

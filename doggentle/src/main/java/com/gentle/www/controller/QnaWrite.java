package com.gentle.www.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		public ModelAndView QnaView(ModelAndView mv) {
			mv.setViewName("qna/qnaWrite");
			
			return mv;
		}
/*		@RequestMapping("/tList.blp")
		public ModelAndView boardList(ModelAndView mv, PageUtil page) {
//			System.out.println("########## nowPage : " + page.getNowPage());
			// 할일
			// 1. 총 게시글 수 가져오고
			int total = bDao.getTotal();
			// 2. 해당페이지의 페이지 정보 만들고
			page.setPage(total);
			// 3. 해당페이지의 글 목록 가져오고...
			List<BoardVO> list = bDao.getList(page);
			// 4. 데이터 심고
			mv.addObject("LIST", list);
			mv.addObject("PAGE", page);
			// 5. 뷰 부르고
			mv.setViewName("board/boardList");
			// 6. mv 반환하고
			return mv;
		}*/
	}

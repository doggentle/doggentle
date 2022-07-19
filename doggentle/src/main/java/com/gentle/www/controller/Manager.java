package com.gentle.www.controller;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.gentle.www.service.*;
import com.gentle.www.dao.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/manager")
public class Manager {
	@Autowired
	ManagerDao mgDao;
	@Autowired
	GDetailDao gDao;

	Counter count;
	
	//관리자 메인
	@RequestMapping("/main.dog")
	public ModelAndView managerMain(ModelAndView mv) throws IOException {
		mv.setViewName("manager/main");
		
		String path = System.getProperty("catalina.base") + "/src/main/resources/log/";
		String fileNm = "member.log";
		
		File file = new File(path + fileNm);
		
		FileReader fileReader = new FileReader(file);

		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

		Map<String, Integer> loginCnt = new TreeMap<>();
		int cnt[] = new int[6];
		
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		String arr[] = new String[6];
		
		for(int i=5; i>=0; i--) {
			LocalDate ago = now.minusDays(i);
			String formatedAgo = ago.format(formatter);
			arr[5-i] = formatedAgo;
		}
		
		for(int i=0; i<6; i++) {
			cnt[i] = 0;
			loginCnt.put(arr[i], cnt[i]);
		}
		
		String line = "";
		String result = "";

		while((line = bufferedReader.readLine()) != null ){ // 파일 내 문자열을 1줄씩 읽기 while
			if(line.contains(arr[0]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[0]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[0], cnt[0]);
		        
		    } else if(line.contains(arr[1]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[1]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[1], cnt[1]);
		        
		    } else if(line.contains(arr[2]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[2]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[2], cnt[2]);
		        
		    } else if(line.contains(arr[3]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[3]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[3], cnt[3]);
		        
		    } else if(line.contains(arr[4]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[4]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[4], cnt[4]);
		        
		    } else if(line.contains(arr[5]) ){ // 찾고자하는 문자열이 있을 때 작성
		    	result += line + "\n"; // 한줄씩 읽어 결과에 추가
		        cnt[5]++; // 찾을 문자열이 몇개 포함되었는지 체크
		        loginCnt.put(arr[5], cnt[5]);
		    }
		}
		bufferedReader.close();
		
        List<String> keySet = new ArrayList<>(loginCnt.keySet());        
        List<Integer> valueSet = new ArrayList<>(loginCnt.values());
    
		mv.addObject("TODAY", cnt[5]);	
		mv.addObject("DAY", keySet);
		mv.addObject("DATA", valueSet);
		
		return mv;
	}
	
	@RequestMapping("/market.dog")
	public ModelAndView managerMarket(ModelAndView mv) {
		//List<ManagerVO> list = mgDao.getLabels();
		
		List<ManagerVO> list = mgDao.getMonthJoinData();
		
		List<ManagerVO> data = mgDao.getGenData();
		
		mv.addObject("LIST", list);
		mv.addObject("DATA", data);
		
		mv.setViewName("manager/mngmarket");
		return mv;
	}
	// 매니저 회원 관리 @@@
	@RequestMapping("/member.dog")
	public ModelAndView managerMember(ModelAndView mv) {
		
		List<MemberVO> list = mgDao.getMemberInfo();
		
		mv.addObject("LIST", list);
		
		mv.setViewName("manager/mngmember");
		return mv;
	}
	
	@RequestMapping("/orderList.dog")
	@ResponseBody
	public List<ManagerVO> orderList(ManagerVO mgVO) {
		List<ManagerVO> list = mgDao.getOrderInfo(mgVO.getMno());
		
		return list;
	}
	
	
	@RequestMapping("/sales.dog")
	public ModelAndView managerSales(ModelAndView mv) {
		mv.setViewName("manager/mngsales");
		List<ManagerVO> list = mgDao.getLabels();
		
		mv.addObject("LABELS", list);
		return mv;
	}
	@RequestMapping("/goods.dog")
	public ModelAndView managerGoods(ModelAndView mv) {
		mv.setViewName("manager/mnggoods");
		
		List<ManagerVO> list = mgDao.getMngGoodsList();
		
		mv.addObject("LIST", list);
		
		return mv;
	}
	@RequestMapping("/addgoods.dog")
	public ModelAndView managerAddGodds(ModelAndView mv, int gno) {
		List<GDetailVO> list = gDao.getStratCate();
		
		mv.addObject("LIST", list);
		System.out.println(gno);
		
		mv.setViewName("manager/mngaddgoods");
		if(gno == 0) {			
			return mv;
		} else {
			List<ManagerVO> info = mgDao.getMngGoodsInfo(gno);
			mv.addObject("INFO", info);
		}
		
		return mv;
	}
	
	@RequestMapping("/cateList.dog")
	@ResponseBody
	public List<GDetailVO> cateList(GDetailVO gVO){
		List<GDetailVO> list = gDao.getCateList(gVO);
		return list;
	}
	
	
	@RequestMapping("/inquiry.dog")
	public ModelAndView managerInquiry(ModelAndView mv) {
		mv.setViewName("manager/mnginquiry");
		
		List<ManagerVO> list = mgDao.getQNAList();
		mv.addObject("LIST", list);
				
		return mv;
	}
	
	// 관리자 답변 등록 함수
	@RequestMapping("/addAnswerProc.dog")
	public ModelAndView addAnswerProc(ModelAndView mv, QnAVO qVO, String title, HttpSession session) {
		String mid = (String) session.getAttribute("MID");

		mv.setViewName("manager/redirect");
		
		if(mid == null) {
			mv.addObject("VIEW", "/www/member/login.dog");
			return mv;
		}
		qVO.setMno(mgDao.getMngMno(mid));
		qVO.setTitle(title);
		
		int cnt = mgDao.addAnswer(qVO);
				
		if(cnt == 0) {
			mv.addObject("MSG", "NO");
		} else {
			mv.addObject("MSG", "OK");
		}
		mv.addObject("VIEW", "/www/manager/inquiry.dog");
		return mv;
	}
	
}

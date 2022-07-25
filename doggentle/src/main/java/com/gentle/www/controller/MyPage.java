package com.gentle.www.controller;

import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.gentle.www.dao.*;
import com.gentle.www.util.PageUtil;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/myPage")
public class MyPage {
   
   @Autowired
   MyPageDao myDao;
   @Autowired
   MemberDao mDao;
   @Autowired
   QnaDao qDao;
   
   // 마이페이지관류 뷰에 들어가는 회원정보
   public void getMember(ModelAndView mv, HttpSession session) {
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
         mv.setViewName("main");
      }
   }
   
   // 마이페이지 메인
   @RequestMapping("/mypagemain.dog")
   public ModelAndView myPageMain(ModelAndView mv, HttpSession session, MemberVO mVO) {
         String sid = (String)session.getAttribute("SID");
         getMember(mv, session);
         List<GDetailVO> olist = myDao.getTransacList(sid);
         List<GDetailVO> alist = myDao.getCartList(sid);
         session.setAttribute("OLIST", olist);
         session.setAttribute("ALIST", alist);
         mv.setViewName("myPage/mypagemain");
   
      return mv;
   }
   
   // 회원포인트 뷰
   @RequestMapping("/myPoint.dog")
   public ModelAndView myPointList(ModelAndView mv, HttpSession session, MyPageVO myVO, PageUtil page) {
      mv.addObject("DATE", myVO);
     getMember(mv, session);
      myVO.setId((String) session.getAttribute("SID"));
      System.out.println(myVO);
      page.setPageRow(5);
      page.setPage(myDao.getPointListCount(myVO));
      HashMap<String, Object> map = new HashMap<>();
      map.put("myVO", myVO);
      map.put("page", page);
      
      List<MyPageVO> list = myDao.getPointList(map);
      
      mv.addObject("PAGE", page);
      mv.addObject("LIST", list);
      mv.setViewName("myPage/mypointlist");   
      return mv; 
   }
   
   //달력 뷰
   @RequestMapping("/myattend.dog")
   public ModelAndView calendar(ModelAndView mv, HttpSession session, MyPageVO myVO) {
	   getMember(mv, session);
	   List<String> list = myDao.getattend(myVO);
	   mv.addObject("ATTEND", list);
       mv.setViewName("myPage/myattend");
       return mv;
   }
    
   // 회원정보 확인하는 뷰
   @RequestMapping("/memberinfopwck.dog")
   public ModelAndView memberInfo(ModelAndView mv) {
      mv.setViewName("myPage/memberinfopwck");
      return mv;
   }
   
   // 회원정보 뷰 보여주기 전 회원확인 ajax
   @RequestMapping("/memberinfopwckProc.dog")
   @ResponseBody
   public String memberInfopwckProc(MemberVO mVO) {
      String result;
      int cnt = myDao.getMemberCheck(mVO);
      if(cnt == 1) {
         result = "OK";
      } else {
         result = "NO";
      }
      return result;
   }
   
   // 회원정보 뷰
   @RequestMapping("/memberinfo.dog")
   public ModelAndView memberInfo(ModelAndView mv, MemberVO mVO, HttpSession session, String result) {
      String sid = (String)session.getAttribute("SID");
      getMember(mv, session);
      if(sid != null) {
         if(result.equals("OK")) {
            // 멤버 정보 담아서
            mVO = myDao.getMember(sid);
            String[] array = mVO.getJdate().split(" ");
            mVO.setJdate(array[0]);
            array = mVO.getBdate().split(" ");
            mVO.setBdate(array[0]);
            session.setAttribute("DATA", mVO);
            mv.setViewName("/myPage/memberinfo");
            return mv;
         }else {
            mv.setViewName("main");
            return mv;
         }
      } else {
         // 세션에 로그인이 안남을 경우
         mv.setViewName("main");
      }
      return mv;
   }
   
   // 회원정보 수정 proc
   @RequestMapping("/memberinfoProc.dog")
   @ResponseBody 
   public String memberInfoProc(HttpSession session, MemberVO mVO) {
      String result = "NO"; 
      if(mVO.getPw() != null) {
         mVO.setId((String) session.getAttribute("SID"));
         int cnt = myDao.getMemberCheck(mVO);
         if(cnt == 0) {
            result = "NON";
         } else {
            int ccnt = myDao.changePw(mVO);
            if(ccnt != 0) {
               result = "OK";
            } else {
               result = "NO";
            } 
         }
         System.out.println("비밀번호 처리 " + result);
         return result;
      } else if(mVO.getMail() != null) {
         System.out.println("이메일 처리");
      }
      return result;
   }
   
 //문의리스트 보기 요청
    @RequestMapping("/QnaList.dog")
    public ModelAndView QnaList(ModelAndView mv, HttpSession session, QnAVO qVO) {
       String id = (String) session.getAttribute("SID");
       System.out.println(id);
       List<QnAVO> qnalist = myDao.getQnaList(id);
       mv.addObject("QNALIST", qnalist);
       mv.setViewName("myPage/qnalist");
       return mv;
    }
   
   
   
   //주소록 목록보기요청
   @RequestMapping("/addressList.dog")
   public ModelAndView addrList(ModelAndView mv, HttpSession session) {
      List<AddressVO> adlist = myDao.getMyAddrList((String)session.getAttribute("SID"));
      mv.setViewName("/address/myAddrList");
      mv.addObject("ADLIST", adlist);
      return mv;
   }
   // 나의 주문내역 리스트
   @RequestMapping("/myOrderList.dog")
   public ModelAndView myOrderList(ModelAndView mv, HttpSession session, QnAVO qVO) {
		String id = (String) session.getAttribute("SID");
		List<QnAVO> list = qDao.getOrderList(id);
		mv.addObject("LIST", list);
      mv.setViewName("myPage/myorderlist");
      return mv;
   }
}
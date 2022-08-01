package com.gentle.www.controller;

import java.text.DecimalFormat;
import java.util.*;
import java.time.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.gentle.www.dao.*;
import com.gentle.www.util.*;
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
         mv.setViewName("member/login");
      }
   }
   
   // 마이페이지 메인
   @RequestMapping("/mypagemain.dog")
   public ModelAndView myPageMain(ModelAndView mv, HttpSession session, MemberVO mVO) {
         String sid = (String)session.getAttribute("SID");
         getMember(mv, session);
         if(sid == null) {
        	 return mv;
         }
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
      String sid = (String) session.getAttribute("SID");
      myVO.setId(sid);
      if(sid == null) {
     	 return mv;
      }
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
   public ModelAndView calendar(ModelAndView mv, HttpSession session, MyPageVO myVO, CalendarVO calVO, MyCalendar mcal) {
      getMember(mv, session);
      String sid = (String) session.getAttribute("SID");
      calVO.setId(sid);
      if(sid == null) {
     	 return mv;
      }
      if(calVO.getYear() != 0 || calVO.getMonth() != 0) {
         new MyCalendar(calVO.getYear(), calVO.getMonth());
      }
      calVO.setsDate(mcal.setDate());
      calVO.setYear(mcal.getYear());
      calVO.setMonth(mcal.getMonth());
      calVO.setDay(mcal.getDay());
      List<Integer> myattend = myDao.getattend(calVO);
      
      mv.addObject("MYATTEND", myattend);
      mv.addObject("ATTEND", calVO);
       mv.setViewName("myPage/myattend");
       return mv;
   }
   
   // 출석 처리
   @RequestMapping("/attendProc.dog")
   @ResponseBody
   public String attendProc(HttpSession session, MyPageVO myVO) {
      String result = "NO";
      String id = (String)session.getAttribute("SID");
      myVO.setId(id);
      int acnt = myDao.addattend(myVO);
      int ocnt = 0;
      if(acnt != 0) {
         ocnt = myDao.occurpoint(myVO);
      }
      if(acnt == 1 && ocnt == 1) {
         result = "OK";
      }
      return result;
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
            mv.setViewName("member/login");
            return mv;
         }
      } else {
         // 세션에 로그인이 안남을 경우
         mv.setViewName("member/login");
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
         return result;
      } else if(mVO.getMail() != null) {
      	}
      return result;
   }
   
 //문의리스트 보기 요청
   @RequestMapping("/QnaList.dog")
   public ModelAndView QnaList(ModelAndView mv, HttpSession session, QnAVO qVO) {
	  getMember(mv, session);
      String id = (String) session.getAttribute("SID");
      List<QnAVO> qnalist = myDao.getQnaList(id);
      mv.addObject("QNALIST", qnalist);
      mv.setViewName("myPage/qnalist");
      return mv;
   }
   
  //문의 글 등록
  @RequestMapping("/QnaWriteProc.dog")
  public ModelAndView addQna(ModelAndView mv, QnAVO qVO, HttpSession session, String name) {
     
     String sid = (String) session.getAttribute("SID");
     
     mv.setViewName("manager/redirect");
     if(sid == null) {
        mv.addObject("VIEW", "/www/member/login.dog");
        return mv;
     }
     qVO.setId(sid);
     qVO.setName(name);
     
     int cnt = qDao.qnaWrite(qVO);
     
     if(cnt != 0) {
        
        mv.addObject("VIEW", "/www/myPage/QnaList.dog");
     }
     
     return mv;
  }

   
   
   
   //주소록 목록보기요청
   @RequestMapping("/addressList.dog") 
   public ModelAndView addrList(ModelAndView mv, HttpSession session) {
	  getMember(mv, session);
	  String sid = (String)session.getAttribute("SID");
	  if(sid == null) {
		  return mv;
	  }
      List<AddressVO> adlist = myDao.getMyAddrList(sid);
      mv.addObject("ADLIST", adlist);
      mv.setViewName("myPage/myAddrList");
      return mv;
   }
   // 나의 주문내역 리스트
   @RequestMapping("/myOrderList.dog")
   public ModelAndView myOrderList(ModelAndView mv, HttpSession session, ManagerVO mVO) {
      getMember(mv, session);
	   String id = (String) session.getAttribute("SID");
      if(id == null) {
         mv.setViewName("member/login");
         return mv;
      }
      List<ManagerVO> list = qDao.getOrderListed(id);
      mv.addObject("LIST", list);
      mv.setViewName("myPage/myorderlist");
      return mv;
   }
}
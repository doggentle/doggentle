package com.gentle.www.controller;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.gentle.www.service.*;
import com.gentle.www.util.PageUtil;
import com.gentle.www.dao.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/manager")
public class Manager {
   @Autowired
   ManagerDao mgDao;
   @Autowired
   GDetailDao gDao;
   
   @Autowired
   GoodsService gSrvc;
    
   
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

      while((line = bufferedReader.readLine()) != null ){ 
         if(line.contains(arr[0]) ){
             result += line + "\n";
              cnt[0]++;
              loginCnt.put(arr[0], cnt[0]);
              
          } else if(line.contains(arr[1]) ){
             result += line + "\n";
              cnt[1]++;
              loginCnt.put(arr[1], cnt[1]);
              
          } else if(line.contains(arr[2]) ){
             result += line + "\n";
              cnt[2]++;
              loginCnt.put(arr[2], cnt[2]);
              
          } else if(line.contains(arr[3]) ){
             result += line + "\n";
              cnt[3]++;
              loginCnt.put(arr[3], cnt[3]);
              
          } else if(line.contains(arr[4]) ){
             result += line + "\n";
              cnt[4]++;
              loginCnt.put(arr[4], cnt[4]);
              
          } else if(line.contains(arr[5]) ){
             result += line + "\n";
              cnt[5]++;
              loginCnt.put(arr[5], cnt[5]);
          }
      }
      bufferedReader.close();
      
        List<String> keySet = new ArrayList<>(loginCnt.keySet());        
        List<Integer> valueSet = new ArrayList<>(loginCnt.values());
        
      ManagerVO mVO = mgDao.getSalesSum();
      mv.addObject("SUM", mVO);
        
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
      
      List<ManagerVO> cate = mgDao.getCateData();
      
      mv.addObject("LIST", list);
      mv.addObject("DATA", data);
      mv.addObject("CATE", cate);
      
      mv.setViewName("manager/mngmarket");
      return mv;
   }
   // 매니저 회원 관리 @@@
   @RequestMapping("/member.dog")
   public ModelAndView managerMember(ModelAndView mv, PageUtil page) {
      
	  int total = mgDao.getMemberTotal();
	  page.setPage(total);
	  
      List<MemberVO> list = mgDao.getMemberInfo(page);
      
      mv.addObject("PAGE", page);
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
      List<ManagerVO> list = mgDao.getSalesTotalDay();
      mv.addObject("DAY", list);
      
      List<ManagerVO> cate = mgDao.getCateSalesSum();
      mv.addObject("CATE", cate);
      
      List<ManagerVO> month = mgDao.getSalesTotatlMonth();
      mv.addObject("MONTH", month);
      
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
   public ModelAndView managerAddGoods(ModelAndView mv, String gno) {
      List<GDetailVO> list = gDao.getStratCate();
      
      mv.addObject("LIST", list);
      
      mv.setViewName("manager/mngaddgoods");
      if(gno == null) {         
         return mv;
      } else {
         ManagerVO mgVO = mgDao.getMngGoodsInfo(gno);
         mv.addObject("INFO", mgVO);
      }
      return mv;
   }
   
   @RequestMapping("/addGoodsProc.dog")
   public ModelAndView mngAddGoodsProc(ModelAndView mv, MultipartRequest file, ManagerVO mgVO, ImageVO iVO) {
      mv.setViewName("manager/redirect");
      
      int gno = mgVO.getGno();
      
      if(gno != 0) { // 수정이면
    	  try {
    		  gSrvc.editGoods(mgVO);
    		  mv.addObject("VIEW", "/www/manager/goods.dog");
    	  } catch(Exception e) {
    		  mv.addObject("VIEW", "/www/manager/addgoods.dog");
    		  e.printStackTrace();
    	  }
      } else { // 상품 등록
         try {
            gSrvc.addGoods(mgVO);
            mv.addObject("VIEW", "/www/manager/goods.dog");
         } catch(Exception e) {
            mv.addObject("VIEW", "/www/manager/addgoods.dog");
            e.printStackTrace();
         }
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
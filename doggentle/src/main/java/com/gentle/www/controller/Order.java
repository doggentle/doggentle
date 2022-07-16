package com.gentle.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import java.io.*;
import java.net.*;
import java.util.*;

import com.gentle.www.dao.*;
import com.gentle.www.service.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/order")
public class Order {
	@Autowired
	OrderDao oDao;
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/cart.dog")
	public ModelAndView cartForm(ModelAndView mv, HttpSession session) {
		List<OrderVO> list = oDao.getMyCartList((String)session.getAttribute("SID"));
		mv.addObject("LIST", list);
		mv.setViewName("/order/cart");
		return mv;
	}
	
	@RequestMapping(path="/cartDel.dog", method=RequestMethod.GET, params="cno")
	public ModelAndView delCartCase(ModelAndView mv, RedirectView rv, int cno) {
		if(oDao.delCartCase(cno)==1) {
			rv.setUrl("/www/order/cart.dog");
			mv.setView(rv);
			return mv;
		}else {
			mv.setViewName("/order/cart");
			return mv;
		}
	}
	
	@RequestMapping("/payment.dog")
	public ModelAndView payForm(ModelAndView mv, HttpSession session, OrderVO oVO, MemberVO mVO) {
		
		List<OrderVO> list = new ArrayList<OrderVO>();//전체 주문 건 조회
		List list2 = Arrays.asList(oVO.getCnoArr());
		list = oDao.estimate(list2);
			mv.addObject("LIST", list);
		
		String id = (String)session.getAttribute("SID");//주문자 정보 조회
		mVO = mDao.getCustInfo(id);
			mv.addObject("INFO", mVO);
		
		int res = 0;//토탈 결제비용 계산
		for(int i = 0 ; i < list.size() ; i++) {
			int pxq = ( list.get(i).getPrice() * list.get(i).getQuant() );
			res = res + pxq;
		}
		
		oVO = list.get(0);//전체 리스트 중 첫번째 데이터만 추출하여 요약데이터
		oVO.setGdsCount(list.size());
		oVO.setTtlPrice(res);
		mv.addObject("ONE", oVO);
		
		List<AddressVO> list3 = new ArrayList<AddressVO>();//주문자 주소리스트 조회
		list3 = oDao.getMyAddrList(id);
		mv.addObject("ADDLIST", list3);
		
		mv.setViewName("/order/payment");
		return mv;
	}
	
									@RequestMapping("/payExecute.dog")
									public String payExecute() {
										return "";
								    }
										

	@RequestMapping("/kakaopay.blp")
	@ResponseBody
	public String kakaopay(OrderVO oVO) {
		
		
		String itemName = "";
		itemName = oVO.getItem_name();
		if(oVO.getQuantity() != 1) {
			int itemEtc = oVO.getQuantity();
			itemName = itemName + " 외 " + itemEtc +"개 품목";
		}
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection scon = (HttpURLConnection)address.openConnection();
			scon.setRequestMethod("POST");
			scon.setRequestProperty("Authorization", "KakaoAK 59a80d41e2423e8eb2c236f3bcc79794");
			scon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			scon.setDoOutput(true); 
			
			 StringBuffer params = new StringBuffer();
	           params.append("cid="					).append("TC0ONETIME"				);
	           params.append("&partner_order_id="	).append("1001"						);
	           params.append("&partner_user_id="	).append(oVO.getPartner_user_id());
	           params.append("&item_name="			).append(itemName);
	           params.append("&quantity="			).append(oVO.getQuantity()+"");
	           params.append("&total_amount="		).append(oVO.getTotal_amount()+"");
	           params.append("&tax_free_amount="	).append("0");
	           params.append("&approval_url="		).append("http://localhost/www/order/payExecute.dog");
	           params.append("&cancel_url="			).append("http://localhost/www/order/cart.dog");
	           params.append("&fail_url="			).append("http://localhost/www/error.dog");
	           PrintWriter pw = new PrintWriter(new OutputStreamWriter(scon.getOutputStream(), "UTF-8"));
	           pw.write(params.toString());
	           pw.flush();

			
			int result = scon.getResponseCode();
			
			InputStream in;
			if(result == 200) {
				in = scon.getInputStream();
			}else {
				in = scon.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(in);
			BufferedReader bfreader = new BufferedReader(reader);
			return bfreader.readLine();
		}/*catch(Exception e){
			e.printStackTrace();
		}*/catch(MalformedURLException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
}

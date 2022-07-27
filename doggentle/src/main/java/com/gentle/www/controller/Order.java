package com.gentle.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	//@RequestMapping(path="/cartDel.dog", method=RequestMethod.GET, params="cno")
	@RequestMapping("/cartDel.dog")
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
		
		String id = (String)session.getAttribute("SID");//주문자 정보 조회
		mVO = mDao.getCustInfo(id);
		mv.addObject("INFO", mVO);
		
		if(oVO.getCnoArr()!=null) {
			List<OrderVO> list = new ArrayList<OrderVO>();//전체 주문 건 조회
			List list2 = Arrays.asList(oVO.getCnoArr());
			list = oDao.estimateList(list2);
			mv.addObject("LIST", list);
			
			int res = 0;//토탈 결제비용 계산
			for(int i = 0 ; i < list.size() ; i++) {
				int pxq = ( list.get(i).getPrice() * list.get(i).getQuant() );
				res = res + pxq;
			}
			
			oVO = list.get(0);//전체 리스트 중 첫번째 데이터만 추출하여 요약데이터
			oVO.setGdsCount(list.size());
			oVO.setTtlPrice(res);
			mv.addObject("ONE", oVO);
			mv.setViewName("/order/payment");
		}else {
			//물품 1 개에 대한 정보와 갯수에 따른 토탈결제비용 계산
			int quantity = oVO.getQuantity();
			oVO = oDao.estimateOnly(oVO.getGno());
			oVO.setTtlPrice(oVO.getPrice()*quantity);
			oVO.setQuantity(quantity);
			mv.addObject("ONLY", oVO);
			mv.setViewName("/order/paymentOnly");
		}
		
		List<AddressVO> list3 = new ArrayList<AddressVO>();//주문자 주소리스트 조회
		list3 = oDao.getMyAddrList(id);
		mv.addObject("ADDLIST", list3);
		
		return mv;
	}
	

	@RequestMapping("/kakaopay.dog")
	@ResponseBody
	public String kakaopay(OrderVO oVO, HttpSession session) {
		String itemName = "";
		itemName = oVO.getItem_name();
		if(oVO.getQuantity() != 1) {
			int itemEtc = oVO.getQuantity();
			itemName = itemName + " 외 " + itemEtc +"개 품목";
			oVO.setItem_name(itemName);
		}
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection scon = (HttpURLConnection)address.openConnection();
			scon.setRequestMethod("POST");
			scon.setRequestProperty("Authorization", "KakaoAK 59a80d41e2423e8eb2c236f3bcc79794");
			scon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			scon.setDoOutput(true); 
			
			 StringBuffer params = new StringBuffer();
	           params.append("cid="					).append("TC0ONETIME"									);
	           params.append("&partner_order_id="	).append("1001"											);
	           params.append("&partner_user_id="	).append(oVO.getPartner_user_id()						);
	           params.append("&item_name="			).append(oVO.getItem_name()								);
	           params.append("&quantity="			).append(oVO.getQuantity()+""							);
	           params.append("&total_amount="		).append(oVO.getTotal_amount()+""						);
	           params.append("&tax_free_amount="	).append("0"											);
	           params.append("&approval_url="		).append("http://localhost/www/order/payAfterPage.dog"	);
	           params.append("&cancel_url="			).append("http://localhost/www/order/cart.dog"			);
	           params.append("&fail_url="			).append("http://localhost/www/error.dog"				);
	           PrintWriter pw = new PrintWriter(new OutputStreamWriter(scon.getOutputStream(), "UTF-8")		);
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
												String tmp = bfreader.readLine();
												String tmp2 = tmp.substring(tmp.indexOf(":")+2, tmp.indexOf(",")-1);
												session.setAttribute("tid", tmp2);
												session.setAttribute("total_amount", oVO.getTotal_amount());
												session.setAttribute("partner_user_id", oVO.getPartner_user_id());
												
			return tmp;
		}/*catch(Exception e){
			e.printStackTrace();
		}*/catch(MalformedURLException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	@RequestMapping("/trReady.dog")
	@ResponseBody
	public String trReady(OrderVO oVO, HttpServletRequest req, HttpSession session) {
		int adno, listCnt1, listCnt2, voCnt, tnoCnt;
		
		adno = oVO.getAdno();
		if(oVO.getGno()==0) {
			List list = Arrays.asList(oVO.getCnoArr());
			listCnt1 = oDao.trReady(list);//구매물건 장바구니 비우기 10개 나와야 정상
			voCnt = (int)list.get(0);//첫번째 물건꺼내기
			oVO = oDao.trReadyVO(voCnt);
			oVO.setAdno(adno);
			listCnt2 = oDao.trExecMo(oVO);//상위 transaction row 입력
			tnoCnt = oVO.getTno();
			if(list.size()!=1) {//나머지 하위 transaction row 입력
				for(int i=1;i<list.size();i++) {
					voCnt = (int)list.get(i);
					oVO = oDao.trReadyVO(voCnt);
					oVO.setAdno(adno);
					oVO.setUpno(tnoCnt);
					listCnt2 = listCnt2 + oDao.trExecCh(oVO);
				}
				if(listCnt2==listCnt1) {
					return "{\"result\":\"OK\", \"tno\":\""+tnoCnt+"\"}";
				}else {
					return "{\"result\":\"NO\"}";
				}
			}
		}else {
			oVO.setMno(oDao.getMno((String)session.getAttribute("SID")));
			listCnt2 = oDao.trExecMo(oVO);
			if(listCnt2 == 1) {
				tnoCnt = oVO.getTno();
				return "{\"result\":\"OK\", \"tno\":\""+tnoCnt+"\"}";
			}else {
				return "{\"result\":\"NO\"}";
			}
		}
		return "{\"result\":\"NO\"}";
	}
	
	@RequestMapping("/payAfter.dog")
	@ResponseBody
	public String payAfter(String pg_token, HttpSession session, OrderVO oVO) {
			 
			 
//		RestTemplate restTemplate = new RestTemplate();
//		 
//		//서버로 요청할 Header
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", "KakaoAK 59a80d41e2423e8eb2c236f3bcc79794");
//		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
//		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
//		 
//		// 서버로 요청할 Body
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
//		params.add("cid", "TC0ONETIME");
//		System.out.println("tid -> :"+(String)session.getAttribute("tid"));
//		System.out.println("token -> :"+pg_token);
//		params.add("tid", (String)session.getAttribute("tid"));
//		params.add("partner_order_id", "1001");
//		params.add("partner_user_id", oVO.getPartner_user_id()+"");
//		params.add("pg_token", pg_token);
//		params.add("total_amount", oVO.getTotal_amount()+"");
//		params.add("tax_free_amount", "0");
//		params.add("item_name", oVO.getItem_name()+"");
//		
//		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
//		
//		try {
//			kpaVO = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/payment/approve"), body, KakaoPayApprovalVO.class);
//			String kpaTostring = kpaVO.toString();
//			return kpaTostring;
//		
//		} catch (RestClientException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (URISyntaxException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	        
	        
	        /////////////////////////////////////////////////////////////////////////////
			try {
				URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
				HttpURLConnection scon = (HttpURLConnection)address.openConnection();
				scon.setRequestMethod("POST");
				scon.setRequestProperty("Authorization", "KakaoAK 59a80d41e2423e8eb2c236f3bcc79794");
				scon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				scon.setDoOutput(true); 
				
				 StringBuffer params = new StringBuffer();
		           params.append("cid="					).append("TC0ONETIME"									);
		           params.append("&partner_order_id="	).append("1001"											);
		           params.append("&partner_user_id="	).append(session.getAttribute("partner_user_id")+""		);
		           params.append("&item_name="			).append(oVO.getItem_name()								);
		           params.append("&quantity="			).append(oVO.getQuantity()+""							);
		           params.append("&total_amount="		).append(session.getAttribute("total_amount")+""		);
		           params.append("&tax_free_amount="	).append("0"											);
		           params.append("&pg_token="			).append(pg_token										);
		           params.append("&tid="				).append(session.getAttribute("tid")+""					);
		           PrintWriter pw = new PrintWriter(new OutputStreamWriter(scon.getOutputStream(), "UTF-8")		);
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
													String tmp = bfreader.readLine();
				return tmp;
			}/*catch(Exception e){
				e.printStackTrace();
			}*/catch(MalformedURLException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
			return "{\"result\":\"NO\"}";
	        /////////////////////////////////////////////////////////////////////////////
	        //return null;
	}
	@RequestMapping("/payAfterPage.dog")
	public ModelAndView payAfterPage(ModelAndView mv, String pg_token, HttpSession session) {
		mv.addObject("partner_user_id", session.getAttribute("SID"));
		mv.addObject("pg_token", pg_token);
		mv.setViewName("/order/payAfter");
		return mv;
	}
	@RequestMapping(value="/payTrDone.dog", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String payTransactionDone(String tno, AddressVO adVO, HttpServletResponse response) {
		int tno2 = Integer.parseInt(tno);
		int trCnt = oDao.trDone(tno2);
		adVO = oDao.trDone2(tno2);
		
		
		if(trCnt==0) {
			return "{\"result\":\"NO\"}";
		}else {
			int trCnt2 = oDao.trDoneTest(tno2);
			System.out.println("trCnt2 :"+trCnt2);
			System.out.println("trCnt :"+trCnt);
			if(trCnt==trCnt2) {//'Y'변환갯수와 tno를기준으로 한 부모-자식 transaction row 갯수를 서로 확인
				 response.setCharacterEncoding("UTF-8");
				 
				 
				return "{"+
					"\"result\":\"OK\""+","+
					"\"who\":\""+adVO.getWho()+"\""+","+
					"\"contact\":\""+adVO.getContact()+"\""+","+
					"\"adrs\":\""+adVO.getAdrs()+"\""+","+
					"\"pno\":\""+adVO.getPno()+"\""+
						"}";
			}else {
				return "{\"result\":\"NO\"}";
			}
		}
	}
	
	@RequestMapping("/cartTest.dog")
	public ModelAndView cartTest(ModelAndView mv) {
		mv.setViewName("/order/cartTest");
		return mv;
	}
	
	//카트에 물품추가
	@RequestMapping("/addCart.dog")
	@ResponseBody
	public String addCart(OrderVO oVO, HttpSession session) {
		String id = (String)session.getAttribute("SID");
		oVO.setId(id);
		if(oDao.isGoodsCart(oVO)==0){//카트안에 같은물품이 있는지 검사
			if(oDao.addCart(oVO)==1) {//
				return "{\"result\":\"OK\"}";
			}else {
				return "{\"result\":\"NO\"}";
			}
		}else {
			return "{\"result\":\"already\"}";
		}
	}
	
	//카트물품 갯수 제어
	@RequestMapping("/cartQtyControl.dog")
	@ResponseBody
	public String qtyControl(int cno, OrderVO oVO) {
		String pnm = oVO.getPnm();
		if(pnm.equals("+1")) {
			if(oDao.cartQtyPlus(cno)==1) {
				return "{\"result\":\"OK\"}";
			}else {
				return "{\"result\":\"NO\"}";
			}
		}else if(pnm.equals("-1")){
			if(oDao.cartQtyMinus(cno)==1) {
				return "{\"result\":\"OK\"}";
			}else{
				return "{\"result\":\"NO\"}";
			}
		}else {
			if(oDao.cartQtyIn(oVO)==1) {
				return "{\"result\":\"OK\"}";
			}else {
				return "{\"result\":\"NO\"}";
			}
		}
	}


}

package com.gentle.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import java.io.*;
import java.net.*;

import com.gentle.www.dao.MemberDao;
import com.gentle.www.service.*;
import com.gentle.www.vo.*;

@Controller
@RequestMapping("/order")
public class Order {
	
	@RequestMapping("/cart.dog")
	public ModelAndView cartForm(ModelAndView mv) {
		mv.setViewName("/order/cart");
		return mv;
	}
	
	@RequestMapping("/payment.dog")
	public ModelAndView payForm(ModelAndView mv) {
		mv.setViewName("/order/payment");
		return mv;
	}
	
	@RequestMapping("/payAfter.dog")
	public ModelAndView payProc(ModelAndView mv) {
		mv.setViewName("/order/payAfter");
		return mv;
	}

	@RequestMapping("/pay.blp")
	@ResponseBody
	public String kakaopay() {
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
	           params.append("&partner_user_id="	).append("gorany"					);
	           params.append("&item_name="			).append("갤럭시S9"					);
	           params.append("&quantity="			).append("1"						);
	           params.append("&total_amount="		).append("2100"						);
	           params.append("&tax_free_amount="	).append("100"						);
	           params.append("&approval_url="		).append("http://localhost/www/order/payAfter.dog");
	           params.append("&cancel_url="			).append("http://localhost/www/order/cart.dog");
	           params.append("&fail_url="			).append("http://localhost/www/error.dog");
	           PrintWriter pw = new PrintWriter(new OutputStreamWriter(scon.getOutputStream(), "UTF-8"));
	           pw.write(params.toString());
	           pw.flush();
			     /*      
			         String param = "cid=TC0ONETIME"
			               + "&partner_order_id=partner_order_id"
			               + "&partner_user_id=partner_user_id"
			               + "&item_name=초코파이마싯ㅅ다헤헤헤헤헤헤헤"
			               + "&quantity=1"
			               + "&total_amount=2200"
			               + "&vat_amount=200"
			               + "&tax_free_amount=0"
			               + "&approval_url=http://localhost/www/"
			               + "&fail_url=http://localhost/www/"
			               + "&cancel_url=http://localhost/www/";
			         OutputStream  out = scon.getOutputStream();
			         DataOutputStream dout = new DataOutputStream(out);
			         dout.writeBytes(param);
			         dout.close(); //이 함수를 호출하면 .flush()함수도 자동으로 호출된다.
			      */   

			
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

package com.gentle.www.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyPageVO {
	private int mno, tcnt, rcnt, spoint;
	private String mail, id, pw, bdate, gen, jdate, isshow, money, spw;
	
	//포인트 관리
	private int pvalue, upno;
	private String odate, body;

	// 포인트에 관해서
	
	public String getSpw() {
		return spw;
	}
	public int getPvalue() {
		return pvalue;
	}
	public void setPvalue(int pvalue) {
		this.pvalue = pvalue;
	}
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public String getDate() {
		return odate;
	}
	public void setDate(String odate) {
		this.odate = odate;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
	// 멤버에 관해서
	public void setSpw(String spw) {
		this.spw = spw;
	}
	public int getMno() {
		return mno;
	}
	public int getTcnt() {
		return tcnt;
	}
	public void setTcnt(int tcnt) {
		this.tcnt = tcnt;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getSpoint() {
		return spoint;
	}
	public void setSpoint(int spoint) {
		this.spoint = spoint;
		DecimalFormat df = new DecimalFormat("###,###");
		setMoney(df.format(spoint));
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getJdate() {
		return jdate;
	}
	public void setJdate(String jdate) {
		this.jdate = jdate;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	
	
	@Override
	public String toString() {
		return "MyPageVO [mno=" + mno + ", tcnt=" + tcnt + ", rcnt=" + rcnt + ", spoint=" + spoint + ", mail=" + mail
				+ ", id=" + id + ", pw=" + pw + ", bdate=" + bdate + ", gen=" + gen + ", jdate=" + jdate + ", isshow="
				+ isshow + ", money=" + money + ", spw=" + spw + ", pvalue=" + pvalue + ", upno=" + upno + ", date="
				+ odate + ", body=" + body + "]";
	}
	
	
	

	

}

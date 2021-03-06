package com.gentle.www.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {
	private int mno, tcnt, rcnt, spoint, cnt, rno;
	private String mail, id, pw, bdate, gen, jdate, isshow, money, spw;
	//private Date birth, join;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSpw() {
		return spw;
	}
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
		return "MemberVO [mno=" + mno + ", tcnt=" + tcnt + ", rcnt=" + rcnt + ", spoint=" + spoint + ", cnt=" + cnt
				+ ", rno=" + rno + ", mail=" + mail + ", id=" + id + ", pw=" + pw + ", bdate=" + bdate + ", gen=" + gen
				+ ", jdate=" + jdate + ", isshow=" + isshow + ", money=" + money + ", spw=" + spw + "]";
	}
	
	
	
	

	

}

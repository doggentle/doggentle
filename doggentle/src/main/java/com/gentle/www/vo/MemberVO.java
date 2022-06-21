package com.gentle.www.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {
	private int mno;
	private String mail, id, pw, bdate, gen, jdate;
	//private Date birth, join;
	
	public int getMno() {
		return mno;
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
	
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", mail=" + mail + ", id=" + id + ", pw=" + pw + ", bdate=" + bdate + ", gen="
				+ gen + ", jdate=" + jdate + "]";
	}

}

package com.gentle.www.vo;

public class AddressVO {
	private int adno, mno;
	private String who, adrs, contact, isuse, pno, spno;
	
	public String getSpno() {
		return spno;
	}
	public void setSpno(int spno) {
		this.spno = String.format("%05d", spno);
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
		setSpno(Integer.parseInt(pno));
	}
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getWho() {
		return who;
	}
	public void setWho(String who) {
		this.who = who;
	}
	public String getAdrs() {
		return adrs;
	}
	public void setAdrs(String adrs) {
		this.adrs = adrs;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getIsuse() {
		return isuse;
	}
	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}
}

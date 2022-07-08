package com.gentle.www.vo;

import java.util.Date;

public class gDeatilVO {
	private int gno, price, cano, hits, ino, cnt;
	private Date slaesdate;
	private String gname, caname;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCano() {
		return cano;
	}
	public void setCano(int cano) {
		this.cano = cano;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getSlaesdate() {
		return slaesdate;
	}
	public void setSlaesdate(Date slaesdate) {
		this.slaesdate = slaesdate;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	public String getCaname() {
		return caname;
	}
	public void setCaname(String caname) {
		this.caname = caname;
	}
	@Override
	public String toString() {
		return "gDeatilVO [gno=" + gno + ", price=" + price + ", cano=" + cano + ", hits=" + hits + ", ino=" + ino
				+ ", cnt=" + cnt + ", slaesdate=" + slaesdate + ", gname=" + gname + "]";
	}
	
}

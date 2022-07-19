package com.gentle.www.vo;

import java.util.Arrays;

public class OrderVO {
	private int cno, gno, quant, price, ino, gdsCount, ttlPrice, adno, quantity, total_amount, mno;
	private Integer[] cnoArr;
	private String gname, gdetail, savename, dir, partner_user_id, item_name;
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public int getTtlPrice() {
		return ttlPrice;
	}
	public void setTtlPrice(int ttlPrice) {
		this.ttlPrice = ttlPrice;
	}
	public int getGdsCount() {
		return gdsCount;
	}
	public void setGdsCount(int gdsCount) {
		this.gdsCount = gdsCount;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public Integer[] getCnoArr() {
		return cnoArr;
	}
	public void setCnoArr(Integer[] cnoArr) {
		this.cnoArr = cnoArr;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGdetail() {
		return gdetail;
	}
	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	@Override
	public String toString() {
		return "OrderVO [cno=" + cno + ", gno=" + gno + ", quant=" + quant + ", price=" + price + ", ino=" + ino
				+ ", gdsCount=" + gdsCount + ", ttlPrice=" + ttlPrice + ", adno=" + adno + ", quantity=" + quantity
				+ ", total_amount=" + total_amount + ", cnoArr=" + Arrays.toString(cnoArr) + ", gname=" + gname
				+ ", gdetail=" + gdetail + ", savename=" + savename + ", dir=" + dir + ", partner_user_id="
				+ partner_user_id + ", item_name=" + item_name + "]";
	}
	
	
}

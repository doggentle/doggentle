package com.gentle.www.vo;

import org.springframework.web.multipart.MultipartFile; 

public class ManagerVO {
	private int gno, mno, tno, ino, cano, price, quantity, data, hits, stock, large, middle, small;
	private String caname, gname, gdetail, dir, savename, label, month, isshow, issell, tdate, sum, total, hit;

	private MultipartFile file;

	
	
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public int getCano() {
		return cano;
	}
	public void setCano(int cano) {
		this.cano = cano;
	}
	public String getGdetail() {
		return gdetail;
	}
	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getLarge() {
		return large;
	}
	public void setLarge(int large) {
		this.large = large;
	}
	public int getMiddle() {
		return middle;
	}
	public void setMiddle(int middle) {
		this.middle = middle;
	}
	public int getSmall() {
		return small;
	}
	public void setSmall(int small) {
		this.small = small;
	}
	public String getIssell() {
		return issell;
	}
	public void setIssell(String issell) {
		this.issell = issell;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCaname() {
		return caname;
	}
	public void setCaname(String caname) {
		this.caname = caname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	@Override
	public String toString() {
		return "ManagerVO [gno=" + gno + ", mno=" + mno + ", tno=" + tno + ", ino=" + ino + ", cano=" + cano
				+ ", price=" + price + ", quantity=" + quantity + ", data=" + data + ", hits=" + hits + ", stock="
				+ stock + ", large=" + large + ", middle=" + middle + ", small=" + small + ", caname=" + caname
				+ ", gname=" + gname + ", gdetail=" + gdetail + ", dir=" + dir + ", savename=" + savename + ", label="
				+ label + ", month=" + month + ", isshow=" + isshow + ", issell=" + issell + ", tdate=" + tdate
				+ ", sum=" + sum + ", total=" + total + ", file=" + file + "]";
	}

	
	
	
}

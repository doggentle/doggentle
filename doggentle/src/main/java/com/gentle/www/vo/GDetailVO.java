package com.gentle.www.vo;

import java.text.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GDetailVO {
   private int gno, price, cano, hits, ino, cnt, stock, upno, quantity;
   private Date salesdate;
   private String gname, gdetail, caname, upname, savename, dir, adrs, money, sdate;
   
   DecimalFormat df = new DecimalFormat("###,###");
   
   public int getUpno() {
      return upno;
   }
   public void setUpno(int upno) {
      this.upno = upno;
   }
   public String getUpname() {
      return upname;
   }
   public void setUpname(String upname) {
      this.upname = upname;
   }
   public String getSavename() {
      return savename;
   }
   public void setSavename(String savename) {
      this.savename = savename;
   }
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
      setMoney(df.format(price));
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
   public int getQuantity() {
	return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getSalesdate() {
		return salesdate;
   }
   public void setSalesdate(Date salesdate) {
      this.salesdate = salesdate;
      setSdate();
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
   
   public int getStock() {
      return stock;
   }
   public void setStock(int stock) {
      this.stock = stock;
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
	public String getAdrs() {
		return adrs;
	}
	public void setAdrs(String adrs) {
		this.adrs = adrs;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
		sdate = form.format(salesdate);
	}
	
}
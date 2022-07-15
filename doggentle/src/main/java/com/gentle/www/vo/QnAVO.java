package com.gentle.www.vo;

public class QnAVO {
	private int qno, mno, upqno;
	private String id, title, body, qdate;
	
	private int ano, mngno;
	private String mid, abody, adate;

	// 문의작성용 vo
	private int tno, gno;

		
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getMngno() {
		return mngno;
	}
	public void setMngno(int mngno) {
		this.mngno = mngno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAbody() {
		return abody;
	}
	public void setAbody(String abody) {
		this.abody = abody;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getUpqno() {
		return upqno;
	}
	public void setUpqno(int upqno) {
		this.upqno = upqno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	@Override
	public String toString() {
		return "QnAVO [qno=" + qno + ", mno=" + mno + ", upqno=" + upqno + ", id=" + id + ", title=" + title + ", body="
				+ body + ", qdate=" + qdate + ", ano=" + ano + ", mngno=" + mngno + ", mid=" + mid + ", abody=" + abody
				+ ", adate=" + adate + ", tno=" + tno + ", gno=" + gno + "]";
	}
	

	


}

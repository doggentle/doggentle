package com.gentle.www.vo;

import java.util.*;

public class CalendarVO {
	private String id;
	private int year, month, day, first, ano;
	
	private List<Integer> sDate;
	
	
	public int getMno() {
		return ano;
	}

	public void setMno(int ano) {
		this.ano = ano;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public List<Integer> getsDate() {
		return sDate;
	}

	public void setsDate(List<Integer> sDate) {
		this.sDate = sDate;
	}

	@Override
	public String toString() {
		return "CalendarVO [id=" + id + ", year=" + year + ", month=" + month + ", day=" + day + ", first=" + first
				+ ", ano=" + ano + ", sDate=" + sDate + "]";
	}

	
}

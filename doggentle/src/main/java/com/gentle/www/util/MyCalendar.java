package com.gentle.www.util;

import java.util.*;

import com.gentle.www.vo.*;

public class MyCalendar {
	
	CalendarVO cldVO = new CalendarVO();
	
	Calendar today = Calendar.getInstance();
	private int year, month, day = today.get(Calendar.DATE);
	
	
	public MyCalendar() {
		year = today.get(Calendar.YEAR);
		month = today.get(Calendar.MONTH) + 1;
		
	}
	
	public MyCalendar(int year, int month) {
		
		this.year = year;
		this.month = month;
	}
	
	
	
	public void settingDate() {
		try{
			if(month>=13){
				year++;
				month =1;
			}else if(month <=0){
				year--;
				month =12;
			}
		}catch(Exception e){
			
		}
	}
 
	
	
//	년도를 넘겨받아 윤년/ 평년을 판단해 윤년이면 true, 평년이면 false를 리턴하는 메서드
	public boolean isLeapYear(int year) {
		return (year % 4 ==0) && (year % 100 !=0) ||(year % 400 ==0);
	}
	
//	년, 월을 넘겨받아 그 달의 마지막 날짜를 리턴하는 메서드
	public int lastDay(int year ,int month ) {
		int[] m = {31,28,31,30,31,30,31,31,30,31,30,31};
		m[1]=isLeapYear(year)? 29:28;
		return m[month-1];
	}
	
	
//	년, 월, 일을 념겨받아 1년 1월 1일부터 지나온 날짜의 합계를 리턴하는 메서드	
	public int totalDay(int year, int month, int day) {
		int sum = (year-1)*365 +(year-1)/4 - (year-1)/100 +(year-1)/400;
		for (int i = 1; i < month; i++) {
			sum += lastDay(year,i);
		}
		return sum + day;
	}
	
//	년, 월, 일을 넘겨받아 요일을 숫자로 리턴하는 메서드, 일요일(0),월요일(1)....토요일(6)
	public int weekDay(int year, int month, int day) {
		return totalDay(year, month, day) % 7;
	}

//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
	public List<Integer> setDate() {
		settingDate();
		int beforeDate;
		List<Integer> list = new ArrayList<Integer>();
		// 1일의 요일을 계산
		int first = weekDay(year, month, 1);
		// 1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산
		int start = 0;
		start = month == 1 ? lastDay(year-1, 12)- first : lastDay(year, month-1)- first;
		
		for(int i= 1; i<= first; i++){
			beforeDate = ++start;   
			list.add(beforeDate);
		}
		
		int afterDate;
		for(int i = 1; i <= lastDay(year, month); i++){
			afterDate = i;
		list.add(afterDate);
		}
		
		return list;
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

	@Override
	public String toString() {
		return "MyCalendar [year=" + year + ", month=" + month + ", day=" + day + "]";
	}
	
	
}
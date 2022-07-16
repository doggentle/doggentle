package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.*;


public class OrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//내 장바구니 조회
	public List<OrderVO> getMyCartList(String id) {
		return sqlSession.selectList("oSQL.myCartList", id);
	}
	
	//장바구니 한 줄 제거
	public int delCartCase(int cno) {
		return sqlSession.update("oSQL.delCartCase", cno);
	}
	
	//cart에서 선택된 cno거래정보 조회 receipt?
	public List<OrderVO> estimate(List list) {
		return sqlSession.selectList("oSQL.estCartList", list);
	}
	
	//주문자의 주소 리스트 조회
	public List<AddressVO> getMyAddrList(String id){
		return sqlSession.selectList("oSQL.myAddrList", id);
	}
	
	//새 거래번호 발급
	public String getNewPK() {
		return "";
	}
}

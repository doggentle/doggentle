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
	
	//tr시작, List에 속한 cart isshow 'N' 설
	public int trReady(List list) {
		return sqlSession.update("oSQL.trReady", list);
	}
	//tr입력VO 생성
	public OrderVO trReadyVO(int cno) {
		return sqlSession.selectOne("oSQL.trReadyVO", cno);
	}
	//
	public int trExec(OrderVO oVO) {
		return sqlSession.insert("oSQL.trExecute", oVO);
	}
}

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
	public List<OrderVO> estimateList(List list) {
		return sqlSession.selectList("oSQL.estCartList", list);
	}
	//cart거치지 않고 한개의 물품에 대한 내용 payment 전달
	public OrderVO estimateOnly(int gno) {
		return sqlSession.selectOne("oSQL.estCartOne", gno);
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
	//상위 transaction row
	public int trExecMo(OrderVO oVO) {
		return sqlSession.insert("oSQL.trExecMo", oVO);
	}
	//하위 transaction row
	public int trExecCh(OrderVO oVO) {
		return sqlSession.insert("oSQL.trExecCh", oVO);
	}
	//승인 후transaction 마무리작업
	public int trDone(int tno) {
		return sqlSession.update("oSQL.trDone", tno);
	}
	//승인 후transaction 마무리작업2
	public AddressVO trDone2(int tno) {
		return sqlSession.selectOne("oSQL.trDone2", tno);
	}
	//transaction row 확인
	public int trDoneTest(int tno) {
		return sqlSession.selectOne("oSQL.trDoneTest", tno);
	}
	//카트에 추가하려는 물품이 있는지 검사 
	public int isGoodsCart(OrderVO oVO) {
		return sqlSession.selectOne("oSQL.isGoodsCart", oVO);
	}
	//물건페이지에서 카트추가
	public int addCart(OrderVO oVO) {
		return sqlSession.insert("oSQL.addCart", oVO);
	}
	//mno 가져오기
	public int getMno(String id) {
		return sqlSession.selectOne("oSQL.getMno", id);
	}
	//cart 수량증가
	public int cartQtyPlus(int cno) {
		return sqlSession.update("oSQL.cartQtyPlus", cno);
	}
	//cart 수량감소
	public int cartQtyMinus(int cno) {
		return sqlSession.update("oSQL.cartQtyMinus", cno);
	}
	//cart 임의의수량
	public int cartQtyIn(OrderVO oVO) {
		return sqlSession.update("oSQL.cartQtyIn", oVO);
	}
	//trDone3 아 진짜 모르겠다 
	public OrderVO trDone3(int tno) {
		return sqlSession.selectOne("oSQL.trDone3", tno);
	}
}

package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.*;

public class ManagerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 관리자 회원보기
	public List<MemberVO> getMemberInfo() {
		return sqlSession.selectList("mgSQL.memberInfo");
	}
	
	// 관리자 회원보기 주문내역
	public List<ManagerVO> getOrderInfo(int mno) {
		return sqlSession.selectList("mgSQL.orderInfo", mno);
	}
	
	// 관리자 차트 라벨
	public List<ManagerVO> getLabels() {
		return sqlSession.selectList("mgSQL.getLabels");
	}
	
	// 관리자 QNA
	public List<ManagerVO> getQNAList() {
		return sqlSession.selectList("mgSQL.getQNA");
	}
	
	// 관리자 Mno
	public int getMngMno(String id) {
		return sqlSession.selectOne("mgSQL.getMno", id);
	}
	
	// 관리자 QNA 답변
	public int addAnswer(QnAVO qVO) {
		return sqlSession.insert("mgSQL.insertAnswer", qVO);
	}
	
	// 관리자 성별 차트 data
	public List<ManagerVO> getGenData() {
		return sqlSession.selectList("mgSQL.genData");
	}
	
	// 관리자 회원가입 차트 data
	public List<ManagerVO> getMonthJoinData() {
		return sqlSession.selectList("mgSQL.monthJoinData");
	}
	
	// 관리자 상품리스트
	public List<ManagerVO> getMngGoodsList() {
		return sqlSession.selectList("mgSQL.mngGoodsList");
	}
	
	// 관리자 상품정보
	public ManagerVO getMngGoodsInfo(String gno) {
		return sqlSession.selectOne("mgSQL.mngGoodsInfo", gno);
	}
	
	// 관리자 상품 이미지 업로드
	public int addGoodsImg (ImageVO iVO) {
		return sqlSession.insert("mgSQL.insertGoodsImg", iVO);
	}
	
	// 관리자 상품 등록
	public int addGoods(ManagerVO mgVO) {
		return sqlSession.insert("mgSQL.insertGoods", mgVO);
	}

}
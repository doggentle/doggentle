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

}

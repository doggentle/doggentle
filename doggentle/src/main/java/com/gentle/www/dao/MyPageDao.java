package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.gentle.www.vo.*;

public class MyPageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public MemberVO getMyInfo(String id) {
		return sqlSession.selectOne("mpSQL.getMyInfo", id);
	}
	public MemberVO getMember(String id) {
		return sqlSession.selectOne("mpSQL.getMember", id);
	}
	
	public List<GDetailVO> getCartList(String id) {
		return sqlSession.selectList("mpSQL.getCartList", id);
	}
	
	public List<GDetailVO> getTransacList(String id){
		return sqlSession.selectList("mpSQL.getTransacList", id);
	}
	public int getMemberCheck(MemberVO mVO) {
		return sqlSession.selectOne("mpSQL.getMemberCheck", mVO);
	}
	
	public int changePw(MemberVO mVO) {
		return sqlSession.update("mpSQL.changePw", mVO);
	}
	
	
	
	
	// 내 주소록 리스트 가져오기
	public List<AddressVO> getMyAddrList(String id){
		return sqlSession.selectList("mpSQL.myAddressList", id);
	}
}

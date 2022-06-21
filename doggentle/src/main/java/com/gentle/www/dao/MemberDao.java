package com.gentle.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.MemberVO;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
}

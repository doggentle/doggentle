package com.gentle.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.*;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
	
	// 회원, 관리자 확인
	public String ckLogin(String id) {
		return sqlSession.selectOne("mSQL.loginck", id);
	}
	
	// 회원가입, isshow default -> 'ext' 변경함
	public int addMember(MemberVO mVO) {
		return sqlSession.insert("mSQL.addMember", mVO);
	}
	
	// 회원가입 시, cert테이블 default isverify -> 'N'
	public int addCert(CertVO cVO) {
		return sqlSession.insert("mSQL.addCert", cVO);
	}
	
	// 메일의 링크요청 시 메일, 코드 파라미터로 cert테이블 확
	public CertVO getJoinCert(String mail) {
		return sqlSession.selectOne("mSQL.getJoinCert", mail);
	}
	
	// cert테이블 확인 후 member, cert 테이블 업데이트  
	public int certMno(int mno) {
		return sqlSession.update("mSQL.certMno", mno);
	}
	public int certCno(int cno) {
		return sqlSession.update("mSQL.certCno", cno);
	}
}

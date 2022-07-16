package com.gentle.www.dao;

import java.util.List;

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
	
	// member, cert 업데이트 후 가입기념 포인트 100
	public int addPoint(int mno) {
		return sqlSession.insert("mSQL.addPoint", mno);
	}
	
	//findidProc
	public MemberVO findidProc(String mail) {
		return sqlSession.selectOne("mSQL.getFindid", mail);
	}
	//findpwProc
	public String findpwProc(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.getFindpw", mVO);
	}
	//findpwProc 이후 비번 변
	public int findpwChange(MemberVO mVO) {
		return sqlSession.update("mSQL.pwChange", mVO);
	}
	
	//Getting Customer Information
	public MemberVO getCustInfo(String id) {
		return sqlSession.selectOne("mSQL.customerInfo", id);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.gentle.www.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.gentle.www.util.*;
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
   // 포인트리스트 카운트 가져오기
   public int getPointListCount(MyPageVO myVO) {
      return sqlSession.selectOne("mpSQL.getPointListCount", myVO);
   }
   // 포인트리스트 가져오기
   public List<MyPageVO> getPointList(HashMap<String, Object> map) {
      return sqlSession.selectList("mpSQL.getPointList", map);
   }
   // n년/n월 해당날짜 가져오기
   public List<String> getattend(MyPageVO myVO) {
	   return sqlSession.selectList("mpSQL.getAttend", myVO);
   } 
   
   //내 문의 리스트 가져오기
   public List<QnAVO> getQnaList(String id) {
      return sqlSession.selectList("mpSQL.qnaList", id);   
   }
   
   // 내 주소록 리스트 가져오기
   public List<AddressVO> getMyAddrList(String id){
      return sqlSession.selectList("mpSQL.myAddressList", id);
   }
}
package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.util.PageUtil;
import com.gentle.www.vo.*;

public class QnaDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//주문목록 조회 함수
	public List<QnAVO> getOrderList(QnAVO qVO){
		return sqlSession.selectList("qSQL.OrderList", qVO);
	}
	public List<ManagerVO> getOrderListed(String id){
		return sqlSession.selectList("qSQL.OrderListed", id);
	}
	//주문 상품목록 조회 함수
	public List<QnAVO> getOrderGoodsList(int tno){
		return sqlSession.selectList("qSQL.OrderGoodsList", tno);
	}
	
	  // 문의글 등록 
	public int qnaWrite(QnAVO qVO) { 
		return sqlSession.insert("qSQL.qnaWrite", qVO); 
	}
	// 문의글 등록 
	public int qnaWritee(QnAVO qVO) { 
		return sqlSession.insert("qSQL.qnaWritee", qVO); 
	}
	 

}
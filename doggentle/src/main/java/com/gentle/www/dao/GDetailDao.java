package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.GDetailVO;

public class GDetailDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//물품 상세정보 조회
	public GDetailVO gDetInfo(int gno){
		return sqlSession.selectOne("gSQL.gDetInfo", gno);
	}
	
	//타입이 다른 2개이상의 데이터가 꺼내지므로 VO에 담는다
	public List<GDetailVO> getStratCate(){
		
		return sqlSession.selectList("gSQL.startCate");
	}
	
	public List<GDetailVO> getCateList(GDetailVO gVO){
		
		return sqlSession.selectList("gSQL.cateList", gVO);
	}
	// 상품 리스트 조회 전담 처리함수
	public List<GDetailVO> getProductList(GDetailVO gVO){
		return sqlSession.selectList("gSQL.gList", gVO);
	}
}

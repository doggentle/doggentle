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
	
	//대카테고리
	public List<GDetailVO> getStratCate(){
		
		return sqlSession.selectList("gSQL.startCate");
	}
	//카테고리
	public List<GDetailVO> getCateList(GDetailVO gVO){
		
		return sqlSession.selectList("gSQL.cateList", gVO);
	}
	// 상품리스트 검색 조회 전담 처리함수
	public List<GDetailVO> getProductList(GDetailVO gVO){
		return sqlSession.selectList("gSQL.gList", gVO);
	}
	// 키워드 검색 전담 처리함수
	public List<GDetailVO> srcGoods(GDetailVO gVO){
		return sqlSession.selectList("gSQL.srcGoods", gVO);
	}
}

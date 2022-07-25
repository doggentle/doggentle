package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.*;

public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 리뷰 이미지
	public int addReviewImage(ImageVO iVO) {
		return sqlSession.insert("rSQL.reviewImage", iVO);
	}
	
	// 리뷰 작성시 이미지가 존재할 경우
	public int existReviewImage() {
		return sqlSession.selectOne("rSQL.existRevImg");
	}
	
	// 리뷰 작성 
	public int addReviewWrite(ReviewVO rVO) {
		return sqlSession.insert("rSQL.reviewWrite", rVO);
	}
	
	// 리뷰 작성 시 상품이름
	public String getReviewGname(int tno) {
		return sqlSession.selectOne("rSQL.reviewGname", tno);
	}
	
	// 작성한 리뷰 리스트 출력
	public List<ReviewVO> getReviewList(String id) {
		return sqlSession.selectList("rSQL.reviewList", id);
	}
}

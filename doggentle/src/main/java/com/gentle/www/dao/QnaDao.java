package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.util.PageUtil;
import com.gentle.www.vo.QnAVO;

public class QnaDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 리스트 조회 전담 처리함수
	public List<QnAVO> getList(PageUtil page){
		return sqlSession.selectList("qSQL.getList", page);
	}
}

package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.gentle.www.vo.ManagerVO;

public class MainDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	 
	//메인 새로운 상품
	public List<ManagerVO> getMainNew() {
		return sqlSession.selectList("mainSQL.mainNew");
	}
	// 메인 판매량 순
	public List<ManagerVO> getMainHit() {
		return sqlSession.selectList("mainSQL.mainHit");
	}
	
}

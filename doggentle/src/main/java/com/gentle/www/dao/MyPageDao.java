package com.gentle.www.dao;

import java.util.List;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.gentle.www.vo.*;

public class MyPageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public MemberVO getMyInfo(String id) {
		return sqlSession.selectOne("mpSQL.getMyInfo", id);
	}
	
	public List<GDetailVO> getCartList(String id) {
		return sqlSession.selectList("mpSQL.getCartList", id);
	}
	
	public List<GDetailVO> getTransacList(String id){
		return sqlSession.selectList("mpSQL.getTransacList", id);
	}
}

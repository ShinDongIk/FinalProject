package com.payalot.enjoyforott.favor.model.dao;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class favorDao {

	public int favor(SqlSessionTemplate sqlSession, HashMap<String,Object> good) {
		
		return sqlSession.insert("favormapper.insertfavor",good);
	}



	public int selectUser(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("favormapper.selectfavor",userId);
	}




}

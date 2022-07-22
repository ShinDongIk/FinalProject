package com.payalot.enjoyforott.favor.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.favor.model.dao.favorDao;
@Service
public class favorServiceImpl implements favorService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private favorDao favordao;
	

	@Override
	public int favor(HashMap<String,Object> good) {
		
		 int result = favordao.favor(sqlSession,good);
		
		return result;
	}


	@Override
	public int notfavor(HashMap<String, Object> good) {
		
		int result = favordao.notfavor(sqlSession,good);
				
		return result;
	}
	
	
	

}

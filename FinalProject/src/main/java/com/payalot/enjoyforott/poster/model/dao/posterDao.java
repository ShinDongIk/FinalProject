package com.payalot.enjoyforott.poster.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.poster.model.vo.Poster;

@Repository
public class posterDao {

	public int AutoInput(SqlSessionTemplate sqlSession,Poster pr) {
		
		
		return sqlSession.insert("postermapper.insertPoster", pr);
		
		
		
	}

	public ArrayList<Poster> listdo(SqlSessionTemplate sqlSession, String list) {
		
		
		return (ArrayList)sqlSession.selectList("postermapper.postselect",list);
	}

	public Poster detaildo(SqlSessionTemplate sqlSession, int postNo) {
		
		
		return sqlSession.selectOne("postermapper.postdetail",postNo);	}

	
}

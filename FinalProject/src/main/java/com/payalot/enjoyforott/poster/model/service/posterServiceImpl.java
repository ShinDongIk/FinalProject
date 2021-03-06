package com.payalot.enjoyforott.poster.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.crawl.crRank;
import com.payalot.enjoyforott.poster.model.dao.posterDao;
import com.payalot.enjoyforott.poster.model.vo.Poster;
import com.payalot.enjoyforott.poster.model.vo.PosterRank;

@Service
public class posterServiceImpl implements posterService{

	@Autowired
	private crRank crawl;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private posterDao posterdao;


	@Override
	public ArrayList<PosterRank> PostRank(String name) throws InterruptedException {
		return crawl.OttRank(name);
	}



	@Override
	public int AutoInput(Poster pr) {
		
		int result = posterdao.AutoInput(sqlSession, pr);
		
		return result;
	}



	@Override
	public ArrayList<Poster> PostAction(String list) {
		
		ArrayList<Poster> pt = posterdao.listdo(sqlSession, list);
		
		
		return pt;
	}



	@Override
	public Poster PostDetail(int postNo) {
		
		Poster pt = posterdao.detaildo(sqlSession, postNo);
		
		return pt;
	}



	
	
	
}

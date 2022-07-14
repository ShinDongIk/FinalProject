package com.payalot.enjoyforott.party.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.party.model.dao.PartyDao;

@Service
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyDao partyDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}

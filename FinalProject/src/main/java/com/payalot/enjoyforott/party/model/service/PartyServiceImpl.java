package com.payalot.enjoyforott.party.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.party.model.dao.PartyDao;
import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;

@Service
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyDao partyDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public OttType ottInfo(OttType o) {
		return partyDao.ottInfo(sqlSession,o);
	}

	@Override
	public ArrayList<Party> selectList() {
		return partyDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Party> findpartylist(String ottEng) {
		return partyDao.findpartylist(sqlSession, ottEng);
	}
	
	@Override
	public ArrayList<Party> selectEndDate() {
		return partyDao.selectEndDate(sqlSession);
	}

	@Override
	public Party selectParty(int partyNo) {
		return partyDao.selectParty(sqlSession, partyNo);
	}

	@Override
	public int enrollParty(Party p) {
		return partyDao.enrollParty(sqlSession, p);
	}

	@Override
	public int joinParty(PartyMember pm) {
		return partyDao.joinParty(sqlSession, pm);
	}

	@Override
	public int updateEndDateParty() {
		return partyDao.updateEndDateParty(sqlSession);
	}





}

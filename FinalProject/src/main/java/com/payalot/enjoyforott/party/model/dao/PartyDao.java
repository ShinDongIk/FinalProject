package com.payalot.enjoyforott.party.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;
import com.payalot.enjoyforott.party.model.vo.Payment;

@Repository
public class PartyDao {

	public OttType ottInfo(SqlSessionTemplate sqlSession, OttType o) {
		return sqlSession.selectOne("ottTypeMapper.ottInfo",o);
	}

	public ArrayList<Party> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("partyMapper.selectList");
	}

	public ArrayList<Party> selectEndDate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("partyMapper.selectEndDate");
	}

	public Party selectParty(SqlSessionTemplate sqlSession, int partyNo) {
		return sqlSession.selectOne("partyMapper.selectParty",partyNo);
	}

	public int enrollParty(SqlSessionTemplate sqlSession, Party p) {
		return sqlSession.insert("partyMapper.enrollParty",p);
	}

	public int updateEndDateParty(SqlSessionTemplate sqlSession) {
		return sqlSession.update("partyMapper.updateEndDateParty");
	}

	public int insertPayment(SqlSessionTemplate sqlSession, Payment payInfo) {
		return sqlSession.insert("partyMapper.insertPayment",payInfo);
	}

	public int insertPartyMember(SqlSessionTemplate sqlSession, PartyMember pm) {
		return sqlSession.insert("partyMapper.insertPartyMember",pm);
	}

	public Party selectPartyMemNum(SqlSessionTemplate sqlSession, int partyNo) {
		return sqlSession.selectOne("partyMapper.selectPartyMemNum",partyNo);
	}
	
	public int updateFullParty(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("partyMapper.updateFullParty",pno);
	}



}

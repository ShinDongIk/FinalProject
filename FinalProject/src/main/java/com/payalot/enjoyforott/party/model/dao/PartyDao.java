package com.payalot.enjoyforott.party.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;

@Repository
public class PartyDao {

	public OttType ottInfo(SqlSessionTemplate sqlSession, OttType o) {
		return sqlSession.selectOne("ottTypeMapper.ottInfo",o);
	}

	public ArrayList<Party> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("partyMapper.selectList");
	}
	
	public ArrayList<Party> findpartylist(SqlSessionTemplate sqlSession, String ottEng) {
		return (ArrayList)sqlSession.selectList("partyMapper.findpartylist",ottEng);
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

	public int joinParty(SqlSessionTemplate sqlSession, PartyMember pm) {
		return sqlSession.insert("partyMapper.joinParty",pm);
	}

	public int updateEndDateParty(SqlSessionTemplate sqlSession) {
		return sqlSession.update("partyMapper.updateEndDateParty");
	}



}

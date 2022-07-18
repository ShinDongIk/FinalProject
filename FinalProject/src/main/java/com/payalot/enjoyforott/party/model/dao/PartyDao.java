package com.payalot.enjoyforott.party.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;

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

}

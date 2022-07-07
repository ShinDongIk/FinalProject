package com.payalot.enjoyforott.memberModal.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.memberModal.model.vo.MemberModal;

@Repository
public class MemberModalDao {

	public MemberModal selectMember(SqlSessionTemplate sqlSession, String clickNickName) {
		return sqlSession.selectOne("memberModalMapper.selectMember", clickNickName);
	}

	public int insertDeclar(SqlSessionTemplate sqlSession, MemberModal mm) {
		return sqlSession.insert("memberModalMapper.insertDeclar", mm);
	}

}

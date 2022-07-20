package com.payalot.enjoyforott.memberModal.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.memberModal.model.dao.MemberModalDao;
import com.payalot.enjoyforott.memberModal.model.vo.MemberModal;

@Service
public class MemberModalServiceImpl implements MemberModalService{
	
	@Autowired
	MemberModalDao mmd;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public MemberModal selectMember(String clickNickName) {
		return mmd.selectMember(sqlSession,clickNickName);
	}

	@Override
	public int insertDeclar(MemberModal mm) {
		return mmd.insertDeclar(sqlSession,mm);
	}
	
}

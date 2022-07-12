package com.payalot.enjoyforott.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	public int inquiryAdminListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inquiryMapper.inquiryAdminListCount");
	}

	public int inquiryUserListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("inquiryMapper.inquiryUserListCount",userId);
	}

	public ArrayList<Inquiry> inquiryAdminList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.inquiryAdminList",null,rowBounds);
	}

	public ArrayList<Inquiry> inquiryUserList(SqlSessionTemplate sqlSession, String userId,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.inquiryUserList",userId,rowBounds);
	}








}

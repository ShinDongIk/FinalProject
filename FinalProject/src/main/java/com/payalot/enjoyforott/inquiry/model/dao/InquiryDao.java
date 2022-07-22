package com.payalot.enjoyforott.inquiry.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;
import com.payalot.enjoyforott.inquiry.model.vo.Reply;
import com.payalot.enjoyforott.inquiry.model.vo.Type;

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

	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		return sqlSession.insert("inquiryMapper.insertInquiry",iq);
	}
	
	public Inquiry inquiryUserDetailView(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.selectOne("inquiryMapper.inquiryUserDetail",inquiryNo);
	}

	public int deleteInquiry(SqlSessionTemplate sqlSession, int[] inquiryNo) {
		
		int result=0;
		
		for(int i=0;i<inquiryNo.length;i++) {
			result=sqlSession.delete("inquiryMapper.deleteInquiry",inquiryNo[i]);
		}
		
		return result;
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		return sqlSession.update("inquiryMapper.updateInquiry",iq);
	}

	public ArrayList<Type> type(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.type");
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("inquiryMapper.insertReply",r);
	}

	public int updateResult(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.update("inquiryMapper.updateResult",inquiryNo);
	}

	public Reply replyList(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.selectOne("inquiryMapper.replyList",inquiryNo);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("inquiryMapper.updateReply",r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int[] inquiryNo) {
		int result=0;
		for(int i=0;i<inquiryNo.length;i++) {
			result=sqlSession.delete("inquiryMapper.deleteReply",inquiryNo[i]);
		}
		return result;
	}

	public int updateResultDelete(SqlSessionTemplate sqlSession, int[] inquiryNo) {
		int result = 0;
		for(int i=0;i<inquiryNo.length;i++) {
			result=sqlSession.update("inquiryMapper.updateResultDelete",inquiryNo[i]);
		}
		return result;
	}

	public int inquiryUserSearchTitleCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("inquiryMapper.userSearchTitleCount",map);
	}

	public ArrayList<Inquiry> inquiryUserSearchTitle(SqlSessionTemplate sqlSession, HashMap<String, String> map,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.userSearchTitle",map,rowBounds);
	}

	public int inquiryUserSearchContentCount(SqlSessionTemplate sqlSession,HashMap<String, String> map) {
		return sqlSession.selectOne("inquiryMapper.userSearchContentCount",map);
	}

	public ArrayList<Inquiry> inquiryUserSearchContent(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.userContentWriter",map,rowBounds);
	}

	public int inquiryAdminsearchTitleCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("inquiryMapper.adminSearchTitleCount",keyword);
	}

	public ArrayList<Inquiry> inquiryAdminsearchTitle(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.adminSearchTitle",keyword,rowBounds);
	}

	public int inquiryAdminsearchWriterCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("inquiryMapper.adminSearchWriterCount",keyword);
	}

	public ArrayList<Inquiry> inquiryAdminsearchWriter(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.adminSearchWriter",keyword,rowBounds);
	}


	
	










}

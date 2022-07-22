package com.payalot.enjoyforott.inquiry.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.dao.InquiryDao;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;
import com.payalot.enjoyforott.inquiry.model.vo.Reply;
import com.payalot.enjoyforott.inquiry.model.vo.Type;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int inquiryAdminListCount() {
		return inquiryDao.inquiryAdminListCount(sqlSession);
	}
	
	@Override
	public int inquiryUserListCount(String userId) {
		return inquiryDao.inquiryUserListCount(sqlSession,userId);
	}
	
	@Override
	public ArrayList<Inquiry> inquiryAdminList(PageInfo pi) {
		return inquiryDao.inquiryAdminList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Inquiry> inquiryUserList(PageInfo pi, String userId) {
		return inquiryDao.inquiryUserList(sqlSession,userId,pi);
	}

	@Override
	public int insertInquiry(Inquiry iq) {
		return inquiryDao.insertInquiry(sqlSession,iq);
	}

	@Override
	public Inquiry inquiryUserDetailView(int inquiryNo) {
		return inquiryDao.inquiryUserDetailView(sqlSession,inquiryNo);
	}

	@Override
	public int deleteInquiry(int[] inquiryNo) {
		return inquiryDao.deleteInquiry(sqlSession,inquiryNo);
	}

	@Override
	public int updateInquiry(Inquiry iq) {
		return inquiryDao.updateInquiry(sqlSession,iq);
	}

	@Override
	public ArrayList<Type> type() {
		return inquiryDao.type(sqlSession);
	}

	@Override
	public int insertReply(Reply r) {
		return inquiryDao.insertReply(sqlSession,r);
	}

	@Override
	public int updateResult(int inquiryNo) {
		return inquiryDao.updateResult(sqlSession,inquiryNo);
	}
	
	@Override
	public Reply replyList(int inquiryNo) {
		return inquiryDao.replyList(sqlSession,inquiryNo);
	}

	@Override
	public int updateReply(Reply r) {
		return inquiryDao.updateReply(sqlSession,r);
	}

	@Override
	public int deleteReply(int[] inquiryNo) {
		return inquiryDao.deleteReply(sqlSession,inquiryNo);
	}

	@Override
	public int updateResultDelete(int[] inquiryNo) {
		return inquiryDao.updateResultDelete(sqlSession,inquiryNo);
	}

	@Override
	public int inquiryUserSearchTitleCount(HashMap<String, String> map) {
		return inquiryDao.inquiryUserSearchTitleCount(sqlSession,map);
	}
	
	@Override
	public ArrayList<Inquiry> inquiryUserSearchTitle(HashMap<String, String> map,PageInfo pi) {
		return inquiryDao.inquiryUserSearchTitle(sqlSession, map,pi);
	}

	@Override
	public int inquiryUserSearchContentCount(HashMap<String, String> map) {
		return inquiryDao.inquiryUserSearchContentCount(sqlSession,map);
	}

	@Override
	public ArrayList<Inquiry> inquiryUserSearchContent(HashMap<String, String> map,PageInfo pi) {
		return inquiryDao.inquiryUserSearchContent(sqlSession, map,pi);
	}

	@Override
	public int inquiryAdminSearchTitleCount(String keyword) {
		return inquiryDao.inquiryAdminsearchTitleCount(sqlSession,keyword);
	}

	@Override
	public ArrayList<Inquiry> inquiryAdminSearchTitle(String keyword, PageInfo pi) {
		return inquiryDao.inquiryAdminsearchTitle(sqlSession, keyword,pi);
	}

	@Override
	public int inquiryAdminSearchWriterCount(String keyword) {
		return inquiryDao.inquiryAdminsearchWriterCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Inquiry> inquiryAdminSearchWriter(String keyword, PageInfo pi) {
		return inquiryDao.inquiryAdminsearchWriter(sqlSession, keyword,pi);
	}

















}

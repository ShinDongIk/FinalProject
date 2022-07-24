package com.kh.m.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.m.common.model.vo.PageInfo;
import com.kh.m.inquiry.model.dao.InquiryDao;
import com.kh.m.inquiry.model.vo.Inquiry;

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
		return 0;
	}

	@Override
	public Inquiry inquiryAdminDetailView(int inquiryNo) {
		return null;
	}

	@Override
	public Inquiry inquiryUserDetailView(String userId) {
		return null;
	}

	@Override
	public int updateInquiry(int inquiryNo) {
		return 0;
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		return 0;
	}













}

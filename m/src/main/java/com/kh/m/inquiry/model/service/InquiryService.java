package com.kh.m.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.m.common.model.vo.PageInfo;
import com.kh.m.inquiry.model.vo.Inquiry;

@Service
public interface InquiryService {
	
	//1:1관리자 문의 개수
	int inquiryAdminListCount();
	
	//1:1사용자 문의 개수
	int inquiryUserListCount(String userId);
	
	//1:1문의 관리자 리스트
	ArrayList<Inquiry> inquiryAdminList(PageInfo pi);
	
	//1:1문의 사용자 리스트
	ArrayList<Inquiry> inquiryUserList(PageInfo pi,String userId);
	
	//1:1문의 작성
	int insertInquiry(Inquiry iq);
	
	//1:1문의 관리자 상세보기
	Inquiry inquiryAdminDetailView(int inquiryNo);
	
	//1:1문의 사용자 상세보기
	Inquiry inquiryUserDetailView(String userId);
	
	//1:1문의 수정
	int updateInquiry(int inquiryNo);
	
	//1:1문의 삭제
	int deleteInquiry(int inquiryNo);
	
	
	
	
	
	
	
	
}

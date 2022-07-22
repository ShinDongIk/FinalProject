package com.payalot.enjoyforott.inquiry.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;
import com.payalot.enjoyforott.inquiry.model.vo.Reply;
import com.payalot.enjoyforott.inquiry.model.vo.Type;

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
	
	//1:1문의 상세보기
	Inquiry inquiryUserDetailView(int inquiryNo);
	
	//1:1문의 삭제
	int deleteInquiry(int[] inquiryNo);

	//1:1문의 수정
	int updateInquiry(Inquiry i);
	
	//카테고리 리스트
	ArrayList<Type> type();
	
	//답글 작성
	int insertReply(Reply r);
	
	//답글 작성 후 1:1문의 처리 결과 변경
	int updateResult(int inquiryNo);
	
	
	//답글 리스트
	Reply replyList(int inquiryNo);
	
	//답글 수정
	int updateReply(Reply r);
	
	//답글 삭제
	int deleteReply(int[] inquiryNo);
	
	//답글 삭제 후 1:1문의 처리 결과 변경
	int updateResultDelete(int[] inquiryNo);
	
	//사용자 1:1문의 제목 검색 게시글 수
	int inquiryUserSearchTitleCount(HashMap<String, String> map);
	
	//사용자 1:1문의 제목 검색
	ArrayList<Inquiry> inquiryUserSearchTitle(HashMap<String, String> map,PageInfo pi);

	//사용자 1:1문의 내용 검색 게시글 수
	int inquiryUserSearchContentCount(HashMap<String, String> map);
	
	//사용자 1:1문의 내용 검색
	ArrayList<Inquiry> inquiryUserSearchContent(HashMap<String, String> map,PageInfo pi);
	
	//관리자 1:1문의 제목 검색 게시글 수
	int inquiryAdminSearchTitleCount(String keyword);
	
	//관리자 1:1문의 제목 검색
	ArrayList<Inquiry> inquiryAdminSearchTitle(String keyword,PageInfo pi);

	//관리자 1:1문의 작성자 검색 게시글 수
	int inquiryAdminSearchWriterCount(String keyword);
	
	//사용자 1:1문의 작성자 검색
	ArrayList<Inquiry> inquiryAdminSearchWriter(String keyword,PageInfo pi);

	
	
	
	
}

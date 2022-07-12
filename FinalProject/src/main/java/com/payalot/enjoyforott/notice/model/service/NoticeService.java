package com.payalot.enjoyforott.notice.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.notice.model.vo.Board;

@Service
public interface NoticeService {
	
	//공지사항 작성
	int insertNotice(Board b);

	//공지사항 개수
	int selectNoticeListCount();
	
	//공지사항 리스트
	ArrayList<Board> selectNoticeList(PageInfo pi);
	
	//공지사항 조회수 증가
	int increaseCount(int boardNo);
	
	//공지사항 상세보기
	Board noticeDetailView(int boardNo);
	
	//공지사항 수정
	int updateNotice(Board b);
	
	//공지사항 삭제
	int deleteNotice(int[] boardNo);
	
	//공지사항 제목 검색 개수
	int searchNoticeTitleList(String search);
	
	//공지사항 내용 검색 개수
	int searchNoticeContentList(String search);
	
	//공지사항 제목 검색
	ArrayList<Board> searchNoticeTitle(String search,PageInfo pi);
	
	//공지사항 내용 검색
	ArrayList<Board> searchNoticeContent(String search,PageInfo pi);
	
	
	//faq 작성
	int insertFaq(Board b);

	//faq 개수
	int selectFaqListCount();
	
	//faq 리스트
	ArrayList<Board> selectFaqList(PageInfo pi);
	
	//faq 제목 검색 개수
	int searchFaqTitleList(String search);
	
	//faq 내용 검색 개수
	int searchFaqContentList(String search);
	
	//faq 제목 검색
	ArrayList<Board> searchFaqTitle(String search,PageInfo pi);

	//faq 내용 검색
	ArrayList<Board> searchFaqContent(String search,PageInfo pi);
	
}

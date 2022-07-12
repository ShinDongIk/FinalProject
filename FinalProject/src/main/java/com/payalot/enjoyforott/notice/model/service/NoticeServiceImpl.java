package com.payalot.enjoyforott.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.notice.model.dao.NoticeDao;
import com.payalot.enjoyforott.notice.model.vo.Board;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 작성
	@Override
	public int insertNotice(Board b) {
		return noticeDao.insertNotice(sqlSession,b);
	}

	//공지사항 개수
	@Override
	public int selectNoticeListCount() {
		return noticeDao.selectNoticeListCount(sqlSession);
	}
	
	//공지사항 리스트
	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession,pi);
	}

	//조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return noticeDao.increaseNoticeCount(sqlSession,boardNo);
	}

	//공지사항 상세보기
	@Override
	public Board noticeDetailView(int boardNo) {
		return noticeDao.noticeDetailView(sqlSession,boardNo);
	}

	//공지사항 수정
	@Override
	public int updateNotice(Board b) {
		return noticeDao.updateNotice(sqlSession,b);
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(int[] boardNo) {
		return noticeDao.deleteNotice(sqlSession,boardNo);
	}

	//공지사항 제목 검색 개수
	@Override
	public int searchNoticeTitleList(String search) {
		return noticeDao.searchNoticeTitleList(sqlSession, search);
	}
	
	//공지사항 내용 검색 개수
	@Override
	public int searchNoticeContentList(String search) {
		return noticeDao.searchNoticeContent(sqlSession,search);
	}

	//공지사항 제목 검색
	@Override
	public ArrayList<Board> searchNoticeTitle(String search, PageInfo pi) {
		return noticeDao.searchNoticeTitle(sqlSession,search,pi);
	}
	
	//공지사항 내용 검색
	@Override
	public ArrayList<Board> searchNoticeContent(String search, PageInfo pi) {
		return noticeDao.searchNoticeContent(sqlSession,search,pi);
	}

	//faq 개수
	@Override
	public int selectFaqListCount() {
		return noticeDao.selectFaqListCount(sqlSession);
	}
	
	//faq 리스트
	@Override
	public ArrayList<Board> selectFaqList(PageInfo pi) {
		return noticeDao.selectfaqList(sqlSession,pi);
	}
	
	//faq 작성
	@Override
	public int insertFaq(Board b) {
		return noticeDao.insertFaq(sqlSession,b);
	}

	//faq 제목 검색 개수
	@Override
	public int searchFaqTitleList(String search) {
		return noticeDao.searchFaqTitleList(sqlSession,search);
	}

	//faq 내용 검색 개수
	@Override
	public int searchFaqContentList(String search) {
		return noticeDao.searchFaqContent(sqlSession,search);
	}

	//faq 제목 검색
	@Override
	public ArrayList<Board> searchFaqTitle(String search, PageInfo pi) {
		return noticeDao.searchFaqTitle(sqlSession,search,pi);
	}

	//faq 내용 검색
	@Override
	public ArrayList<Board> searchFaqContent(String search, PageInfo pi) {
		return noticeDao.searchFaqContent(sqlSession,search,pi);
	}


}

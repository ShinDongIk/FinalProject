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
	
	//�������� �ۼ�
	@Override
	public int insertNotice(Board b) {
		return noticeDao.insertNotice(sqlSession,b);
	}

	//�������� ����
	@Override
	public int selectNoticeListCount() {
		return noticeDao.selectNoticeListCount(sqlSession);
	}
	
	//�������� ����Ʈ
	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession,pi);
	}

	//��ȸ�� ����
	@Override
	public int increaseCount(int boardNo) {
		return noticeDao.increaseNoticeCount(sqlSession,boardNo);
	}

	//�������� �󼼺���
	@Override
	public Board noticeDetailView(int boardNo) {
		return noticeDao.noticeDetailView(sqlSession,boardNo);
	}

	//�������� ����
	@Override
	public int updateNotice(Board b) {
		return noticeDao.updateNotice(sqlSession,b);
	}

	//�������� ����
	@Override
	public int deleteNotice(int[] boardNo) {
		return noticeDao.deleteNotice(sqlSession,boardNo);
	}

	//�������� ���� �˻� ����
	@Override
	public int searchNoticeTitleList(String search) {
		return noticeDao.searchNoticeTitleList(sqlSession, search);
	}
	
	//�������� ���� �˻� ����
	@Override
	public int searchNoticeContentList(String search) {
		return noticeDao.searchNoticeContent(sqlSession,search);
	}

	//�������� ���� �˻�
	@Override
	public ArrayList<Board> searchNoticeTitle(String search, PageInfo pi) {
		return noticeDao.searchNoticeTitle(sqlSession,search,pi);
	}
	
	//�������� ���� �˻�
	@Override
	public ArrayList<Board> searchNoticeContent(String search, PageInfo pi) {
		return noticeDao.searchNoticeContent(sqlSession,search,pi);
	}

	//faq ����
	@Override
	public int selectFaqListCount() {
		return noticeDao.selectFaqListCount(sqlSession);
	}
	
	//faq ����Ʈ
	@Override
	public ArrayList<Board> selectFaqList(PageInfo pi) {
		return noticeDao.selectfaqList(sqlSession,pi);
	}
	
	//faq �ۼ�
	@Override
	public int insertFaq(Board b) {
		return noticeDao.insertFaq(sqlSession,b);
	}

	//faq ���� �˻� ����
	@Override
	public int searchFaqTitleList(String search) {
		return noticeDao.searchFaqTitleList(sqlSession,search);
	}

	//faq ���� �˻� ����
	@Override
	public int searchFaqContentList(String search) {
		return noticeDao.searchFaqContent(sqlSession,search);
	}

	//faq ���� �˻�
	@Override
	public ArrayList<Board> searchFaqTitle(String search, PageInfo pi) {
		return noticeDao.searchFaqTitle(sqlSession,search,pi);
	}

	//faq ���� �˻�
	@Override
	public ArrayList<Board> searchFaqContent(String search, PageInfo pi) {
		return noticeDao.searchFaqContent(sqlSession,search,pi);
	}


}

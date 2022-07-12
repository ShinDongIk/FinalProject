package com.payalot.enjoyforott.notice.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.notice.model.vo.Board;

@Service
public interface NoticeService {
	
	//�������� �ۼ�
	int insertNotice(Board b);

	//�������� ����
	int selectNoticeListCount();
	
	//�������� ����Ʈ
	ArrayList<Board> selectNoticeList(PageInfo pi);
	
	//�������� ��ȸ�� ����
	int increaseCount(int boardNo);
	
	//�������� �󼼺���
	Board noticeDetailView(int boardNo);
	
	//�������� ����
	int updateNotice(Board b);
	
	//�������� ����
	int deleteNotice(int[] boardNo);
	
	//�������� ���� �˻� ����
	int searchNoticeTitleList(String search);
	
	//�������� ���� �˻� ����
	int searchNoticeContentList(String search);
	
	//�������� ���� �˻�
	ArrayList<Board> searchNoticeTitle(String search,PageInfo pi);
	
	//�������� ���� �˻�
	ArrayList<Board> searchNoticeContent(String search,PageInfo pi);
	
	
	//faq �ۼ�
	int insertFaq(Board b);

	//faq ����
	int selectFaqListCount();
	
	//faq ����Ʈ
	ArrayList<Board> selectFaqList(PageInfo pi);
	
	//faq ���� �˻� ����
	int searchFaqTitleList(String search);
	
	//faq ���� �˻� ����
	int searchFaqContentList(String search);
	
	//faq ���� �˻�
	ArrayList<Board> searchFaqTitle(String search,PageInfo pi);

	//faq ���� �˻�
	ArrayList<Board> searchFaqContent(String search,PageInfo pi);
	
}

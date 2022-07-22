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
	
	//1:1������ ���� ����
	int inquiryAdminListCount();
	
	//1:1����� ���� ����
	int inquiryUserListCount(String userId);
	
	//1:1���� ������ ����Ʈ
	ArrayList<Inquiry> inquiryAdminList(PageInfo pi);
	
	//1:1���� ����� ����Ʈ
	ArrayList<Inquiry> inquiryUserList(PageInfo pi,String userId);
	
	//1:1���� �ۼ�
	int insertInquiry(Inquiry iq);
	
	//1:1���� �󼼺���
	Inquiry inquiryUserDetailView(int inquiryNo);
	
	//1:1���� ����
	int deleteInquiry(int[] inquiryNo);

	//1:1���� ����
	int updateInquiry(Inquiry i);
	
	//ī�װ� ����Ʈ
	ArrayList<Type> type();
	
	//��� �ۼ�
	int insertReply(Reply r);
	
	//��� �ۼ� �� 1:1���� ó�� ��� ����
	int updateResult(int inquiryNo);
	
	
	//��� ����Ʈ
	Reply replyList(int inquiryNo);
	
	//��� ����
	int updateReply(Reply r);
	
	//��� ����
	int deleteReply(int[] inquiryNo);
	
	//��� ���� �� 1:1���� ó�� ��� ����
	int updateResultDelete(int[] inquiryNo);
	
	//����� 1:1���� ���� �˻� �Խñ� ��
	int inquiryUserSearchTitleCount(HashMap<String, String> map);
	
	//����� 1:1���� ���� �˻�
	ArrayList<Inquiry> inquiryUserSearchTitle(HashMap<String, String> map,PageInfo pi);

	//����� 1:1���� ���� �˻� �Խñ� ��
	int inquiryUserSearchContentCount(HashMap<String, String> map);
	
	//����� 1:1���� ���� �˻�
	ArrayList<Inquiry> inquiryUserSearchContent(HashMap<String, String> map,PageInfo pi);
	
	//������ 1:1���� ���� �˻� �Խñ� ��
	int inquiryAdminSearchTitleCount(String keyword);
	
	//������ 1:1���� ���� �˻�
	ArrayList<Inquiry> inquiryAdminSearchTitle(String keyword,PageInfo pi);

	//������ 1:1���� �ۼ��� �˻� �Խñ� ��
	int inquiryAdminSearchWriterCount(String keyword);
	
	//����� 1:1���� �ۼ��� �˻�
	ArrayList<Inquiry> inquiryAdminSearchWriter(String keyword,PageInfo pi);

	
	
	
	
}

package com.payalot.enjoyforott.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;

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
	
	//1:1���� ������ �󼼺���
	Inquiry inquiryAdminDetailView(int inquiryNo);
	
	//1:1���� ����� �󼼺���
	Inquiry inquiryUserDetailView(String userId);
	
	//1:1���� ����
	int updateInquiry(int inquiryNo);
	
	//1:1���� ����
	int deleteInquiry(int inquiryNo);
	
	
	
	
	
	
	
	
}

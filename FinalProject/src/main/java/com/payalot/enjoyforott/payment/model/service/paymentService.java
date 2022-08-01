package com.payalot.enjoyforott.payment.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.payment.model.vo.payment;

public interface paymentService {
	
	//리스트 조회 + 페이징처리
	
	//전체 개수 구하기
	int selectPaymentCount(String userId);
	
	//리스트 조회
	ArrayList<payment> selectPayment(PageInfo pi,String userId);
	
	

}

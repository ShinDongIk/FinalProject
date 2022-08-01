package com.payalot.enjoyforott.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.payment.model.dao.paymentDao;
import com.payalot.enjoyforott.payment.model.vo.payment;

@Service
public class paymentServiceImple implements paymentService{

	@Autowired
	private paymentDao paymentDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectPaymentCount(String userId) {
		
		return paymentDao.selectPaymentCount(sqlSession,userId);
	}

	@Override
	public ArrayList<payment> selectPayment(PageInfo pi, String userId) {
		
		return paymentDao.selectPayment(sqlSession,pi,userId);
	}

}

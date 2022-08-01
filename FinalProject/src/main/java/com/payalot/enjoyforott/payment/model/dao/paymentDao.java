package com.payalot.enjoyforott.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.payment.model.vo.payment;

@Repository
public class paymentDao {

	public int selectPaymentCount(SqlSessionTemplate sqlSession,String userId) {
		
		return sqlSession.selectOne("paymentMapper.selectPaymentCount",userId);
	}

	public ArrayList<payment> selectPayment(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("paymentMapper.selectPayment",userId, rowBounds);
	}

}

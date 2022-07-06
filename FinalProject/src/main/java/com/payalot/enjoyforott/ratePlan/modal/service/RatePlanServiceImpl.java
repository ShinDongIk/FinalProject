package com.payalot.enjoyforott.ratePlan.modal.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.ratePlan.modal.dao.RatePlanDao;
import com.payalot.enjoyforott.ratePlan.modal.vo.RatePlan;

@Service
public class RatePlanServiceImpl implements RatePlanService{
	
	@Autowired
	RatePlanDao ratePlanDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertRatePlan(RatePlan rp) {
		return ratePlanDao.insertRatePlan(sqlSession,rp);
	}

	@Override
	public int updateRatePlan(RatePlan rp) {
		return ratePlanDao.updateRatePlan(sqlSession,rp);
	}

	@Override
	public int deleteRatePlan(int priceInfoNo) {
		return ratePlanDao.deleteRatePlan(sqlSession,priceInfoNo);
	}

	@Override
	public ArrayList<RatePlan> searchData(String ottName) {
		return ratePlanDao.searchData(sqlSession,ottName);
	}

	@Override
	public RatePlan searchRatePlan(int priceInfoNo) {
		return ratePlanDao.searchRatePlan(sqlSession,priceInfoNo);
	}

	
}

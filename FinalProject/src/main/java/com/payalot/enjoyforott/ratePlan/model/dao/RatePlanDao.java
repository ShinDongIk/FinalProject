package com.payalot.enjoyforott.ratePlan.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.ratePlan.model.vo.RatePlan;

@Repository
public class RatePlanDao {

	public int insertRatePlan(SqlSessionTemplate sqlSession, RatePlan rp) {
		return sqlSession.insert("rateplanMapper.insertRatePlan",rp);
	}

	public ArrayList<RatePlan> searchData(SqlSessionTemplate sqlSession, String ottName) {
		return (ArrayList)sqlSession.selectList("rateplanMapper.searchData", ottName);
	}

	public int deleteRatePlan(SqlSessionTemplate sqlSession, int priceInfoNo) {
		return sqlSession.update("rateplanMapper.deleteRatePlan", priceInfoNo);
	}

	public int updateRatePlan(SqlSessionTemplate sqlSession, RatePlan rp) {
		return sqlSession.update("rateplanMapper.updateRatePlan", rp);
	}

	public RatePlan searchRatePlan(SqlSessionTemplate sqlSession, int priceInfoNo) {
		return sqlSession.selectOne("rateplanMapper.searchRatePlan", priceInfoNo);
	}
}

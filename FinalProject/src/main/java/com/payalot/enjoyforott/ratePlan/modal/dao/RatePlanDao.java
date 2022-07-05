package com.payalot.enjoyforott.ratePlan.modal.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.ratePlan.modal.vo.RatePlan;

@Repository
public class RatePlanDao {

	public int insertRatePlan(SqlSessionTemplate sqlSession, RatePlan rp) {
		return sqlSession.insert("rateplanMapper.insertRatePlan",rp);
	}

	public ArrayList<RatePlan> searchData(SqlSessionTemplate sqlSession, String ottName) {
		return (ArrayList)sqlSession.selectList("rateplanMapper.searchData", ottName);
	}
}

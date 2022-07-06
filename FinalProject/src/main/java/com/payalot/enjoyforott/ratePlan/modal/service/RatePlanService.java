package com.payalot.enjoyforott.ratePlan.modal.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.ratePlan.modal.vo.RatePlan;

public interface RatePlanService {

	//ott 가격정보 등록 부분
	public abstract int insertRatePlan(RatePlan rp);
	
	//ott 가격정보 수정 부분
	public abstract int updateRatePlan(RatePlan rp);
	
	//ott 가격정보 삭제 부분
	public abstract int deleteRatePlan(int priceInfoNo);
	
	//ajax를 통해 ott별 가격정보 가져오는 메소드
	public abstract ArrayList<RatePlan> searchData(String ottName);
	
	//ott 가격정보 가져오는 메소드
	public abstract RatePlan searchRatePlan(int priceInfoNo);
}

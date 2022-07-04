package com.payalot.enjoyforott.ratePlan.modal.service;

import com.payalot.enjoyforott.ratePlan.modal.vo.RatePlan;

public interface RatePlanService {

	//ott 가격정보 불러오는 부분
	public abstract RatePlan selectRatePlan(int ottName);
	
	//ott 가격정보 등록 부분
	public abstract int insertRatePlan(RatePlan rp);
	
	//ott 가격정보 수정 부분
	public abstract int updateRatePlan(RatePlan rp);
	
	//ott 가격정보 삭제 부분
	public abstract int deleteRatePlan(int priceInfoNo);
}

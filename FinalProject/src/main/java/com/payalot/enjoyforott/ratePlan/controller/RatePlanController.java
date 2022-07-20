package com.payalot.enjoyforott.ratePlan.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.payalot.enjoyforott.ratePlan.model.service.RatePlanService;
import com.payalot.enjoyforott.ratePlan.model.vo.RatePlan;

@Controller
public class RatePlanController {

	@Autowired
	RatePlanService ratePlanService;
	
	//ott 가격정보 페이지 이동 메소드
	@RequestMapping(value="watch.ra")
	public String goToRatePlan() {
		return "ratePlan/ratePlan";
	}
	
	//ott 가격정보 등록 페이지 이동 메소드
	@RequestMapping(value="enroll.ra")
	public String goToRatePlanEnrollFrom() {
		return "ratePlan/ratePlanEnrollFrom";
	}
	
	//ott 가격정보 등록 메소드
	@RequestMapping(value="insert.ra")
	public String insertRatePlan(RatePlan rp,HttpSession session) {
		
		int result = ratePlanService.insertRatePlan(rp);
		if(result>0) {
			session.setAttribute("alertMsg", "OTT 가격 정보가 등록되었습니다!");
		}else {
			session.setAttribute("alertMsg", "OTT 가격 정보가 등록 실패 하였습니다! 다시 등록해 주세요!");
		}
		return "redirect:watch.ra";
	}
	
	//ajax를 통해 ott별 가격정보 가져오는 메소드
	@ResponseBody
	@RequestMapping(value="searchOtt.ra",produces="application/json; charset=UTF-8")
	public String searchData(String ottName) {
		ArrayList<RatePlan> list = ratePlanService.searchData(ottName);
		return new Gson().toJson(list);
	}
	
	//ott 가격정보 삭제 메소드
	@RequestMapping(value="delete.ra")
	public String deleteRatePlan(int priceInfoNo,HttpSession session) {
		int result = ratePlanService.deleteRatePlan(priceInfoNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "OTT 가격정보가 삭제 완료 되었습니다!");
		}else {
			session.setAttribute("alertMsg", "OTT 가격정보 삭제하는데 실패하였습니다!");
		}
		
		return "redirect:watch.ra";
	}
	
	//ott 가격정보 수정 페이지 이동 메소드
	@RequestMapping(value="updateEnroll.ra")
	public ModelAndView goToUpdateEnroll(int priceInfoNo,ModelAndView mv) {
		RatePlan rp = ratePlanService.searchRatePlan(priceInfoNo);
				
		mv.addObject("rp", rp);
		mv.setViewName("ratePlan/ratePlanUpdateForm");
				
		return mv;
	}
	
	//ott 가격정보 수정 메소드
	@RequestMapping(value="update.ra")
	public String updateRatePlan(RatePlan rp,HttpSession session) {
		int result = ratePlanService.updateRatePlan(rp);
			
		if(result>0) {
			session.setAttribute("alertMsg", "OTT 가격정보가 수정 완료 되었습니다!");
		}else {
			session.setAttribute("alertMsg", "OTT 가격정보 수정이 실패하였습니다!");
		}
			
		return "redirect:watch.ra";
	}
}

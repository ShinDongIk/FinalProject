package com.payalot.enjoyforott.ratePlan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RatePlanController {

	@RequestMapping(value="watch.ra")
	public String goToRatePlan() {
		return "ratePlan/ratePlan";
	}
	
	@RequestMapping(value="insert.ra")
	public String goToRatePlanEnrollFrom() {
		return "ratePlan/ratePlanEnrollFrom";
	}
}

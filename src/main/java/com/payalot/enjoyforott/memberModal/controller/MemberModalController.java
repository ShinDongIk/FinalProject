package com.payalot.enjoyforott.memberModal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.payalot.enjoyforott.memberModal.model.service.MemberModalService;
import com.payalot.enjoyforott.memberModal.model.vo.MemberModal;

@Controller
public class MemberModalController {
	
	@Autowired
	MemberModalService mms;
	
	@ResponseBody
	@RequestMapping(value="find.mo", produces="application/json; charset=UTF-8")
	public String selectMember(String clickNickName) {
		MemberModal mm = mms.selectMember(clickNickName);
		return new Gson().toJson(mm);
	}
	
	@ResponseBody
	@RequestMapping(value="deInsert.mo", produces="application/json; charset=UTF-8")
	public String insertDeclar(MemberModal mm) {
		int result = mms.insertDeclar(mm);
		
		if(result>0) {
			return new Gson().toJson("NNNNY");
		}else {
			return new Gson().toJson("NNNNN");
		}
	}
}

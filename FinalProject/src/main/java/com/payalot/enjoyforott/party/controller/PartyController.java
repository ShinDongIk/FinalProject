package com.payalot.enjoyforott.party.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payalot.enjoyforott.party.model.service.PartyService;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	//파티리스트 폼 이동
	@RequestMapping("partylist.pa")
	public String partylist() {
		return "party/partyList";
	}
	
	//신규파티등록 폼 이동
	@RequestMapping("partyenrollForm.pa")
	public String partyenrollForm() {
		return "party/partyEnrollForm";
	}

}

package com.payalot.enjoyforott.party.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.payalot.enjoyforott.party.model.service.PartyService;
import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	//파티리스트 폼 이동
	@RequestMapping("partylist.pa")
	public String partylist(Model model) {
		
		ArrayList<Party> list = partyService.selectList();
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "party/partyList";
	}
	
	
	/* 신규파티 등록 */
	
	//신규파티등록 폼 이동
	@RequestMapping("partyenrollForm.pa")
	public String partyenrollForm() {
		
		return "party/partyEnrollForm";
	}
	
	//OTT 아이콘 클릭시 OTT_PRICE_LIST에서 플랜 정보가져옴
	@RequestMapping(value="ottInfo.pa", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void ottInfo(OttType o, Model model) {
		
		OttType ottInfo = partyService.ottInfo(o);
		
		//금액, 인원 숫자만 추출
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace(",", ""));
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace("원", ""));
		ottInfo.setProfilesNum(ottInfo.getProfilesNum().replace(",", ""));
		ottInfo.setProfilesNum(ottInfo.getProfilesNum().replace("개", ""));
		
		int newMonthPrice = Integer.parseInt(ottInfo.getMonthPrice());
		int newProfilesNum = Integer.parseInt(ottInfo.getProfilesNum());
		
		ottInfo.setPerOneMonthPrice((int)Math.ceil((double)newMonthPrice/newProfilesNum));
		System.out.println(ottInfo.getPerOneMonthPrice()); //일수 가져와서 계산해야함
		System.out.println(ottInfo);
		
		model.addAttribute("ottInfo", ottInfo);

	}
	

}

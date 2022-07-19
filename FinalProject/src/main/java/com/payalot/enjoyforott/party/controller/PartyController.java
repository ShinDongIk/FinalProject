package com.payalot.enjoyforott.party.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		
		ArrayList<Party> endDate = partyService.selectEndDate();
//		System.out.println(list.get(5));
		
		
		Calendar today = Calendar.getInstance();
		today.setTime(new Date());
		
		System.out.println(today);
		
		model.addAttribute("list", list);
		
		
		
		return "party/partyList";
	}
	
	//파티가입 버튼 클릭시 결제화면 이동
	@RequestMapping("partyjoin.pa")
	public ModelAndView partyjoin(int pno, ModelAndView mv) {
		
		System.out.println(pno);
		
		Party p = partyService.selectParty(pno);
		System.out.println(p);

		mv.addObject("p",p).setViewName("party/partyJoinForm");
		
		return mv;
		
//		Calendar today = Calendar.getInstance();
//		today.setTime(new Date());
//		
//		System.out.println(today);
//		
//		return "party/partyJoinForm";
		
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
	public String ottInfo(OttType o, Model model) {
		
		OttType ottInfo = partyService.ottInfo(o);
		
		//금액, 인원 숫자만 추출
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace(",", ""));
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace("원", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace(",", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace("명", ""));
		
		int newMonthPrice = Integer.parseInt(ottInfo.getMonthPrice());
		int newConcurrentUsers = Integer.parseInt(ottInfo.getConcurrentUsers());
		int newPerOneDayPrice = (int)Math.ceil((double)newMonthPrice*12/365/newConcurrentUsers);
		
//		ottInfo.setPerOneDayPrice((int)Math.ceil((double)newMonthPrice*12/365/newConcurrentUsers));
//		System.out.println(ottInfo.getPerOneMonthPrice()); //일수 가져와서 계산해야함
//		System.out.println(ottInfo);
		
		JSONObject ottInfoList = new JSONObject();
		
		ottInfoList.put("perOneDayPrice", newPerOneDayPrice);
		ottInfoList.put("concurrentUsers", newConcurrentUsers);
		
		return ottInfoList.toJSONString();
	}
	
	@RequestMapping("enrollparty.pa")
	public String enrollParty(Party p, Model model) {

		System.out.println(p);
		int result = partyService.enrollParty(p);
		
		if(result>0) {
			return "redirect:/partylist.pa";
		}else {
			model.addAttribute("errorMsg","파티등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	

}

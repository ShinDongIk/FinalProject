package com.payalot.enjoyforott.party.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.common.model.vo.UpdateScore;
import com.payalot.enjoyforott.party.model.service.PartyService;
import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;
import com.payalot.enjoyforott.user.model.service.UserService;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	private UserService userService;
	
	//파티리스트 폼 이동
	@RequestMapping("partylist.pa")
	public String partylist(Model model) {
		
		//endDate 지난 파티 status 'N'처리
		int result = partyService.updateEndDateParty();
		
		if(result>0) {
			ArrayList<Party> enrolledParty = partyService.selectList();
			
			model.addAttribute("enrolledParty", enrolledParty);
			return "party/partyList";
		}else {
			model.addAttribute("errorMsg","페이지를 불러올수 없습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}	
	}
	
	//ott별 파티리스트 sort
	@RequestMapping("findpartylist")
	@ResponseBody
	public String partylistott(String ottEng, Party p, Model model) {
		
		System.out.println(ottEng);
		int result = partyService.updateEndDateParty();
		
		if(result>0) {
			ArrayList<Party> enrolledParty = partyService.findpartylist(ottEng);

			System.out.println(enrolledParty);
		
			model.addAttribute("enrolledParty", enrolledParty);
		
			return "party/partyList";
		}else {
			model.addAttribute("errorMsg","페이지를 불러올수 없습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}	

	}
	
	//파티가입 버튼 클릭시 결제화면 이동
	@RequestMapping("partyjoin.pa")
	public ModelAndView partyjoin(int pno, ModelAndView mv) {
		
		Party p = partyService.selectParty(pno);
		System.out.println(p);

		mv.addObject("p",p).setViewName("party/partyJoinForm");
		
		return mv;
	}
		
	//신규파티등록 폼 이동
	@RequestMapping("partyenrollForm.pa")
	public String partyenrollForm() {
		
		return "party/partyEnrollForm";
	}
	
	//OTT별 일단가, 최대동접인원 정보(객체)
	@RequestMapping(value="ottInfo.pa", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String ottInfo(OttType o, Model model) {
		
		
		OttType ottInfo = partyService.ottInfo(o);
		
//		//금액, 인원 숫자만 추출
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace(",", ""));
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace("원", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace(",", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace("명", ""));
		
		int newMonthPrice = Integer.parseInt(ottInfo.getMonthPrice());
		int newConcurrentUsers = Integer.parseInt(ottInfo.getConcurrentUsers());
		int newPerOneDayPrice = (int)Math.ceil((double)newMonthPrice*12/365/newConcurrentUsers);
		
		JSONObject ottInfoList = new JSONObject();
		
		ottInfoList.put("perOneDayPrice", newPerOneDayPrice);
		ottInfoList.put("concurrentUsers", newConcurrentUsers);
		
		return ottInfoList.toJSONString();
	}
	
	//OTT별 일단가, 최대동접인원 정보(리스트)
	@RequestMapping(value="ottInfoList.pa", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Integer> ottInfo(@RequestParam(value="ottEng[]") List<String> ottEng, OttType o, Model model) {
		
		List<Integer> ottInfoList = new ArrayList<Integer>();
		
		for(int i=0; i<ottEng.size(); i++) {
			
			o.setOttEng(ottEng.get(i));
			
			OttType ottInfo = partyService.ottInfo(o);
		
		//금액, 인원 숫자만 추출
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace(",", ""));
		ottInfo.setMonthPrice(ottInfo.getMonthPrice().replace("원", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace(",", ""));
		ottInfo.setConcurrentUsers(ottInfo.getConcurrentUsers().replace("명", ""));
		
		int newMonthPrice = Integer.parseInt(ottInfo.getMonthPrice());
		int newConcurrentUsers = Integer.parseInt(ottInfo.getConcurrentUsers());
		int newPerOneDayPrice = (int)Math.ceil((double)newMonthPrice*12/365/newConcurrentUsers);
				
		ottInfoList.add(newPerOneDayPrice);		
		}
		
		return ottInfoList;
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
	
	//파티가입
	@RequestMapping("joinParty.pa")
	public String joinParty(PartyMember pm, UpdateScore us, HttpSession session, Model model) {
		
		int basicScore = 3; //1개월당 추가 매너점수
		int month = pm.getDiffMonth(); //가입개월수
		int getScore = basicScore*month;
		
		us.setUserId(pm.getJoinMember());
		us.setUpdateScore(getScore);
		
		int resultJoin = partyService.joinParty(pm);
		
		if(resultJoin>0) {
			int resultScore = userService.updateUserScore(us);
			if(resultScore>0) {
				session.setAttribute("joinParty", pm); 
				return "redirect:/joinComplete.me";				
			} else {
				model.addAttribute("errorMsg","파티가입에 실패하였습니다.");
				return "common/errorPage";
			}
		} else {
			model.addAttribute("errorMsg","파티가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
//	//회원가입 완료페이지 이동
//	@RequestMapping("joinComplete.me")
//	public String joinComplete(User u) {
//		return "user/userJoinComplete";
//	}
	

}

package com.payalot.enjoyforott.party.controller;

import java.text.SimpleDateFormat;
import java.time.Period;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.common.model.vo.UpdateScore;
import com.payalot.enjoyforott.party.model.service.PartyService;
import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;
import com.payalot.enjoyforott.user.model.service.UserService;
import com.payalot.enjoyforott.user.model.vo.User;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	private UserService userService;
	
	//파티리스트 폼 이동
	@RequestMapping("partylist.pa")
	public String partylist(Model model) {
		
		ArrayList<Party> enrolledParty = partyService.selectList();
		
//		String monthPriceOg = ottInfo.getMonthPrice();
//		String concurrentUsersOg = ottInfo.getConcurrentUsers();
//		System.out.println(monthPriceOg);
		
		model.addAttribute("enrolledParty", enrolledParty);
		
		return "party/partyList";
	}
	
	//ott별 파티리스트 sort
	@RequestMapping("findpartylist")
	@ResponseBody
	public ArrayList<Party> partylistott(String selectOtt, Party p, Model model) {
		
		System.out.println(selectOtt);
		
		p.setFindOtt(selectOtt);
		
		System.out.println(p);
		
		ArrayList<Party> findOttParty = partyService.findpartylist(p);
		
		System.out.println(findOttParty);
		
		return findOttParty;
		
//		System.out.println(enrolledParty);
		
//		model.addAttribute("enrolledParty", enrolledParty);
		
//		return "party/partyList";
		
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
	
	//OTT별 일단가, 최대동접인원 정보
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

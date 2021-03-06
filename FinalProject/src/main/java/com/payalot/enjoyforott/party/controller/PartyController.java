package com.payalot.enjoyforott.party.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.payalot.enjoyforott.party.model.service.PartyService;
import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;
import com.payalot.enjoyforott.party.model.vo.Payment;
import com.payalot.enjoyforott.user.model.service.UserService;
import com.payalot.enjoyforott.user.model.vo.UpdateScore;
import com.payalot.enjoyforott.user.model.vo.User;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	@Autowired
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
	
	//파티가입 버튼 클릭시 결제화면 이동
	@RequestMapping("partyjoin.pa")
	public ModelAndView partyjoin(int pno, ModelAndView mv) {
		
		Party p = partyService.selectParty(pno);

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
	
	//결제페이지 이동
	@RequestMapping("partyPayForm.pa")
	public String joinComplete(Payment payInfo, PartyMember pm, HttpSession session) {
		
		System.out.println(payInfo);
		System.out.println(pm);
		
		session.setAttribute("payInfo", payInfo); 
		session.setAttribute("pm", pm); 
		
		return "party/partyPay";
	}
	
	//결제완료
	@RequestMapping(value="partyPayComplete.pa", produces="application/json; charset=UTF-8", method= RequestMethod.POST)
	@ResponseBody
	public String partyPayComplete(String dataArr, Payment pay, PartyMember pm, User us, HttpSession session, Model model) 
			throws IOException {
		
		System.out.println("결제완료페이지 이동하는 컨트롤러임다");
		
		ObjectMapper mapper = new ObjectMapper();
		Payment payInfo = mapper.readValue(dataArr, Payment.class);
		
		System.out.println(payInfo);
		
		int payPartyNo = payInfo.getPayPartyNo(); 			//가입한 파티번호
		String payUserId = payInfo.getPayUserId(); 			//구매자 아이디
		String payConfirmNo = payInfo.getPayConfirmNo();	//승인번호
		String payName = payInfo.getPayName(); 				//상품명
		int diffMonth = payInfo.getDiffMonth();				//가입개월수

		//결제 insert
		pay.setPayPartyNo(payPartyNo);
		pay.setPayUserId(payUserId);
		pay.setPayConfirmNo(payConfirmNo);
		int resultPayment = partyService.insertPayment(pay);
		
		//멤버 insert
		pm.setJoinParty(payPartyNo);
		pm.setJoinMember(payUserId);
		int resultPartyMember = partyService.insertPartyMember(pm);
		System.out.println("파티멤버테이블 추가완료");
		
		if(resultPayment>0 && resultPartyMember>0) {
			//멤버수 조회 후 status 'N'처리
			int pno = pm.getJoinParty();
			System.out.println("멤버수 처리할 파티번호 : "+pno);
			
			Party partyJoinedNum = partyService.selectPartyMemNum(pno);
			System.out.println("가입후 멤버수 : "+partyJoinedNum.getNowMemNum());
			
			if(partyJoinedNum.getNowMemNum()>=partyJoinedNum.getPartyCount()) {
				int resultFullParty = partyService.updateFullParty(pno);				
				System.out.println("풀파티결과"+resultFullParty);
			}
			
			System.out.println("개월수"+diffMonth);
			//매너점수 update
			int basicScore = 3; //1개월당 추가 매너점수
			int getScore = basicScore*diffMonth;
			us.setUserId(payUserId);
			us.setUpdateScore(getScore);	
			
			System.out.println(us);
			int resultScore = userService.updateUserScore(us);
			System.out.println(resultScore);
			if(resultScore>0) { 
				System.out.println("joinParty에 담길 값은 "+pm);
				session.setAttribute("joinParty", pm); 
				return "ok";									
			}else {
				model.addAttribute("errorMsg","파티가입에 실패하였습니다.");
				return "no";
			}
		} else {
			model.addAttribute("errorMsg","파티가입에 실패하였습니다.");
			return "no";
		}
	}
	
	//파티완료시 화면
	@RequestMapping("partyPayCompleteForm.pa")
	public String partyPayCompleteForm() {
		
		return "party/partyJoinComplete";
	}
	
	//마이페이지 참여파티 내역 
			@RequestMapping("partyJoin.my")
			public String partyJoin(Party p,HttpSession session, Model model,String userId) {
				
				ArrayList<Party> list = partyService.selectPartyJoinList(userId);
				
				model.addAttribute("list",list);
				
				
				return "myPage/myPagejoin";
			}

			//마이페이지 생성파티 내역
			@RequestMapping("partyMade.my")
			public String partyMade(PartyMember pm,HttpSession session, Model model,String userId) {
				
				ArrayList<Party> list = partyService.selectPartyJoinList(userId);
				
				model.addAttribute("list",list);
				
				ArrayList<PartyMember> list2 = partyService.selectPartyMadeList(userId);
				
				model.addAttribute("list2",list2);
				
				return "myPage/myPagejoin";
			}

			
			//참여파티 모달창
			@RequestMapping("partyModal.me")
			public String partyIdPw(String userId,Model model) {
				
				ArrayList<Party> list = partyService.selectPartyModal(userId);
				
				System.out.println(list.size());
				System.out.println(list);

				model.addAttribute("partyLoginInfo", list);
				
				
				return "myPage/myPagejoin";
			}
			
			@ResponseBody
			@RequestMapping(value="joinparty", produces="application/json; charset=UTF-8")
			public String joinparty(int joinNo) {
				
				Party joinparty = partyService.joinParty(joinNo);
				
				Gson gson = new Gson();
				return gson.toJson(joinparty);
			}
	
}

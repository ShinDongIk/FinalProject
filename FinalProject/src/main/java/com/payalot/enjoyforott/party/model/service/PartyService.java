package com.payalot.enjoyforott.party.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;
import com.payalot.enjoyforott.party.model.vo.Payment;

public interface PartyService {
	
	//OTT정보
	OttType ottInfo(OttType o);
	
	//파티목록
	ArrayList<Party> selectList();

	//종료일 출력
	ArrayList<Party> selectEndDate();
	
	//파티정보
	Party selectParty(int partyNo);
	
	//신규파티등록
	int enrollParty(Party p);
	
	//종료일 지난 파티 status 'N'
	int updateEndDateParty();
	
	//결제완료시 결제정보 입력
	int insertPayment(Payment payInfo);
	
	//파티멤버테이블 멤버 추가
	int insertPartyMember(PartyMember pm);

	//파티멤버 카운트
	Party selectPartyMemNum(int pno);
	
	//풀파티 status 'N'
	int updateFullParty(int pno);


}

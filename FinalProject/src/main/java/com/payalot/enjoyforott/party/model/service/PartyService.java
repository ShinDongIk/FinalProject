package com.payalot.enjoyforott.party.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;
import com.payalot.enjoyforott.party.model.vo.PartyMember;

public interface PartyService {
	
	//OTT정보
	OttType ottInfo(OttType o);
	
	//파티목록
	ArrayList<Party> selectList();
	
	//ott별 파티목록
	ArrayList<Party> findpartylist(String ottEng);
	
	//종료일 출력
	ArrayList<Party> selectEndDate();
	
	//파티정보
	Party selectParty(int partyNo);
	
	//신규파티등록
	int enrollParty(Party p);
	
	//파티 가입
	int joinParty(PartyMember pm);
	
	//종료일 지난 파티 status 'N'
	int updateEndDateParty();


}

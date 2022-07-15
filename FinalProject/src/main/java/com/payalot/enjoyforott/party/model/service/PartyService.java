package com.payalot.enjoyforott.party.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.party.model.vo.OttType;
import com.payalot.enjoyforott.party.model.vo.Party;

public interface PartyService {
	
	//OTT정보
	OttType ottInfo(OttType o);
	
	//파티목록
	ArrayList<Party> selectList();	

}

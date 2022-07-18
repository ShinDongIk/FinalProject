package com.payalot.enjoyforott.party.model.vo;

import lombok.Data;

@Data
public class PartyMember {
	
	private int joinNo;				//	JOIN_NO			NUMBER
	private int joinParty;			//	JOIN_PARTY		NUMBER
	private String joinMember;		//	JOIN_MEMBER		VARCHAR2(100 BYTE)
	private String joinEnterDate;	//	JOIN_ENTERDATE	DATE
}

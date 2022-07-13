package com.payalot.enjoyforott.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Party {
	
	private int partyNo; 				//	PARTY_NO			NUMBER
	private String partyMaster;			//	PARTY_MASTER		VARCHAR2(100 BYTE)
	private int partyCount;				//	PARTY_COUNT			NUMBER
	private int partyOtt;				//	PARTY_OTT			NUMBER
	private Date partyStartDate;		//	PARTY_STARTDATE		DATE ==>인덱스가면 죄다 업데이트 되게?
	private Date partyEndDate; 			//	PARTY_ENDDATE		DATE
	private String partyAccountBank;	//	PARTY_ACCOUNTBANK	VARCHAR2(20 BYTE)
	private int partyAccountNum;		//	PARTY_ACCOUNTNUM	NUMBER
	private String partyRule;			//	PARTY_RULE			VARCHAR2(2000 BYTE)
	private String partyOttId;			//	PARTY_OTTID			VARCHAR2(20 BYTE)
	private String partyOttPwd;			//	PARTY_OTTPWD		VARCHAR2(20 BYTE)
	private String partyStatus;			//	PARTY_STATUS		VARCHAR2(100 BYTE)
	
}

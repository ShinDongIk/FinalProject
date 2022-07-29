package com.payalot.enjoyforott.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Party {
	
	private int partyNo; 				//	PARTY_NO			NUMBER
	private String partyMaster;			//	PARTY_MASTER		VARCHAR2(100 BYTE)
	private int partyCount;				//	PARTY_COUNT			NUMBER
	private String partyOttEng;			//	PARTY_OTTENG		VARCHAR2(100 BYTE)
	private Date partyStartDate;		//	PARTY_STARTDATE		DATE
	private Date partyEndDate; 			//	PARTY_ENDDATE		DATE
	private String partyAccountBank;	//	PARTY_ACCOUNTBANK	VARCHAR2(20 BYTE)
	private int partyAccountNum;		//	PARTY_ACCOUNTNUM	NUMBER
	private String partyRule;			//	PARTY_RULE			VARCHAR2(2000 BYTE)
	private String partyOttId;			//	PARTY_OTTID			VARCHAR2(20 BYTE)
	private String partyOttPwd;			//	PARTY_OTTPWD		VARCHAR2(20 BYTE)
	private String partyStatus;			//	PARTY_STATUS		VARCHAR2(100 BYTE)
	
	private String ottKor;
	private String levelName;
	private String userNickname;
	
	private int ableDays;
	private int ableMemNum;
	
	private int diffMonth;
	private int nowMemNum;
	
}

package com.payalot.enjoyforott.party.model.vo;

import lombok.Data;

@Data
public class OttType {
	
	private String ottEng;				//	OTT_ENG			VARCHAR2(100 BYTE)
	private String ottKor;				//	OTT_KOR			VARCHAR2(100 BYTE)
	
	private String monthPrice;			//	MONTH_PRICE		VARCHAR2(100 BYTE)
	private String profilesNum;			//	PROFILES_NUM	VARCHAR2(100 BYTE)
	
	private int perOneMonthPrice;		// 월단가(1인)
	private int perOneDayPrice;			// 일단가(1인)

}

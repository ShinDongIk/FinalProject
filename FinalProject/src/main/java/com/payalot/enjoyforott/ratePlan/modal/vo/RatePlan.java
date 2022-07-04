package com.payalot.enjoyforott.ratePlan.modal.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RatePlan {
		private int priceInfoNo; 			//	PRICE_INFORMATION_NO	NUMBER
		private String ottName;				//	OTT_NAME	VARCHAR2(100 BYTE)
		private String monthPrice;			//	MONTH_PRICE	VARCHAR2(100 BYTE)
		private String yearPrice;			//	YEAR_PRICE	VARCHAR2(100 BYTE)
		private String concurrentUsers;		//	CONCURRENT_USERS	VARCHAR2(100 BYTE)
		private String profilesNum;			//	PROFILES_NUM	VARCHAR2(100 BYTE)
		private String imageQuality;		//	IMAGE_QUALITY	VARCHAR2(100 BYTE)
		private String priceInfoStatus;		//	PRICE_INFORMATIONT_STATUS	VARCHAR2(100 BYTE)
		private Date priceInfoEnter;		//	PRICE_INFORMATIONT_ENTER	DATE
}

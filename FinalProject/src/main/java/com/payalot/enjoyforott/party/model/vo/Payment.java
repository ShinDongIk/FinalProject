package com.payalot.enjoyforott.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	
	private String payNo;			//	PAYMENT_PMNO	VARCHAR2(100 BYTE)
	private int payPartyNo; 		//	PAY_PARTY_NO	NUMBER
	private Date payDate;			//	PAY_DATE		DATE
	private String payUserId;		//	PAY_USER_ID		VARCHAR2(100 BYTE)
	private String payConfirmNo;	//	PAY_CONFIRM_NO	VARCHAR2(100 BYTE)
	
	//아임포트 API 관련 변수
	private String payName;			// 상품명
	private int payAmount;			// 금액
	private String buyerEmail;		// 구매자이메일
	private String buyerName;		// 구매자이름
	private String buyerTel;		// 구매자연락처
	
	private int diffMonth; 			// 가입개월수
}

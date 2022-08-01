package com.payalot.enjoyforott.payment.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class payment {
	
	private String paymentPmno;		//	PAYMENT_PMNO	VARCHAR2(100 BYTE)
	private int payPartyNo;			//	PAY_PARTY_NO	NUMBER
	private Date payDate;			//	PAY_DATE	DATE
	private String payUserId;		//	PAY_USER_ID	VARCHAR2(100 BYTE)
	private String payConfirmNo;	//	PAY_CONFIRM_NO	VARCHAR2(100 BYTE)

	private int postNo;
}

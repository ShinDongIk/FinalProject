package com.payalot.enjoyforott.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;				//	CHAT_NO	NUMBER
	private String firstUserId;		//	FIRST_USER_ID	VARCHAR2(20 BYTE)
	private String secondUserId;	//	SECOND_USER_ID	VARCHAR2(20 BYTE)
	private Date chatEnter;			//	CHAT_ENTER	DATE
	private String chatStatus;		//	CHAT_STATUS	VARCHAR2(100 BYTE)
}

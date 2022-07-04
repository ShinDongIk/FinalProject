package com.payalot.enjoyforott.chat.modal.vo;

import lombok.Data;

@Data
public class ChatContent {
	private	int chatNo;					//	CHAT_NO	NUMBER
	private	String nickName;			//	USER_ID	VARCHAR2(20 BYTE)
	private	String chatContent;			//	CHAT_CONTENT	VARCHAR2(4000 BYTE)
	private	String chatEnter;			//	CHAT_CONTENT_ENTER	VARCHAR2(100 BYTE)
	private	String checkChatContent;	//	CHECK_CHAT_CONTENT	VARCHAR2(100 BYTE)
	private	String chatContentStatus;	//	CHAT_CONTENT_STATUS	VARCHAR2(100 BYTE)
}

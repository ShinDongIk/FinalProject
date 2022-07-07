package com.payalot.enjoyforott.memberModal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberModal {
	private String userNickName;	//	USER_NICKNAME	VARCHAR2(20 BYTE)
	private	String userLevel; 		//	USER_LEVEL	NUMBER
	private	int declarationNo;		//	DECLARATION_NO	NUMBER
	private	String reporter;		//	REPORTER	VARCHAR2(100 BYTE)
	private	String reported;		//	REPORTED	VARCHAR2(100 BYTE)
	private	String reportContent;	//	REPORT_CONTENT	VARCHAR2(4000 BYTE)
	private	Date reportEnter; 		//	REPORT_ENTER	DATE
	private	String reportStatus;	//	REPORT_STATUS	VARCHAR2(100 BYTE)
	
	public MemberModal(String userNickName, String reporter) {
		super();
		this.userNickName = userNickName;
		this.reporter = reporter;
		this.reported = userNickName;
	}
}

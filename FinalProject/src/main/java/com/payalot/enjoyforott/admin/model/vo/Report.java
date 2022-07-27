package com.payalot.enjoyforott.admin.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Report {
//	DECLARATION_NO	NUMBER
//	REPORTER	VARCHAR2(100 BYTE)
//	REPORTED	VARCHAR2(100 BYTE)
//	REPORT_CONTENT	VARCHAR2(4000 BYTE)
//	REPORT_ENTER	DATE
//	REPORT_STATUS	VARCHAR2(100 BYTE)
	private int declarationNo;
	private String reporter;
	private String reported;
	private String reportContent;
	private Date reportEnter;
	private String reportStatus;
	
}

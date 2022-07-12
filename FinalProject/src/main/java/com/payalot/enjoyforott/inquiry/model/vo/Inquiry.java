package com.payalot.enjoyforott.inquiry.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Inquiry {
	
	private int inquiryNo;
	private String inquiryTitle;
	private String inquiryWriter;
	private String inquiryContent;
	private String inquiryType;
	private String originName;
	private String changeName;
	private Date createDate;
	private String status;
	
}

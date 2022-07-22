package com.payalot.enjoyforott.inquiry.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private int inquiryNo;
	private String replyContent;
	private Date createDate;
	private String status;
}

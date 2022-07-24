package com.kh.m.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String boardType;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date createDate;
	private int count;
	private String boardImp;

}

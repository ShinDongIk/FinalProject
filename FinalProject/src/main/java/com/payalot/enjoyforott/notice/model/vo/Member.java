package com.payalot.enjoyforott.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userPhone;
	private Date userEnterdate;
	private int userLevel;
	private int userScore;
	private String userStopStatus;
	private Date userStopDate;
	private String userDeleteStatus;
	private Date userDeleteDate;
	
	
}

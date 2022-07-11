package com.payalot.enjoyforott.user.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
	
	private String userId;				//	USER_ID				VARCHAR2(20 BYTE)
	private String userPwd;				//	USER_PWD			VARCHAR2(20 BYTE)
	private String userName;			//	USER_NAME			VARCHAR2(20 BYTE)
	private String userNickname;		//	USER_NICKNAME		VARCHAR2(20 BYTE)
	private String userEmail;			//	USER_EMAIL			VARCHAR2(20 BYTE)
	private String userPhone;			//	USER_PHONE			VARCHAR2(20 BYTE)
	private Date userEnterDate;			//	USER_ENTERDATE		DATE
	private int userLevel;				//	USER_LEVEL			NUMBER
	private int userScore;				//	USER_SCORE			NUMBER
	private String userGenre; 			//	USER_GENRE			VARCHAR2(100 BYTE)
	private String userStopStatus;		//	USER_STOP_STATUS	VARCHAR2(100 BYTE)
	private Date userStopDate;			//	USER_STOP_DATE		DATE
	private String userDeleteStatus;	//	USER_DELETE_STATUS	VARCHAR2(100 BYTE)
	private Date userDeleteDate;		//	USER_DELETE_DATE	DATE
	
	private String levelName;			//	LEVEL_NAME	VARCHAR2(20 BYTE)

}

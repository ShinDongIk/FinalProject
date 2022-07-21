package com.payalot.enjoyforott.user.model.service;

import com.payalot.enjoyforott.common.model.vo.UpdateScore;
import com.payalot.enjoyforott.user.model.vo.User;

public interface UserService {
	
	//로그인
	User loginUser(User u);
	
	//회원가입
	int joinUser(User u);
	
	//아이디 중복체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nicknameCheck(String checkNickname);
	
	//매너점수 업데이트
	int updateUserScore (UpdateScore us);
}

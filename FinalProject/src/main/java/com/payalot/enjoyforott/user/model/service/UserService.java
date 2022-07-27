package com.payalot.enjoyforott.user.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.common.model.vo.UpdateScore;
import com.payalot.enjoyforott.user.model.vo.User;

public interface UserService {
	
	//로그인
	User loginUser(User u);
	
	//회원가입
	int joinUser(User u);
	
	//회원 정보수정
	int updateUser(User u);
		
	//회원 탈퇴
	int deleteUser(String userId);
	
	//아이디 중복체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nicknameCheck(String checkNickname);
	
	//매너점수 업데이트
	int updateUserScore (UpdateScore us);
	
	//유저 수
	int UserListCount();
		
	//유저 리스트
	ArrayList<User> UserList(PageInfo pi);
		
	//유저 조회
	User selectUser(String userId);
		
	//유저 이용 정지
	int userStop(String userId);
		
	//유저 이용 정지 취소
	int userStopCan(String userId);
}

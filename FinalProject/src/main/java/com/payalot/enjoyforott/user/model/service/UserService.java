package com.payalot.enjoyforott.user.model.service;

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
	
	//아이디 찾기
	User findId(User u);
	
	//임시비밀번호 발급
	int findPwd(String pwdUserId, String pwdUserEmail);
	
	
}

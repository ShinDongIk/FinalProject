package com.payalot.enjoyforott.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.user.model.dao.UserDao;
import com.payalot.enjoyforott.user.model.vo.UpdateScore;
import com.payalot.enjoyforott.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession,u);
	}

	@Override
	public int joinUser(User u) {
		return userDao.joinUser(sqlSession, u);
	}

	//회원정보 수정
	@Override
	public int updateUser(User u) {
		
		int result = userDao.updateUser(sqlSession,u);
		
		return result;
	}

	//회원정보 삭제
	@Override
	public int deleteUser(String userId) {
		
		int result = userDao.deleteUser(sqlSession,userId);
		
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nicknameCheck(String checkNickname) {
		return userDao.nicknameCheck(sqlSession, checkNickname);
	}

	@Override
	public int updateUserScore(User us) {
		return userDao.updateUserScore(sqlSession, us);
	}
	
	@Override
	public int UserListCount() {
		return userDao.userListCount(sqlSession);
	}

	@Override
	public ArrayList<User> UserList(PageInfo pi) {
		return userDao.UserList(sqlSession,pi);
	}

	@Override
	public User selectUser(String userId) {
		return userDao.selectUser(sqlSession,userId);
	}

	@Override
	public int userStop(String userId) {
		return userDao.userStop(sqlSession,userId);
	}

	@Override
	public int userStopCan(String userId) {
		return userDao.userStopCan(sqlSession,userId);
	}

}

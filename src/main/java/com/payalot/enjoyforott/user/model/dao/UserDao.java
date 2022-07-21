package com.payalot.enjoyforott.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.user.model.vo.User;

@Repository
public class UserDao {

	public int joinUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.joinUser", u);
	}

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser",u);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("userMapper.idCheck", checkId);
	}

	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		return sqlSession.selectOne("userMapper.nicknameCheck", checkNickname);
	}

}

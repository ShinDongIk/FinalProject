package com.payalot.enjoyforott.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.common.model.vo.UpdateScore;
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

	public int updateUserScore(SqlSessionTemplate sqlSession, UpdateScore us) {
		return sqlSession.update("userMapper.updateUserScore", us);
	}

	//회원정보 수정
	public int updateUser(SqlSessionTemplate sqlSession, User u) {
			
		return sqlSession.update("userMapper.updateUser",u);
	}

	//회원정보 삭제
	public int deleteUser(SqlSessionTemplate sqlSession, String userId) {
			
		return sqlSession.update("userMapper.deleteUser",userId);
	}
	
	public int userListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.userListCount");
	}

	public ArrayList<User> UserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("userMapper.userList",null,rowBounds);
	}

	public User selectUser(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("userMapper.selectUser",userId);
	}

	public int userStop(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("userMapper.userStop",userId);
	}

	public int userStopCan(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("userMapper.userStopCan",userId);
	}

}

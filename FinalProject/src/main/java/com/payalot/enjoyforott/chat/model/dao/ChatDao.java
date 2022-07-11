package com.payalot.enjoyforott.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.chat.model.vo.Chat;
import com.payalot.enjoyforott.chat.model.vo.ChatContent;

@Repository
public class ChatDao {

	public ArrayList<Chat> searchChatRoom(SqlSessionTemplate sqlSession, Chat ch) {
		return (ArrayList)sqlSession.selectList("chatMapper.searchChatRoom",ch);
	}

	public int makeChatRoom(SqlSessionTemplate sqlSession, Chat ch) {
		return sqlSession.insert("chatMapper.makeChatRoom", ch);
	}

	public ArrayList<ChatContent> loadChatContent(SqlSessionTemplate sqlSession, int chatNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.loadChatContent", chatNo);
	}

	public int insertChatContent(SqlSessionTemplate sqlSession, ChatContent chatContent) {
		return sqlSession.insert("chatMapper.insertChatContent", chatContent);
	}

}

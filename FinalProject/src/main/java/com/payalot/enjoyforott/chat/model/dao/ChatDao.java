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

	public ArrayList<Chat> chatRoomSearch(SqlSessionTemplate sqlSession, Chat ch) {
		return (ArrayList)sqlSession.selectList("chatMapper.chatRoomSearch",ch);
	}

	public int updateReadContent(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.update("chatMapper.updateReadContent",c);
	}

	public int chatRoomDelete(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.update("chatMapper.chatRoomDelete", chatNo);
	}

	public String findUserId(SqlSessionTemplate sqlSession, String userNick) {
		return sqlSession.selectOne("chatMapper.findUserId", userNick);
	}

	public String roomState(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.selectOne("chatMapper.roomState", chatNo);
	}

}

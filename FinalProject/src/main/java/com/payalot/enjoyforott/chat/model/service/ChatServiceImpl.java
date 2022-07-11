package com.payalot.enjoyforott.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.chat.model.dao.ChatDao;
import com.payalot.enjoyforott.chat.model.vo.Chat;
import com.payalot.enjoyforott.chat.model.vo.ChatContent;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao cd;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Chat> searchChatRoom(Chat ch) {
		return cd.searchChatRoom(sqlSession,ch);
	}
	
	@Override
	public int makeChatRoom(Chat ch) {
		return cd.makeChatRoom(sqlSession,ch);
	}

	@Override
	public ArrayList<ChatContent> loadChatContent(int chatNo) {
		return cd.loadChatContent(sqlSession,chatNo);
	}

	@Override
	public int insertChatContent(ChatContent chatContent) {
		return cd.insertChatContent(sqlSession,chatContent);
	}

	@Override
	public ArrayList<Chat> chatRoomSearch(Chat ch) {
		return cd.chatRoomSearch(sqlSession,ch);
	}
}

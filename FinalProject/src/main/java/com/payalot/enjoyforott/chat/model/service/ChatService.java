package com.payalot.enjoyforott.chat.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.chat.model.vo.Chat;
import com.payalot.enjoyforott.chat.model.vo.ChatContent;

public interface ChatService {

	//채팅방이 존재하는지 확인
	public abstract ArrayList<Chat> searchChatRoom(Chat ch);
	
	//채팅방을 만드는 메소드
	public abstract int makeChatRoom(Chat ch);
	
	//해당 채팅방의 채팅 내용 불러오기
	public abstract ArrayList<ChatContent> loadChatContent(int chatNo);
	
	//해당 채팅방의 채팅 내용 입력
	public abstract int insertChatContent(ChatContent chatContent);
	
	//채팅 접속시 원으로 클릭 후 접속시
	public abstract ArrayList<Chat> chatRoomSearch(Chat ch);
	
	//채팅방 접속시 메세지 확인 업데이트 메소드
	public abstract int updateReadContent(Chat c);
	
	//채팅방 삭제 메소드
	public abstract int chatRoomDelete(int chatNo);
	
	//유저 아이디 찾아오는 메소드
	public abstract String findUserId(String userNick);
	
	//채팅방 상태 알아오는 메소드
	public abstract String roomState(int chatNo);
}

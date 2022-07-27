package com.payalot.enjoyforott.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.payalot.enjoyforott.chat.model.service.ChatService;
import com.payalot.enjoyforott.chat.model.vo.Chat;
import com.payalot.enjoyforott.chat.model.vo.ChatContent;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cs;
	
	@ResponseBody
	@RequestMapping(value="mkChat.ch",  produces="application/json; charset=UTF-8")
	public String makeChatRoom(Chat ch) {
		ArrayList<Chat> chatRoom = cs.searchChatRoom(ch);
		
		if(chatRoom.isEmpty()) {
			int result = cs.makeChatRoom(ch);
			if(result>0) {
				chatRoom = cs.searchChatRoom(ch);
			}
		}
		
		return new Gson().toJson(chatRoom);
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomLoad.ch",  produces="application/json; charset=UTF-8")
	public String chatRoomSearch(Chat ch) {
		ArrayList<Chat> chatRoom = cs.chatRoomSearch(ch);
		return new Gson().toJson(chatRoom);
	}
	
	@ResponseBody
	@RequestMapping(value="loadChatCont.ch",  produces="application/json; charset=UTF-8")
	public String loadChatContent(int chatNo, String loginUser) {
		ArrayList<ChatContent> list = cs.loadChatContent(chatNo);
		String roomState = cs.roomState(chatNo);
		
		Chat c = new Chat();
		c.setChatNo(chatNo);
		c.setFirstUserId(loginUser);
		
		if(!list.isEmpty()) {
			cs.updateReadContent(c);
		}
		if(roomState.equals("N")) {
			return new Gson().toJson("NNNNN");
		}else {
			return new Gson().toJson(list);
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="chatContEnt.ch",  produces="application/json; charset=UTF-8")
	public String insertChatContent(ChatContent chatContent,String toUser) {
		int result = cs.insertChatContent(chatContent);
		String userId = cs.findUserId(toUser);
		
		return new Gson().toJson(userId);
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomDelete.ch",  produces="application/json; charset=UTF-8")
	public String chatRoomDelete(int chatNo,String userNick) {
		int result = cs.chatRoomDelete(chatNo);
		if(result>0) {
			int result2 = cs.chatContentDelete(chatNo);
		}
		String userId = cs.findUserId(userNick);
		
		String result2[] = new String[2]; 
		
		if(result>0) {
			result2[0]="NNNNY";
			result2[1]=userId;
		}else {
			result2[0]="NNNNN";
		}
		
		return new Gson().toJson(result2);
	}
}

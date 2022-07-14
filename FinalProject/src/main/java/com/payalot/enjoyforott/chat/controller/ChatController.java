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
	ChatService cs;
	
	@ResponseBody
	@RequestMapping(value="mkChat.ch",  produces="application/json; charset=UTF-8")
	public String makeChatRoom(Chat ch) {
		ArrayList<Chat> chatRoom = cs.searchChatRoom(ch);
		System.out.println(chatRoom);
		if(chatRoom == null) {
			int result = cs.makeChatRoom(ch);
			if(result>0) {
				chatRoom = cs.searchChatRoom(ch);
			}
		}
		
		return new Gson().toJson(chatRoom);
	}
	
	@ResponseBody
	@RequestMapping(value="loadChatCont.ch",  produces="application/json; charset=UTF-8")
	public String loadChatContent(int chatNo) {
		ArrayList<ChatContent> list = cs.loadChatContent(chatNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="chatContEnt.ch",  produces="application/json; charset=UTF-8")
	public String insertChatContent(ChatContent chatContent) {
		int result = cs.insertChatContent(chatContent);
		
		return new Gson().toJson(result);
	}
}

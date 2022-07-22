package com.payalot.enjoyforott.common.alrim;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.payalot.enjoyforott.user.model.vo.User;

public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
		//System.out.println("userSession : "+userSessionsMap);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		logger.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("msg="+msg);
		
		if (!StringUtils.isEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			System.out.println("strs : " +strs );
			if(strs != null && strs.length == 3) {
				
				String text = strs[0];
				String toUser = strs[1]; //받는 사람
				String fromUser = strs[2]; //보내는 사람
				logger.info("length 성공?"+text);
				
				WebSocketSession fromUserSession = userSessionsMap.get(fromUser);
				WebSocketSession toUserSession = userSessionsMap.get(toUser);
				logger.info("boardWriterSession="+userSessionsMap.get(toUser));
				logger.info("boardWirterSession"+toUserSession);
				
				if (toUserSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(text);
					toUserSession.sendMessage(tmpMsg);
				}
				/*
				if ("reply".equals(cmd) && boardWriterSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='/board/readView?bno="+ bno +"&bgno="+bgno+"'  style=\"color: black\">"
							+ title+" 에 댓글을 달았습니다!</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
				*/
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		//System.out.println("httpSession값 : "+session.getAttributes());
		User loginUser = (User)httpSession.get("loginUser");
		//System.out.println("유저정보 : "+loginUser);
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getUserId();
		return mid;
		
	}
}
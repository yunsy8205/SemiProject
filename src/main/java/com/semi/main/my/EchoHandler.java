package com.semi.main.my;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.semi.main.member.MemberDTO;


public class EchoHandler extends TextWebSocketHandler{
	
	Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	
	@Autowired
	MyPageService mypageService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("Connect");
		System.out.println(mypageService +"ddddd");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttributes().get("member");
		System.out.println(memberDTO.getUserId());
		map.put(memberDTO.getUserId(), session);
		
		List<ChatMessageDTO> ar = mypageService.getChatMessages(memberDTO.getUserId());
		
		
		for(WebSocketSession s : map.values()) {
			for(ChatMessageDTO chatMessageDTO : ar) {
				s.sendMessage(new TextMessage(chatMessageDTO.getUserId() + " : " + chatMessageDTO.getMessage()));
			}
			s.sendMessage(new TextMessage("지난대화----"));
			s.sendMessage(new TextMessage("[" + memberDTO.getUserId() + "님이 입장했습니다.]"));
		}
		
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttributes().get("member");		
		
		System.out.println(session.getId());
		System.out.println(message.getPayload());
		
		TextMessage msg = new TextMessage(memberDTO.getUserId() + " : " + message.getPayload());

		Set<String> keys = map.keySet();
		Iterator<String> ite = keys.iterator();
		while(ite.hasNext()) {
			map.get(ite.next()).sendMessage(msg);
		}
		mypageService.saveChatMessage(memberDTO.getUserId(), message.getPayload());
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("Close");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttributes().get("member");
		map.remove(memberDTO.getUserId());
		for(WebSocketSession s : map.values()) {
			s.sendMessage(new TextMessage("[" + memberDTO.getUserId() + "님이 나가셨습니다.]"));			
		}
	}
	
}

package com.semi.main.my;

public class ChatMessageDTO {
	private Long chatNo;
	private String userId;
	private String message;
	
	public Long getChatNo() {
		return chatNo;
	}
	public void setChatNo(Long chatNo) {
		this.chatNo = chatNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}

package com.semi.main.qnaComment;

import java.sql.Date;

public class QnaCommentDTO {
	
	private Long qnaCommentNo;
	private Long userNo;
	private Long boardNo;
	private String contents;
	private Date createDate;
	private String userId;
	
	public Long getQnaCommentNo() {
		return qnaCommentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setQnaCommentNo(Long qnaCommentNo) {
		this.qnaCommentNo = qnaCommentNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Long boardNo) {
		this.boardNo = boardNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}

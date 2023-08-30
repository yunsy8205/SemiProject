package com.semi.main.qna;

import com.semi.main.board.BoardDTO;

public class QnaDTO extends BoardDTO{
	
	private Integer kindNo;
	private String status;
	
	public Integer getKindNo() {
		return kindNo;
	}
	public void setKindNo(Integer kindNo) {
		this.kindNo = kindNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}

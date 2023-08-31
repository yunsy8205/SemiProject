package com.semi.main.qna;

import java.util.List;

import com.semi.main.board.BoardDTO;

public class QnaDTO extends BoardDTO{
	
	private Integer kindNo;
	private String status;
	private String kindName;
	
	private List<QnaFileDTO> fileDTOs;
	
	
	
	public List<QnaFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<QnaFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
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

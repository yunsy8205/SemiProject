package com.semi.main.adminNotice;

import java.sql.Date;
import java.util.List;

import com.semi.main.board.BoardDTO;

public class AdminNoticeDTO extends BoardDTO{
	
	private Date modifyDate;
	private Long hit;
	
	private List<AdminNoticeFileDTO> fileDTOs;

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Long getHit() {
		if(this.hit ==null) {
			this.hit =0L;
		}
		return hit;
	}

	public void setHit(Long hit) {
		this.hit = hit;
	}

	public List<AdminNoticeFileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(List<AdminNoticeFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
	
	

}

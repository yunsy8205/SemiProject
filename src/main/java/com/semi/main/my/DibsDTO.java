package com.semi.main.my;

import java.sql.Date;
import java.util.List;

import com.semi.main.product.ProductFileDTO;

public class DibsDTO {
	 private Long userNo;
	 private Long proNo;
	 private String proName;
	 private List<ProductFileDTO> fileDTOs;
	 
	 private String userId;
	 private String proContents;
	 private Long proPrice;
	 private Date createDate;
	 private Long proHit;
	 
	 
	 
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProContents() {
		return proContents;
	}
	public void setProContents(String proContents) {
		this.proContents = proContents;
	}
	public Long getProPrice() {
		return proPrice;
	}
	public void setProPrice(Long proPrice) {
		this.proPrice = proPrice;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getProHit() {
		return proHit;
	}
	public void setProHit(Long proHit) {
		this.proHit = proHit;
	}
	public List<ProductFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<ProductFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getProNo() {
		return proNo;
	}
	public void setProNo(Long proNo) {
		this.proNo = proNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}

	 
	 
}

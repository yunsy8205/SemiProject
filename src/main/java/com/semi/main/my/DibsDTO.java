package com.semi.main.my;

import java.util.List;

import com.semi.main.product.ProductFileDTO;

public class DibsDTO {
	 private Long userNo;
	 private Long proNo;
	 private String proName;
	 private List<ProductFileDTO> fileDTOs;
	 
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

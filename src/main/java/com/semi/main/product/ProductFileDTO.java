package com.semi.main.product;

import com.semi.main.file.FileDTO;

public class ProductFileDTO extends FileDTO{

	private Long fileNo;
	private Long proNo;
	

	public Long getProNo() {
		return proNo;
	}

	public void setProNo(Long proNo) {
		System.out.println("Setting proNo in ProductFileDTO: " + proNo); // 디버깅 메시지 추가
		this.proNo = proNo;
	}

	public Long getFileNo() {
		return fileNo;
	}

	public void setFileNo(Long fileNo) {
		this.fileNo = fileNo;
	}
	
	

	
}

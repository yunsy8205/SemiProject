package com.semi.main.my;

import java.sql.Date;
import java.util.List;

import com.semi.main.product.ProductFileDTO;

public class ReviewsDTO {
	private Long userNo;
	private Long proNo;
	private Long reviewNo;
	private String proName;
	private String contents;
	private Date reviewDate;
	private List<ProductFileDTO> fileDTOs;
	private Double score;
	
	
	
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
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
	public Long getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(Long reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
	
}

package com.semi.main.product;

public class ProductReviewDTO {

	private Long reviewNo;
	private Long proNo;
	private Long userNo;
	private String contents;
	private Integer score;
	
	public Long getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(Long reviewNo) {
		this.reviewNo = reviewNo;
	}
	public Long getProNo() {
		return proNo;
	}
	public void setProNo(Long proNo) {
		this.proNo = proNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	
	
}



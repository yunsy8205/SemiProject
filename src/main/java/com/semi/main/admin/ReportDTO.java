package com.semi.main.admin;

import java.sql.Date;

public class ReportDTO {
	
	private Long reportNo;
	private Long userNo;
	private Long catNo;
	private Long StatusNo;
	private String rContents;
	private String userId;
	private String title;
	private Date reportDate;
	private String catName;
	
	
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getReportNo() {
		return reportNo;
	}
	public void setReportNo(Long reportNo) {
		this.reportNo = reportNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getCatNo() {
		return catNo;
	}
	public void setCatNo(Long catNo) {
		this.catNo = catNo;
	}
	public Long getStatusNo() {
		return StatusNo;
	}
	public void setStatusNo(Long statusNo) {
		StatusNo = statusNo;
	}
	public String getrContents() {
		return rContents;
	}
	public void setrContents(String rContents) {
		this.rContents = rContents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}

package com.semi.main.product;

import java.sql.Date;

public class ProductDTO {
	
	private Long proNo;
	private Long catNo;
	private Long userNo;
	private	String proName;
	private	Long proPrice;
	private	String proContents;
	private	Long proAmount;
	private	Date createDate;
	private	Date modifyDate;
	private	int	exchange;
	private int proStatus;
	private Long proHit;
	private int proSale;
	
	
	public Long getProNo() {
		return proNo;
	}
	public void setProNo(Long proNo) {
		this.proNo = proNo;
	}
	public Long getCatNo() {
		return catNo;
	}
	public void setCatNo(Long catNo) {
		this.catNo = catNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Long getProPrice() {
		return proPrice;
	}
	public void setProPrice(Long proPrice) {
		this.proPrice = proPrice;
	}
	public String getProContents() {
		return proContents;
	}
	public void setProContents(String proContents) {
		this.proContents = proContents;
	}
	public Long getProAmount() {
		return proAmount;
	}
	public void setProAmount(Long proAmount) {
		this.proAmount = proAmount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getExchange() {
		return exchange;
	}
	public void setExchange(int exchange) {
		this.exchange = exchange;
	}
	public int getProStatus() {
		return proStatus;
	}
	public void setProStatus(int proStatus) {
		this.proStatus = proStatus;
	}
	public Long getProHit() {
		return proHit;
	}
	public void setProHit(Long proHit) {
		this.proHit = proHit;
	}
	public int getProSale() {
		return proSale;
	}
	public void setProSale(int proSale) {
		this.proSale = proSale;
	}
	

}

package com.semi.main.product;

import java.sql.Date;
import java.util.List;

public class ProductDTO {

	private String proContents;
	private Long proAmount;
	private Date createDate;
	private Date ModifyDate;
	private Integer exChange;
	private Integer proState;
	private Long proHit;
	private Integer proSale;
	private Long proNo;
	private Long catNo;
	private Long userNo;
	private String proName;
	private Long proPrice;
	private List<ProductFileDTO> fileDTOs;
	
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
		return ModifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		ModifyDate = modifyDate;
	}
	public Integer getExChange() {
		return exChange;
	}
	public void setExChange(Integer exChange) {
		this.exChange = exChange;
	}
	public Integer getProState() {
		return proState;
	}
	public void setProState(Integer proState) {
		this.proState = proState;
	}
	public Long getProHit() {
		return proHit;
	}
	public void setProHit(Long proHit) {
		this.proHit = proHit;
	}
	public Integer getProSale() {
		return proSale;
	}
	public void setProSale(Integer proSale) {
		this.proSale = proSale;
	}
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

}

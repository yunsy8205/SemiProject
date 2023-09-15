package com.semi.main.my;

import java.sql.Date;
import java.util.List;

import com.semi.main.product.ProductFileDTO;

public class SaleDTO {
	private Long userNo;
	private String proName;
	private Long totalPrice;
	private Long proAmount;
	private Date createDate;
	private List<ProductFileDTO> fileDTOs;
	private Long statusNo;
	private Long proNo;
	private Date paymentDate;
	private Long proPrice;
	private String paymentNo;
	
	
	
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	public Long getProPrice() {
		return proPrice;
	}
	public void setProPrice(Long proPrice) {
		this.proPrice = proPrice;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public Long getProNo() {
		return proNo;
	}
	public void setProNo(Long proNo) {
		this.proNo = proNo;
	}
	public Long getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(Long statusNo) {
		this.statusNo = statusNo;
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
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
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
	public List<ProductFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<ProductFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
}

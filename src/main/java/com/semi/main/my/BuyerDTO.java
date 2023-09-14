package com.semi.main.my;

import java.sql.Date;
import java.util.List;

import com.semi.main.product.ProductFileDTO;

public class BuyerDTO {
	private Long userNo;
	private Long proNo;
	private String proName;
	private Long totalPrice;
	private Date paymentDate;
	private String uidNo;
	private List<ProductFileDTO> fileDTOs;
	private Long statusNo;
	
	
	public Long getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(Long statusNo) {
		this.statusNo = statusNo;
	}
	public String getUidNo() {
		return uidNo;
	}
	public void setUidNo(String uidNo) {
		this.uidNo = uidNo;
	}
	public List<ProductFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<ProductFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
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
	
	
}

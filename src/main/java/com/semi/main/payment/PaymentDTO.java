package com.semi.main.payment;

public class PaymentDTO {
	
	private Long paymentNo;
	private String proName;
	private Long proPrice;
	private String name;
	private String phone;
	private String uid;
	public Long getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(Long paymentNo) {
		this.paymentNo = paymentNo;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}

}

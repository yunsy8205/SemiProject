package com.semi.main.my;

import java.sql.Date;

public class MyPageDTO {

	private Long userNo;
	private String userId;
	private String userPw;
	private String name;
	private String email;
	private Date birth;
	private String address;
	private String phone;
	private Date accountDate;
//	08/21? 컬럼 추가
	private String intro;
	private MyPageFileDTO myPageFileDTO;
//	08/28 주소컬럼 추가
	private Long zipCode;
	private String refAddress;
	private String DetailAddress;
	
	
	
	public Long getZipCode() {
		return zipCode;
	}
	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}
	public String getRefAddress() {
		return refAddress;
	}
	public void setRefAddress(String refAddress) {
		this.refAddress = refAddress;
	}
	public String getDetailAddress() {
		return DetailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}
	public MyPageFileDTO getMyPageFileDTO() {
		return myPageFileDTO;
	}
	public void setMyPageFileDTO(MyPageFileDTO myPageFileDTO) {
		this.myPageFileDTO = myPageFileDTO;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Long getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(Long statusNo) {
		this.statusNo = statusNo;
	}
	private Long statusNo;
	
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getAccountDate() {
		return accountDate;
	}
	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}
	
	
}
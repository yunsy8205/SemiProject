package com.semi.main.member;

import java.sql.Date;
import java.util.List;

public class MemberDTO {
	
	/* MEMBER 테이블 기본 컬럼*/
	
	private Long userNo;
	
	private String userId;
	
	private String userPw;
	
	private String name;
	
	private String email;
	
	private Date birth;
	
	//메인주소
	private String address;
	
	private String phone;
	
	private Date accountDate;
	
	private String intro;
	
	private Long statusNo;
	
	// 주소 컬럼 추가
	// 우편주소
	private Long zipCode;
	
	// 참조주소
	private String refAddress;
	
	// 상세주소
	private String DetailAddress;
	
	
	
	/* JOIN절에 따른 추가 컬럼 */
	
	private List<RoleDTO> roles;
	
	private MemberFileDTO memberFileDTO;
	
	private String originalName;
	

	
	/* getter and setter */
	
	public Long getUserNo() {
		return userNo;
	}


	public Long getZipCode() {
		return zipCode;
	}


	public String getRefAddress() {
		return refAddress;
	}


	public String getDetailAddress() {
		return DetailAddress;
	}


	public MemberFileDTO getMemberFileDTO() {
		return memberFileDTO;
	}


	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}


	public void setRefAddress(String refAddress) {
		this.refAddress = refAddress;
	}


	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}


	public void setMemberFileDTO(MemberFileDTO memberFileDTO) {
		this.memberFileDTO = memberFileDTO;
	}


	public String getUserId() {
		return userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}


	public Date getBirth() {
		return birth;
	}


	public String getAddress() {
		return address;
	}


	public String getPhone() {
		return phone;
	}


	public Date getAccountDate() {
		return accountDate;
	}


	public String getIntro() {
		return intro;
	}


	public Long getStatusNo() {
		return statusNo;
	}


	public List<RoleDTO> getRoles() {
		return roles;
	}


	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}


	public void setStatusNo(Long statusNo) {
		this.statusNo = statusNo;
	}


	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}


	public String getOriginalName() {
		return originalName;
	}


	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	
	

}

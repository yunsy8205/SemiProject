package com.semi.main.member;

import java.beans.JavaBean;
import java.lang.reflect.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
//import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private HttpSession session;
	
//	@Autowired
//	private JavaMailSender jmsender;
	
	
	
	//@Autowired
	//private HttpSession session;

	// login
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		
		MemberDTO memberDTO2 = memberDAO.getLogin(memberDTO);
		
		// 비밀번호 중복확인
		if(memberDTO2 != null && memberDTO2.getUserPw().equals(memberDTO.getUserPw())) {
			memberDTO = memberDTO2;
			return memberDTO;
		}
		else {
			return null;
		}
	}
	
	/** 회원가입*/
	public int setJoin(MemberDTO memberDTO) throws Exception{
		System.out.println("회원가입 서비스");
		return memberDAO.setJoin(memberDTO);
	}
	
	// Naver login
	/*
	 * public String getnaverLogin(String type) throws Exception{ String baseUrl =
	 * context.get }
	 */
	
	/**ID 체크*/
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getUserIdCheck(memberDTO);
	}
	
	/**EMAIL 체크*/
	public MemberDTO getMailCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMailCheck(memberDTO);
	}
	
	
	

}
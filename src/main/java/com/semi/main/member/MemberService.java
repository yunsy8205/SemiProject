package com.semi.main.member;

import java.beans.JavaBean;
import java.lang.reflect.Member;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.semi.main.util.MailService;


@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MailService mailService;
	
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
		int result = memberDAO.setJoin(memberDTO);
		return memberDAO.joinGrant(memberDTO);
		}
	
	
	/**ID 체크*/
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getUserIdCheck(memberDTO);
	}
	
	/**EMAIL 체크*/
	public MemberDTO getMailCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMailCheck(memberDTO);
	}
	
	
	/** 비밀번호 찾기*/
	public int getFindPw(MemberDTO memberDTO) throws Exception{
		int result = 0;
		MemberDTO memberDTO2 = memberDAO.getMemberDetail(memberDTO);
		if(memberDTO2 != null && memberDTO.getEmail().equals(memberDTO2.getEmail())) {
			String newPw = UUID.randomUUID().toString().substring(0,7);//랜덤
			memberDTO.setUserPw(newPw);
			
			result = memberDAO.setUpdatePw(memberDTO);
			if(result >0) {
				String toEmail = memberDTO.getEmail();
				System.out.println(toEmail);
				String frEmail = "yunsy8205@naver.com";
				String subject = "구디장터 비밀번호 변경 안내";
				String body = "비밀번호가 ["+newPw+"]로 변경되었습니다.";
				
				mailService.sendEmail(toEmail, frEmail, subject, body);
				
				return result;  //1
			}
			else { 
				return result;  //0
			}
		}
		else {
			return result;  
		}
		
	}
	
	

}
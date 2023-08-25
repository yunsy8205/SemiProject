package com.semi.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//@Autowired
	//private HttpSession session;

	// login
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getLogin(memberDTO);
	
	}

}

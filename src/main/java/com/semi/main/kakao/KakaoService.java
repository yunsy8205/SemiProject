package com.semi.main.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.member.MemberDTO;

@Service
public class KakaoService {
	
	@Autowired
	private KakaoDAO kakaoDAO;
	
	public MemberDTO getEmailCheck(MemberDTO memberDTO) {
		return kakaoDAO.getEmailCheck(memberDTO);
	}
}

package com.semi.main.kakao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.member.MemberDTO;

@Repository
public class KakaoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.semi.main.member.MemberDAO.";
	
	public MemberDTO getEmailCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getEmailCheck", memberDTO);
	}
}

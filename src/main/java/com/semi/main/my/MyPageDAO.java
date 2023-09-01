package com.semi.main.my;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.member.MemberDTO;
import com.semi.main.member.MemberFileDTO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.semi.main.my.MyPageDAO.";
	
	
	public int setFileJoin(MemberFileDTO memberFileDTO) throws Exception{ //사진등록
	
		return sqlSession.insert(NAMESPACE+"setFileJoin", memberFileDTO);
	}
	
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{ //로그인 테스트로 나중에 삭제
    
		System.out.println(memberDTO.getUserId());
		System.out.println(memberDTO.getUserPw());
		
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
	}
	
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{ // 회원수정
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	

	public int setDelete(MemberDTO memberDTO) throws Exception{ // 회원탈퇴
		return sqlSession.delete(NAMESPACE+"setDelete", memberDTO);
	}
	

}
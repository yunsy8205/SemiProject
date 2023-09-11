package com.semi.main.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.semi.main.member.MemberDAO.";
	
	
	// login
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{	
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
		
	}
	
	// 회원가입
	  public int setJoin(MemberDTO memberDTO) throws Exception{ 
		  System.out.println("DAO 회원가입");
		  return sqlSession.insert(NAMESPACE+"setJoin", memberDTO); 
	  }
	  
	// ID 체크
	  public MemberDTO getUserIdCheck(MemberDTO memberDTO) throws Exception{
		  return sqlSession.selectOne(NAMESPACE+"getUserIdCheck", memberDTO);
	  }
	 
	

}
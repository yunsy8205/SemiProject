package com.semi.main.my;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.semi.main.my.MyPageDAO.";
	
	
	public int setFileJoin(MyPageFileDTO myPageFileDTO) throws Exception{ //사진등록
	
		return sqlSession.insert(NAMESPACE+"setFileJoin", myPageFileDTO);
	}
	
	
	public MyPageDTO getLogin(MyPageDTO myPageDTO) throws Exception{ //로그인 테스트로 나중에 삭제
		System.out.println(myPageDTO.getUserId());
		System.out.println(myPageDTO.getUserPw());
		
		return sqlSession.selectOne(NAMESPACE+"getLogin", myPageDTO);
	}
	
	
	public int setMemberUpdate(MyPageDTO myPageDTO) throws Exception{ // 회원수정
		return sqlSession.update(NAMESPACE+"setMemberUpdate", myPageDTO);
	}
	

	public int setDelete(MyPageDTO myPageDTO) throws Exception{ // 회원탈퇴
		return sqlSession.delete(NAMESPACE+"setDelete", myPageDTO);
	}
	

}
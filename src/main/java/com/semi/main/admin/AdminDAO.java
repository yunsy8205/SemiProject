package com.semi.main.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.member.MemberDTO;
import com.semi.main.util.Pager;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.admin.AdminDAO.";
	
	public List<MemberDTO> memberList(Pager pager)throws Exception{
		System.out.println("1");
		return sqlSession.selectList(NAMESPACE+"memberList",pager);
	}
	
	public Long getTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}
}

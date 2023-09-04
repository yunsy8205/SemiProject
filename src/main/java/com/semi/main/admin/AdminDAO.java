package com.semi.main.admin;

import java.util.List;
import java.util.Map;

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
		return sqlSession.selectList(NAMESPACE+"memberList",pager);
	}
	
	public Long getTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}
	
	public int statusChange(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"statusChange", memberDTO);
	}
	
	public MemberDTO memberDetail(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberDetail", memberDTO);
	}
	
	public int memberUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}
	
	public int reportAdd(Map<String, Object> map)throws Exception{
		return sqlSession.insert(NAMESPACE+"reportAdd", map);
	}
	
	public int setFileAdd(ReportFileDTO reportFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", reportFileDTO);
				
	}
	
	public List<ReportDTO> reportList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"reportList", pager);
	}
	
	public Long reportTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reportTotal", pager);
	}
	
	public int reportStatus(ReportDTO reportDTO)throws Exception{
		System.out.println("확인여부");
		return sqlSession.update(NAMESPACE+"reportStatus", reportDTO);
	}
}

package com.semi.main.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.member.MemberDTO;
import com.semi.main.util.Pager;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<MemberDTO> memberList(Pager pager)throws Exception{
		pager.setPerPage(20L);
		pager.makeRowNum();
		Long total = adminDAO.getTotal(pager);
		pager.makePageNum(total);		
		return adminDAO.memberList(pager);
	}
	
	public int statusChange(MemberDTO memberDTO)throws Exception{
		if(memberDTO.getStatusNo()==0) {
			memberDTO.setStatusNo(1L);
		}else {
			memberDTO.setStatusNo(0L);
		}
		return adminDAO.statusChange(memberDTO);
	}
	
	public MemberDTO memberDetail(MemberDTO memberDTO) throws Exception{
		return adminDAO.memberDetail(memberDTO);
	}
}

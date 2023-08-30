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
		return adminDAO.memberList(pager);
	}
}

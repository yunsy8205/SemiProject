package com.semi.main.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.main.member.MemberDTO;
import com.semi.main.util.Pager;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "member", method = RequestMethod.GET)
	public String memberList(Pager pager, Model model) throws Exception{
		List<MemberDTO> ar = adminService.memberList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "admin/member";
	}
	
	@RequestMapping(value = "statusChange", method = RequestMethod.POST)
	public String statusChange(MemberDTO memberDTO, Model model)throws Exception {
		int result = adminService.statusChange(memberDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "memberdetail", method = RequestMethod.GET)
	public String memberList(MemberDTO memberDTO, Model model) throws Exception{
		memberDTO = adminService.memberDetail(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "admin/memberdetail";
	}
}	

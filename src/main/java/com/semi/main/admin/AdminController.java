package com.semi.main.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value = "memberupdate", method = RequestMethod.GET)
	public String memberUpdate(MemberDTO memberDTO, Model model) throws Exception{
		memberDTO = adminService.memberDetail(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "admin/memberupdate"; 
	}
	
	@RequestMapping(value = "memberupdate", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO) throws Exception{
		int result = adminService.memberUpdate(memberDTO);
		return "redirect:./memberdetail?userNo="+memberDTO.getUserNo(); 
	}
	
	@RequestMapping(value = "reportadd", method = RequestMethod.GET)
	public String reportAdd(MemberDTO memberDTO, Model model)throws Exception{
		memberDTO=adminService.memberDetail(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "admin/reportadd";
	}
	
	@RequestMapping(value = "reportadd", method = RequestMethod.POST)
	public String reportAdd(MultipartFile [] photos, ReportDTO reportDTO, Model model, HttpSession session)throws Exception{
		int result=adminService.reportAdd(photos, reportDTO, session);
		return "redirect:../profile/products?userNo="+reportDTO.getUserNo();
	}
	
	@RequestMapping(value = "report", method = RequestMethod.GET)
	public String reportList(Model model, Pager pager) throws Exception{
		List<ReportDTO> ar =adminService.reportList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "admin/report";
	}
	
	@RequestMapping(value = "reportstatus", method = RequestMethod.POST)
	public String reportStatus(ReportDTO reportDTO, Model model)throws Exception {
		int result = adminService.reportStatus(reportDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
}	

package com.semi.main.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.member.MemberDTO;
import com.semi.main.util.MailService;
import com.semi.main.util.Pager;
import com.semi.main.util.PayService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private PayService payService;
	@Autowired
	private MailService mailService;
	
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
		System.out.println(memberDTO.getOriginalName());
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
	
	@RequestMapping(value = "reportdetail", method = RequestMethod.GET)
	public String reportDetail(ReportDTO reportDTO, Model model)throws Exception{
		reportDTO = adminService.reportDetail(reportDTO);
		model.addAttribute("dto", reportDTO);
		MemberDTO memberDTO = adminService.reportId(reportDTO);
		model.addAttribute("id", memberDTO);
		
		return "admin/reportdetail";
	}
	
	@RequestMapping(value = "checkAccount", method = RequestMethod.GET)
	public String checkAccount()throws Exception{
		String token = payService.getToken("3857776236202128", "qt5gBM0lhOUyMjNsP0SCyU89K16kK326nk369CwdKlRavvMtHIp14JJZLHocGlzAz5WPLENXIux6DcwK");
		String name =payService.checkAccount(token, "011", "3520512490733");
		System.out.println(name);
		return "redirect:/";
	}
	//비번초기화
	@RequestMapping(value = "passwordreset", method = RequestMethod.POST)
	public String passwordReset(MemberDTO memberDTO, Model model)throws Exception{
		String pw = RandomStringUtils.randomAlphanumeric(10);
		System.out.println(pw);
		memberDTO.setUserPw(pw);
		int result = adminService.passwordReset(memberDTO);
		if(result==1) {
			String toEmail = memberDTO.getEmail();
			String frEmail = "yunsy8205@naver.com";
			String subject = "구디장터 비밀번호 변경 안내";
			String body = "비밀번호가 ["+memberDTO.getUserPw()+"]로 변경되었습니다.";

			mailService.sendEmail(toEmail, frEmail, subject, body);
		}else {
			System.out.println("비번 초기화 실패");
		}
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
}	

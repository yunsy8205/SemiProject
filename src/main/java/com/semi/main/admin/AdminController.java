package com.semi.main.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.board.BoardDTO;
import com.semi.main.member.MemberDTO;

import com.semi.main.member.MemberFileDTO;
import com.semi.main.member.RoleDTO;
import com.semi.main.product.ProductDTO;


import com.semi.main.payment.PaymentDTO;
import com.semi.main.payment.PaymentService;

import com.semi.main.qna.QnaService;

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
	@Autowired
	private QnaService qnaService;
	@Autowired
	private PaymentService paymentService;

	//비번초기화
	@RequestMapping(value = "passwordreset", method = RequestMethod.POST)
	public String passwordReset(MemberDTO memberDTO, Model model)throws Exception{
		String pw = RandomStringUtils.randomAlphanumeric(10);//비번생성 10자리
		System.out.println("비번:"+pw);
		memberDTO.setUserPw(pw);
		int result = adminService.passwordReset(memberDTO);//비번 db에 저장
		if(result==1) {//저장 성공시 메일
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
	

	
	//qnalist
	@GetMapping("qna")
	public String QnaList(Pager pager, Model model)throws Exception {
		List<BoardDTO> ar = qnaService.getList(pager);
		
		model.addAttribute("list",ar);
		model.addAttribute("pager",pager);
		return "admin/qnaList";
	}
	
	@GetMapping("payment")
	public String getPayList(Pager pager, Model model)throws Exception {
		List<PaymentDTO> ar = paymentService.getPayList(pager);
		
		model.addAttribute("list",ar);
		model.addAttribute("pager",pager);
		return "admin/paymentList";
	}


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
	
// 	@RequestMapping(value = "memberdetail", method = RequestMethod.GET)
// 	public String memberList(MemberDTO memberDTO, Model model) throws Exception{
// 		memberDTO = adminService.memberDetail(memberDTO);
// 		model.addAttribute("dto", memberDTO);
// 		return "admin/memberdetail";
// 	}
	
	@RequestMapping(value = "memberupdate", method = RequestMethod.GET)
	public String memberUpdate(MemberDTO memberDTO, Model model) throws Exception{
		memberDTO = adminService.memberDetail(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "admin/memberupdate"; 
	}
	
	@RequestMapping(value = "memberupdate", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO, RoleDTO roleDTO) throws Exception{
		int result = adminService.memberUpdate(memberDTO, roleDTO);
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

	
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String productList(Pager pager, Model model)throws Exception{
		List<ProductDTO> ar = adminService.productList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
		return "admin/product";
	}
	
	@RequestMapping(value = "productsale", method = RequestMethod.POST)
	public String productSale(ProductDTO productDTO, Model model) throws Exception{

		int result = adminService.productSale(productDTO);
		System.out.println(result);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "memberFileDel", method = RequestMethod.POST)
	public String memberFileDel(MemberFileDTO memberFileDTO, Model model)throws Exception {
		int result = adminService.memberFileDel(memberFileDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

}	

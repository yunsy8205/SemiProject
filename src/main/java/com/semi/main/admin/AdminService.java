package com.semi.main.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.integration.dsl.KotlinFilterEndpointSpec;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.member.MemberDTO;
import com.semi.main.member.MemberFileDTO;
import com.semi.main.member.RoleDTO;
import com.semi.main.product.ProductDTO;
import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private FileManager fileManager;
	
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
	
	public int memberUpdate(MemberDTO memberDTO, RoleDTO roleDTO)throws Exception{
		int result = adminDAO.memberUpdate(memberDTO);
		
		if(result==1) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member", memberDTO);
			map.put("role", roleDTO);
			result = adminDAO.memberRole(map);
			System.out.println(result);
		}else {
			result=0;
			System.out.println("권한업데이트 실패");
		}
		
		return result;
	}
	
	public int reportAdd(MultipartFile [] files, ReportDTO reportDTO, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("report", reportDTO);
		map.put("member", memberDTO);
		int result = adminDAO.reportAdd(map);
		String path="/resources/upload/report/";
		for(MultipartFile multipartFile: files) {// 배열이라서 for 문을 사용한다.
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(path, session, multipartFile);
			ReportFileDTO reportFileDTO = new ReportFileDTO();
			reportFileDTO.setReportNo(reportDTO.getReportNo());;
			reportFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			reportFileDTO.setFileName(fileName);
			
			result = adminDAO.setFileAdd(reportFileDTO);
			
		}
		return result;
	}
	
	public List<ReportDTO> reportList(Pager pager)throws Exception{
		pager.setPerPage(20L);
		pager.makeRowNum();
		Long total = adminDAO.reportTotal(pager);
		pager.makePageNum(total);		
		return adminDAO.reportList(pager);
	}
	
	public int reportStatus(ReportDTO reportDTO)throws Exception{
		return adminDAO.reportStatus(reportDTO);
	}
	
	public ReportDTO reportDetail(ReportDTO reportDTO)throws Exception{
		return adminDAO.reportDetail(reportDTO);
	}
	
	public MemberDTO reportId(ReportDTO reportDTO)throws Exception{
		return adminDAO.reportId(reportDTO);
	}
	
	public int passwordReset(MemberDTO memberDTO)throws Exception{
		int result = adminDAO.passwordReset(memberDTO);
		return result;
	}
	
	public List<ProductDTO> productList(Pager pager)throws Exception{
		pager.setPerPage(20L);
		pager.makeRowNum();
		Long total = adminDAO.productTotal(pager);
		pager.makePageNum(total);
		return adminDAO.productList(pager);
	}
	
	public int productSale(ProductDTO productDTO) throws Exception{
		return adminDAO.productSale(productDTO);
	}
	
	public int memberFileDel(MemberFileDTO memberFileDTO) throws Exception{
		return adminDAO.memberFileDel(memberFileDTO);
	}
	
}

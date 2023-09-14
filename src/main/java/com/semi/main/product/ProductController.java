package com.semi.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;

import com.semi.main.admin.AdminService;
import com.semi.main.admin.ReportDTO;
import com.semi.main.member.MemberDTO;
import com.semi.main.profile.ProfileService;
import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public String getList(Pager pager,Model model,Long catNo,String condition) throws Exception{
	
		 // condition 값을 Pager 객체에 설정
	    pager.setCondition(condition);
	
	   

		List<ProductDTO> ar = productService.getList(pager);
//		System.out.println("Controller Pager: " + pager);
//		System.out.println("startNum Pager: " + pager.getStartNum());
//		System.out.println("lastNum Pager: " + pager.getLastNum());
//		System.out.println("total: " + pager.getTotalPage());
//		System.out.println("startRow Pager: " + pager.getStartRow());
//		System.out.println("LastRow Pager: " + pager.getLastRow());
//		System.out.println("getPerPage: " + pager.getPerPage());
//		System.out.println("getPage: " + pager.getPage());
//		
		
		
		
		model.addAttribute("list",ar);
		model.addAttribute("condition", condition); // 현재 선택된 조건
		model.addAttribute("pager", pager);
		
		return "product/list";
	}
	
	
	
		@RequestMapping(value = "categoryList")
		public String getCategoryList(Pager pager,Long catNo, Model model,String condition) throws Exception{
		    // Pager 클래스에 조건(condition) 및 카테고리(catNo)를 설정합니다.
		    pager.setCondition(condition); // 최신순, 인기순, 저가순, 고가순 중 어떤 조건으로 리스트를 가져올지 설정합니다.
		    pager.setCatNo(catNo); // 카테고리 번호를 설정합니다.

		    System.out.println(pager.getLastNum());
	        List<ProductDTO> ar = productService.getCategoryList(pager);
	      
//	        // 각 상품에 대한 이미지 리스트 가져오기
//	        for (ProductDTO product : ar) {
//	            List<ProductFileDTO> fileList = productService.getFileList(product.getProNo());
//	            if (!fileList.isEmpty()) { // 파일이 있는 경우에만 첫 번째 파일을 설정
//	                ProductFileDTO firstFile = fileList.get(0);
//	                product.getFileDTOs().clear(); // 기존 파일 리스트 제거
//	                product.getFileDTOs().add(firstFile); // 첫 번째 파일만 추가
//	            }
//	        }
			model.addAttribute("list",ar);
			model.addAttribute("pager", pager);
			model.addAttribute("catNo", catNo);
			model.addAttribute("condition", condition); // 현재 선택된 조건 (예: 최신순, 인기순 등)
	        return "product/categoryList"; // JSP page name in the "product" folder
	    }
	
	@GetMapping("detail")
	public String getDetail(ProductDTO productDTO, Model model,Long proHit) throws Exception{
		
		//판매상품 정보
		productDTO = productService.getDetail(productDTO);
		productService.setHitCount(productDTO.getProNo());
		for(ProductFileDTO a:productDTO.getFileDTOs()) {
			a.getOriginalName();
		}
		model.addAttribute("dto", productDTO);
		//판매자상품수, 판매자후기수
		Long countProduct = productService.countProduct(productDTO);
		model.addAttribute("countp", countProduct);
		Long countReview = productService.countReview(productDTO);
		model.addAttribute("countr", countReview);
		//판매자상품 리스트
		List<ProductDTO> ar = productService.memberProList(productDTO);
		model.addAttribute("list", ar);
		//판매자후기 리스트
		List<ProductReviewDTO> ar2 = productService.memberReviewList(productDTO);
		model.addAttribute("review", ar2);
		
		//dibsNum
		Long dibsNum = productService.dibsNum(productDTO);
		model.addAttribute("dibsNum", dibsNum);
		
		
		return "product/detail";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String setAdd()throws Exception{
		return "product/add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String setAdd(ProductDTO productDTO, MultipartFile[] photos, HttpSession session, Model model)throws Exception{
		int result = productService.setAdd(productDTO, photos, session);
		
		String message="등록 실패";
		
		if(result>0) {
			message="등록 성공";
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("url", "/");
		
		return "commons/result";
	}
	
	
	@GetMapping("index")
	public String boot() throws Exception{
		return "product/index";
	}
	
	@PostMapping("dibsAdd")
	public String dibsAdd(ProductDTO productDTO, Model model, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productDTO.setUserNo(memberDTO.getUserNo());
		int result = productService.dibsAdd(productDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String setUpdate( ProductDTO productDTO,Model model) throws Exception{
		
		productDTO = productService.getDetail(productDTO);
		System.out.println(productDTO.getProNo());
		model.addAttribute("product", productDTO);
		System.out.println(productDTO);
		return "product/update";
	
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(ProductDTO productDTO, MultipartFile[] photos, HttpSession session, HttpServletRequest request) throws Exception {
	    // 제품 정보 업데이트
	    int result = productService.setUpdate(productDTO, photos, session);

//	    // 선택한 파일 삭제
//	    String[] fileIds = request.getParameterValues("deleteFiles");
//	    if (fileIds != null) {
//	        for (String fileId : fileIds) {
//	            ProductFileDTO productFileDTO = new ProductFileDTO();
//	            productFileDTO.setFileNo(Long.parseLong(fileId));
//	            
//	            // 파일 삭제 메서드 호출
//	            productService.setFileDelete(productFileDTO, session);
//	        }
//	    }
//
//	    // 새 파일 업로드
//	    for (MultipartFile file : photos) {
//	        if (file != null && !file.isEmpty()) {
//	            String fileName = fileManager.fileSave("/resources/upload/product/", session, file);
//
//	            ProductFileDTO productFileDTO = new ProductFileDTO();
//	            productFileDTO.setFileNo(productDTO.getProNo());
//	            productFileDTO.setFileName(fileName);
//	            productFileDTO.setOriginalName(file.getOriginalFilename());
//	            productFileDTO.setProNo(productDTO.getProNo());
//
//	            // 파일 추가 메서드 호출
//	            productService.setFileAdd(productFileDTO);
//	        }
//	    }

	    Long proNo = productDTO.getProNo();
	    return "redirect:/product/detail?proNo=" + proNo;
	}

	
	@GetMapping("fileDelete")
	public String setFileDelete(ProductFileDTO productFileDTO,Model modle,HttpSession session) throws Exception{
		System.out.println("Controller = "+productFileDTO.getFileNo());
		System.out.println("Controller = "+productFileDTO.getFileName());
		System.out.println("Controller = "+productFileDTO.getOriginalName());
		int result = productService.setFileDelete(productFileDTO,session);;
		modle.addAttribute("result",result);
		
		return "commons/ajaxResult";
		
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String setDelete(@RequestParam Long proNo)throws Exception{
		int result =productService.setDelete(proNo);
		return "redirect:/my/list";
	}	

	
	
	@GetMapping("dibsDelete")
	public String dibsDelete(ProductDTO productDTO, Model model, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productDTO.setUserNo(memberDTO.getUserNo());
		int result = productService.dibsDelete(productDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	@GetMapping("dibsConfirm")
	public String dibsConfirm(ProductDTO productDTO, Model model, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productDTO.setUserNo(memberDTO.getUserNo());
		ProductDTO dto = productService.dibsConfirm(productDTO);
		if(dto!=null) {
			
			model.addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		return "commons/ajaxResult";
	}
	
	@GetMapping("reviewadd")
	public String reviewAdd(ProductDTO productDTO, Model model)throws Exception{
		productDTO=productService.getDetail(productDTO);
		System.out.println(productDTO.getProName());
		model.addAttribute("dto", productDTO);
		return "product/reviewadd";
	}
	
	@PostMapping("reviewadd")
	public String reviewAdd(ProductReviewDTO productReviewDTO, Model model)throws Exception{
		

		int result =productService.reviewAdd(productReviewDTO);
		System.out.println(result);
		return "redirect:../";
	}
	
	@GetMapping("reportadd")
	public void reportAdd(ReportDTO reportDTO, Model model)throws Exception{
		MemberDTO memberDTO=adminService.reportId(reportDTO);
		System.out.println(memberDTO.getUserId());
		model.addAttribute("dto", memberDTO);
		
	}
	
	@PostMapping("reportadd")
	public String reportAdd(ReportDTO reportDTO, MultipartFile [] photos, HttpSession session, Model model)throws Exception{
		int result =adminService.reportAdd(photos, reportDTO, session);
		
		String message="신고 실패";
		
		if(result>0) {
			message="신고 완료";	
		}
		
		model.addAttribute("message", message);
		model.addAttribute("url", "/");
		
		return "commons/result";
		
	}
}

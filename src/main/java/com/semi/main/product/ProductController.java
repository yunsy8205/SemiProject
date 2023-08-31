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
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.member.MemberDTO;
import com.semi.main.profile.ProfileService;
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public String getList(Pager pager,Model model) throws Exception{
		List<ProductDTO> ar = productService.getList(pager);
		
		// 각 상품에 대한 이미지 리스트 가져오기
        for (ProductDTO product : ar) {
            List<ProductFileDTO> fileList = productService.getFileList(product.getProNo());
            if (!fileList.isEmpty()) { // 파일이 있는 경우에만 첫 번째 파일을 설정
                ProductFileDTO firstFile = fileList.get(0);
                product.getFileDTOs().clear(); // 기존 파일 리스트 제거
                product.getFileDTOs().add(firstFile); // 첫 번째 파일만 추가
            }
        }
		model.addAttribute("list",ar);
		model.addAttribute("pager", pager);
		
		return "product/list";
	}
	
	 @GetMapping("/category/{catNo}")
	    public String getCategoryList(@PathVariable Long catNo, Model model) {
	        List<ProductDTO> productList = productService.getListByCategory(catNo);
	        model.addAttribute("productList", productList);
	        return "product/categoryList"; // JSP page name in the "product" folder
	    }
	
	@GetMapping("detail")
	public String getDetail(ProductDTO productDTO, Model model) throws Exception{
		
		//판매상품 정보
		productDTO = productService.getDetail(productDTO);
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
		model.addAttribute("url", "list");
		
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
}

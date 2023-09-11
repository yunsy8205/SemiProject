package com.semi.main;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductFileDTO;
import com.semi.main.product.ProductService;
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/*")
public class FrontController {
	
	@Autowired
    private ProductService productService;


	
	@RequestMapping(value="")
	public String index(Pager pager,Model model) throws Exception{
		List<ProductDTO> ar = productService.getList(pager);
		for(ProductDTO productDTO: ar) {
//			String file=productDTO.getFileDTOs().get(0).getOriginalName();
		}
		
//			// 조건에 따라 정렬된 상품 리스트 가져오기
//		    List<ProductDTO> conditionList = productService.getConditionList(pager);
		    
	
		model.addAttribute("list",ar);
//		model.addAttribute("conditionList", conditionList);
		model.addAttribute("pager", pager);
		
		return "index";
	}
	
	
	}
	

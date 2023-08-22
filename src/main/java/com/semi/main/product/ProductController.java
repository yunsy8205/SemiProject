package com.semi.main.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("detail")
	public String getDetail(ProductDTO productDTO, Model model) throws Exception{
		System.out.println("C");
		productDTO=productService.getDetail(productDTO);
		model.addAttribute("dto", productDTO);
		
		return "product/detail";
	}

}

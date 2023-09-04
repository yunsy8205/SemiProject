package com.semi.main.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "paymentadd", method = RequestMethod.GET)
	public String paymentAdd(ProductDTO productDTO, Model model) throws Exception{
		productDTO = productService.getDetail(productDTO);
		System.out.println(productDTO.getProName());
		model.addAttribute("dto", productDTO);
		return "payment/paymentadd";
	}
	
}

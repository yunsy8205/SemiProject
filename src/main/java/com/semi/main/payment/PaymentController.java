package com.semi.main.payment;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Autowired
	private ProductService productService;
	
	private IamportClient api;
	
	public PaymentController() {
		this.api = new IamportClient("0423121332258201","gucymO3pfPTz2um1RFankOgQlBdMynAnTuxxjh8mXDFLYhLjcC5XZjhZ1UD39Dgpv0aFfphzsR1RYlvK");
	}
	
	@RequestMapping(value = "paymentadd", method = RequestMethod.GET)
	public String paymentAdd(ProductDTO productDTO, Model model) throws Exception{
		productDTO = productService.getDetail(productDTO);
		System.out.println(productDTO.getProName());
		model.addAttribute("dto", productDTO);
		return "payment/paymentadd";
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}", method = RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
		
	}

	
}
	

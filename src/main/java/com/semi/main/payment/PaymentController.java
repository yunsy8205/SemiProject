package com.semi.main.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@RequestMapping(value = "paymentadd", method = RequestMethod.GET)
	public String paymentAdd() throws Exception{
		return "payment/paymentadd";
	}

}

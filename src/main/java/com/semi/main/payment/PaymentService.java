package com.semi.main.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	public int paymentAdd(PaymentDTO paymentDTO)throws Exception {
		return paymentDAO.paymentAdd(paymentDTO);
	}
	
	
	
}

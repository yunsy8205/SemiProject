package com.semi.main.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.member.MemberDTO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	public int paymentAdd(PaymentDTO paymentDTO)throws Exception {
		return paymentDAO.paymentAdd(paymentDTO);
	}
	
	public int checkAccount(MemberDTO memberDTO)throws Exception{
		return paymentDAO.checkAccount(memberDTO);
	}
	
}

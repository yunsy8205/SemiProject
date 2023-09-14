package com.semi.main.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.semi.main.qna.QnaDAO;
import com.semi.main.util.Pager;
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
  
  public List<PaymentDTO> getPayList(Pager pager)throws Exception{
	   
	   pager.setPerPage(15L);
	   pager.makeRowNum();
	   Long total = paymentDAO.getTotal(pager);
	   pager.makePageNum(total);
	   return paymentDAO.getPayList(pager);
   }
  
  public int setPayUpdate(PaymentDTO paymentDTO)throws Exception{
	  return paymentDAO.setPayUpdate(paymentDTO);
  }

  public PaymentDTO getPayDetail(PaymentDTO paymentDTO)throws Exception{
	  return paymentDAO.getPayDetail(paymentDTO);
  }
}

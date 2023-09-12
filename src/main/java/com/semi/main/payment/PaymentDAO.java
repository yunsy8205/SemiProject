package com.semi.main.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.member.MemberDTO;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.payment.PaymentDAO.";
	
	public int paymentAdd(PaymentDTO paymentDTO)throws Exception {
		return sqlSession.insert(NAMESPACE+"paymentAdd", paymentDTO);
	}
	
	public int checkAccount(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"checkAccount", memberDTO);
	}
}

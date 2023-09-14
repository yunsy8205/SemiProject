package com.semi.main.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.semi.main.util.Pager;
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

   public List<PaymentDTO> getPayList(Pager pager)throws Exception{
	   return sqlSession.selectList(NAMESPACE+"getPayList",pager );
   }
   
   public Long getTotal(Pager pager)throws Exception{
	   return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
   }
   
   public int setPayUpdate(PaymentDTO paymentDTO)throws Exception{
	   return sqlSession.update(NAMESPACE+"setPayUpdate", paymentDTO);
   }
  

}


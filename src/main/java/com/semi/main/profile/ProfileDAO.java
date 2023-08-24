package com.semi.main.profile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductReviewDTO;

@Repository
public class ProfileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.profile.ProfileDAO.";
	
	public ProfileDTO memberProfile(ProfileDTO profileDTO) throws Exception{
		System.out.println(profileDTO.getUserNo());
		return sqlSession.selectOne(NAMESPACE+"memberProfile", profileDTO);
	}
	
	public Long countSaleProduct(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"countSaleProduct", profileDTO);
	}
	
	public Double avgScore(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"avgScore", profileDTO);
	}
	
	public List<ProductDTO> memberProList(ProfileDTO profileDTO)throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberProList", profileDTO);
	}
	
	public List<ProductReviewDTO> memberReviewList(ProfileDTO profileDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberReviewList", profileDTO);
	}
}

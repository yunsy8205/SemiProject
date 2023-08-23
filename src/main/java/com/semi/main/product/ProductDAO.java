package com.semi.main.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.util.Pager;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.product.ProductDAO.";
	
	
	public List<ProductDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}


	public ProductDTO getDetail(ProductDTO productDTO) throws Exception{
		productDTO= sqlSession.selectOne(NAMESPACE+"getDetail", productDTO);
		
		return productDTO;
	}
	
	public Long countProduct(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"countProduct",productDTO);
	}
	
	public Long countReview(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"countReview",productDTO);
	}
	
	public List<ProductDTO> memberProList(ProductDTO productDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProList", productDTO);
	}
	
	public List<ProductReviewDTO> memberReviewList(ProductDTO productDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberReviewList", productDTO);
	}
	
}

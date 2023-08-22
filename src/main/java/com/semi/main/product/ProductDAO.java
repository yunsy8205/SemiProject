package com.semi.main.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.product.ProductDAO.";

	public ProductDTO getDetail(ProductDTO productDTO) throws Exception{
		System.out.println(productDTO.getProNo());
		productDTO= sqlSession.selectOne(NAMESPACE+"getDetail", productDTO);
		System.out.println(productDTO);
		return productDTO;
	}
	
}

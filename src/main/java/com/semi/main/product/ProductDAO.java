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

	public int setAdd(ProductDTO productDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setAdd", productDTO);
	}
	
	public int setFileAdd(ProductFileDTO productFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", productFileDTO);
	}
	
}

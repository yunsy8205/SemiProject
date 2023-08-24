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
	
	
	public Long getTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}

	
	public List<ProductDTO> getList(Pager pager) throws Exception {
		
		
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	public List<ProductFileDTO> getFileList(Long proNo) throws Exception {
			
			
			return sqlSession.selectList(NAMESPACE+"getFileList",proNo);
	}

	public int setAdd(ProductDTO productDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setAdd", productDTO);
	}
	
	public int setFileAdd(ProductFileDTO productFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", productFileDTO);
	}
	
	public int setHitUpdate(ProductDTO productDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}

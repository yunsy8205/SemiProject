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
	
	
	
	
	public List<ProductDTO> getList(Pager pager) throws Exception {
		
		
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	public List<ProductFileDTO> getFileList(Long proNo) throws Exception {
			
			
			return sqlSession.selectList(NAMESPACE+"getFileList",proNo);
	}

	
	
	public List<ProductDTO> getCategoryList(Pager pager) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+"getCategoryList",pager);
	}

	public List<ProductDTO> getConditionList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getConditionList",pager);
	}
	
	
	public List<ProductDTO> memberProList(ProductDTO productDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProList", productDTO);
	}
	
	public List<ProductReviewDTO> memberReviewList(ProductDTO productDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberReviewList", productDTO);
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
	
	public int dibsAdd(ProductDTO productDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"dibsAdd", productDTO);
	}
	
	public int dibsDelete(ProductDTO productDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"dibsDelete", productDTO);
	}
	
	public ProductDTO dibsConfirm(ProductDTO productDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"dibsConfirm", productDTO);
	}
	
	public Long dibsNum(ProductDTO productDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"dibsNum", productDTO);
	}
	
}

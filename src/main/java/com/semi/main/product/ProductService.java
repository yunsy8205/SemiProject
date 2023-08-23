package com.semi.main.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	
	public List<ProductDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		//Long total = ProductDAO.getTotal(pager);
		//pager.makePageNum(total);
		return productDAO.getList(pager);
	}
	
    //상품상세
	public ProductDTO getDetail(ProductDTO productDTO) throws Exception{
		return productDAO.getDetail(productDTO);
	}
	
	//판매상품수
	public Long countProduct(ProductDTO productDTO) throws Exception{
		return productDAO.countProduct(productDTO);
	}
	
	//후기수
	public Long countReview(ProductDTO productDTO) throws Exception{
		return productDAO.countReview(productDTO);
	}
	
	//판매자상품목록
	public List<ProductDTO> memberProList(ProductDTO productDTO) throws Exception{
		return productDAO.memberProList(productDTO);
	}
	
	//판매자후기목록
	public List<ProductReviewDTO> memberReviewList(ProductDTO productDTO) throws Exception{
		return productDAO.memberReviewList(productDTO);
	}

}

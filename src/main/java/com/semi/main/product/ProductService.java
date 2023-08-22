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

}

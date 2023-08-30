package com.semi.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	
	
	public List<ProductFileDTO> getFileList(Long proNo) throws Exception {
		
		
		return productDAO.getFileList(proNo);
	}
	
	
	public List<ProductDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(productDAO.getTotal(pager));
		return productDAO.getList(pager);
	}
	
	public List<ProductDTO> getListByCategory(Long catNo) {
        return productDAO.getListByCategory(catNo);
    }

	
	public int setAdd(ProductDTO productDTO,MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String path="/resources/upload/product/";
		
		int result = productDAO.setAdd(productDTO);
		 System.out.println("ProductDTO proNo: " + productDTO.getProNo()); // 디버깅 메시지 추가

		for(MultipartFile file:files) {
			if(!file.isEmpty()) {
				String fileName=fileManager.fileSave(path, session, file);
				
				ProductFileDTO productFileDTO = new ProductFileDTO();
				productFileDTO.setFileNo(productDTO.getProNo());
				productFileDTO.setFileName(fileName);
				productFileDTO.setOriginalName(file.getOriginalFilename());
				productFileDTO.setProNo(productDTO.getProNo()); // 디버깅 메시지 추가
		        System.out.println("ProductFileDTO proNo: " + productFileDTO.getProNo()); // 디버깅 메시지 추가
				result=productDAO.setFileAdd(productFileDTO);
			
			}
		}
		
		System.out.println(path);
		return result;
	}
	
		

}

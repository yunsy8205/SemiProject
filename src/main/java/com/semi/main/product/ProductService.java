package com.semi.main.product;

import java.io.File;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
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
		
	    // 나머지 Pager 속성도 확인할 수 있습니다.
		return productDAO.getList(pager);
	}
	
	public List<ProductDTO> getCategoryList(Pager pager) throws Exception{
		
		pager.makeRowNum();
		pager.makePageNum(productDAO.getTotal(pager));
        return productDAO.getCategoryList(pager);
    }

	
	public int setAdd(ProductDTO productDTO,MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String path="/resources/upload/product/";
		
		int result = productDAO.setAdd(productDTO);
		
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
		
		
		return result;
	}
	public int setFileAdd(ProductFileDTO productFileDTO) throws Exception {
        // DAO의 setFileAdd 메서드 호출
        return productDAO.setFileAdd(productFileDTO);
    }
	//상품 조건별 리스
	public List<ProductDTO> getConditionList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(productDAO.getTotal(pager));
        return productDAO.getCategoryList(pager);
	}
	
		
		
    //상품상세
	public ProductDTO getDetail(ProductDTO productDTO) throws Exception{
		return productDAO.getDetail(productDTO);
	}
	//조회수 증
	public int setHitCount(Long proNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.setHitCount(proNo);
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
	
	

	
	public int setUpdate(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
	    int result = productDAO.setUpdate(productDTO);
	    String path = "/resources/upload/product/";

	    for (MultipartFile file : files) {
	        if (file != null && !file.isEmpty()) {
	            String fileName = fileManager.fileSave(path, session, file);

	            ProductFileDTO productFileDTO = new ProductFileDTO();
	            productFileDTO.setFileNo(productDTO.getProNo());
	            productFileDTO.setFileName(fileName);
	            productFileDTO.setOriginalName(file.getOriginalFilename());
	            productFileDTO.setProNo(productDTO.getProNo());
	            System.out.println("ProductFileDTO proNo: " + productFileDTO.getProNo());
	            result = productDAO.setFileAdd(productFileDTO);
	        }
	    }

	    return result;
	}

	

	public int setFileDelete(ProductFileDTO productFileDTO, HttpSession session) throws Exception {
		System.out.println("service ="+productFileDTO.getFileNo());
		System.out.println("service ="+productFileDTO.getFileName());
		System.out.println("service ="+productFileDTO.getOriginalName());
				//폴더 파일 삭제
				
				boolean flag=fileManager.fileDelete(productFileDTO, "/resources/upload/product/", session);
				
				if(flag) {
					//DB에서 삭제
					return productDAO.setFileDelete(productFileDTO);
				}
				return 0;	
			}
	
	public int setDelete(Long proNo) throws Exception{
		return productDAO.setDelete(proNo);
	}

	
	public int dibsAdd(ProductDTO productDTO) throws Exception{
		return productDAO.dibsAdd(productDTO);
	}
	
	public int dibsDelete(ProductDTO productDTO)throws Exception{
		return productDAO.dibsDelete(productDTO);
	}
	
	public ProductDTO dibsConfirm(ProductDTO productDTO)throws Exception{
		return productDAO.dibsConfirm(productDTO);
	}
	
	public Long dibsNum(ProductDTO productDTO)throws Exception{
		return productDAO.dibsNum(productDTO);
	}
}

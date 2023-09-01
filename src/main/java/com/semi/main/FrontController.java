package com.semi.main;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductFileDTO;
import com.semi.main.product.ProductService;
import com.semi.main.util.Pager;

@Controller
public class FrontController {
	
	@Autowired
    private ProductService productService;


	
	@RequestMapping(value="/*")
	public String index(Pager pager,Model model) throws Exception{
		List<ProductDTO> ar = productService.getList(pager);
		for(ProductDTO productDTO: ar) {
			String file=productDTO.getFileDTOs().get(0).getOriginalName();
		
		
			//productDTO.getFileDTOs().get(0).setOriginalName("d033fecd-03a2-4809-96f8-de2ab4c02bc5_세탁기.jpg");
			System.out.println(productDTO.getFileDTOs().get(0).getOriginalName());
		}
		// 각 상품에 대한 이미지 리스트 가져오기
//        for (ProductDTO product : ar) {
//            List<ProductFileDTO> fileList = productService.getFileList(product.getProNo());
//            product.setFileDTOs(fileList);
//        }
		model.addAttribute("list",ar);
		model.addAttribute("pager", pager);
		
		return "index";
	}
	
	
}

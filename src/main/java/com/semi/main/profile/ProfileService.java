package com.semi.main.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductReviewDTO;

@Service
public class ProfileService {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	public ProfileDTO memberProfile(ProfileDTO profileDTO) throws Exception{
		return profileDAO.memberProfile(profileDTO);
	}
	
	public Long countSaleProduct(ProfileDTO profileDTO)throws Exception{
		return profileDAO.countSaleProduct(profileDTO);
	}
	
	public Double avgScore(ProfileDTO profileDTO)throws Exception{
		return profileDAO.avgScore(profileDTO);
	}
	
	public List<ProductDTO> memberProList(ProfileDTO profileDTO)throws Exception {
		return profileDAO.memberProList(profileDTO);
	}
	
	public List<ProductReviewDTO> memberReviewList(ProfileDTO profileDTO) throws Exception{
		return profileDAO.memberReviewList(profileDTO);
	}
}

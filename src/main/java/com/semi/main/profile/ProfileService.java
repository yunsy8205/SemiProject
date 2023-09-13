package com.semi.main.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductReviewDTO;
import com.semi.main.util.Pager;

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
	
	public List<ProductDTO> memberProList(ProfileDTO profileDTO, Pager pager)throws Exception {
		pager.setPerPage(8L);
		pager.makeRowNum();
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("profileDTO", profileDTO);
		map.put("pager", pager);
		Long total = profileDAO.getTotal(map);
		pager.makePageNum(total);
		return profileDAO.memberProList(map);
	}
	
	public List<ProductReviewDTO> memberReviewList(ProfileDTO profileDTO, Pager pager) throws Exception{
		pager.setPerPage(3L);
		pager.makeRowNum();
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("profileDTO", profileDTO);
		map.put("pager", pager);
		Long total = profileDAO.getTotal(map);
		pager.makePageNum(total);
		return profileDAO.memberReviewList(map);
	}
}

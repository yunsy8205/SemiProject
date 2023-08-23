package com.semi.main.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}

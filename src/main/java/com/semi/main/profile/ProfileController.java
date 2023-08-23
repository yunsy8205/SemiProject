package com.semi.main.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	@GetMapping("products")
	public String memberProfile(ProfileDTO profileDTO, Model model) throws Exception{
		profileDTO=profileService.memberProfile(profileDTO);
		model.addAttribute("dto", profileDTO);
		Long countp = profileService.countSaleProduct(profileDTO);
		model.addAttribute("countp", countp);
		return "member/profile";
	}
}

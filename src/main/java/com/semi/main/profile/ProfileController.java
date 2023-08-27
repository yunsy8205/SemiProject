package com.semi.main.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductReviewDTO;
import com.semi.main.product.ProductService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("products")
	public String profileProducts(ProfileDTO profileDTO, Model model) throws Exception{
		profileDTO=profileService.memberProfile(profileDTO);
		model.addAttribute("dto", profileDTO);
		Long countp = profileService.countSaleProduct(profileDTO);
		model.addAttribute("countp", countp);
		Double score = profileService.avgScore(profileDTO);
		model.addAttribute("score", score);
		System.out.println("score:"+score);
		model.addAttribute("flag", "products");
		List<ProductDTO> ar = profileService.memberProList(profileDTO);
		model.addAttribute("list", ar);
		
		return "member/profile";
	}
	
	@GetMapping("reviews")
	public String ProfileReviews(ProfileDTO profileDTO, Model model) throws Exception{
		profileDTO=profileService.memberProfile(profileDTO);
		model.addAttribute("dto", profileDTO);
		Long countp = profileService.countSaleProduct(profileDTO);
		model.addAttribute("countp", countp);
		Double score = profileService.avgScore(profileDTO);
		model.addAttribute("score", score);
		System.out.println("score:"+score);
		model.addAttribute("flag", "reviews");
		List<ProductReviewDTO> ar2 = profileService.memberReviewList(profileDTO);
		model.addAttribute("list", ar2);
		
		return "member/profile";
	}
}

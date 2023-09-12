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
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("products")
	public String profileProducts(ProfileDTO profileDTO, Model model, Pager pager) throws Exception{
		profileDTO=profileService.memberProfile(profileDTO);
		model.addAttribute("dto", profileDTO);
		Long countp = profileService.countSaleProduct(profileDTO);
		model.addAttribute("countp", countp);
		Double score = profileService.avgScore(profileDTO);
		if(score==null) {
			score=0.0;
		}
		System.out.println(score);
		model.addAttribute("score", score);
		model.addAttribute("flag", "products");
		
		return "profile/profile";
	}
	
	@GetMapping("reviews")
	public String profileReviews(ProfileDTO profileDTO, Model model) throws Exception{
		profileDTO=profileService.memberProfile(profileDTO);
		model.addAttribute("dto", profileDTO);
		Long countp = profileService.countSaleProduct(profileDTO);
		model.addAttribute("countp", countp);
		Double score = profileService.avgScore(profileDTO);
		if(score==null) {
			score=0.0;
		}
		model.addAttribute("score", score);
		model.addAttribute("flag", "reviews");
		return "profile/profile";
	}
	
	@GetMapping("prolist")
	public String proList(ProfileDTO profileDTO, Model model, Pager pager) throws Exception{
		List<ProductDTO> ar = profileService.memberProList(profileDTO, pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		for(ProductDTO a:ar) {
			System.out.println(a.getProName());
		}
		return "commons/productresult";
	}
	
	@GetMapping("revlist")
	public String revList(ProfileDTO profileDTO, Model model, Pager pager) throws Exception{
		System.out.println(profileDTO.getUserNo());
		List<ProductReviewDTO> ar = profileService.memberReviewList(profileDTO, pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		for(ProductReviewDTO a:ar) {
			System.out.println(a.getProName());
			System.out.println(a.getContents());
		}

		return "commons/reviewresult";
	}
}

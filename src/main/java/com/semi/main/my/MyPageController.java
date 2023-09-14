package com.semi.main.my;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.semi.main.member.MemberDTO;
import com.semi.main.member.MemberFileDTO;
import com.semi.main.product.ProductDTO;
import com.semi.main.profile.ProfileDTO;
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/my/*")
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	


	// 마이페이지
	@GetMapping(value = "mypage") 
	public void myPage(HttpSession session,Model model) throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO=(MemberDTO)session.getAttribute("member");
		System.out.println(memberDTO.getUserId()+"myPage 메서드");
		System.out.println(memberDTO.getAccountDate());
		
		Long ar = myPageService.getBuyCount(memberDTO.getUserNo());
		model.addAttribute("buyer", ar);
		
		Long arr = myPageService.getSaleCount(memberDTO.getUserNo());
		model.addAttribute("sale", arr);
		
		
	}
	
	
	
	// 정보수정
	@GetMapping(value = "update") 
	public void update() throws Exception{
		
	}
	
	// 정보수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setMemberUpdate(MemberDTO memberDTO, MultipartFile file,HttpSession session) throws Exception{
		MemberDTO memberDTO2 = (MemberDTO)session.getAttribute("member"); //기존 멤버 정보
		

		
		String userId = ((MemberDTO)session.getAttribute("member")).getUserId(); 
		memberDTO.setUserNo(memberDTO2.getUserNo());
		memberDTO.setUserId(userId);
		
		Date userAccountDate = ((MemberDTO)session.getAttribute("member")).getAccountDate(); // update 후 회원가입일 null값 떠서 insert용으로 선언
		
		
		int result = myPageService.setMemberUpdate(memberDTO);
		
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		memberFileDTO.setFileName((String)session.getAttribute("newFileName"));
		memberFileDTO.setUserNo(memberDTO.getUserNo());
		memberFileDTO.setOriginalName(file.getOriginalFilename());
		memberDTO.setMemberFileDTO(memberFileDTO);
		
		
//		System.out.println(file.getOriginalFilename()+"이건뭐지");
//		System.out.println((String)session.getAttribute("newFileName")+"이건뭐지??");
//		System.out.println(memberDTO2.getMemberFileDTO().getFileName()+"이건뭐지???");
		
		if(result>0) {
			session.setAttribute("member", memberDTO); // 기존 멤버 정보를 새로운(수정한) 멤버 정보로 업데이트
			memberDTO.setAccountDate(userAccountDate); // 업데이트됐을때 회원가입일 insert
		}
		
		if((String)session.getAttribute("newFileName")==null){ //수정한 사진이 null이면 이전 세션 사진으로 저장
			memberFileDTO.setFileName(memberDTO2.getMemberFileDTO().getFileName());
		}
		
		return "redirect:./mypage";
	}

	
//	@GetMapping(value = "list") // 내판매글/구매내역
//	public String list(MemberDTO memberDTO) throws Exception{
//		return "./my/list";
//	}
	

	// 사진수정
	// 4. AJAX로 넘긴 파일 데이터를 처리
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile file, HttpSession session, Model model)throws Exception{
		String path = myPageService.setContentsImg(file, session);
		model.addAttribute("result", path);
		return "commons/ajaxResult";
		
	}
	
	// 회원 탈퇴
	@GetMapping("delete")
	public void setDelete() throws Exception{ 

	}
	
	// 회원 탈퇴
	@PostMapping("delete")
	public String setDelete(MemberDTO memberDTO, HttpSession session, Model model) throws Exception{ //회원탈퇴
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		String sessionPass = mem.getUserPw();
		String pass = memberDTO.getUserPw();
		
		String message = "탈퇴 성공하셨습니다";
		if(!(sessionPass.equals(pass))) {
			message = "비밀번호를 다시 입력해주세요";
			model.addAttribute("message", message);
			model.addAttribute("url", "./delete");	
		} else {
		model.addAttribute("message", message);
		model.addAttribute("url", "../");	
		myPageService.setDelete(memberDTO);
		session.invalidate();
		}
		
		return "commons/result";
	}
	

	// 정보수정 검증
	@GetMapping("check") 
	public void check() throws Exception{
		
	}
	
	// 정보수정 검증
	@PostMapping("check")
	public String check(MemberDTO memberDTO, HttpSession session, Model model) throws Exception{
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		String sessionPass = mem.getUserPw();
		String pass = memberDTO.getUserPw();
		
		System.out.println(sessionPass+"sessionPass");
		System.out.println(pass+"pass");
		
		if(!(sessionPass.equals(pass))) {
			String message = "비밀번호를 다시 입력해주세요";
			model.addAttribute("message", message);
			model.addAttribute("url", "./check");	
			return "commons/result";
		} 
		
		return "./my/update";
	}
	
	@GetMapping("chat") // 1대1 채팅
	public void chat() throws Exception{		
		
	}
	
	@GetMapping("list")
	public String proList(HttpSession session, Model model, Pager pager) throws Exception{
	    // 현재 로그인한 사용자의 정보를 세션에서 가져옴
	    MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	    
	    // profileDTO 생성 및 userNo 설정
	    ProfileDTO profileDTO = new ProfileDTO();
	    profileDTO.setUserNo(memberDTO.getUserNo());
	    
	    List<ProductDTO> ar = myPageService.memberProList(profileDTO, pager);
	    model.addAttribute("list", ar);
	    model.addAttribute("pager", pager);
	    
	    return "./my/list";
	}
	
	
	
	//내 찜 목록
	@GetMapping("dibs")
	public String getDibs(DibsDTO dibsDTO, HttpSession session, Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    long userNo = memberDTO.getUserNo();

	    
	    List<DibsDTO> dibs = myPageService.getDibs(userNo);
	    model.addAttribute("dibs", dibs);
	    
//	    for(int i=0; i<dibs.size(); i++) {
//	    	System.out.println(dibs.get(i).getUserId());
//	    	System.out.println(dibs.get(i).getProNo());
//	    }
	    return "./my/dibs";
	}
	
	// 구매목록, 판매목록
		@GetMapping("management") 
		public void management(HttpSession session, Model model) throws Exception{
//			--------구매목록
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		    long userNo = memberDTO.getUserNo();
			List<BuyerDTO> ar = myPageService.getBuyer(userNo);
//			--------판매목록
			List<SaleDTO> arr = myPageService.getSale(userNo);
			
			model.addAttribute("buyer", ar);
			model.addAttribute("sale", arr);
		}

		// 후기
		@GetMapping("review")
		public void review(HttpSession session, Model model) throws Exception{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		    long userNo = memberDTO.getUserNo();
			List<ReviewsDTO> ar = myPageService.getReviews(userNo);
			
			model.addAttribute("reviews", ar);
		}
	 
}
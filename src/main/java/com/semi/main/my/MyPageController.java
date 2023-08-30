package com.semi.main.my;

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

@Controller
@RequestMapping("/my/*")
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	
	
	
	
	@RequestMapping(value = "login", method = RequestMethod.GET) //로그인 테스트용으로 나중에 삭제
	public void getLogin() throws Exception{
		
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST) //로그인 테스트용으로 나중에 삭제
	public String getLogin(MyPageDTO myPageDTO, HttpSession session) throws Exception{
		myPageDTO = myPageService.getLogin(myPageDTO);
		if(myPageDTO != null) {
			session.setAttribute("member", myPageDTO);
		}
		
		return "redirect:/";
	}
	

	
	@GetMapping(value = "mypage") //마이페이지
	public void myPage() throws Exception{
		
	}
	
	@GetMapping(value = "update") //정보수정
	public void update() throws Exception{
		
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setMemberUpdate(MyPageDTO myPageDTO, MultipartFile file,HttpSession session) throws Exception{
		MyPageDTO memberDTO2 = (MyPageDTO)session.getAttribute("member"); //기존 멤버 정보
		
		String userId = ((MyPageDTO)session.getAttribute("member")).getUserId(); 
		myPageDTO.setUserNo(memberDTO2.getUserNo());
		myPageDTO.setUserId(userId);
		
		int result = myPageService.setMemberUpdate(myPageDTO);
		
		MyPageFileDTO myPageFileDTO = new MyPageFileDTO();
		myPageFileDTO.setFileName((String)session.getAttribute("newFileName"));
		myPageFileDTO.setUserNo(myPageDTO.getUserNo());
		myPageFileDTO.setOriginalName(file.getOriginalFilename());
		
		myPageDTO.setMyPageFileDTO(myPageFileDTO);
		
		if(result>0) {
			session.setAttribute("member", myPageDTO); // 기존 멤버 정보를 새로운(수정한) 멤버 정보로 업데이트
		}
		return "redirect:./mypage";
	}
	
	@GetMapping(value = "list") // 내판매글/구매내역
	public String list(MyPageDTO myPageDTO) throws Exception{
		return "./my/list";
	}
	

	
	// 4. AJAX로 넘긴 파일 데이터를 처리
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile file, HttpSession session, Model model)throws Exception{
		String path = myPageService.setContentsImg(file, session);
		model.addAttribute("result", path);
		return "commons/ajaxResult";
		
	}
	
	
	@GetMapping("delete")
	public void setDelete() throws Exception{ //회원탈퇴

	}
	
	@PostMapping("delete")
	public String setDelete(MyPageDTO myPageDTO, HttpSession session, Model model) throws Exception{ //회원탈퇴
		MyPageDTO mem = (MyPageDTO)session.getAttribute("member");
		String sessionPass = mem.getUserPw();
		String pass = myPageDTO.getUserPw();
		
		String message = "탈퇴 성공하셨습니다";
		if(!(sessionPass.equals(pass))) {
			message = "비밀번호를 다시 입력해주세요";
			model.addAttribute("message", message);
			model.addAttribute("url", "./delete");	
		} else {
		model.addAttribute("message", message);
		model.addAttribute("url", "../");	
		myPageService.setDelete(myPageDTO);
		session.invalidate();
		}
		
		return "commons/result";
	}
	

	
	@GetMapping("check") //정보수정창
	public void check() throws Exception{
		
	}
	
	@PostMapping("check") //정보수정창
	public String check(MyPageDTO myPageDTO, HttpSession session, Model model) throws Exception{
		MyPageDTO mem = (MyPageDTO)session.getAttribute("member");
		String sessionPass = mem.getUserPw();
		String pass = myPageDTO.getUserPw();
		
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
	
	@GetMapping("management") //상품관리
	public void management() throws Exception{
		
	}
	
	@GetMapping("test")
	public void test() throws Exception{
		
	}
}
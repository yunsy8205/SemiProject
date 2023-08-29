package com.semi.main.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/** 로그인 FORM 이동 */
	@GetMapping("login")
	public String getLogin() throws Exception{
	
		return "member/login";
	}
	
	
	@PostMapping("login")
	public ModelAndView getLogin(MemberDTO memberDTO, HttpServletRequest request) throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		
		memberDTO = memberService.getLogin(memberDTO);
		
		/* NullPointException 발생 이유 : Null이라서 에러가 뜨는게 아니라 Null에 들어있는 주소를 참조하려는 시도를 하였기 때문에 에러가 발생함.
			System.out.println("아이디 :"+memberDTO.getUserId());
		*/
		
		System.out.println("null인지 확인 :"+memberDTO);
		System.out.println("아이디 :"+memberDTO.getUserId());
		System.out.println("회원상태 :"+memberDTO.getStatusNo());
		
		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();
		
		System.out.println("컨트롤러 로그인 상태 여부 ===========================");
		
		if(memberDTO != null && memberDTO.getStatusNo() != 0) {
			session.setAttribute("member", memberDTO);
			System.out.println("로그인 성공");
		} 
		else if(memberDTO != null && memberDTO.getStatusNo() == 0){
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "탈퇴한 아이디입니다. 고객센터로 문의해주세요.");
			mv.addObject("url", "login");
			mv.setViewName("member/alert");
			return mv;
		}
		else {
			session.setAttribute("member", memberDTO);
			System.out.println("로그인 실패");
			// member/alert.jsp 이동
			mv.addObject("msg", "아이디/비밀번호가 틀렸습니다");
			mv.addObject("url", "login");
			mv.setViewName("member/alert");
			return mv;
		}
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("redirect:../");
		
		
		return mv;
		
	}

}

package com.semi.main.member;

import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.ibatis.session.SqlSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;

//	@Autowired
//	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;


	/** 로그인 FORM 이동 */
	@GetMapping("login")
	public String getLogin() throws Exception{
	
		return "member/login";
	}
	
	
	@PostMapping("login")
	public ModelAndView getLogin(MemberDTO memberDTO, String cookieUserId) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		Cookie cookie = new Cookie("cookieUserId", memberDTO.getUserId());
	
		if(cookieUserId != null && cookieUserId.equals("cookieUserId")) {
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
		else {
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.getLogin(memberDTO);
		
		System.out.println("null인지 확인 :"+memberDTO);
		
		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();
		
		System.out.println("컨트롤러 로그인 상태 여부 ===========================");
		
		if(memberDTO != null && memberDTO.getStatusNo() != 0) {
			session.setAttribute("member", memberDTO);
			session.setAttribute("userId", memberDTO.getUserId());
			System.out.println("로그인 성공");
			
		} 
		else if(memberDTO != null && memberDTO.getStatusNo() == 0){
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "활동 정지중인 아이디입니다. 고객센터로 문의해주세요.");
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
	
	
/** 로그아웃 */
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception{
		
		// 세션 비우기
		session.invalidate();
		
		return "redirect:../";
	}
	
	
/** 회원가입 FORM 이동 */
	@GetMapping("signUp")
	public String setJoin() throws Exception{
		
		return "member/signUp";
	}

	
/** ID 체크 */	
	@GetMapping("idCheck")
	public String getIdCheck(MemberDTO memberDTO, Model model) throws Exception{
		
		System.out.println(memberDTO.getUserId());
		memberDTO = memberService.getIdCheck(memberDTO);
		
		int result = 0;
		
		if(memberDTO == null) {
			result=1;
		}
		
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
		
	}
	
/** EMAIL 체크 */
	@ResponseBody
	@PostMapping("mailCheck")
	public int getMailCheck(@RequestBody MemberDTO memberDTO, Model model) throws Exception{
		System.out.println(memberDTO.getEmail());
		memberDTO = memberService.getMailCheck(memberDTO);
		
		int result = 0;
		
		if(memberDTO == null) {
			result=1;
		}
		
		System.out.println("result: "+ result);
		
		return result;
	}
	
	
/** 회원가입  */
	 @ResponseBody
	 @PostMapping("signUp") 
		public int setJoin(@RequestBody MemberDTO memberDTO, Model model) throws Exception{ 
		 
		
		 System.out.println("컨트롤러 회원가입");
		 System.out.println(memberDTO.getUserId());
		 
		 
		 // result가 0이면 insert 안됨, 1이면 insert 됨.
		 int result = memberService.setJoin(memberDTO); 
		 System.out.println(result);
//		 
//		 if(result>0) { 
//			  model.addAttribute("msg", "회원가입을 축하드립니다");
//			  } 
//		 else { 
//			 model.addAttribute("msg", "회원가입 오류 발생하였습니다");
//			  }
			  
		 	 return result;
	 }
	 
/** ID 찾기*/
	 @GetMapping("findId")
	 public String getFindId() throws Exception{
		 
		 return "member/findId";
	 }
	 
/** PW 찾기*/
	 @GetMapping("findPw")
	 public String getFindPw() throws Exception{
		 
		 return "member/findPw";
	 }

	// userId, email 입력받음
	@PostMapping("findPw")
	public ModelAndView getFindPw(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
//		String message ="";
//		String url ="/";
		int result = memberService.getFindPw(memberDTO);
//		if(result > 0) {
//			message = "이메일에 비밀번호를 성공적으로 보냄!";
//		}else {
//			message = "존재하지 않는 아이디 또는 이메일 입니다";
//			url = "./findPw";
//		}
		
		mv.addObject("result", result);
//		mv.addObject("url", url);
		mv.setViewName("/commons/ajaxResult");
		
		return mv;
	}
	

}
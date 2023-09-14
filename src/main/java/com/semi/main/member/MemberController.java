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

	/** 네이버 로그인 API 연동 */
	// 인가코드 및 토큰 발급
	//@SuppressWarnings("unchecked")
//	@GetMapping("callback")
//	public void naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, Model model) throws Exception{
//		
//		//1. header 생성
//		HttpHeaders httpHeaders = new HttpHeaders();
//		httpHeaders.add(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");
//		
//		//2. body 생성
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
//		params.add("grant_type", "authorization_code");
//		params.add("clientId", "r6eVt2waeuOw7uHsH9OU");
//		params.add("clientSecret", "wLhCPAnFJX");
//		params.add("redirectURI", "http://localhost:82/member/callback");
//		params.add("code", code);
//		params.add("state", state);
//		
//		//3. header + body
//		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String,String>>(params, httpHeaders);
//		
//		//4. http 요청하기
//		RestTemplate restTemplate = new RestTemplate();
//		ResponseEntity<String> response = restTemplate.exchange(
//			"https://nid.naver.com/oauth2.0/token", 
//			HttpMethod.POST, 
//			httpEntity, 
//			String.class
//		);
//		
//		System.out.println("http 요청");
//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonObj = (JsonObject)jsonParser.parse(response.getBody());
//		
////		String accessToken = (String)jsonObj.get("access_token");
//		
//		//발급받은 토큰 정보로 유저 정보를 얻어옴
//		//MemberDTO memberDTO = getUserInfoWithToken(accessToken);
//		
//		
//		//state용 난수 생성
////		SecureRandom random = new SecureRandom();
////		
////		// 상태 토큰으로 사용할 랜덤 문자열 생성
////		String state = new BigInteger(130, random).toString(32);
////		
////		// 세션에 상태 토큰을 저장
////		session.setAttribute("state", state);
////		System.out.println(state);
////		
////		// redirect
////		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
////		url.append("/oauth2.0/authorize?");
////		System.out.println(url);
//		
//		System.out.println("Naver Call Back");
//		System.out.println(request.getParameterNames());
//		
//		String clientId="r6eVt2waeuOw7uHsH9OU";//애플리케이션 클라이언트 아이디값"; 
//		String clientSecret="wLhCPAnFJX";//애플리케이션 클라이언트 시크릿값"; 
//		code=request.getParameter("code"); 
//		
//		String redirectURI=URLEncoder.encode("http://localhost:82/member/callback", "UTF-8"); 
//		String apiURL="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
//		 + "&client_id=" + clientId + "&client_secret=" + clientSecret +
//		 "&redirect_uri=" + redirectURI + "&code=" + code + "&state=" + state; 
//		 /*토큰 불러오기*/
//		 NaverLoginApi naverLoginApi = new NaverLoginApi();
//		
////		@SuppressWarnings("unchecked")
////		Enumeration<String> map = request.getParameterNames();
////		
////		while (map.hasMoreElements()) {
////			String string = (String) map.nextElement();
////			System.out.println(string);
////		}
//		
//		
//		return;
//	}
	


	@GetMapping("naver/login")
	public String naverConnect(HttpSession session) throws Exception {

		// state용 난수 생성
		SecureRandom random = new SecureRandom();

		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = new BigInteger(130, random).toString(32);

		// 세션에 상태 토큰을 저장
		session.setAttribute("state", state);
		System.out.println(state);

		// redirect
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("/oauth2.0/authorize?");
		System.out.println(url);

		return "naver/login";
	}

	/** 로그인 FORM 이동 */
	@GetMapping("login")
	public String getLogin() throws Exception {

		return "member/login";
	}

	@PostMapping("login")
	public ModelAndView getLogin(MemberDTO memberDTO, String cookieUserId) throws Exception {

		ModelAndView mv = new ModelAndView();
		Cookie cookie = new Cookie("cookieUserId", memberDTO.getUserId());

		if (cookieUserId != null && cookieUserId.equals("cookieUserId")) {
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cookie);
		} else {
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		/*
		 * NullPointException 발생 이유 : Null이라서 에러가 뜨는게 아니라 Null에 들어있는 주소를 참조하려는 시도를 하였기
		 * 때문에 에러가 발생함. System.out.println("아이디 :"+memberDTO.getUserId());
		 */

		memberDTO = memberService.getLogin(memberDTO);

		System.out.println("null인지 확인 :" + memberDTO);
//		System.out.println("아이디 :"+memberDTO.getUserId());
//		System.out.println("회원상태 :"+memberDTO.getStatusNo());

		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();

		System.out.println("컨트롤러 로그인 상태 여부 ===========================");

		if (memberDTO != null && memberDTO.getStatusNo() != 0) {
			session.setAttribute("member", memberDTO);
			session.setAttribute("userId", memberDTO.getUserId());
			System.out.println("로그인 성공");

		} else if (memberDTO != null && memberDTO.getStatusNo() == 0) {
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "활동 정지중인 아이디입니다. 고객센터로 문의해주세요.");
			mv.addObject("url", "login");
			mv.setViewName("member/alert");
			return mv;
		} else {
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
	public String logout(HttpSession session) throws Exception {

		// 세션 비우기
		session.invalidate();

		return "redirect:../";
	}

	/** 회원가입 FORM 이동 */
	@GetMapping("signUp")
	public String setJoin() throws Exception {

		return "member/signUp";
	}

	/** ID 체크 */
	@GetMapping("idCheck")
	public String getIdCheck(MemberDTO memberDTO, Model model) throws Exception {

		System.out.println(memberDTO.getUserId());
		memberDTO = memberService.getIdCheck(memberDTO);

		int result = 0;

		if (memberDTO == null) {
			result = 1;
		}

		model.addAttribute("result", result);

		return "commons/ajaxResult";

	}
	
/** EMAIL 체크 */
	@ResponseBody
	@PostMapping("mailCheck")
	public int getMailCheck(@RequestBody MemberDTO memberDTO, Model model) throws Exception{
		System.out.println("이메일체");
		System.out.println(memberDTO.getEmail());
		memberDTO = memberService.getMailCheck(memberDTO);
		
		int result = 0;
		
		if(memberDTO == null) {
			result=1;
		}
		
//		System.out.println("이메일체크: "+memberDTO.getEmail());
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

	/** ID 찾기 */
	@GetMapping("findId")
	public String getFindId() throws Exception {

		return "member/findId";
	}

	/** PW 찾기 */
	@GetMapping("findPw")
	public String getFindPw() throws Exception {

		return "member/findPw";
	}

}
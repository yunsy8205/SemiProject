package com.semi.main.kakao;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.semi.main.member.MemberDTO;

@Controller
@RequestMapping("/kakao/*")
public class KakaoController {

    @Autowired
    private KakaoService kakaoService; 
    
    
 // 로그인: 인가 코드 및 토큰 발급
 	@RequestMapping(value = "callback", method = RequestMethod.GET)
 	public String getLogin(@RequestParam("code") String code, HttpSession session, Model model) throws Exception{
        
         // 1. header 생성
         HttpHeaders httpHeaders = new HttpHeaders();
         httpHeaders.add(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");

         // 2. body 생성
         MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
         params.add("grant_type", "authorization_code"); //고정값
         params.add("client_id", "d5aa1769209cd0342601e6c69c838176");
         params.add("redirect_uri", "http://localhost:82/kakao/callback"); //등록한 redirect uri
         params.add("code", code); 

         // 3. header + body
         HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(params, httpHeaders);
         
         // 4. http 요청하기
         RestTemplate restTemplate = new RestTemplate();
         ResponseEntity<String> response = restTemplate.exchange(
                 "https://kauth.kakao.com/oauth/token",
                 HttpMethod.POST,
                 httpEntity,
                 String.class     
         );
         System.out.println("1111");
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());

         String accessToken  = (String) jsonObj.get("access_token");
         
         // 발급받은 토큰 정보로 유저 정보를 얻어옴
         MemberDTO memberDTO = getUserInfoWithToken(accessToken);
                 
         MemberDTO memberDTO2 = kakaoService.getEmailCheck(memberDTO);
       
         if(memberDTO2 != null) {
 			//4. 세션에 저장
 			System.out.println("기존 정보 있음");
 			session.setAttribute("member", memberDTO2);
 			
 			return "redirect:/";
 		}else {
 			System.out.println("기존 정보 없음");
 			session.setAttribute("kakaoMember", memberDTO);
 			return "/member/kakaoSignUp";
 		}			
 	
 	}

 	private MemberDTO getUserInfoWithToken(String accessToken) throws ParseException {
 		
         //HttpHeader 생성
         HttpHeaders headers = new HttpHeaders();
         headers.add("Authorization", "Bearer " + accessToken);
         headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
         
         //HttpHeader 담기
         RestTemplate rt = new RestTemplate();
         HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);
         ResponseEntity<String> response = rt.exchange(
                 "https://kapi.kakao.com/v2/user/me",
                 HttpMethod.POST,
                 httpEntity,
                 String.class
         );
         
         //Response 데이터 파싱
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObj    = (JSONObject) jsonParser.parse(response.getBody());
         JSONObject account = (JSONObject) jsonObj.get("kakao_account");
         
         String email = String.valueOf(account.get("email"));
         
         MemberDTO memberDTO = new MemberDTO();
         memberDTO.setEmail(email);
         
         System.out.println(memberDTO);
         System.out.println(memberDTO.getName());
         return memberDTO;
 	}
}










 	
// 	//로그아웃
// 	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
// 	public String logout(HttpSession session)throws IOException {
// 			System.out.println("여기는 logout");
// 			session.invalidate();
// 	        
// 			return "redirect:../";
// 	}
 	
// 	// 카카오 회원가입(모델은 동의 사항 데이터 전달을 위해 필요) 
// 	@RequestMapping(value = "join", method = RequestMethod.GET)
// 	public String midJoin(AgreeDTO agreeDTO, Model model) throws Exception{
// 		model.addAttribute("agree", agreeDTO);
// 		
// 		return "member/kakaoJoin";
// 	}
 //}

//    @RequestMapping(value = "/login/getKakaoAuthUrl")
//    public @ResponseBody String getKakaoAuthUrl() throws Exception {
//        String reqUrl = "https://kauth.kakao.com/oauth/authorize"
//                + "?client_id=d5aa1769209cd0342601e6c69c838176" // 본인의 카카오 앱 클라이언트 아이디로 변경
//                + "&redirect_uri=http://localhost:82/kakao/callback"
//                + "&response_type=code";
//
//        return reqUrl;
//    }
//
//    @RequestMapping(value = "/callback")
//    public String oauthKakao(
//            @RequestParam(value = "code", required = false) String code,
//            Model model) throws Exception {
//
//        System.out.println("#########" + code);
//        String access_Token = getAccessToken(code);
//        System.out.println("###access_Token#### : " + access_Token);
//
//        // 사용자 정보 초기화 및 설정
//        HashMap<String, Object> userInfo = new HashMap<String, Object>();
//
//        // 디버깅 코드: 확인용 정보 출력
//        System.out.println("###userInfo#### : " + userInfo.get("email"));
//        System.out.println("###name#### : " + userInfo.get("name"));
//
//        model.addAttribute("kakaoInfo", userInfo);
//
////        // 회원 가입 또는 로그인 처리
////        String kakaoEmail = userInfo.get("email").toString();
////        Member member = memberDAO.getMemberByEmail(kakaoEmail);
////
////        if (member == null) {
////            // 카카오 이메일로 가입된 회원 정보가 없다면, 회원 가입 수행
////            Member newMember = new Member();
////            newMember.setEmail(kakaoEmail);
////            newMember.setName(userInfo.get("name").toString()); // "name" 컬럼에 닉네임 저장
////            // 필요한 다른 정보도 설정
////            memberDAO.insertMember(newMember);
////            model.addAttribute("kakaoInfo", newMember);
////        } else {
////            // 이미 가입된 회원이면 해당 회원으로 로그인됩니다.
////            model.addAttribute("kakaoInfo", member);
////        }
////
//        // 로그인 후 리다이렉트할 페이지로 이동
//        return "/kakao/callback"; // 본인이 원하는 경로로 설정
//    }
//
//    // 토큰 발급 메서드
//    public String getAccessToken(String authorize_code) {
//        String access_Token = "";
//        String reqURL = "https://kauth.kakao.com/oauth/token";
//
//        try {
//            URL url = new URL(reqURL);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//
//            // POST 요청 설정
//            conn.setRequestMethod("POST");
//            conn.setDoOutput(true);
//
//            // POST 요청에 필요한 파라미터 설정
//            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//            StringBuilder sb = new StringBuilder();
//            sb.append("grant_type=authorization_code");
//            sb.append("&client_id=d5aa1769209cd0342601e6c69c838176"); // 본인의 카카오 앱 클라이언트 아이디로 변경
//            sb.append("&redirect_uri=http://localhost:82/kakao/callback");
//            sb.append("&code=" + authorize_code);
//            bw.write(sb.toString());
//            bw.flush();
//
//            // 응답 코드 확인
//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);
//
//            // 응답 내용 읽기
//            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//            String line;
//            StringBuilder response = new StringBuilder();
//
//            while ((line = br.readLine()) != null) {
//                response.append(line);
//            }
//            br.close();
//
//            // JSON 파싱
//            ObjectMapper objectMapper = new ObjectMapper();
//            JsonNode node = objectMapper.readTree(response.toString());
//            access_Token = node.get("access_token").asText();
//
//            System.out.println("access_token : " + access_Token);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return access_Token;
//    }
//
//    // 유저 정보 조회 메서드
//    public HashMap<String, Object> getUserInfo(String access_Token) {
//        HashMap<String, Object> userInfo = new HashMap<String, Object>();
//        String reqURL = "https://kapi.kakao.com/v2/user/me";
//
//        try {
//            URL url = new URL(reqURL);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("GET");
//
//            // 헤더에 토큰 추가
//            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);
//
//            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//            String line;
//            StringBuilder response = new StringBuilder();
//
//            while ((line = br.readLine()) != null) {
//                response.append(line);
//            }            br.close();
//
//            // JSON 파싱
//            ObjectMapper objectMapper = new ObjectMapper();
//            JsonNode node = objectMapper.readTree(response.toString());
//
//            String name = node.get("properties").get("name").asText(); // "name" 컬럼에 닉네임 저장
//            String email = node.get("kakao_account").get("email").asText();
//
//            userInfo.put("name", name);
//            userInfo.put("email", email);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return userInfo;
//    }
//}
//

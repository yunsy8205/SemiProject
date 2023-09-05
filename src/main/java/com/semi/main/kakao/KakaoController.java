package com.semi.main.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Member;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.semi.main.member.MemberDAO;

@Controller
@RequestMapping("/kakao/*")
public class KakaoController {

    @Autowired
    private MemberDAO memberDAO; // MemberDAO를 주입

    @RequestMapping(value = "/login/getKakaoAuthUrl")
    public @ResponseBody String getKakaoAuthUrl() throws Exception {
        String reqUrl = "https://kauth.kakao.com/oauth/authorize"
                + "?client_id=cd934c1bfa1d419ececfe6e1e1ef9624" // 본인의 카카오 앱 클라이언트 아이디로 변경
                + "&redirect_uri=http://localhost:82/kakao/callback"
                + "&response_type=code";

        return reqUrl;
    }

    @RequestMapping(value = "/callback")
    public String oauthKakao(
            @RequestParam(value = "code", required = false) String code,
            Model model) throws Exception {

        System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);

        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###name#### : " + userInfo.get("name"));

        model.addAttribute("kakaoInfo", userInfo);

//        // 회원 가입 또는 로그인 처리
//        String kakaoEmail = userInfo.get("email").toString();
//        Member member = memberDAO.getMemberByEmail(kakaoEmail);
//
//        if (member == null) {
//            // 카카오 이메일로 가입된 회원 정보가 없다면, 회원 가입 수행
//            Member newMember = new Member();
//            newMember.setEmail(kakaoEmail);
//            newMember.setName(userInfo.get("name").toString()); // "name" 컬럼에 닉네임 저장
//            // 필요한 다른 정보도 설정
//            memberDAO.insertMember(newMember);
//            model.addAttribute("kakaoInfo", newMember);
//        } else {
//            // 이미 가입된 회원이면 해당 회원으로 로그인됩니다.
//            model.addAttribute("kakaoInfo", member);
//        }
//
        // 로그인 후 리다이렉트할 페이지로 이동
        return "/member/login"; // 본인이 원하는 경로로 설정
    }

    // 토큰 발급 메서드
    public String getAccessToken(String authorize_code) {
        String access_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청 설정
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요한 파라미터 설정
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=cd934c1bfa1d419ececfe6e1e1ef9624"); // 본인의 카카오 앱 클라이언트 아이디로 변경
            sb.append("&redirect_uri=http://localhost:82/kakao/callback");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 응답 내용 읽기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            br.close();

            // JSON 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode node = objectMapper.readTree(response.toString());
            access_Token = node.get("access_token").asText();

            System.out.println("access_token : " + access_Token);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }

    // 유저 정보 조회 메서드
    public HashMap<String, Object> getUserInfo(String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 헤더에 토큰 추가
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = br.readLine()) != null) {
                response.append(line);
            }            br.close();

            // JSON 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode node = objectMapper.readTree(response.toString());

            String name = node.get("properties").get("name").asText(); // "name" 컬럼에 닉네임 저장
            String email = node.get("kakao_account").get("email").asText();

            userInfo.put("name", name);
            userInfo.put("email", email);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    }
}


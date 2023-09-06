package com.semi.main.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.JsonObject;



@Component
public class PayService {
   public String getToken(String imp_key, String imp_secret) throws Exception {
      HttpURLConnection conn = null;
      URL url = new URL("https://api.iamport.kr/users/getToken");
      
      conn = (HttpsURLConnection)url.openConnection();
      conn.setRequestMethod("POST");
      
      // Set Request Header
      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      
      conn.setDoOutput(true); // 출력 스트림 사용 여부
      // conn.setDoInput(true); // 기본값 : true
      
      JsonObject json = new JsonObject();
      json.addProperty("imp_key", imp_key);
      json.addProperty("imp_secret", imp_secret);
      
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
      bw.write(json.toString());
      bw.flush();
      bw.close();
      
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
      
      Gson gson = new Gson();
      String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
      String token = gson.fromJson(response, Map.class).get("access_token").toString();
      
      br.close();
      conn.disconnect();
      
      return token;
   }
   
   public Map<String, String> paymentInfo(String access_token, String imp_uid) throws Exception {
      HttpsURLConnection conn = null;
      URL url = new URL("https://api.iamport.kr/payments/" + imp_uid); // imp_uid : 포트원 거래 고유번호
      
      conn = (HttpsURLConnection)url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Authorization", access_token);
      conn.setDoOutput(true);
      
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
      
      // 응답 결과인 JSON의 Key 또는 Value 값에 공백, 유니코드, 특수문자가 포함되어 있는 경우에는 아래의 방법으로 JSON을 조작해야 하는 것 같다.
      JSONParser parser = new JSONParser();
      JSONObject json = (JSONObject)parser.parse(br.readLine());
      
      String response = json.get("response").toString();
      json = (JSONObject)parser.parse(response);
      
      String pay_method = json.get("pay_method").toString();
      String amount = json.get("amount").toString();
      String canceled_amount = json.get("cancel_amount").toString();
      
      Map<String, String> paymentInfo = new HashMap<String, String>();
      paymentInfo.put("pay_method", pay_method); // 결제 방법
      paymentInfo.put("amount", amount); // 결제 금액
      paymentInfo.put("canceled_amount", canceled_amount); // 결제 금액 중 취소된 금액
      
      br.close();
      conn.disconnect();
      
      return paymentInfo;
   }
   
   public int paymentCancel(String access_token, String imp_uid, String cancel_amount, String reason) throws Exception {
      if(Integer.parseInt(cancel_amount) > 0) {
         HttpsURLConnection conn = null;
         URL url = new URL("https://api.iamport.kr/payments/cancel");
         
         conn = (HttpsURLConnection)url.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Content-type", "application/json");
         conn.setRequestProperty("Accept", "application/json");
         conn.setRequestProperty("Authorization", access_token);
         conn.setDoOutput(true);
         
         Map<String, String> paymentInfo = paymentInfo(access_token, imp_uid);
         int amount = Integer.parseInt(paymentInfo.get("amount"));
         int canceled_amount = Integer.parseInt(paymentInfo.get("canceled_amount"));
         int cancelable_amount = amount - canceled_amount;
         
         {
            JsonObject json = new JsonObject();
            json.addProperty("imp_uid", imp_uid);
            json.addProperty("amount", cancel_amount); // 취소 금액
            json.addProperty("reason", reason); // 취소 사유
            json.addProperty("checksum", cancelable_amount); // 앞으로 취소 가능한 금액
            
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            bw.write(json.toString());
            bw.flush();
            bw.close();
         }
         
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
         
         JSONParser parser = new JSONParser();
         JSONObject json = (JSONObject)parser.parse(br.readLine());
         
         /*
            잘못된 요청을 할 경우에 응답 결과는 다음과 같으므로 NullPointerException이 발생하게 된다.
            {"code":1, "response":null, "message":"..."}
            ※잘못된 요청 ex) 취소 금액이 0원이거나 앞으로 취소 가능한 금액보다 더 많은 취소 금액을 요청할 경우
         */
         String response = json.get("response").toString();
         json = (JSONObject)parser.parse(response);
         
         String status = json.get("status").toString();
         
         br.close();
         conn.disconnect();
         
         return status.equalsIgnoreCase("cancelled") ? 1 : 0;
      }else {
         return 1;
      }
   }
}
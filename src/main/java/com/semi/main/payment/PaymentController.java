package com.semi.main.payment;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.main.product.ProductDTO;
import com.semi.main.product.ProductService;
import com.semi.main.util.PayService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
   private final String REST_API_KEY = "0423121332258201";
   private final String REST_API_SECRET = "gucymO3pfPTz2um1RFankOgQlBdMynAnTuxxjh8mXDFLYhLjcC5XZjhZ1UD39Dgpv0aFfphzsR1RYlvK";
   
   @Autowired
   private ProductService productService;
   
   @Autowired
   private PaymentService paymentService;
   
   @RequestMapping(value = "paymentadd", method = RequestMethod.GET)
   public String paymentAdd(ProductDTO productDTO, Model model) throws Exception{
      productDTO = productService.getDetail(productDTO);
      System.out.println(productDTO.getProName());
      model.addAttribute("dto", productDTO);
      return "payment/paymentadd";
   }
   
      
   @ResponseBody
   @RequestMapping(value="paymentadd", method = RequestMethod.POST)
   public int paymentAdd(@RequestBody PaymentDTO paymentDTO) throws Exception
   {   
         PayService payService = new PayService();
         String token = payService.getToken(REST_API_KEY, REST_API_SECRET);
         Map<String, String> paymentInfo = payService.paymentInfo(token, paymentDTO.getUidNo());
         
         String amount = paymentInfo.get("amount"); // 결제된 금액
         
         if(Integer.parseInt(amount) == paymentDTO.getTotalPrice()) { // 검증 성공
            System.out.println("검증 성공!");
            paymentService.paymentAdd(paymentDTO);
            
         }else { // 검증 실패(결제된 금액과 실제 계산되어야 할 금액이 다른 경우)
            // 취소 처리...
            System.out.println("검증 실패");
            payService.paymentCancel(token, paymentDTO.getUidNo(), amount, "결제금액 오류");
            
            return 0;
         }
         
         return 1;
   }
   
   
   @RequestMapping(value="delete", method = RequestMethod.POST)
   public String paymentDelete() throws Exception
   {
      PayService payService = new PayService();
      String token = payService.getToken(REST_API_KEY, REST_API_SECRET);
      
      Map<String, String> paymentInfo = payService.paymentInfo(token, "imp_608353866775");
      
      String amount = paymentInfo.get("amount");
      
      int result=payService.paymentCancel(token, "imp_608353866775", amount, "단순변심");
      System.out.println("삭제 성공");
      System.out.println(result);
      return "commons/ajaxResult";
   
   }
}
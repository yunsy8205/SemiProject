<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
<!-- jQuery -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header.jsp"></c:import>
<c:import url="../temp/template.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/bankadd.css">
<style type="text/css">
.billing-details {
    margin-bottom: 30px;
    margin-top: 8%;
    margin-left: 17%;
}
</style>
</head>
<body>

   <section class="contain border mt-5 mb-5">
      <div class="billing-details">
                     <div class="section-title title2">
                        <h1 class="title" id="member">계좌 등록</h1>
                     </div>
   <!-- Order Details -->
               <div class="details">
         <div class="modal-body">
              <form>
                <div class="mb-3" style="width:200px;">
                  <label for="recipient-name" class="col-form-label">예금주</label>
                  <input type="text" class="form-control" id="holder" name="holder">
                </div>
                <div class="mb-3 form-group">
                  <label for="message-text" class="col-form-label">은행 선택</label>
                  <select class="input-select" id="code" name="bankcode">
                     <option value="004" selected>KB국민은행</option>
                     <option value="003">기업은행</option>
                     <option value="011">농협</option>
                     <option value="088">신한은행</option>
                     <option value="020">우리은행</option>
                     <option value="090">카카오뱅크</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="recipient-name" class="col-form-label">계좌번호</label>
                  <input style="width:350px;" type="text" class="form-control" id="num" name="banknum">
                </div>
              </form>
            </div>
                  <button type="button" id="save" data-user="${dto.userNo}" class="btn btn-danger ms-4">저장</button>
                  <!-- /Billing Details -->
                  </div>
               <!-- /Order Details -->
                  </div>


   </section>

      <!-- FOOTER -->
      <footer id="footer">
         <!-- top footer -->
         <div class="section">
            <!-- container -->
            <div class="container">
               <!-- row -->
               <div class="row">
                  <div class="col-md-3 col-xs-6">
                     <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                           <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                           <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                           <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                     </div>
                  </div>

                  <div class="col-md-3 col-xs-6">
                     <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                           <li><a href="#">Hot deals</a></li>
                           <li><a href="#">Laptops</a></li>
                           <li><a href="#">Smartphones</a></li>
                           <li><a href="#">Cameras</a></li>
                           <li><a href="#">Accessories</a></li>
                        </ul>
                     </div>
                  </div>

                  <div class="clearfix visible-xs"></div>

                  <div class="col-md-3 col-xs-6">
                     <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                           <li><a href="#">About Us</a></li>
                           <li><a href="#">Contact Us</a></li>
                           <li><a href="#">Privacy Policy</a></li>
                           <li><a href="#">Orders and Returns</a></li>
                           <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                     </div>
                  </div>

                  <div class="col-md-3 col-xs-6">
                     <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                           <li><a href="#">My Account</a></li>
                           <li><a href="#">View Cart</a></li>
                           <li><a href="#">Wishlist</a></li>
                           <li><a href="#">Track My Order</a></li>
                           <li><a href="#">Help</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               <!-- /row -->
            </div>
            <!-- /container -->
         </div>
         <!-- /top footer -->

         <!-- bottom footer -->
         <div id="bottom-footer" class="section">
            <div class="container">
               <!-- row -->
               <div class="row">
                  <div class="col-md-12 text-center">
                     <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                     </ul>
                     <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     </span>
                  </div>
               </div>
                  <!-- /row -->
            </div>
            <!-- /container -->
         </div>
         <!-- /bottom footer -->
      </footer>
      <!-- /FOOTER -->
<script>
$('#save').click(function(){
   let userNo=$(this).attr("data-user");
   let holder = $('#holder').val();
   console.log(holder);
   let code = $('#code').val();
   console.log(code);
   let num = $('#num').val();
   console.log(num);
      $.ajax({
         type: "post",
         url: "../payment/checkaccount",
         data:{
            userNo:userNo,
            holder:holder,
            bankCode:code,
            bankNum:num
         }
         ,success:function(res){
            if(res.trim()>0){
               alert("계좌변경 완료");
               window.location.href="../my/management";
            }else{
               alert("계좌변경 실패");
            }
         }
         ,error:function(){
            alert("서버 연결 실패");
         }
      })
   })
</script>
</body>
</html>
package com.semi.main.my;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.member.MemberDTO;
import com.semi.main.member.MemberFileDTO;

import com.semi.main.product.ProductDTO;

import com.semi.main.product.ProductFileDTO;


@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.semi.main.my.MyPageDAO.";
	
	 //사진등록
	public int setFileJoin(MemberFileDTO memberFileDTO) throws Exception{
	
		return sqlSession.insert(NAMESPACE+"setFileJoin", memberFileDTO);
	}
	
	// 회원수정
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{ 
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
	// 회원탈퇴
	public int setDelete(MemberDTO memberDTO) throws Exception{ 
		return sqlSession.delete(NAMESPACE+"setDelete", memberDTO);
	}
	
	// 채팅 내역 저장
    public void saveChatMessage(String userId, String message) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("message", message);
        sqlSession.insert(NAMESPACE + "saveChatMessage", paramMap);
    }

    // 채팅 내역 불러오기
    public List<ChatMessageDTO> getChatMessages(String userId) throws Exception {
        return sqlSession.selectList(NAMESPACE + "getChatMessages", userId);
    }
    

    // 찜 목록
    public List<DibsDTO> getDibs(Long userNo) throws Exception{
    	List<DibsDTO> dibs =  sqlSession.selectList(NAMESPACE+"getDibs", userNo);
//    	System.out.println("찜목록 사이즈 : " + dibs.size());
    	return dibs;
    }


    
    //내판매글불러오기
    public List<ProductDTO> memberProList(Map<String, Object> map)throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberProList", map);
	} 
    
    //total
  	public Long getTotal(Map<String, Object> map)throws Exception{
  		return sqlSession.selectOne(NAMESPACE+"getTotal", map);
  	}
    
  	// 내게 쓴 후기 
  	public List<ReviewsDTO> getReviews(Long userNo) throws Exception{
  		List<ReviewsDTO> ar = sqlSession.selectList(NAMESPACE + "getReview", userNo);
 
  		return ar;
  	}
    	
  	//구매목록
  	public List<BuyerDTO> getBuyer(Long userNo) throws Exception{
  		List<BuyerDTO> ar = sqlSession.selectList(NAMESPACE + "getBuyer", userNo);
  	
  		return ar;
  	}
  	
  	//판매목록
  	public List<SaleDTO> getSale(Long userNo) throws Exception{
  		List<SaleDTO> arr = sqlSession.selectList(NAMESPACE+"getSale", userNo);

  		return arr;
  	}
  	
  	//구매목록 카운트
  	public Long getBuyCount(Long userNo) throws Exception{
  		Long a = sqlSession.selectOne(NAMESPACE+"getBuyCount", userNo);
  	
  		return a;
  	}
  	
  	//판매목록 카운트
  	public Long getSaleCount(Long userNo) throws Exception{
  		Long b = sqlSession.selectOne(NAMESPACE+"getSaleCount", userNo);
  	
  		return b;
  	}
}
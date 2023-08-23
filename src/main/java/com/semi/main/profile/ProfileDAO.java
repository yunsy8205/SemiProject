package com.semi.main.profile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.profile.ProfileDAO.";
	
	public ProfileDTO memberProfile(ProfileDTO profileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProfile", profileDTO);
	}
	
	public Long countSaleProduct(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"countSaleProduct", profileDTO);
	}
}

package com.semi.main.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {
	
	private SqlSession sqlSession;
	final private String NAMESPACE= "com.semi.main.qna.QnaDAO.";

}

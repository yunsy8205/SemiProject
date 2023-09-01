package com.semi.main.adminNotice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.main.board.BoardDAO;
import com.semi.main.board.BoardDTO;
import com.semi.main.util.Pager;

@Repository
public class AdminNoticeDAO implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.semi.main.adminNotice.AdminNoticeDAO.";

	//fileAdd
	public int setFileAdd(AdminNoticeFileDTO adminNoticeFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", adminNoticeFileDTO);
		
	}
	//filedown
	public AdminNoticeFileDTO getFileDetail(AdminNoticeFileDTO adminNoticeFileDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getFileDetail",adminNoticeFileDTO);
	}
	
	//fileDelete
	public int setFileDelete(AdminNoticeFileDTO adminNoticeFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDelete",adminNoticeFileDTO);
	}
	//list
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
	
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	

	//detail
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getDetail",boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public Long getTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}

	public int setHit(AdminNoticeDTO adminNoticeDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setHit", adminNoticeDTO);
	}

	
	
	

}

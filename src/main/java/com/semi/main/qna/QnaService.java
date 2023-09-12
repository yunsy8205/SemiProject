package com.semi.main.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.adminNotice.AdminNoticeFileDTO;
import com.semi.main.board.BoardDTO;
import com.semi.main.board.BoardService;
import com.semi.main.file.FileDTO;
import com.semi.main.qnaComment.QnaCommentDTO;
import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

@Service
public class QnaService implements BoardService{
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//qnaCommentList
	
	public List<QnaCommentDTO> getCommentList(QnaCommentDTO qnaCommentDTO)throws Exception{
		
		return qnaDAO.getCommentList(qnaCommentDTO);
	}
	//qnaCommentADD
	public int setCommentAdd(QnaCommentDTO qnaCommentDTO)throws Exception{
		return qnaDAO.setCommentAdd(qnaCommentDTO);
	}
	//imgdelete
	public boolean setContentsImgDelete(String path, HttpSession session)throws Exception{
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setFileName(path.substring(path.lastIndexOf("/")+1));
		path = "/resources/upload/board/";
		return fileManager.fileDelete(fileDTO, path, session);
	}
		
	//imgup
	public String setContentsImg(MultipartFile files, HttpSession session) throws Exception{
		
		String path ="/resources/upload/board/";
		String fileName = fileManager.fileSave(path, session, files);
		return path+fileName;
	}
	
	//filedown
	public QnaFileDTO getFileDown(QnaFileDTO qnaFileDTO)throws Exception{
		
		return qnaDAO.getFileDetail(qnaFileDTO);
	}
	
	//fileDelete
	public int setFileDelete(QnaFileDTO qnaFileDTO,HttpSession session)throws Exception{
		String path ="/resources/upload/qna/";
		
		qnaFileDTO = qnaDAO.getFileDetail(qnaFileDTO);
		boolean flag = fileManager.fileDelete(qnaFileDTO, path, session);
		
		if(flag) {
			return qnaDAO.setFileDelete(qnaFileDTO); //de 삭제
		}
		return 0;
	}
	
	
	public List<BoardDTO> getMyList(QnaDTO qnaDTO)throws Exception{
		
		return qnaDAO.getMyList(qnaDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRowNum();
		Long total = qnaDAO.getTotal(pager);
		pager.makePageNum(total);
		
		return qnaDAO.getList(pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getDetail(boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		
		String path = "/resources/upload/qna/";
		
		int result = qnaDAO.setAdd(boardDTO);
		
		for(MultipartFile multipartFile: files) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, session, multipartFile);
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			qnaFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setBoardNo(boardDTO.getBoardNo());
			result = qnaDAO.setFileAdd(qnaFileDTO); 
					
		}
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		
		String path = "/resources/upload/qna/";
		int result = qnaDAO.setUpdate(boardDTO);
		
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(path, session, multipartFile);
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			qnaFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setBoardNo(boardDTO.getBoardNo());
			result = qnaDAO.setFileAdd(qnaFileDTO);
					
		}
		
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setDelete(boardDTO);
	}
	
	//setStatusUpdate
	public int setStatusUpdate(QnaDTO qnaDTO)throws Exception{
		return qnaDAO.setStatusUpdate(qnaDTO);
	}
	
	
	

}

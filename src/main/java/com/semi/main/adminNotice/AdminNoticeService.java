package com.semi.main.adminNotice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.board.BoardDTO;
import com.semi.main.board.BoardService;
import com.semi.main.util.FileManager;
import com.semi.main.util.Pager;

@Service
public class AdminNoticeService implements BoardService{
	
	@Autowired
	private AdminNoticeDAO adminNoticeDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		
		pager.makeRowNum();
		Long total = adminNoticeDAO.getTotal(pager);
		pager.makePageNum(total);
		return adminNoticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		
		return null;
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		
		String path = "/resources/upload/notice";
		int result = adminNoticeDAO.setAdd(boardDTO);
		
		for(MultipartFile multipartFile: files) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(path, session, multipartFile);
			AdminNoticeFileDTO adminNoticeFileDTO = new AdminNoticeFileDTO();
			adminNoticeFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			adminNoticeFileDTO.setFileName(fileName);
			adminNoticeFileDTO.setBoardNo(boardDTO.getBoardNo());
			result = adminNoticeDAO.setFileAdd(adminNoticeFileDTO);
			
		}
		
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		
		return 0;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		
		return 0;
	}
	
	
	
	

}

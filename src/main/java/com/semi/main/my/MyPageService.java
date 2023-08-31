package com.semi.main.my;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.file.FileDTO;
import com.semi.main.util.FileManager;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private FileManager fileManager;
	

	
	public MyPageDTO getLogin(MyPageDTO myPageDTO) throws Exception{ //로그인 삭제예정
		return myPageDAO.getLogin(myPageDTO);
	}
	

	
	public int setMemberUpdate(MyPageDTO myPageDTO) throws Exception{ //회원수정 메서드
		return myPageDAO.setMemberUpdate(myPageDTO);
	}
	

	
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path="/resources/upload/member/";
		String fileName = fileManager.fileSave(path, session, file); // -> fileName ------> insert 해야됨
		session.setAttribute("newFileName", fileName);
		
		
//		-------
		MyPageDTO mem = (MyPageDTO)session.getAttribute("member");
		Long userNo = mem.getUserNo();
		MyPageFileDTO myPageFileDTO = new MyPageFileDTO();
		myPageFileDTO.setFileName(fileName);
		myPageFileDTO.setUserNo(userNo);
		myPageFileDTO.setOriginalName(file.getOriginalFilename());
		int result = myPageDAO.setFileJoin(myPageFileDTO);
//		--------
		
		
		return path+fileName; // -5. 선택한 이미지가 실제로 존재하는 경로를 반환 -
	}
	
	
	public int setDelete(MyPageDTO myPageDTO) throws Exception{ //회원탈퇴
		return myPageDAO.setDelete(myPageDTO);
	}
	

}
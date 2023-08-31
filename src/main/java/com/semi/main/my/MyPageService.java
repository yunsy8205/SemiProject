package com.semi.main.my;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.file.FileDTO;
import com.semi.main.member.MemberDTO;
import com.semi.main.member.MemberFileDTO;
import com.semi.main.util.FileManager;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private FileManager fileManager;
	

	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{ //로그인 삭제예정
		return myPageDAO.getLogin(memberDTO);
	}
	

	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{ //회원수정 메서드
		return myPageDAO.setMemberUpdate(memberDTO);
	}
	

	
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path="/resources/upload/member/";
		String fileName = fileManager.fileSave(path, session, file); // -> fileName ------> insert 해야됨
		session.setAttribute("newFileName", fileName);
		
		
//		-------
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		Long userNo = mem.getUserNo();
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		memberFileDTO.setFileName(fileName);
		memberFileDTO.setUserNo(userNo);
		memberFileDTO.setOriginalName(file.getOriginalFilename());
		int result = myPageDAO.setFileJoin(memberFileDTO);
//		--------
		
		
		return path+fileName; // -5. 선택한 이미지가 실제로 존재하는 경로를 반환 -
	}
	
	
	public int setDelete(MemberDTO memberDTO) throws Exception{ //회원탈퇴
		return myPageDAO.setDelete(memberDTO);
	}
	

}
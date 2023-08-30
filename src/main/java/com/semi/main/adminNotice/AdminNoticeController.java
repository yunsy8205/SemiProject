
package com.semi.main.adminNotice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import com.semi.main.board.BoardDTO;
import com.semi.main.member.MemberDTO;
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@ModelAttribute("board") //reuestmapping 실행되기전에 실행되서 모델에다가 이름은:board value:notice
	public String getBoardName() {
		return "notice";
	}
	
	//filedelete
	@GetMapping("fileDelete")
	public String setFileDelete(AdminNoticeFileDTO adminNoticeFileDTO,HttpSession session, Model model)throws Exception{
		int result = adminNoticeService.setFileDelete(adminNoticeFileDTO, session);
		model.addAttribute("result",result);
		return "commons/ajaxResult";
	}
	
	//imgdel
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path, HttpSession session,Model model)throws Exception{
		boolean check = adminNoticeService.setContentsImgDelete(path, session);
		model.addAttribute("result", check);
		
		return "commons/ajaxResult";
		
	}
	
	//imgupload
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files, HttpSession session,Model model)throws Exception{
		
		String path = adminNoticeService.setContentsImg(files, session);
		model.addAttribute("result",path);
		
		return "commons/ajaxResult";
	}
	
	//filedown
	@GetMapping("fileDown")
	public String getFileDown(AdminNoticeFileDTO adminNoticeFileDTO,Model model)throws Exception{
		adminNoticeFileDTO = adminNoticeService.getFileDown(adminNoticeFileDTO);
		model.addAttribute("file", adminNoticeFileDTO);
		
		return "fileManager";
	}
	
	//list
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception {
		
		List<BoardDTO> ar = adminNoticeService.getList(pager);

		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "board/list";
		
	}
	
	//add
	@GetMapping("add")
	public String setAdd()throws Exception{
		
		return "board/add";
	}
	
	@PostMapping("add")
	public String setAdd(AdminNoticeDTO adminNoticeDTO, MultipartFile[] files1, HttpSession session, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		adminNoticeDTO.setUserNo(memberDTO.getUserNo());
		
		int result = adminNoticeService.setAdd(adminNoticeDTO, files1, session);
				
		
		return "board/add";
	}
	
	//detail
	@GetMapping("detail")
	public String getDetail(AdminNoticeDTO adminNoticeDTO, Model model,HttpSession session)throws Exception{
		
		adminNoticeService.setHit(adminNoticeDTO);
		BoardDTO boardDTO = adminNoticeService.getDetail(adminNoticeDTO);
		
		
		model.addAttribute("dto", boardDTO);
		
		return "board/detail"; 
	}
	
	//update
	@GetMapping("update")
	public String getUpdate(AdminNoticeDTO adminNoticeDTO, Model model)throws Exception{
		
		BoardDTO boardDTO = adminNoticeService.getDetail(adminNoticeDTO);
	
		model.addAttribute("dto",boardDTO);
		
		return "board/update";
	}
	//update
	@PostMapping("update")
	public String getUpdate(AdminNoticeDTO adminNoticeDTO,MultipartFile[] files1,HttpSession session, Model model)throws Exception{
		 
		int result = adminNoticeService.setUpdate(adminNoticeDTO, files1, session);
		 
		return "redirect:./list";
	}
	//delete
	@GetMapping("delete")
	public String setdelete(AdminNoticeDTO adminNoticeDTO)throws Exception{
		int result = adminNoticeService.setDelete(adminNoticeDTO);
		
		return "redirect:./list";
	}
}

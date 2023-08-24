package com.semi.main.adminNotice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.board.BoardDTO;
import com.semi.main.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception {
		
		List<BoardDTO> ar = adminNoticeService.getList(pager);

		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "board/list";
		
	}
	
	@GetMapping("add")
	public String setAdd()throws Exception{
		
		return "board/add";
	}
	
	@PostMapping("add")
	public String setAdd(AdminNoticeDTO adminNoticeDTO, MultipartFile[] files, HttpSession session, Model model)throws Exception{
		adminNoticeDTO.setUserNo(1);
		int result = adminNoticeService.setAdd(adminNoticeDTO, files, session);
				
		
		return "board/add";
	}

}

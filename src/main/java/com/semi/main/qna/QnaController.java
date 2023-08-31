package com.semi.main.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.board.BoardDTO;
import com.semi.main.member.MemberDTO;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
//myqnaList
	@GetMapping("list")
	public String getMyList(QnaDTO qnaDTO, Model model, HttpSession session)throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qnaDTO.setUserNo(memberDTO.getUserNo());
		List<BoardDTO> ar = qnaService.getMyList(qnaDTO);
		
		model.addAttribute("list", ar);
		
		return "qna/list";
		
	}
	//add
	@GetMapping("add")
	public String setAdd() throws Exception {

		return "qna/add";
	}
	
	@PostMapping("add")
	public String setAdd(QnaDTO qnaDTO, MultipartFile[] files1, HttpSession session, Model model)
			throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qnaDTO.setUserNo(memberDTO.getUserNo());
		
		int result = qnaService.setAdd(qnaDTO, files1, session);

		String message = "등록 실패";

		if (result > 0) {
			message = "등록 성공";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
		return "commons/result";

	}
	
	//detail
	@GetMapping("detail")
	public String getDtail(QnaDTO qnaDTO, Model model) throws Exception {

		BoardDTO boardDTO = qnaService.getDetail(qnaDTO);

		
			model.addAttribute("dto", boardDTO);

			return "qna/detail";


	}

	
}

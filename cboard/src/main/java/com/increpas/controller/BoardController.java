package com.increpas.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.increpas.domain.BoardVO;
import com.increpas.domain.Criteria;
import com.increpas.domain.PageingInfo;
import com.increpas.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		model.addAttribute("list",service.getBoardList(cri));
		model.addAttribute("pageMaker",new PageingInfo(cri,service.getTotal(cri)));
	}
	
	@GetMapping("/view")
	public void view(Criteria cri,int boardBno, Model model) {
		model.addAttribute("board",service.getBoardView(boardBno));
		model.addAttribute("pageMaker",cri);
		service.hitBoard(boardBno);
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/writeDO")
	public String write(BoardVO board,RedirectAttributes rttr) {
		int result = service.writeBoard(board);
		if(result != 0) {
			rttr.addFlashAttribute("result", result);
			rttr.addFlashAttribute("checkWD","write");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String delete(Criteria cri,int boardBno,RedirectAttributes rttr) {
		boolean result = service.removeBoard(boardBno);
		if(result) {
			rttr.addFlashAttribute("result", boardBno);
			rttr.addFlashAttribute("checkWD","delete");
		}
		return "redirect:/board/list"+cri.getListLink();
	}
	
	@GetMapping("/update")
	public void update(Criteria cri,int boardBno, Model model) {
		model.addAttribute("board",service.getBoardView(boardBno));
		model.addAttribute("pageMaker",cri);
	}
	
	@PostMapping("/updateDO")
	public String update(BoardVO board,Criteria cri,RedirectAttributes rttr) {
		boolean result = service.updateBoard(board);
		if(result) {
			rttr.addFlashAttribute("result", board.getBoardBno());
		}
		return "redirect:/board/view"+cri.getListLink()+"&boardBno="+board.getBoardBno();
	}
}

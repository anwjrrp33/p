package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.PageMapper;
import org.zerock.util.PageMaker;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Setter(onMethod_={@Autowired})	
	private PageMapper mapper;
	@Setter(onMethod_={@Autowired})
	private BoardMapper bmapper;

	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
				
		PageMaker maker = new PageMaker(cri.getPage(), mapper.getTotal());
		
		List<BoardVO> list = mapper.getList(cri);
		
		int total = mapper.getTotal();
		
		model.addAttribute("list", list);
		model.addAttribute("maker", maker);
	}
	
	@GetMapping("/insert")
	public void insert() {
		
		
	}
	
	@PostMapping("/insert")
	public String insertPost(BoardVO vo,RedirectAttributes type) {
		bmapper.insert(vo);
		type.addFlashAttribute("type", "success");
		return "redirect:/board/list";
	}
}

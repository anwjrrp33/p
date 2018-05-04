package org.zerock.controller;

import java.lang.reflect.Parameter;
import java.util.Arrays;
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

	@Setter(onMethod_ = { @Autowired })
	private PageMapper mapper;
	@Setter(onMethod_ = { @Autowired })
	private BoardMapper bmapper;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		List<BoardVO> list = null;
		int total;
		
		log.info("type" + cri.getType());
		log.info("keyword" + cri.getKeyword());

		if (cri.getKeyword() == null) {
			list = mapper.getList(cri);
			total = mapper.getTotal(cri);
		} else {
			list = bmapper.search(cri);
			total = mapper.getTotal(cri);
		}

		PageMaker maker = new PageMaker(cri.getPage(), mapper.getTotal(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("list", list);
		model.addAttribute("maker", maker);
		
		log.info("list: " + list);
	}

	@GetMapping("/insert")
	public void insert() {
	}

	@PostMapping("/insert")
	public String insertPost(BoardVO vo, RedirectAttributes type) {
		bmapper.insert(vo);
		type.addFlashAttribute("type", "success");
		return "redirect:/board/list";
	}

	@GetMapping("/view")
	public void viewGet(int bno, Model model) {

		BoardVO vo = bmapper.view(bno);

		model.addAttribute("vo", vo);

	}

	@GetMapping("/update")
	public void updateGet(int bno, Model model) {
		BoardVO vo = bmapper.view(bno);

		model.addAttribute("vo", vo);

	}

	@PostMapping("/update")
	public String updatePost(BoardVO vo) {
		bmapper.update(vo);

		return "redirect:/board/list";
	}

	@PostMapping("/delete")
	public String delete(int bno, RedirectAttributes type) {

		bmapper.delete(bno);
		type.addFlashAttribute("type", "success");
		return "redirect:/board/list";
	}

}

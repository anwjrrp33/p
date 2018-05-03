package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.PageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Setter(onMethod_={@Autowired})	
	private PageMapper mapper;
	
	@GetMapping("/list/{page}")
	public List<BoardVO> list(Criteria cri, Model model) {
				
		log.info("cri: " + cri);
		
		log.info(mapper.getList(cri));
		
		model.addAttribute(mapper.getList(cri));
		return  mapper.getList(cri);
		
	}	
}

package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;
import org.zerock.util.PageMaker;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/*")
@RestController
@Log4j
public class ReplyController {

	@Setter(onMethod_ = { @Autowired })
	private ReplyMapper mapper;
	
	@GetMapping("/list/{bno}/{page}")
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("bno") int bno, Criteria cri) {
		
		ResponseEntity<List<ReplyVO>> list = null;
		
		PageMaker maker = new PageMaker(cri.getPage(), mapper.getTotal(bno));
		
		return new ResponseEntity<>(mapper.listReply(cri, bno), HttpStatus.OK);
	}
	
}

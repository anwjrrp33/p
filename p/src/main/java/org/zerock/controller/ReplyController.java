package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@PostMapping("/insert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO vo) {
		
		log.info(vo.getReple());
		mapper.insertReply(vo);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@GetMapping("/read/{rno}")
	public ResponseEntity<ReplyVO> replyRead(@PathVariable("rno") int rno) {
		return new ResponseEntity<>(mapper.readReply(rno), HttpStatus.OK);
	}
	
	@DeleteMapping("/delete/{rno}")
	public ResponseEntity<String> replyDelete(@PathVariable("rno") int rno) {
		
		mapper.deleteReply(rno);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@PutMapping("/update")
	public ResponseEntity<String> replyUpdate(@RequestBody ReplyVO vo) {
		log.info(vo.getRno());
		log.info(vo.getReple());
		log.info(vo.getReplyer());
		mapper.updateReply(vo);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}

package org.zerock.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = { @Autowired })
	private ReplyMapper mapper;
	
	@Test
	public void testInsert() {
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(600);
		vo.setReplyer("ÆÄÀÌ¸®");
		vo.setReple("¸öÅë¹ÚÄ¡±â");
		log.info(mapper.insertReply(vo));
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(1);
		int bno = 394;
		log.info(mapper.listReply(cri, bno));
	}
	
	@Test
	public void testUpdate() {
		
		ReplyVO vo = new ReplyVO();
		vo.setRno(13);
		vo.setReple("ÆÄ±«±¤¼±");
		log.info(mapper.updateReply(vo));
	}
	
	@Test
	public void testDelete() {
		
		int rno = 13;
		log.info(mapper.deleteReply(rno));
	}
}

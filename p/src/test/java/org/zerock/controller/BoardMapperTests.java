package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardMapper mapper;

	@Test
	public void viewPage() {
		int bno = 607;
		
		log.info(mapper.view(bno));
		
	}
	
	@Test
	public void insertTest() {
		
		BoardVO vo = new BoardVO();
		vo.setBno(607);
		vo.setTitle("Update Test Title");
		vo.setContent("Update Test Content");
		
		log.info(mapper.update(vo));
	}
	
	@Test
	public void searchPage() {
		
		Criteria cri = new Criteria();
		
		cri.setKeyword("t");
		
		cri.setType("t");
		
		log.info("Arr: " + cri.getArr());
		
		mapper.search(cri);
		
	}
	
	@Test
	public void testInsert() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("Test Title");
		vo.setContent("Test Content");
		vo.setWriter("DDDD");
		
		log.info(mapper.insert(vo));
	}
	
	@Test
	public void testDelete() {
		
		int bno = 607;
		
		log.info(mapper.delete(bno));
	}
}


















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
	public void mapSearch() {
		Map<String, String> map = new HashMap<>();
		String keyword = "테스트";

		map.put("t", keyword);
		map.put("c", keyword);
		map.put("w", keyword);

		/* mapper.search(map, new Criteria(2)); */

	}

	@Test
	public void searchPage() {
		
		Criteria cri = new Criteria();
		
		cri.setKeyword("제목");
		
		cri.setType("t");
		
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
}

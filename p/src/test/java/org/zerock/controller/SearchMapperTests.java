package org.zerock.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.mapper.SearchMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SearchMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private SearchMapper mapper;

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
	public void searchArr() {
		Criteria cri = new Criteria();

		cri.setType("tc");
		log.info("Type: " + Arrays.toString(cri.getArr(cri.getType())));

	}

}

package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface PageMapper {
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}

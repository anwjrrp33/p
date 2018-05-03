package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> search(Criteria cri);
	
	public int insert(BoardVO vo);
	
	public BoardVO view(Integer bno);
}

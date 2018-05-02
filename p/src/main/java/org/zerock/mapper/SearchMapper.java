package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;

public interface SearchMapper {

	public List<BoardVO> search(@Param("map") Map<String, String> map);
	
}

package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insertReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(@Param("cri")Criteria cri,@Param("bno")int bno);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(int rno);
	
	public int getTotal(int bno);
	
	public ReplyVO readReply(int rno);
}

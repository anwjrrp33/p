package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insertReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(int bno);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(int rno);
}

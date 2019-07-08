package com.increpas.mapper;

import java.util.List;

import com.increpas.domain.ReReplyVO;
import com.increpas.domain.ReplyVO;

public interface ReReplyMapper {
	// C
	public int insertReply(ReReplyVO vo);

	// R
	public List<ReReplyVO> selectReply(int replyCno);

	// U
	public int updateReply(ReReplyVO vo);

	// D
	public int deleteReply(int replyCCno);

	public int countReply(int replyCno);
}

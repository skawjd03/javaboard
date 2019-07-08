package com.increpas.service;

import java.util.List;

import com.increpas.domain.ReReplyVO;
import com.increpas.domain.ReplyVO;

public interface ReReplyService {
	
		public int insertReply(ReReplyVO vo);
		public List<ReReplyVO> selectReply(int replyCno);
		public int updateReply(ReReplyVO vo);
		public int deleteReply(int replyCCno);
		public int countReply(int replyCno);
}

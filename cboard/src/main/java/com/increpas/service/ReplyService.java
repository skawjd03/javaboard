package com.increpas.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.increpas.domain.ReplyVO;

public interface ReplyService {
	public int insertReply(ReplyVO vo);

	public List<ReplyVO> selectReply(int replyBno, int pageNum);

	public int updateReply(ReplyVO vo);

	public int deleteReply(int replyCno);

	public int upthumbs(int cno);

	public int downthumbs(int cno);
}

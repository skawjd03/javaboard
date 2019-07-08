package com.increpas.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.increpas.domain.ReplyVO;

public interface ReplyMapper {
	// C
	public int insertReply(ReplyVO vo);

	// R
	public List<ReplyVO> selectReply(@Param("replyBno")int replyBno,@Param("pageNum")int pageNum);

	// U
	public int updateReply(ReplyVO vo);

	// D
	public int deleteReply(int replyCno);
	
	public int upthumbs(int cno);
	
	public int downthumbs(int cno);
}

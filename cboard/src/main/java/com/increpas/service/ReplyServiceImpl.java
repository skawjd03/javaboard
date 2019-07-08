package com.increpas.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.increpas.domain.ReplyVO;
import com.increpas.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper mapper;
	
	@Override
	public int insertReply(ReplyVO vo) {
		log.info("insertReply...............");
		return mapper.insertReply(vo);
	}

	@Override
	public List<ReplyVO> selectReply(int replyBno,int pageNum) {
		log.info("selectReply...............");
		return mapper.selectReply(replyBno,pageNum);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		log.info("updateReply...............");
		return mapper.updateReply(vo);
	}

	@Override
	public int deleteReply(int replyCno) {
		log.info("deleteReply...............");
		return mapper.deleteReply(replyCno);
	}

	@Override
	public int upthumbs(int cno) {
		
		return mapper.upthumbs(cno);
	}

	@Override
	public int downthumbs(int cno) {
		return mapper.downthumbs(cno);
	}

	
}

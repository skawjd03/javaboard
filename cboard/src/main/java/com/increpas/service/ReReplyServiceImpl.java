package com.increpas.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.increpas.domain.ReReplyVO;
import com.increpas.domain.ReplyVO;
import com.increpas.mapper.ReReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReReplyServiceImpl implements ReReplyService{

	private ReReplyMapper mapper;
	
	@Override
	public int insertReply(ReReplyVO vo) {
		log.info("insertReReply...............");
		return mapper.insertReply(vo);
	}

	@Override
	public List<ReReplyVO> selectReply(int replyCno) {
		log.info("selectReReply...............");
		return mapper.selectReply(replyCno);
	}

	@Override
	public int updateReply(ReReplyVO vo) {
		log.info("updateReReply...............");
		return mapper.updateReply(vo);
	}

	@Override
	public int deleteReply(int replyCCno) {
		log.info("deleteReReply...............");
		return mapper.deleteReply(replyCCno);
	}

	@Override
	public int countReply(int replyCno) {
		return mapper.countReply(replyCno);
	}

}

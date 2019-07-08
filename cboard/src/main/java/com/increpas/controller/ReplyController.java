package com.increpas.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.increpas.domain.ReReplyVO;
import com.increpas.domain.ReplyVO;
import com.increpas.service.ReReplyService;
import com.increpas.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reply/*")
@AllArgsConstructor
public class ReplyController {

	private ReplyService replyservice;
	private ReReplyService reReplyservice;


	@PostMapping(value = "/writeReply", consumes = "application/json", produces = "application/json;charset=UTF-8")
	public ResponseEntity<ReplyVO> writeReply(@RequestBody ReplyVO vo) {
		log.info("여기까지옴~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		ResponseEntity<ReplyVO> res = null;
		if(vo.getReplyContent().equals("")) {
			res = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			return res;
		}else if(replyservice.insertReply(vo) != 1) {
			res = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			return res;
		}else {
			res = new ResponseEntity<>(vo,HttpStatus.OK);
			return res;
		}
	}
	
	@GetMapping("/getReplyList/{replyBno}/{pageNum}")
	public List<ReplyVO> getReplyList(@PathVariable("replyBno") int replyBno,@PathVariable("pageNum") int pageNum){
		List<ReplyVO> list = replyservice.selectReply(replyBno,pageNum);
		list.forEach(v->{
			v.setCnt(reReplyservice.countReply(v.getReplyCno()));
		});
		log.info(list);
		return list;
	}
	
	@GetMapping("/getReReplyList/{replyCno}")
	public List<ReReplyVO> getReReplyList(@PathVariable("replyCno") int replyCno){
		List<ReReplyVO> list = reReplyservice.selectReply(replyCno);
		log.info(list);
		return list;
	}
	
//	@GetMapping("/upthumbs/{cno}")
//	public int upthumbs(@PathVariable("cno") int cno) {
//		return replyservice.upthumbs(cno);
//	}
//	@GetMapping("/downthumbs/{cno}")
//	public int downthumbs(@PathVariable("cno") int cno) {
//		return replyservice.downthumbs(cno);
//	}
}

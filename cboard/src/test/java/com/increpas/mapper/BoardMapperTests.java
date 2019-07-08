package com.increpas.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
//	@Test
//	public void BoardMapperTest() {
//		BoardVO board = new BoardVO();
//		mapper.insertBoard(board);
//		log.info(board.getBoardBno());
//	}
	
//	@Test
//	public void BoardDeleteTest() {
//		mapper.deleteBoard(2054);
//	}
	
//	@Test
//	public void BoardUpdateTest() {
//		BoardVO board = new BoardVO();
//		board.setBoardCategory("바꿔");
//		board.setBoardContent("바꿔");
//		board.setBoardTitle("바꿨따");
//		board.setBoardBno(2050);
//		mapper.updateBoard(board);
//	}
	
}

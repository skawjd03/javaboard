package com.increpas.pesistencs;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.increpas.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTests {
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
//	@Test
//	public void TestList() {
//		service.getBoardList().forEach(board->log.info(board));
//	}
	
	@Test
	public void TestView() {
		log.info(service.getBoardView(2049));
	}
}

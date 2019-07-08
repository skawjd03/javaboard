package com.increpas.service;

import java.util.List;

import com.increpas.domain.BoardVO;
import com.increpas.domain.Criteria;

public interface BoardService {
	public List<BoardVO> getBoardList(Criteria cri);
	public BoardVO getBoardView(int boardBno);
	public boolean removeBoard(int boardBno);
	public boolean updateBoard(BoardVO board);
	public int writeBoard(BoardVO board);
	public int getTotal(Criteria cri);
	public void hitBoard(int boardBno);
}
